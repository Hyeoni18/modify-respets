package com.teamx.respets.business.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BusinessMapper {

	public List<Map<String, Object>> selectBusinessList(String svcCd) throws SQLException;
	
	public List<Map<String, Object>> selectHashTagBusinessList(String hashTag) throws SQLException;
	
}
