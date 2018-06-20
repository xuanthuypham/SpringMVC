package com.tinyworld.spring.security;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface SecurityAnnotation {
	Role[] allowedRole();
}
