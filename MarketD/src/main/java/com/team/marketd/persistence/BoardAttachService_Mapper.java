package com.team.marketd.persistence;

import java.util.HashMap;
import java.util.List;
import com.team.marketd.domain.BoardAttachVo;

public interface BoardAttachService_Mapper {
	
	public int insert(BoardAttachVo bav);
	
	public void delete(String uuid);
	
	public List<BoardAttachVo>findBybno(long pidx);
	
	public int checkproduct(HashMap<String, Object> hm);
}
