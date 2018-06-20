package com.tinyworld.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tinyworld.hibernate.dao.PermissionDao;
import com.tinyworld.hibernate.model.Permission;

@Service("permissionService")
@Transactional
public class PermissionServiceImpl implements PermissionService{
	@Autowired
	PermissionDao dao;
	
	public List<Permission> getAll(){
		return dao.getAll();
	}

	public Permission getDefaultPermissionForUser(){
		return dao.getDefaultPermissionForUser();
	}
}
