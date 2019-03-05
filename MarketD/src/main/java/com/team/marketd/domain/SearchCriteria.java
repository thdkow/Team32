package com.team.marketd.domain;

public class SearchCriteria extends Criteria {
	//Criteria를 상속받아 사용하는 검색의 기능이있는 클레스
	private String searchType; //검색유형(제목,이름 등)
	private String keyword;    //검색 키워드
	private String ppagenum;  
	private String category;   //
	private String minPrice ;
	private String maxPrice ;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}
	public String getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(String maxPrice) {
		this.maxPrice = maxPrice;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {	
		return keyword;
	}
	public void setKeyword(String keyword) {
		
		this.keyword = keyword;
	}
	public String getPpagenum() {
		return ppagenum;
	}
	public void setPpagenum(String ppagenum) {
		this.ppagenum = ppagenum;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [page=" + super.getPage() + ", perPageNum=" + super.getPerPageNum() + ",keyword="+keyword+",searchType="+searchType+"]";
	}
	
	

}
