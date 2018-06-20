package com.tinyworld.spring.example;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tinyworld.spring.configuration.ManagedBeanConfiguration;

public class FirstApp {
	public static void main(String[] args) {
		// Get bean configurations from xml file
		ApplicationContext context = new ClassPathXmlApplicationContext("springBean.xml");
		
		HelloWorld obj = (HelloWorld) context.getBean("helloBean");
		obj.printHello();
		
		// Get bean configuration from Annotaion config 
		context = new AnnotationConfigApplicationContext(ManagedBeanConfiguration.class);
		AnnotationHelloBean anHelloBean = (AnnotationHelloBean)context.getBean("anHelloBean");
		anHelloBean.printScreen();
	}
}