package com.tinyworld.jsf.action;

public class UserActionListener {
	//private User user = new User();
	private String userName="";
	private String lastName="";
	private String firstName="";

	/*public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}*/

	public String addNewUser(){
		System.out.println(this.firstName);
		System.out.println(this.lastName);
		System.out.println(this.userName);
		return "result";
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
}
