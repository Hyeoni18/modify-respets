package com.teamx.respets.pet.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamx.respets.common.mapper.CommonMapper;
import com.teamx.respets.common.util.UploadFileUtils;
import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.pet.mapper.PetMapper;
import com.teamx.respets.pet.service.PetService;
import com.teamx.respets.pet.vo.PetVO;

@Service
public class PetServiceImpl implements PetService{

	@Autowired
	private PetMapper petMapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@Override
	public List<Map<String, Object>> selectPetList(LoginVO loginVO) throws Exception {
		return petMapper.selectPetList(loginVO);
	}

	@Override
	public Integer selectPetListCnt(LoginVO loginVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPet(PetVO petVO) throws Exception {
		if (!petVO.getUpload().isEmpty()) {
			Map<String, Object> fileMap = uploadFileUtils.fileUpload(petVO.getUpload());
			
			commonMapper.insertFile(fileMap);
			petVO.setPetFileId(String.valueOf(fileMap.get("fileId")));
		}
		
		petMapper.insertPet(petVO);
		
		for(int i=0; i<petVO.getPetDtlInfo().length; i++) {
			if(!petVO.getPetDtlInfo()[i].isEmpty()) {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("petNo", petVO.getPetNo());
				map.put("petDtlInfo", petVO.getPetDtlInfo()[i]);
				map.put("petInfoCd", petVO.getPetInfoCd()[i]);
				petMapper.insertPetDtl(map);
			}
		}
		
	}

}
