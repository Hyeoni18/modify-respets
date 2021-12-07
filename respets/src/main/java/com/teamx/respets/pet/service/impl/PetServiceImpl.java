package com.teamx.respets.pet.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.pet.mapper.PetMapper;
import com.teamx.respets.pet.service.PetService;

@Service
public class PetServiceImpl implements PetService{

	@Autowired
	private PetMapper petMapper;
	
	@Override
	public List<Map<String, Object>> selectPetList(LoginVO loginVO) throws Exception {
		return petMapper.selectPetList(loginVO);
	}

	@Override
	public Integer selectPetListCnt(LoginVO loginVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
