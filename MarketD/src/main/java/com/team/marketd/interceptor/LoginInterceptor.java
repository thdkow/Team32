package com.team.marketd.interceptor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.team.marketd.service.MemberService;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	MemberService ms;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,Object handler,ModelAndView modelAndView) throws Exception{
	 Object midx = modelAndView.getModel().get("midx"); // object타입은 null과 비교를 할 수 있다
	 System.out.println("midx:?"+midx);
	 
	 System.out.println("여기까지 실행");
	 //여기서 에러
	 int midxx = (int)midx;	//keepLogin에서 int타입을 맞춰주기위해 강제형변환을 사용

	 System.out.println("midxx:"+midxx);
	 //modelAndView.getModelMap().get()은 객체 꺼낼때
	 
	 if(midx != null){
		 System.out.println("midx != null 아니면 실행되는 if문");
		 //컨트롤러에서 담은 모델값 꺼내서 세션에 담기

		//세션에 midx담음(로그인)
		 
		 if(request.getParameter("useCookie")!=null) {		//이 if문 처리를 하지않는다면 자동로그인 체크박스를 풀었을시에 null이들어와 에러가남
		System.out.println("useCookie != null 아니면 실행되는 if문");
			 if (request.getParameter("useCookie").equals("on") ) {		//null에 .equals를 할 수 없다.
			 	System.out.println("실행2?");
			 Cookie useCookie = new Cookie("useCookie",request.getSession().getId());	//
			 System.out.println("cookie:"+useCookie.getValue());
			 useCookie.setPath("/");
			 //7일동안 클라이언트 쿠키보관한다
			 useCookie.setMaxAge(60*60*24*7);				 
			 response.addCookie(useCookie);	
			 
			// DB 테이블에도 날짜 갱신
			 Calendar cal = Calendar.getInstance();
			 cal.setTime(new Date());
			 cal.add(Calendar.DATE, 7);
			 DateFormat df1 = new SimpleDateFormat("yy-MM-dd");   
			 String sessionLimit = df1.format(cal.getTime());
			 
			 ms.keepLogin(midxx, useCookie.getValue(), sessionLimit);	
		  }
		 }
	 }
		}
	 @Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{

		 HttpSession session = request.getSession();	
		 
		 if(session.getAttribute("midx") != null){
			 session.removeAttribute("midx");
		 }
		 
		 return true;		
	 	}
	 }
