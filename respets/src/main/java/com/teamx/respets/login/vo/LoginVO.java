package com.teamx.respets.login.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginVO {
	
	private String no;
	private String email;
	private String pw;
	private String name;
	private String phone;
	private String fileId;
	private String emchk;
	private String leave;
	private String type;
	
	private String alert; //추후삭제예정
	private String view; //추후삭제예정
}
