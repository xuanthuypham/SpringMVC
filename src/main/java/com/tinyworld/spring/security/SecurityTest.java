package com.tinyworld.spring.security;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tinyworld.spring.mvc.UserController;

public class SecurityTest {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("springBean.xml");
		UserController uC = (UserController) context.getBean("userController"); 
		System.out.println(">>>>> Start");
		//uC.userForm();
		System.out.println(">>>>>> Finish");
	}
}
