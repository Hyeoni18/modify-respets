package com.teamx.respets.pet.service;

import java.util.List;
import java.util.Map;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.pet.vo.PetVO;

public interface PetService {

	public List<Map<String, Object>> selectPetList(LoginVO loginVO) throws Exception;

	public Integer selectPetListCnt(LoginVO loginVO) throws Exception;

	public void insertPet(PetVO petVO) throws Exception;

	public Map<String, Object> selectPetInfo(PetVO petVO) throws Exception;

	public List<Map<String, Object>> selectPetDtlInfo(PetVO petVO) throws Exception;

	public void updatePet(PetVO petVO) throws Exception;

	public void deletePet(PetVO petVO) throws Exception;

}
