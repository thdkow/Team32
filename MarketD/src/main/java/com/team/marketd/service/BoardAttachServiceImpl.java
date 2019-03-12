package com.team.marketd.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.marketd.domain.BoardAttachVo;
import com.team.marketd.persistence.BoardAttachService_Mapper;

@Service
public class BoardAttachServiceImpl implements BoardAttachService {

	BoardAttachService_Mapper bam;
	
	@Autowired
	BoardAttachServiceImpl(SqlSession session){
		this.bam = session.getMapper(BoardAttachService_Mapper.class);
	}

	@Override
	public int insert(BoardAttachVo bav) {
		
		int result =bam.insert(bav);
		return result;
	}

	@Override
	public void delete(String uuid) {
		bam.delete(uuid);
		
	}

	@Override
	public List<BoardAttachVo> findBybno(long pidx) {
		List<BoardAttachVo> result = bam.findBybno(pidx);
		return result;
	}

	@Override
	public int checkproduct(int midx,int caidx,String psubject,String pcontent,int pvol,int pmoney,int pfee,String pip) {
		HashMap<String, Object> hm =new HashMap<String, Object>();
						hm.put("midx", midx);
						hm.put("caidx", caidx);
						hm.put("psubject", psubject);
						hm.put("pcontent", pcontent);
						hm.put("pvol", pvol);
						hm.put("pmoney", pmoney);
						hm.put("pfee", pfee);
						hm.put("pip", pip);
				int result = bam.checkproduct(hm);
		return result;
	}
	
	
}
