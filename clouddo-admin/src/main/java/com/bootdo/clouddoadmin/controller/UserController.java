package com.bootdo.clouddoadmin.controller;

import com.bootdo.clouddoadmin.domain.UserDO;
import com.bootdo.clouddoadmin.dto.UserDTO;
import com.bootdo.clouddoadmin.dto.UserRoleDTO;
import com.bootdo.clouddoadmin.dto.do2dto.UserConvert;
import com.bootdo.clouddoadmin.service.RoleService;
import com.bootdo.clouddoadmin.service.UserService;
import com.bootdo.clouddoadmin.utils.MD5Utils;
import com.bootdo.clouddocommon.annotation.Log;
import com.bootdo.clouddocommon.context.FilterContextHandler;
import com.bootdo.clouddocommon.dto.LoginUserDTO;
import com.bootdo.clouddocommon.utils.PageUtils;
import com.bootdo.clouddocommon.utils.Query;
import com.bootdo.clouddocommon.utils.R;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户信息
 * @author bootdo
 */
@RequestMapping("/user")
@RestController
public class UserController extends BaseController {
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;

	/**
	 * 登录的当前用户，前台需要验证用户登录的页面可以调用此方法
	 * @return
	 */
    @GetMapping("/currentUser")
	LoginUserDTO currentUser(){
		LoginUserDTO loginUserDTO = new LoginUserDTO();
		loginUserDTO.setUserId(FilterContextHandler.getUserID());
		loginUserDTO.setUsername(FilterContextHandler.getUsername());
		loginUserDTO.setName(FilterContextHandler.getName());
		return loginUserDTO;
	}

	/**
	 * 根据用户id获取用户
	 * @param id
	 * @return
	 */
    @GetMapping("{id}")
	R get(@PathVariable("id") Long id ){
		UserDTO userDTO = UserConvert.MAPPER.do2dto(userService.get(id));
    	return R.ok().put("data",userDTO);
	}

	/**
	 * 分页查询用户
	 * @param params
	 * @return
	 */
	@Log("获取用户列表")
    @GetMapping()
    R listByPage(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        List<UserDTO> userDTOS = UserConvert.MAPPER.dos2dtos((userService.list(query)));
        int total = userService.count(query);
        PageUtils pageUtil = new PageUtils(userDTOS, total);
        return R.ok().put("page",pageUtil);
    }

	/**
	 * 增加用户
	 * @param user
	 * @return
	 */
	@PostMapping()
    R save(@RequestBody UserDO user) {
		user.setPassword(MD5Utils.encrypt(user.getUsername(), user.getPassword()));
		return R.operate(userService.save(user) > 0);
	}

	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	@PutMapping()
	R update(@RequestBody UserDO user) {
		return R.operate(userService.update(user) > 0);
	}


	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	@DeleteMapping()
	R remove( Long id) {
		return R.operate (userService.remove(id) > 0);
	}

	@PostMapping("/batchRemove")
	@ResponseBody
	R batchRemove(@RequestParam("ids[]") Long[] userIds) {
		int r = userService.batchremove(userIds);
		if (r > 0) {
			return R.ok();
		}
		return R.error();
	}

	@PostMapping("/exits")
	@ResponseBody
	boolean exits(@RequestParam Map<String, Object> params) {
		// 存在，不通过，false
		return !userService.exits(params);
	}
}
