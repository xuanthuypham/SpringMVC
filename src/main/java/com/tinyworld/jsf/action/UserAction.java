package com.tinyworld.jsf.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.event.ValueChangeEvent;

import org.springframework.stereotype.Component;

import com.tinyworld.hibernate.model.Permission;
import com.tinyworld.hibernate.model.User;
import com.tinyworld.spring.service.PermissionService;
import com.tinyworld.spring.service.UserService;

@SuppressWarnings("serial")
@ManagedBean(name="userAction", eager=true)
@RequestScoped
@Component
public class UserAction /*extends ActionBase*/ implements Serializable{
	@ManagedProperty("#{userService}")
	private UserService userService;

	@ManagedProperty("#{permissionService}")
	private PermissionService permissionService;
	
	/*public UserAction(){
		userService = (UserService)getBean(UserService.class);
		permissionService = (PermissionService)getBean(PermissionService.class);
	}*/
	
	@ManagedProperty(value="#{user}")
	private User user;
	private ArrayList<User> users;
	private ArrayList<Permission> permissions;
	private int permissionId;
	private boolean isUpdate = false;
	private String loginMessage;
	
	public String login(){
		System.out.println(">>>>>> Login function -> runs");
		try{
			User u = userService.login(this.user.getUserName(), this.user.getPassword());
			if(u != null) {
				return "usermanagement";
			} else {
				System.out.println("~~~~~> Login false");
				this.loginMessage = "Login false";
			}
		} catch (Exception ex){
			return null;
		}
		return "login";
	}

	public void addNewUser(AjaxBehaviorEvent aBEven){
		System.out.println(">>>>>> Add new user:");
		
		//this.user.setPermission((new PermissionManagement()).getDefaultPermissionForUser());
		this.user.setDateSingUp(new Date());
		userService.insertUser(this.user);
		return;
	}
	
	public void selectPermission(AjaxBehaviorEvent aBEven){
		System.out.println("\n\n\n\n\t>>>>>> Selected permisison is:" + this.permissionId);
		return;
	}
	
	public void changePermission(ValueChangeEvent vcE){
		this.permissionId = Integer.parseInt(vcE.getNewValue().toString());
		System.out.println("\n\n\n\n>>>>>>>> permission's id" + this.permissionId);
		
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ArrayList<User> getUsers() {
		users = new ArrayList<User>();
		users.addAll((this.permissionId == 0)?userService.getAll():userService.getUserByPermissionID(this.permissionId));
		return users;
	}

	public void setUsers(ArrayList<User> users) {
		this.users = users;
	}

	public String getLoginMessage() {
		return loginMessage;
	}

	public void setLoginMessage(String loginMessage) {
		this.loginMessage = loginMessage;
	}

	public ArrayList<Permission> getPermissions() {
		this.permissions = new ArrayList<Permission>(permissionService.getAll());
		return permissions;
	}

	public void setPermissions(ArrayList<Permission> permissions) {
		this.permissions = permissions;
	}

	public int getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(int permissionId) {
		this.permissionId = permissionId;
	}
	

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public PermissionService getPermissionService() {
		return permissionService;
	}

	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}
}
