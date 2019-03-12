package com.team.marketd.service;

import java.util.HashMap;
import java.util.List;

import com.team.marketd.domain.BoardAttachVo;

public interface BoardAttachService {

	public int insert(BoardAttachVo bav);
	
	public void delete(String uuid);
	
	public List<BoardAttachVo>findBybno(long pidx);
	
	public int checkproduct(int midx,int caidx,String psubject,String pcontent,int pvol,int pmoney,int pfee,String pip);
	
}
