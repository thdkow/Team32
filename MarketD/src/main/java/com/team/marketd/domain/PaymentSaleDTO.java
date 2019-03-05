package com.team.marketd.domain;

import lombok.Data;

@Data
public class PaymentSaleDTO {
		// Product
	private int pidx;
	private int caidx;
	private int midx;
	private String psubject;
	private String mname;
	private int phit;
	private String pwridate;
	private String pcontent;
	private String pimage;
	private int pvol;
	private int pmoney;
	private int pfee;
	private String pip;
	private String psaleYn;
	private String pdelYn;
		// Delivery
	private int didx;
//	private int oidx;
	private String drecipt;
	private String dtell;
	private String dzip;
	private String daddr;
	private String ddetails;
	private String dmemo;
	private int dwaybill;
	private String dsenddate;
	private String dcancle;
		// Order
	private int oidx;
//	private int pidx;
//	private int midx;
	private String oid;
	String obuydate;
	private int ovol;
	private int omoney;
	private String oip;
	private String ofinal;
	private String ocancle;
	private String odelyn;
	
}
