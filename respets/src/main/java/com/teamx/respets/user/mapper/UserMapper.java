package com.teamx.respets.user.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamx.respets.user.vo.BusinessVO;
import com.teamx.respets.user.vo.UserVO;

@Mapper
public interface UserMapper {

	public void insertPersonalJoin(UserVO userVo) throws SQLException;

	public void emailConfirmSuccess(String email) throws SQLException;

	public List<Map<String, String>> selectBusCategory() throws SQLException;

	public void insertBusinessJoin(BusinessVO busiVO) throws SQLException;

	public void insertBusJoinSvc(BusinessVO busiVO) throws SQLException;

	public void insertLicense(Map<String, Object> hMap) throws SQLException;

	public Map<String, Object> findId(Map<String, Object> map) throws SQLException;

	public List<Map<String, Object>> findRND(Map<String, Object> map) throws SQLException;

	public void deleteRND(Map<String, Object> map) throws SQLException;

	public boolean insertRND(Map<String, Object> map) throws SQLException;

}
