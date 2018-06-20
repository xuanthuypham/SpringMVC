package com.tinyworld.spring.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {

	@RequestMapping("/welcome.jsp")
	public ModelAndView mymethod(){
		return new ModelAndView("welcomepage");
	}
}
