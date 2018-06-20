package com.tinyworld.spring.service;

import java.util.List;

import com.tinyworld.hibernate.model.User;

public interface UserService {
	public List<User> getAll();

	public List<User> getUserByPermissionID(int perId);

	public User getUserByID(int id);

	public List<User> getUserByAddress(String address);

	public User login(String userName, String pass);

	public List<User> getAllUserWithNativeSQL();
	
	public void insertUser(User user);
}
