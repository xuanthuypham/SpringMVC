package com.tinyworld.hibernate;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	public static SessionFactory SESSION_FACTORY;

	static {
		try {
			System.out.println("\n\n\n\n>>>>>> Generate SessionFactory:");
			// Create the SessionFactory from hibernate.cfg.xml
			if(SESSION_FACTORY == null || SESSION_FACTORY.isClosed())
				SESSION_FACTORY = new Configuration().configure().buildSessionFactory();
		} catch (HibernateException ex) {
			// Make sure you log the exception, as it might be swallowed
			System.err.println("\n\t>>>>>> SessionFactory creation failed:\n" + ex + "\n\n");
			throw ex;
		}
	}

	public static SessionFactory getSessionFactory() {
		return SESSION_FACTORY;
	}

	public static void shutdown() {
		// Close caches and connection pools
		getSessionFactory().close();
	}
}
