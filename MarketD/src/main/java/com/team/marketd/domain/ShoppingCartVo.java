package com.team.marketd.domain;

import lombok.Data;

@Data
public class ShoppingCartVo {

	private int sidx;
	private int midx;
	private int pidx;
	private int svol;
	private String sdate;
	
	private int pmoney;
	private int pfee;
	private String psubject;
	
	private String mname;
	
}
