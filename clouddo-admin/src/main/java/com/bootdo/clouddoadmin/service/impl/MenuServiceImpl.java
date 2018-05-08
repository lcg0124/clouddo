package com.bootdo.clouddoadmin.service.impl;

import com.bootdo.clouddoadmin.domain.Tree;
import com.bootdo.clouddoadmin.utils.BuildTree;
import com.bootdo.clouddoadmin.dao.MenuDao;
import com.bootdo.clouddoadmin.dao.RoleMenuDao;
import com.bootdo.clouddoadmin.domain.MenuDO;
import com.bootdo.clouddoadmin.service.MenuService;
import com.bootdo.clouddocommon.dto.MenuDTO;
import com.bootdo.clouddocommon.dto.RouterDTO;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuDao menuMapper;
    @Autowired
    RoleMenuDao roleMenuMapper;

    /**
     * @param
     * @return 树形菜单
     */
    @Cacheable
    @Override
    public Tree<MenuDO> getSysMenuTree(Long id) {
        List<Tree<MenuDO>> trees = new ArrayList<Tree<MenuDO>>();
        List<MenuDO> menuDOs = userMenus(id);
        for (MenuDO menuDO : menuDOs) {
            Tree<MenuDO> tree = new Tree<MenuDO>();
            tree.setId(menuDO.getMenuId().toString());
            tree.setParentId(menuDO.getParentId().toString());
            tree.setText(menuDO.getName());
            Map<String, Object> attributes = new HashMap<>(16);
            attributes.put("url", menuDO.getUrl());
            attributes.put("icon", menuDO.getIcon());
            tree.setAttributes(attributes);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<MenuDO> t = BuildTree.build(trees);
        return t;
    }

    @Cacheable(value = "permission", key = "#userId")
    @Override
    public List<MenuDO> userMenus(Long userId) {
        return menuMapper.listMenuByUserId(userId);
    }

    @Override
    @CacheEvict(value = "permission", key = "#userId")
    public boolean clearCache(Long userId) {
        return true;
    }

    @Override
    public List<MenuDO> list(Map<String, Object> params) {
        List<MenuDO> menus = menuMapper.list(params);
        return menus;
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public int remove(Long id) {
        int result = menuMapper.remove(id);
        roleMenuMapper.removeByMenuId(id);
        return result;
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public int save(MenuDO menu) {
        int r = menuMapper.save(menu);
        return r;
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public int update(MenuDO menu) {
        int r = menuMapper.update(menu);
        return r;
    }

    @Override
    public MenuDO get(Long id) {
        MenuDO menuDO = menuMapper.get(id);
        return menuDO;
    }

    @Override
    public Tree<MenuDO> getTree() {
        List<Tree<MenuDO>> trees = new ArrayList<Tree<MenuDO>>();
        List<MenuDO> menuDOs = menuMapper.list(new HashMap<>(16));
        for (MenuDO menuDO : menuDOs) {
            Tree<MenuDO> tree = new Tree<MenuDO>();
            tree.setId(menuDO.getMenuId().toString());
            tree.setParentId(menuDO.getParentId().toString());
            tree.setText(menuDO.getName());
            tree.setObject(menuDO);
//			Map<String,Object> map =new HashMap<>(16);
//			map.put("url",menuDO.getUrl());
//			map.put("perms",menuDO.getPerms());
//
//			tree.setAttributes(map);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<MenuDO> t = BuildTree.build(trees);
        return t;
    }

    @Override
    public Tree<MenuDO> getTree(Long id) {
        // 根据roleId查询权限
        List<MenuDO> menus = menuMapper.list(new HashMap<String, Object>(16));
        List<Long> menuIds = roleMenuMapper.listMenuIdByRoleId(id);
        List<Long> temp = menuIds;
        for (MenuDO menu : menus) {
            if (temp.contains(menu.getParentId())) {
                menuIds.remove(menu.getParentId());
            }
        }
        List<Tree<MenuDO>> trees = new ArrayList<Tree<MenuDO>>();
        List<MenuDO> menuDOs = menuMapper.list(new HashMap<String, Object>(16));
        for (MenuDO menuDO : menuDOs) {
            Tree<MenuDO> tree = new Tree<MenuDO>();
            tree.setId(menuDO.getMenuId().toString());
            tree.setParentId(menuDO.getParentId().toString());
            tree.setText(menuDO.getName());
            Map<String, Object> state = new HashMap<>(16);
            Long menuId = menuDO.getMenuId();
            if (menuIds.contains(menuId)) {
                state.put("selected", true);
            } else {
                state.put("selected", false);
            }
            tree.setState(state);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<MenuDO> t = BuildTree.build(trees);
        return t;
    }

    @Override
    public Set<String> listPerms(Long userId) {
        List<String> perms = menuMapper.listUserPerms(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms) {
            if (StringUtils.isNotBlank(perm)) {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }

    /**
     * 获取角色下的权限所有id
     *
     * @param roleId
     * @return
     */
    @Override
    public List<Long> MenuIdsByRoleId(Long roleId) {
        // 根据roleId查询权限,只保留子节点，父节点的选中或半选中状态，前台自动调整
        List<MenuDO> menus = menuMapper.list(new HashMap<String, Object>(16));
        List<Long> menuIds = roleMenuMapper.listMenuIdByRoleId(roleId);
        List<Long> temp = menuIds;
        for (MenuDO menu : menus) {
            if (temp.contains(menu.getParentId())) {
                menuIds.remove(menu.getParentId());
            }
        }
        return menuIds;
    }

    /**
     * 用户的路由
     *
     * @return
     */
    @Override
    public List<RouterDTO> RouterDTOsByUserId(Long userId) {
        List<MenuDO> menuDOs = userMenus(userId);
        List<RouterDTO> routerDTOs = new ArrayList<>();
        for (MenuDO menuDO : menuDOs) {
            RouterDTO routerDTO = new RouterDTO();
            routerDTO.setId(menuDO.getMenuId());
            routerDTO.setParentId(menuDO.getParentId());
            routerDTO.setPath(menuDO.getUrl());
            routerDTO.setComponent(menuDO.getComponent());
            routerDTO.setName(menuDO.getName());
            routerDTO.setIconCls(menuDO.getIcon());
            routerDTO.setMenuShow(true);
            routerDTO.setChildren(new ArrayList<>());
            routerDTO.setLeaf(null!=menuDO.getType()&&menuDO.getType()==1);
            routerDTOs.add(routerDTO);
        }
        return RouterDTO.buildList(routerDTOs, 0L);
    }

    @Override
    public List<String> PermsByUserId(Long userId) {
        List<String> permsList = new ArrayList<>();
        List<MenuDO> menuDOs = userMenus(userId);
        for (MenuDO menuDO:menuDOs){
            if(menuDO.getPerms()!=null && ""!=menuDO.getPerms()){
                permsList.add(menuDO.getPerms());
            }
        }
        return permsList;
    }

    @Override
    public List<Tree<MenuDO>> listMenuTree(Long id) {
        List<Tree<MenuDO>> trees = new ArrayList<Tree<MenuDO>>();
        List<MenuDO> menuDOs = menuMapper.listMenuByUserId(id);
        for (MenuDO menuDO : menuDOs) {
            Tree<MenuDO> tree = new Tree<MenuDO>();
            tree.setId(menuDO.getMenuId().toString());
            tree.setParentId(menuDO.getParentId().toString());
            tree.setText(menuDO.getName());
            Map<String, Object> attributes = new HashMap<>(16);
            attributes.put("url", menuDO.getUrl());
            attributes.put("icon", menuDO.getIcon());
            tree.setAttributes(attributes);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        List<Tree<MenuDO>> list = BuildTree.buildList(trees, "0");
        return list;
    }

}
