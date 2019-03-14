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
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.team.marketd.domain.MemberVo;
import com.team.marketd.service.MemberService;

@Component
public class AuthInterceptor extends HandlerInterceptorAdapter {
		
	@Autowired
	MemberService ms;
	
	 @Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{
			System.out.println("Interceptor 실행?");
		 HttpSession session = request.getSession();	
		 System.out.println("session"+session);
		 //로그인 하지않은 경우
		 if(session.getAttribute("midx") == null){
			 System.out.println("들어왔니?");
			//이동할 주소를 담는다
			 saveDest(request); // 원래 가려고했던 주소를 담아두고 자동로그인 성공시 이동
			//본인 pc에 저장된 쿠키 정보를 꺼낸다
			 Cookie useCookie = WebUtils.getCookie(request,"useCookie"); //WebUtils에서 getCookie로 loginCookie이름의 쿠키 매핑하여 변수저장
			 			 System.out.println("너는");
			 //저장된 쿠키에 자동 로그인정보가 있으면
			if (useCookie  != null){ 
				System.out.println("실행?");
			//쿠키에 저장된 키정보와 같은 키가 DB에 있는지 체크해서 있으면 그 회원정보를 담는다 	
			 MemberVo mv =  ms.checkAutoLogin(useCookie.getValue());
			 if (mv != null) {
				 System.out.println("실행2?");
				 //자동로그인 기록이 존재하면 세션에 담고
				 request.getSession().setAttribute("midx", mv.getMidx());	
				
				 Cookie useCookie2 = new Cookie("useCookie",useCookie.getValue());	//갱신 같은이름으로 만들어 전에것은 삭제 키값을 담아서만듬
				 
				 useCookie2.setPath("/");
				 useCookie2.setMaxAge(60*60*24*7);			//쿠키의 키값은 담아놓은데이터들이다. 7일의 기간동안 사용할 수 있게 처리하였다.
				 response.addCookie(useCookie2);
				 
				 // DB 테이블에도 날짜 갱신
				 Calendar cal = Calendar.getInstance();
				 cal.setTime(new Date());
				 cal.add(Calendar.DATE, 7);
				 DateFormat df1 = new SimpleDateFormat("yy-MM-dd");   
				 String sessionLimit = df1.format(cal.getTime());
				 
				 ms.keepLogin(mv.getMidx(), useCookie.getValue(), sessionLimit);				
			 
			 }else {
				 response.sendRedirect(request.getContextPath()+"/index.jsp");
				 return false;
			 }
			 
			}else {			
			 response.sendRedirect(request.getContextPath()+"/login.dobby");
			 return false;
			}
			 
		 }
		 
		 return true;		
	 	}
	
	 private void saveDest(HttpServletRequest req){
	
		 String uri = req.getRequestURI();		 
		 String query = req.getQueryString();
		
		 
		 if (query ==null || query.equals("null")){
			 query = "";
		 }else {
			 query = "?" + query;
		 }
		 
		 if (req.getMethod().equals("GET")){
			 req.getSession().setAttribute("dest", uri+query);
			
		//	 System.out.println("이동해야할 페이지url:"+uri+query);
		 }		 
	 }	
}