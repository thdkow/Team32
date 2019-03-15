package com.team.marketd.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProductVo {
	
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
	private int ovol;
	private int pmoney;
	private int pfee;
	private String pip;
	private String psaleYn;
	private String pdelYn;
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private List<BoardAttachVo> attachList;//BoardAttachVo 추가 product 등록시 같이 처리할 수 있도록
}
