package com.tinyworld.spring.mvc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tinyworld.hibernate.model.User;
import com.tinyworld.spring.security.Role;
import com.tinyworld.spring.security.SecurityAnnotation;
import com.tinyworld.spring.service.UserService;

@Controller
@SecurityAnnotation(allowedRole = { Role.ADMIN })
public class UserController {
	@Autowired
	UserService service;
	
	@RequestMapping(value="/adduser.jsp", method=RequestMethod.GET)
	public ModelAndView userForm(){
		return new ModelAndView("adduser", "userForm", new User());
	}
	
	@RequestMapping(value="/insertUser.jsp", method=RequestMethod.POST)
	public ModelAndView inserUser(@ModelAttribute("userForm")User user, ModelMap model){
		System.out.println("\n\n\n\n>>>>>>>> Add new user");
		System.out.println("firstName:" + user.getFirstName());
		System.out.println("last name:" + user.getLastName());
		System.out.println("username:" + user.getUserName());
		return new ModelAndView("redirect:/getAllUsers");
	}
	
	@RequestMapping(value="/getAllUsers.jsp")
	public ModelAndView getUsers(HttpSession session){
		System.out.println(">>>>>> Start run Get all users");
		List<User> userList = new ArrayList<User>();
		/*AbstractApplicationContext context = new AnnotationConfigApplicationContext(ManagedBeanConfiguration.class);
		service = context.getBean(UserService.class);*/
		System.out.println(">>>>>> UserController :" + service);
		userList.addAll(service.getAll());
		return  new ModelAndView("userList", "users", userList);
	}
}
