package com.teamx.respets.user.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BusinessVO {

	private int bus_seq;
	private String bus_no;
	private String bus_email;
	private String bus_pw;
	private String bus_name;
	private String bus_ceo;
	private String bus_lcno;
	private String bus_lcno_file_id;
	private String bus_phone;
	private String bus_post;
	private String bus_addr;
	private String bus_dtl_addr;
	private String bus_file_id;
	private String bus_emchk;
	private String bus_chk;
	private String bus_input_dt;
	private String bus_leave;
	private String bus_leave_dt;
	
	private String svc_cd;
	private int svc_sort;
	private String svc_file_id;
	
	private MultipartFile busLicense;
	private MultipartFile mainPhoto;
}
