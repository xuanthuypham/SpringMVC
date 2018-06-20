package com.tinyworld;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import com.tinyworld.spring.configuration.HibernateConfiguration;

public class WebAppInitializer implements WebApplicationInitializer {
	public void onStartup(ServletContext servletContext) throws ServletException {  
		System.out.println("\n\n\n\n-------- WebAppInitializer: Start inits");
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();  
		ctx.register(HibernateConfiguration.class);

		/*System.out.println("-------- WebAppInitializer: setServletContext");
		ctx.setServletContext(servletContext);

		System.out.println("-------- WebAppInitializer: addListener");
		servletContext.addListener(new ContextLoaderListener(ctx));
		//servletContext.addListener(new RequestContextListener());
		 */

		System.out.println("-------- WebAppInitializer: refresh AnnotationConfigWebApplicationContext");
		ctx.refresh();

		System.out.println(">>>>>>>> WebAppInitializer: addServlet");
		Dynamic dynamic = servletContext.addServlet("dispatcher", new DispatcherServlet(ctx));  
		dynamic.addMapping("/");  
		dynamic.setLoadOnStartup(1);  


		System.out.println("-------- WebAppInitializer: Finish inits\n\n\n\n");
	}
}