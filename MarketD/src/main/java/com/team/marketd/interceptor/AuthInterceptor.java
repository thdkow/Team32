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
			System.out.println("Interceptor ����?");
		 HttpSession session = request.getSession();	
		 System.out.println("session"+session);
		 //�α��� �������� ���
		 if(session.getAttribute("midx") == null){
			 System.out.println("���Դ�?");
			//�̵��� �ּҸ� ��´�
			 saveDest(request); // ���� �������ߴ� �ּҸ� ��Ƶΰ� �ڵ��α��� ������ �̵�
			//���� pc�� ����� ��Ű ������ ������
			 Cookie useCookie = WebUtils.getCookie(request,"useCookie"); //WebUtils���� getCookie�� loginCookie�̸��� ��Ű �����Ͽ� ��������
			 			 System.out.println("�ʴ�");
			 //����� ��Ű�� �ڵ� �α��������� ������
			if (useCookie  != null){ 
				System.out.println("����?");
			//��Ű�� ����� Ű������ ���� Ű�� DB�� �ִ��� üũ�ؼ� ������ �� ȸ�������� ��´� 	
			 MemberVo mv =  ms.checkAutoLogin(useCookie.getValue());
			 if (mv != null) {
				 System.out.println("����2?");
				 //�ڵ��α��� ����� �����ϸ� ���ǿ� ���
				 request.getSession().setAttribute("midx", mv.getMidx());	
				
				 Cookie useCookie2 = new Cookie("useCookie",useCookie.getValue());	//���� �����̸����� ����� �������� ���� Ű���� ��Ƽ�����
				 
				 useCookie2.setPath("/");
				 useCookie2.setMaxAge(60*60*24*7);			//��Ű�� Ű���� ��Ƴ��������͵��̴�. 7���� �Ⱓ���� ����� �� �ְ� ó���Ͽ���.
				 response.addCookie(useCookie2);
				 
				 // DB ���̺��� ��¥ ����
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
			
		//	 System.out.println("�̵��ؾ��� ������url:"+uri+query);
		 }		 
	 }	
}