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
	 Object midx = modelAndView.getModel().get("midx"); // objectŸ���� null�� �񱳸� �� �� �ִ�
	 System.out.println("midx:?"+midx);
	 
	 System.out.println("������� ����");
	 //���⼭ ����
	 int midxx = (int)midx;	//keepLogin���� intŸ���� �����ֱ����� ��������ȯ�� ���

	 System.out.println("midxx:"+midxx);
	 //modelAndView.getModelMap().get()�� ��ü ������
	 
	 if(midx != null){
		 System.out.println("midx != null �ƴϸ� ����Ǵ� if��");
		 //��Ʈ�ѷ����� ���� �𵨰� ������ ���ǿ� ���

		//���ǿ� midx����(�α���)
		 
		 if(request.getParameter("useCookie")!=null) {		//�� if�� ó���� �����ʴ´ٸ� �ڵ��α��� üũ�ڽ��� Ǯ�����ÿ� null�̵��� ��������
		System.out.println("useCookie != null �ƴϸ� ����Ǵ� if��");
			 if (request.getParameter("useCookie").equals("on") ) {		//null�� .equals�� �� �� ����.
			 	System.out.println("����2?");
			 Cookie useCookie = new Cookie("useCookie",request.getSession().getId());	//
			 System.out.println("cookie:"+useCookie.getValue());
			 useCookie.setPath("/");
			 //7�ϵ��� Ŭ���̾�Ʈ ��Ű�����Ѵ�
			 useCookie.setMaxAge(60*60*24*7);				 
			 response.addCookie(useCookie);	
			 
			// DB ���̺��� ��¥ ����
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
