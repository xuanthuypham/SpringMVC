package com.tinyworld.spring.service;

import java.util.List;

import com.tinyworld.hibernate.model.Permission;

public interface PermissionService {
	public List<Permission> getAll();

	public Permission getDefaultPermissionForUser();
}
