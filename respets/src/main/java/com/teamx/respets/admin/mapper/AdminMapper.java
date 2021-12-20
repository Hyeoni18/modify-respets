package com.teamx.respets.admin.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamx.respets.login.vo.LoginVO;

@Mapper
public interface AdminMapper {

	public LoginVO adminLogin(Map<String, Object> map) throws SQLException;

}
