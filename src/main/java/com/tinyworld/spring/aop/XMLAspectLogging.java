package com.tinyworld.spring.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class XMLAspectLogging {
	public void logBefore(JoinPoint joinPoint) {
		System.out.println("\nXMLAspec>>>>>> logBefore()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("------------------------");
	}
	
	public void logAfter(JoinPoint joinPoint) {
		System.out.println("\nXMLAspec>>>>>> logAfter()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("------------------------");
	}

	public void logAfterReturning(JoinPoint joinPoint, Object result) {
		System.out.println("\nXMLAspec>>>>>> logAfterReturning()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("Method returned value: " + result);
		System.out.println("------------------------");
	}

	public void logAfterThrowing(JoinPoint joinPoint, Throwable error) {
		System.out.println("\nXMLAspec>>>>>> logAfterThrowing()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("Exception : " + error);
		System.out.println("------------------------");
	}

	public void logAround(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("\nXMLAspec>>>>>> logAround()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("Method's arguments : " + Arrays.toString(joinPoint.getArgs()));

		System.out.println("Around before");
		joinPoint.proceed();
		System.out.println("Around after");

		System.out.println("------------------------");
	}
}
