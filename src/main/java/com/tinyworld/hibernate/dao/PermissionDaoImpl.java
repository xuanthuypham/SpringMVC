package com.tinyworld.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.tinyworld.hibernate.HibernateUtil;
import com.tinyworld.hibernate.model.Permission;

@Repository("permissionDao")
public class PermissionDaoImpl extends ModelDao implements PermissionDao{
	Session session ;
	
	public List<Permission> getAll(){
		//session = HibernateUtil.getSessionFactory().openSession();
		
		session = getSession();
		List<Permission> listPermission = new ArrayList<Permission>();
		listPermission.addAll(session.createQuery("FROM Permission").list());
		return listPermission;
	}

	public Permission getDefaultPermissionForUser(){
		Permission permission = new Permission();
		//session = HibernateUtil.SESSION_FACTORY.openSession();
		session = getSession();
		String sql = "SELECT count(*) FROM Permission WHERE permissionName = :perName";
		Query query = session.createQuery(sql);
		query.setParameter("perName", "Member");
		return permission;
	}
}
