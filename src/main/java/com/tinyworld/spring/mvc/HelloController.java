package com.tinyworld.spring.mvc;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tinyworld.spring.configuration.ManagedBeanConfiguration;
import com.tinyworld.spring.example.AnnotationHelloBean;
import com.tinyworld.spring.security.Role;

@Controller
public class HelloController {

	@RequestMapping(method = RequestMethod.GET, value = "/SpringMVC/hello.jsp")
	public ModelAndView mymethod(HttpSession session){
		// Get bean configuration from Annotaion config 
		ApplicationContext context = new AnnotationConfigApplicationContext(ManagedBeanConfiguration.class);
		AnnotationHelloBean anHelloBean = (AnnotationHelloBean)context.getBean("anHelloBean");
		anHelloBean.printScreen();

		session.setAttribute("role", Role.ADMIN);

		ModelAndView mv = new ModelAndView("hellopage");
		mv.addObject("message", "Hello Spring MVC, My name is ");
		mv.addObject("name", "Ha");
		return mv;
	}
}
