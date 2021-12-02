package com.teamx.respets.common.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonMapper {
	
	public int insertFile(Map<String, Object> map) throws SQLException;

}
