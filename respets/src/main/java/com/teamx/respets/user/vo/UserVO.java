package com.teamx.respets.user.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	
	private String perNo;
	private String perEmail;
	private String perPw;
	private String perName;
	private String perPhone;
	private String perFileId;
	private String perEmchk;
	private String perLeave;
	private String perLeaveDt;

	private MultipartFile upload;
}
