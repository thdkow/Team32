package com.team.marketd.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team.marketd.domain.CommentVo;
import com.team.marketd.service.CommentService;

@RestController
public class CommentController {
	
	@Autowired
	CommentService cs;
	String reuslt = null;
	
	@GetMapping(value="/product/{pidx}/{page}/commentlist.dobby"//댓글 리스트 이동(Ajax)
			,produces={	MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public ArrayList<CommentVo> commentList(@PathVariable("pidx")int pidx
			,@PathVariable("page")int page) { 

			ArrayList<CommentVo> commentlist = cs.selectCommentList(pidx,page);
		
					return commentlist;//페이지 완성후 페이지 주소로 바꾸기 지금은 데이터 확인용
	}
	
	@PostMapping(value="/product/commentWriteAction.dobby"
				,produces= {MediaType.APPLICATION_JSON_UTF8_VALUE,
							MediaType.APPLICATION_XML_VALUE})//댓글  입력
	public HashMap<String, Object> commentWriteAction(@RequestBody CommentVo cv)
			throws Exception{
		
									String cip = null;
								try{
									cip = InetAddress.getLocalHost().getHostAddress();
								} catch (UnknownHostException e) {
									e.printStackTrace();
								}
					cv.setCip(cip);
	String result = cs.insertComment(cv);
		
		HashMap<String, Object> hm= new HashMap<String, Object>();
								hm.put("result", result);
								
					return hm;
	}
	
	@DeleteMapping(value="/Comment/{cidx}/deleteComment.dobby"
			,produces={	MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public void deleteCommentAction(
				@PathVariable("cidx") int cidx ) throws Exception{
		
							String cdelip = null;
						try{
							cdelip = InetAddress.getLocalHost().getHostAddress();
							} catch (UnknownHostException e) {
								e.printStackTrace();
							}

				CommentVo cv = new CommentVo();

					cv.setCdelip(cdelip);
					cv.setCidx(cidx);
					cs.deleteCommentAction(cv);
	}
		@PostMapping(value="/comment/commentReplyWrite.dobby"//댓글에 답글 달기(원글 정보 전달)
				,produces={	MediaType.APPLICATION_JSON_UTF8_VALUE})
		public int commentReplyWrite(@RequestBody CommentVo cv) {
			
								String cip = null;
							try{
								cip = InetAddress.getLocalHost().getHostAddress();
							} catch (UnknownHostException e) {
								e.printStackTrace();
							}
							
				cs.replycomment(cv.getCorigincidx(),cv.getCupdown());
				
						HashMap<String, Object> hm = new HashMap<String, Object>();
						hm.put("pidx", cv.getPidx());
						hm.put("midx", cv.getMidx());
						hm.put("cwriter", cv.getCwriter());
						hm.put("ccontent", cv.getCcontent());
						hm.put("corigincidx", cv.getCorigincidx());
						hm.put("cleftright", cv.getCleftright());
						hm.put("cupdown", cv.getCupdown());
						hm.put("cip", cip);
				
			/*int corigincidx=(int)hm.get("corigincidx");
			int cupdown=(int)hm.get("cupdown");
				cs.replycomment(corigincidx,cupdown);
				*/
			int resultreply	= cs.insertCommentReply(hm);
			/*model.addAttribute("cv", resultreply);
			 * return "redirect:*/
			return resultreply;
		}
	@GetMapping(value="comment/{cidx}/commentOne.dobby"
			,produces={	MediaType.APPLICATION_JSON_UTF8_VALUE})
	public CommentVo commentOne(@PathVariable("cidx")int cidx) {//하나의 댓글의 정보를 출력 용도
				
			CommentVo cv = cs.selectCommentOne(cidx);
		
					return cv;
	}
}
