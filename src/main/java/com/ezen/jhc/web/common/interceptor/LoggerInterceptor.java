package com.ezen.jhc.web.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j2;


@Log4j2
public class LoggerInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {	
		
		HttpSession session=request.getSession();
		if(session.getAttribute("ADMIN_LOGIN")==null) {
			log.info("ADMIN_LOGIN  세션값 널");		
			response.sendRedirect("/admin/login");			
			return false;
		}
		return true;
	}

}
