package com.team.marketd.persistence;

public interface MemberService_Mapper {
	

	public String selectDoubleIdCheck();
	
	public String insertProfile();
	
	public String login();
	
	public String checkAutoLogin();
	
	public String keepLogin();
	
	public String selectIdFind();
	
	public String selectPwdFind();
	
	public String updatePwd();
	
	public String selectProfile();
	
	public String checkPwd();
	
	public String updateProfile();
	
	public String updateUpgrade();
	
	public String deleteProfile();
	
	public String checkGB1();
	
	public String checkGB2();
	
	public String insertGB();
	
	public String updateGB();
	

	
}
