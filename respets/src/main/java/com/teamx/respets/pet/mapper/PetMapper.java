package com.teamx.respets.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.pet.vo.PetVO;

@Mapper
public interface PetMapper {

	public List<Map<String, Object>> selectPetList(LoginVO loginVO) throws SQLException;

	public void insertPet(PetVO petVO) throws SQLException;

	public void insertPetDtl(Map<String, Object> map) throws SQLException;

}
