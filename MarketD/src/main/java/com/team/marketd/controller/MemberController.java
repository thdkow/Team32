package com.team.marketd.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.marketd.domain.MemberVo;
import com.team.marketd.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;

	@RequestMapping(value = "MemberJoin.dobby", method = RequestMethod.GET)
	public String memberJoin() { // 회원가입 페이지 이동 해결
		return "member/memberJoin";
	}
	
	@RequestMapping(value = "MemberJoinAction.dobby", method = RequestMethod.POST) //회원가입 기능 해결
	public String memberJoinAction(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
			@RequestParam("name") String name, @RequestParam("birth") int birth, @RequestParam("sex") String sex,
			@RequestParam("mmail1") String mmail1, @RequestParam("mmail2") String mmail2,
			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3, @RequestParam("caidx") int caidx,
			@RequestParam("maccount") long maccount, @RequestParam("mkakao") String kakao,
			@RequestParam("question") String question, @RequestParam("mquestion") String mquestion) { // 회원정보 저장
		String mail = mmail1 + "@" + mmail2; // 이메일 합친거
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		// 휴대폰 번호 합친거
		/*
		 * System.out.println("계좌번호:"+maccount); //계좌번호 찍기
		 */ String ip = null; // ip 담을 변수 생성
		try {
			ip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		/*
		 * System.out.println(ip); //아이피 찍어보기
		 */
		if (ms.selectDoubleIdCheck(id) == 1) {
			System.out.println("회원가입 실패");
			return "redirect:/MemberJoin.dobby";
		} else {
			ms.insertProfile(id, pwd, name, birth, sex, mail, phone, caidx, maccount, kakao, mquestion, ip);
			return "login/login";
		}
	}

	@RequestMapping(value = "login.dobby")
	public String memberLogin() { // 로그인 페이지 이동 해결

		return "login/login";
	}

	@RequestMapping(value = "loginAction.dobby")
	public String memberLoginAction(@RequestParam("id") String id, @RequestParam("pwd") String pwd, Model model,
			HttpSession session) { // 로그인 작동 해결
		System.out.println(id);
		System.out.println(pwd);
		MemberVo mv = ms.login(id, pwd);
		session.setAttribute("midx", mv.getMidx()); // session 만들기
		System.out.println("추천수:" + mv.getMgood());
		int a = mv.getMgood() - mv.getMbad();
		System.out.println("추천 비추천 결과를 계산한값 :"+a);
		String mgrade = null;
		if (5 <= a && a <10 ) {  // 추천과 비추천의 합이 5보다 크거나 같고 10보다 작다면 Silver등급
			mgrade = "S";
		} else if (10 <= a && a<15) { //추천과 비추천의 합이 10보다 크거나 같고 15보다 작다면 Gold 등급
			mgrade = "G";
		} else if (15 <= a && a<20) { //추천과 비추천의 합이 15보다 크거나 같고 20보다 작다면 platinum 등급
			mgrade = "P";
		} else if (20 <= a ) { //추천과 비추천의 합이 20과 같거나 크다면 Diamond 등급
			mgrade = "D";
		}else if(mgrade==null && a<5) {
			mgrade ="B";
		}
		System.out.println("현재 등급은:"+mgrade);
		ms.updateUpgrade(mgrade, mv.getMidx());

		model.addAttribute("mv", mv);
		return "index";
	}

	@RequestMapping(value = "logoutAction.dobby")
	public String memberLogoutAction(HttpSession session) { // 로그아웃 작동 해결
		System.out.println("세션 삭제전 값:" + session.getAttribute("midx"));
		session.removeAttribute("midx"); //세션 삭제 메소드
		System.out.println("세션 삭제완료?");
		System.out.println("세션 삭제후 값:" + session.getAttribute("midx"));
		return "redirect:index.jsp";
	}

/*	@RequestMapping("IdFind.dobby")
	public String memberIdFind() { // 아이디 찾기 페이지 이동
	
		return "member/memberIdFind";
	}

	@RequestMapping("PwdFind.dobby")
	public String memberPwdFind() { // 비밀번호 찾기 페이지 이동

		return "member/memberPwdFind";
	}*/

	@RequestMapping("IdFindAction.dobby") //아이디찾기 해결
	public String memberNewIdFindAction(@RequestParam("name") String name, @RequestParam("birth") int birth,
			@RequestParam("question") String question, Model model) {
/*		System.out.println("이름" + name);
		System.out.println("생년월일" + birth);
		System.out.println("질문" + question);*/
		MemberVo mv = ms.selectIdFind(name, birth, question); // 메소드 반환값을 mv에 담음
		System.out.println(mv.getMid());
		model.addAttribute("mv", mv); //model.addAttribute 로 view단으로 보내줌 
		return "member/memberIdFind";
	}

	@RequestMapping("PwdFindAction.dobby")//비밀번호 찾기 해결
	public String memberNewPwdFindAction(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("mquestion") String mquestion, Model model) { // 비밀번호 찾기 작동
		System.out.println("아이디:" + id);
		System.out.println("이름:" + name);
		System.out.println("question:" + mquestion);
		MemberVo mv = ms.selectPwdFind(id, name, mquestion); // 메소드 결과값 mv에 저장 view단에 전달하고 확인하기 위해서

		model.addAttribute("mv", mv); // view 단에 보내주기
		System.out.println(mv.getMpwd());
		return "member/memberPwdFind";
	}

	@RequestMapping("PwdUpdate.dobby")
	public String memberNewPwdSave(HttpSession session) { // 새 비밀번호 입력창이동
		int midx =(int)session.getAttribute("midx");
		return "login/memberPwdFindComplete";
	}

	@RequestMapping("PwdUpdateAction.dobby")
	public String memberNewPwdSaveAction(@RequestParam("newpwd") String newpwd, @RequestParam("newpwd2") String newpwd2,
			@RequestParam("midx") int midx) { // 비밀번호 바꾸기
		System.out.println(newpwd);
		System.out.println(newpwd2);
		System.out.println("midx의 값은:" + midx);
		ms.updatePwd(newpwd, midx); 
		return "login/login";
	}

	@RequestMapping("memberProfile.dobby")
	public String memberProfile(HttpSession session, Model model) { // 회원정보 보기 페이지 이동
		int midx = (int) session.getAttribute("midx");
		MemberVo mv = ms.selectProfile(midx); 
		model.addAttribute("mv", mv); //객체를 model.addAttribute에 담아서 view단으로 보내준다
		return "member/memberContent";
	}

	@RequestMapping("memberCheck.dobby")
	public String memberModifyProfile(@RequestParam("pwd") String pwd, Model model, HttpSession session) { // 회원정보 수정페이지
																											// 이동
		int midx = (int) session.getAttribute("midx"); // 세션 형변환
		MemberVo mv = ms.selectProfile(midx); // 회원정보 출력
		MemberVo mv2 = ms.checkPwd(midx, pwd); // 회원정보 수정페이지로 이동전 비밀번호 체크
		model.addAttribute("mv", mv);
		model.addAttribute("mv2", mv2);
		if (mv.getMpwd().equals(mv2.getMpwd())) { // DB안에 저장되있는 비밀번호와 입력한 비밀번호가 같은지 체크
			System.out.println("if 실행?");
			return "member/memberUpdate"; // 같다면 회원정보 수정페이지로
		} else { // 비밀번호가 맞지않을시 인덱스로 페이지로 이동해야되지만 에러페이지로 이동
			System.out.println("else 실행?");
			return "redirect:index.jsp";
		}
	}

	@RequestMapping("memberUpdate.dobby") // 회원정보 수정하기
	public String memberModifyProfileAction(@RequestParam("midx") int midx, @RequestParam("pwd") String pwd,
			@RequestParam("mmail1") String mmail1,@RequestParam("mmail2")String mmail2, @RequestParam("caidx") int caidx,
			@RequestParam("phone1") String phone1,@RequestParam("phone2")String phone2,@RequestParam("phone3")String phone3,
			@RequestParam("maccount") long account, @RequestParam("mkakao") String mkakao,
			@RequestParam("mquestion") String mquestion) {
		String email= mmail1+"@"+mmail2;
		String phone= phone1+"-"+phone2+"-"+phone3;
		ms.updateProfile(midx, pwd,phone, email, caidx, account, mkakao, mquestion);// 리턴값없이 void로 메소드 실행만
		return "redirect:index.jsp";

	}

	//로그인 할때 회원등급 상승을 시키므로 구현하지 않아도 됨
/*	@RequestMapping("memberMgrade.dobby") //회원등급 상승작동
	public String memberUpgradeAction(@RequestParam("mgrade") String mgrade, @RequestParam("midx") int midx) { 
																												

		return null;
	}*/
	
	@RequestMapping("memberRecommend.dobby")
	public String memberGBAction(HttpSession session,@RequestParam("rflag")String rflag,@RequestParam("pidx")int pidx,@RequestParam("chidx")int chidx) { // 추천 작동
		System.out.println("컨트롤러 접속");
		System.out.println("rflag:"+rflag);
		System.out.println("pidx:"+pidx);
		System.out.println("chidx:"+chidx);
		MemberVo mv = ms.checkGB1(pidx);
		System.out.println("여기까지실행?");
		System.out.println("checkGB1:"+ms.checkGB1(pidx));
		//여기까지 실행
		System.out.println("추천할 회원번호는?"+mv.getMidx());
		ms.updateGB(mv.getMidx(), chidx, rflag);
		return "redirect:index.jsp";
	}

	public String memberAutoLogin() { // 자동로그인

		return null;
	}

	@RequestMapping("deleteMember.dobby")
	public String memberDeleteAction(int midx) { // 회원탈퇴
		ms.deleteProfile(midx);

		return "redirect:index.jsp";
	}

}
