package com.tinyworld.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tinyworld.hibernate.dao.UserDao;
import com.tinyworld.hibernate.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao dao;

	public List<User> getAll(){
		return dao.getAll();
	}

	public List<User> getUserByPermissionID(int perId){
		return dao.getUserByPermissionID(perId);
	}

	public User getUserByID(int id){
		return dao.getUserByID(id);
	}

	public List<User> getUserByAddress(String address){
		return dao.getUserByAddress(address);
	}


	/**
	 * Login system
	 * @param userName	user-name of account
	 * @param pass		Pass word
	 * @return			User object
	 */
	public User login(String userName, String pass){
		return dao.login(userName, pass);
	}

	/**
	 * Get all users, using Native SQL
	 * @return List<User>
	 */
	public List<User> getAllUserWithNativeSQL(){
		return dao.getAllUserWithNativeSQL();
	}
	
	public void insertUser(User user){
		dao.insertUser(user);
	}

}
