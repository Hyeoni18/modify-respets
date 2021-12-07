package com.teamx.respets.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamx.respets.login.vo.LoginVO;

@Mapper
public interface PetMapper {

	public List<Map<String, Object>> selectPetList(LoginVO loginVO) throws SQLException;

}
