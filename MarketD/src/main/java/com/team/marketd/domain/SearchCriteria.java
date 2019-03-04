package com.team.marketd.domain;

public class SearchCriteria extends Criteria {
	//Criteria를 상속받아 사용하는 검색의 기능이있는 클레스
	private String searchType; //검색유형(제목,이름 등)
	private String Keyword;    //검색 키워드
	private String ppagenum = "12";   //
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {	
		return Keyword;
	}
	public void setKeyword(String Keyword) {
		
		this.Keyword = Keyword;
	}
	public String getPpagenum() {
		return ppagenum;
	}
	public void setPpagenum(String ppagenum) {
		this.ppagenum = ppagenum;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [page=" + super.getPage() + ", perPageNum=" + super.getPerPageNum() + ",seltext="+Keyword+",searchType="+searchType+"]";
	}
	
	

}
