package com.tinyworld.spring.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class AnnotationAspectLogging {
	@Pointcut("execution(* com.tinyworld.spring.example.HelloWorld.*(..))")
	public void aspectMethod() {}
	
	@Before("aspectMethod()")
	public void logBefore(JoinPoint joinPoint) {
		System.out.println("\nAnnotationAspect>>>>>> logBefore()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("------------------------");
	}
	
	@After("aspectMethod()")
	public void logAfter(JoinPoint joinPoint) {
		System.out.println("\nAnnotationAspect>>>>>> logAfter()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("------------------------");
	}

	@AfterReturning(pointcut = "aspectMethod()",
			returning= "result")
	public void logAfterReturning(JoinPoint joinPoint, Object result) {
		System.out.println("\nAnnotationAspect>>>>>> logAfterReturning()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("Method returned value: " + result);
		System.out.println("------------------------");
	}

	@AfterThrowing(pointcut = "aspectMethod()",
			throwing = "error")
	public void logAfterThrowing(JoinPoint joinPoint, Throwable error) {
		System.out.println("\nAnnotationAspect>>>>>> logAfterThrowing()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("Exception : " + error);
		System.out.println("------------------------");
	}

	@Around("aspectMethod()")
	public void logAround(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("\nAnnotationAspect>>>>>> logAround()");
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("Method's arguments : " + Arrays.toString(joinPoint.getArgs()));

		System.out.println("Around before");
		joinPoint.proceed();
		System.out.println("Around after");

		System.out.println("------------------------");
	}
	
	
}
