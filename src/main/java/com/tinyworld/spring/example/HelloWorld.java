package com.tinyworld.spring.example;

public class HelloWorld {
	private String name;

	public void setName(String name) {
		this.name = name;
	}

	public void printHello() {
		System.out.println("Hello Spring, My name is " + name);
	}
	
	public void sayHello(String name){
		System.out.println("Spring AOP says hello to " + name);
	}
}
