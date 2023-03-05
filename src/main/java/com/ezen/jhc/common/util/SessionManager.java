package com.ezen.jhc.common.util;

import java.util.Arrays;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component
public class SessionManager {
	 private static final String SESSION_COOKIE_NAME = "jhCustomID";
	  private Map<String, Object> sessionStore = new ConcurrentHashMap<>();
	 
	  /**
	   * 세션 생성
	   */
	  public void createSession(Object value, HttpServletResponse response) {
	    
	    String sessionId = UUID.randomUUID().toString();
	    sessionStore.put(sessionId, value);
	    
	    //쿠키 생성
	    Cookie mySessionCookie = new Cookie(SESSION_COOKIE_NAME, sessionId);
	  
	    mySessionCookie.setPath("/");
	    	    
	    response.addCookie(mySessionCookie);
	  }
	 
	  /**
	   * 세션 조회
	   */
	  public Object getSession(HttpServletRequest request) {
	    Cookie sessionCookie = findCookie(request, SESSION_COOKIE_NAME);
	    if (sessionCookie == null) {
	      return null;
	    }
	 
	    
	    return sessionStore.get(sessionCookie.getValue());
	  }
	 
	  /**
	   * 세션 만료
	   */
	  public void expires(HttpServletRequest request) {
	    Cookie sessionCookie = findCookie(request, SESSION_COOKIE_NAME);
	    
	    if (sessionCookie != null) {
	      sessionStore.remove(sessionCookie.getValue());
	    }
	  }
	 
	 
	  public Cookie findCookie(HttpServletRequest request, String cookieName) {
	    Cookie[] cookies = request.getCookies();
	    
	    if (cookies == null) {
	      return null;
	    }
	    return Arrays.stream(cookies).filter(c -> c.getName().equals(cookieName))
	        .findAny()
	        .orElse(null);
	  }

}
