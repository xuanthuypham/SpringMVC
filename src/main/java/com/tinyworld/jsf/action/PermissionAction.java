package com.tinyworld.jsf.action;

import java.util.ArrayList;

import javax.faces.bean.ManagedProperty;

import com.tinyworld.hibernate.dao.PermissionDaoImpl;
import com.tinyworld.hibernate.model.Permission;

public class PermissionAction {
	@ManagedProperty(value="#{permission}")
	private Permission permission;

	private ArrayList<Permission> permissions;

	public ArrayList<Permission> getPermissions() {
		PermissionDaoImpl pm = new PermissionDaoImpl();
		permissions = new ArrayList<Permission>();
		permissions.addAll(pm.getAll());
		return permissions;
	}

	public void setPermissions(ArrayList<Permission> permissions) {
		this.permissions = permissions;
	}
	
	
	public Permission getPermission() {
		return permission;
	}

	public void setPermission(Permission permission) {
		this.permission = permission;
	}
}
