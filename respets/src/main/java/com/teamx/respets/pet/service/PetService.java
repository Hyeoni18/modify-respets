package com.teamx.respets.pet.service;

import java.util.List;
import java.util.Map;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.pet.vo.PetVO;

public interface PetService {

	public List<Map<String, Object>> selectPetList(LoginVO loginVO) throws Exception;

	public Integer selectPetListCnt(LoginVO loginVO) throws Exception;

	public void insertPet(PetVO petVO) throws Exception;

}
