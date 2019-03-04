package com.team.marketd.domain;

public class SearchCriteria extends Criteria {
	//Criteria�� ��ӹ޾� ����ϴ� �˻��� ������ִ� Ŭ����
	private String searchType; //�˻�����(����,�̸� ��)
	private String Keyword;    //�˻� Ű����
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
