package com.teamx.respets.user.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	
	private String per_no;
	private String per_email;
	private String per_pw;
	private String per_name;
	private String per_phone;
	private String per_file_id;
	private String per_emchk;
	private String per_leave;
	private String per_ltime;

	private MultipartFile upload;
}
