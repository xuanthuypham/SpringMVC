package com.tinyworld.spring.configuration;

public class SpringInit /*implements WebApplicationInitializer*/ {
	/*public void onStartup(ServletContext servletContext) throws ServletException {
		// TODO Auto-generated method stub
		AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
		appContext.register(HibernateConfiguration.class);

		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("SpringDispatcher", new DispatcherServlet(appContext));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
		
		
	    ContextLoaderListener contextLoaderListener = new ContextLoaderListener(appContext);
		servletContext.addListener(contextLoaderListener);
		
		
		// Filter.
		FilterRegistration.Dynamic fr = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);

		fr.setInitParameter("encoding", "UTF-8");
		fr.setInitParameter("forceEncoding", "true");
		fr.addMappingForUrlPatterns(null, true, "/*");


		appContext.refresh();

		System.out.println("\n\n\n\n>>>>>>>> SpringInit -->  appContext:" + appContext.toString());
		System.out.println(">>>>>>>> SpringInit --> sessionFactory: "+((SessionFactory)appContext.getBean("sessionFactory")).toString() + "\n\n\n\n");
	}*/
}
