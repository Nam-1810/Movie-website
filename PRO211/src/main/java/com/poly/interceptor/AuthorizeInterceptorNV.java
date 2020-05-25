  package com.poly.interceptor;
  
  import javax.servlet.http.HttpServletRequest; 

  import javax.servlet.http.HttpServletResponse; 
  import javax.servlet.http.HttpSession;
  
  import org.springframework.beans.factory.annotation.Autowired;
  import org.springframework.stereotype.Component; 
  import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
  
  @Component 
  public class AuthorizeInterceptorNV extends HandlerInterceptorAdapter {
  
  @Autowired 
  HttpSession session;
  
  @Override 
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	  if(session.getAttribute("nhanvien") == null) {
		  session.setAttribute("back-urlnv", request.getRequestURI());
		  session.setAttribute("message-login","Vui lòng đăng nhập");
		  response.sendRedirect("/admin/dangnhap"); 
		  return false; 
	  }
  System.out.println("AuthorizeInterceptor.preHandle()"); 
  return true; 
  } 
 }
  
 