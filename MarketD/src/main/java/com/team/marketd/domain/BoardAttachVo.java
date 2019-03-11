package com.team.marketd.domain;

import lombok.Data;

@Data
public class BoardAttachVo {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private long bidx; // 게시글 번호
}
