package com.teamx.respets.user.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BusinessVO {

	private String busNo;
	private String busEmail;
	private String busPw;
	private String busName;
	private String busCeo;
	private String busLcno;
	private String busLcnoFileId;
	private String busPhone;
	private String busPost;
	private String busAddr;
	private String busDtlAddr;
	private String busFileId;
	private String busEmchk;
	private String busChk;
	private String busInputDt;
	private String busLeave;
	private String busLeaveDt;
	
	private String svcCd;
	private int svcSort;
	private String svcFileId;
	
	private MultipartFile busLicense;
	private MultipartFile mainPhoto;
}
