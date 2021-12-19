package com.teamx.respets.board.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	
	private String boardNo;
	private String ctgrCd;
	private String boardTitle;
	private String boardContent;
	private String inputNo;
	private String boardFileId; //파일추가필요
	private String inputDt;

}
