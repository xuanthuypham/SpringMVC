package com.tinyworld.hibernate.dao;

import java.util.List;

import com.tinyworld.hibernate.model.Permission;

public interface PermissionDao {

	public List<Permission> getAll();

	public Permission getDefaultPermissionForUser();
}
