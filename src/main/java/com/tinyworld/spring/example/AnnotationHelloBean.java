package com.tinyworld.spring.example;

public class AnnotationHelloBean {
	private String name;
	
	public void initName(){
		this.name = "Ha";
		System.out.println("\n\n\n\n>>>>>>AnnotationHelloBean: Run init function");
	}
	
	public void printScreen(){
		System.out.println("AnnotationHelloBean: Hello World, my name is " + this.name);
	}
	
	public void destroyMethod(){
		this.name = null;
		System.out.println(">>>>>>AnnotationHelloBean: Destroy method runs");
	}
}
