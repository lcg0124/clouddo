package com.bootdo.clouddocommon.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class RouterDTO implements Serializable {
    private String path;
    private String component;
    private Long id;
    private String name;

    private String redirect;
    /**
     * 是否为叶子节点
     */
    private boolean leaf;
    private boolean menuShow;
    private Long parentId;
    private String iconCls;
    List<RouterDTO> children;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getRedirect() {
        return redirect;
    }

    public void setRedirect(String redirect) {
        this.redirect = redirect;
    }

    public boolean getLeaf() {
        return leaf;
    }

    public void setLeaf(boolean leaf) {
        this.leaf = leaf;
    }

    public boolean getMenuShow() {
        return menuShow;
    }

    public void setMenuShow(boolean menuShow) {
        this.menuShow = menuShow;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public boolean isLeaf() {
        return leaf;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public List<RouterDTO> getChildren() {
        return children;
    }

    public void setChildren(List<RouterDTO> children) {
        this.children = children;
    }

    public static List<RouterDTO> buildList(List<RouterDTO> nodes, Long idParam) {
        if (nodes == null) {
            return null;
        }
        List<RouterDTO> topNodes = new ArrayList<RouterDTO>();
        for (RouterDTO child : nodes) {
            Long pid = child.getParentId();
            if (pid == null || idParam == pid) {
                topNodes.add(child);
                continue;
            }
            for (RouterDTO parent : nodes) {
                Long id = parent.getId();
                if (id != null && id.equals(pid)) {
                    parent.getChildren().add(child);
                    // child.setHasParent(true);
                   // parent.setChildren(true);
                    //parent.setLeaf(false);
                    continue;
                } else {
                   // parent.setLeaf(true);
                }
            }
        }
        return topNodes;
    }
}
