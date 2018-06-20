package com.tinyworld.jsf.action;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import com.tinyworld.spring.configuration.ManagedBeanConfiguration;

public class ActionBase {
	private static AbstractApplicationContext context ;
	
	static{
		context = new AnnotationConfigApplicationContext(ManagedBeanConfiguration.class);	
	}
	
	protected Object getBean(Class classBean){
		return context.getBean(classBean);
	}
}
