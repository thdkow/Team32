package com.team.marketd.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


public class PageMaker {
	//페이지를 만들어주는 이름그대로의 페이지이다.
	private int totalCount;//표시하여 페이지의 담아야하는 갯수(현재 메소드를 하나더만들어 DB의 delYn이N인모든것을 count로 int로담았다)
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;	
	private int displayPageNum = 10;//<- 1 2 3 4 5 6 7 8 9 10 -> 이것
	private SearchCriteria scri;
	/*private SearchCriteria scri;
	
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}*/
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
		}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	//	System.out.println("totalCount:"+totalCount);
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}	
	
	public void calcData(){
	/*	System.out.println("endPage"+endPage);
		System.out.println("cri.getPage()"+cri.getPage());
		System.out.println("displayPageNum"+displayPageNum);
		System.out.println("startPage"+startPage);
		System.out.println("totalCount"+totalCount);
		System.out.println("cri.getPerPageNum()"+cri.getPerPageNum());
		System.out.println("prev"+prev);*/
		
		endPage = (int) (Math.ceil(scri.getPage()/
				(double)displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum)+1;
		
		int tempEndPage = (int) (Math.ceil(totalCount/(double) scri.getPerPageNum()));
		
		
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}		
		prev = startPage == 1 ? false : true;		
		next = endPage * scri.getPerPageNum() >= totalCount ? false : true;
		
	}	
	
	/*public String makeQuery(int page){
		UriComponents uriComponents = 
				UriComponentsBuilder         //Spring에서 사용(Component클래스에 담아서 이용)
				.newInstance()
				.queryParam("page", page)
			//	.queryParam("perPageNum", cri.getPerPageNum())
				.build();
				
		return uriComponents.toUriString();
	}*/
	public String makeSearch(int page){     //get방식으로 uri뒤쪽에 붙여서 주렁주렁 보낼필요없이 메소드 하나로 처리를 할 수있다.
		UriComponents uriComponents = 
				UriComponentsBuilder
				.newInstance()
				.queryParam("page", page)
				.queryParam("scount", scri.getPerPageNum())
				.queryParam("searchType", scri.getSearchType())
				.queryParam("keyword", encoding(scri.getKeyword()))
				.build();
				
		return uriComponents.toUriString();
	}
	public String makePrev(){  
		UriComponents uriComponents = 
				UriComponentsBuilder //UriComponents클래스는 Path나 query에 해당하는 문자열들을 추가해서 원하는 URI를 생성할 때 사용한다.
				.newInstance()
				.queryParam("page", getStartPage()-1)
				.queryParam("scount", scri.getPerPageNum())
				.queryParam("searchType", scri.getSearchType())
				.queryParam("keyword", encoding(scri.getKeyword()))
				.build();
				
		return uriComponents.toUriString();
	}
	public String makeNext(){     //get방식으로 uri뒤쪽에 붙여서 주렁주렁 보낼필요없이 메소드 하나로 처리를 할 수있다.
		UriComponents uriComponents = 
				UriComponentsBuilder
				.newInstance()
				.queryParam("page", getEndPage()+1)
				.queryParam("scount", scri.getPerPageNum())
				.queryParam("searchType", scri.getSearchType())
				.queryParam("keyword", encoding(scri.getKeyword()))
				.build();
				
		return uriComponents.toUriString();
	}
	
	public String encoding(String keyword){
		
		if(keyword==null || keyword.trim().length()==0){
			return "";
		}		
		try{
			return URLEncoder.encode(keyword, "UTF-8");
		}catch(UnsupportedEncodingException e){
			return "";			
		}
	}
	
	}

