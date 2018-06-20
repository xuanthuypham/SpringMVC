package com.tinyworld.spring.configuration;

import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.tinyworld.hibernate.dao.PermissionDao;
import com.tinyworld.hibernate.dao.PermissionDaoImpl;
import com.tinyworld.hibernate.dao.UserDao;
import com.tinyworld.hibernate.dao.UserDaoImpl;

@Configuration
@EnableTransactionManagement
//@ComponentScan({ "com.tinyworld.spring.configuration" })
@PropertySource(value = { "classpath:hibernateconfig.properties" })
public class HibernateConfiguration {
	@Autowired
	private Environment environment;

	@Bean
	public /*SessionFactory*/ LocalSessionFactoryBean sessionFactory(DataSource dataSource) throws IOException {
		LocalSessionFactoryBean localSesFactory = new LocalSessionFactoryBean();
		localSesFactory.setDataSource(dataSource);
		localSesFactory.setPackagesToScan(new String[] { "com.tinyworld.hibernate.model" });
		localSesFactory.setHibernateProperties(hibernateProperties());
		localSesFactory.afterPropertiesSet();
		System.out.println("-----> HibernateConfiguration--> sessionFactory--> localSesFactory:" + localSesFactory.toString());
		System.out.println("-----> HibernateConfiguration--> sessionFactory--> SessonFactory:" + localSesFactory.getObject().toString());
		System.out.println("\n\n\n\n");
		return localSesFactory;
	}

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(environment.getRequiredProperty("jdbc.driverClassName"));
		dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
		dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
		dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));
		return dataSource;
	}

	private Properties hibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
		properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
		properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
		properties.put("current_session_context_class", environment.getProperty("current_session_context_class"));
		return properties;        
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager transactionManager(SessionFactory s) {
		System.out.println(">>>>>> HibernateConfiguration: transactionManager -->SessionFactory: " + s.toString());
		HibernateTransactionManager txManager = new HibernateTransactionManager(s);
		//txManager.setSessionFactory(s);
		System.out.println("\n\n\n\n");
		return txManager;
	}
	
	@Bean
	public UserDao userDao(){
		UserDao userDao = new UserDaoImpl();
		return userDao;
	}
	
	@Bean
	public PermissionDao permissionDao(){
		return new PermissionDaoImpl();
	}
}
