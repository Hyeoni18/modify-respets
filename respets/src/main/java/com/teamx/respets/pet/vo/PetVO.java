package com.teamx.respets.pet.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PetVO {
	private String petNo;
	private String perNo;
	private String petKnd;
	private String petName;
	private int petBirth;
	private String petSex;
	private String petNtr;
	private String petFileId;
	
	private String[] petDtlInfo;
	private String[] petInfoCd;
	
	private MultipartFile upload;
}
