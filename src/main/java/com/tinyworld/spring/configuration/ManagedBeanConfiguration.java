package com.tinyworld.spring.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.tinyworld.spring.example.AnnotationHelloBean;

@Configuration
//@ComponentScan(basePackages = "com.tinyworld.spring")
public class ManagedBeanConfiguration {
	@Bean(initMethod="initName", destroyMethod="destroyMethod")
	public AnnotationHelloBean anHelloBean(){
		System.out.println(">>>>>> BeanManagementConfiguration: anHelloBean");
		return new AnnotationHelloBean();
	}
}
