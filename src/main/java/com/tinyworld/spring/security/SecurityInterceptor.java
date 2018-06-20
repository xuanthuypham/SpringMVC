package com.tinyworld.spring.security;

import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;


@Aspect
public class SecurityInterceptor {
	@Pointcut("within(@org.springframework.stereotype.Controller *)")
	public void controllerBean() {}

	@Pointcut("execution(* com.tinyworld.spring.mvc.UserController.*(..))")
	public void pointSecurity() {}
	
	@Pointcut("within(@javax.faces.bean.ManagedBean *)")
	public void JSFManagedBean(){}
	
	@Pointcut("execution(* com.tinyworld.jsf.action.UserAction.*(..))")
	public void pointJSFUserActionSecurity() {}
	
	/**
	 * 1. Get role of current-user: role is stored in session attribute (name is "role") when user login successfully.
	 * 2. Get Allowed roles in the controller: allowed roles are configed in Annotation of each controller 
	 * 3. Compare the current user's role with Controller's allowed roles
	 * 3.1 if Allowed roles has the current user's role the let the controller runs
	 * 3.2 else redirect user to login page.
	 * @param joinPoint
	 * @return
	 * @throws Throwable
	 */
	@Around("controllerBean() && pointSecurity()")
	public Object checkControllerPermission(ProceedingJoinPoint joinPoint) throws Throwable{
		System.out.println("\n\n\n\nAnnotationAspect>>>>>> logAround()");
		//1. Get role of current-user
		// Get HttpServerletRequest Attributes and HTTP Session
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession();
		
		// Get session set to current user
		Role role = (Role)session.getAttribute("role");
		System.out.println(">>>>>> Set Role of user is:" + role);
		
		
		// 2. Get Allowed roles in the controller
		// Get the class which is processed, then get it's annotation configurations 
		AnnotatedElement annotatedElement = (AnnotatedElement) joinPoint.getTarget().getClass();
		System.out.println("\n\n\n\n>>>>>>>> checkControllerPermission:" + annotatedElement);
		// Get the SecurityAnnotation
		Annotation annotation = annotatedElement.getAnnotation(SecurityAnnotation.class);
		// From annotation configuration, get the Class
		SecurityAnnotation annotationRule = (SecurityAnnotation) annotation;
		// Get all roles set into
		System.out.println(">>>>>>>> checkControllerPermission: " + annotationRule);
		List<Role> requiredRolesList = Arrays.asList(annotationRule.allowedRole());
		for(Role r : requiredRolesList){
			System.out.println("Role's name: " + r);
		}

		// The method is processed
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("Method's arguments : " + Arrays.toString(joinPoint.getArgs()));

		System.out.println("Around before");
		Object result = null;
		// 3. Compare the current user's role with Controller's allowed roles
		// 3.1 if Allowed roles has the current user's role the let the controller runs
		if(requiredRolesList.contains(role)){
			System.out.println("-----> Valid permission");
			// Get the result of processing Controller an return it, in here it's the ModelAndView object referent to a JSP page
			result = joinPoint.proceed();
		} 
		// 3.2 else redirect user to login page.
		else {
			result =  new ModelAndView("redirect:/hello.jsp");
		}
		
		System.out.println("Around after");
		System.out.println("------------------------");
		return result;
	}
	
	@Around("pointJSFUserActionSecurity()")
	public void checkJSFBeanAction(ProceedingJoinPoint joinPoint) throws Throwable{
		System.out.println("\n\n\n\nSecurityInterceptor>>>>>> logAround()");
		// The method is processed
		System.out.println("Method's name : " + joinPoint.getSignature().getName());
		System.out.println("Method's arguments : " + Arrays.toString(joinPoint.getArgs()));

		System.out.println("SecurityInterceptor>>>>>> Around before");
		
		joinPoint.proceed();
		
		System.out.println("SecurityInterceptor>>>>>> Around after");
		System.out.println("------------------------");
		//return result;
	}
}
