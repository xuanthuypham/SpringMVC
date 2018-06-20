

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tinyworld.spring.example.HelloWorld;

public class AppTest {
	public static void main(String[] args) {
		System.out.println(">>>>>> Start");
		ApplicationContext context = new ClassPathXmlApplicationContext("springBean.xml");
		HelloWorld helloWorld = (HelloWorld) context.getBean("helloBean"); 
		System.out.println("I. Call printHello function ");
		helloWorld.printHello();
		System.out.println("\n\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("II. Call sayHello function, with argument is \"Mai Van Ha\"");
		helloWorld.sayHello("Mai Van Ha");
		System.out.println(">>>>>> Finish");
	}
}
