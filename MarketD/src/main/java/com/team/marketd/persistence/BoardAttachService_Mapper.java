package com.team.marketd.persistence;

import java.util.List;
import com.team.marketd.domain.BoardAttachVo;

public interface BoardAttachService_Mapper {
	
	public void insert(BoardAttachVo bav);
	
	public void delete(String uuid);
	
	public List<BoardAttachVo>findBybno(long bidx);

}
