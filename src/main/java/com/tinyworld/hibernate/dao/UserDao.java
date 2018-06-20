package com.tinyworld.hibernate.dao;

import java.util.List;

import org.hibernate.Session;

import com.tinyworld.hibernate.model.User;

public interface UserDao {
	public Session getSession();
	
	public List<User> getAll();

	public List<User> getUserByPermissionID(int perId);

	public User getUserByID(int id);

	public List<User> getUserByAddress(String address);

	public User login(String userName, String pass);

	public List<User> getAllUserWithNativeSQL();
	
	public void insertUser(User user);
}
