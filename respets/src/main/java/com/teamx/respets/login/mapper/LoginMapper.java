package com.teamx.respets.login.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.vo.BusinessVO;
import com.teamx.respets.user.vo.UserVO;

public interface LoginMapper {

	public LoginVO getUser(Map<String, Object> map) throws SQLException;

	public String selectBlackList(Map<String, Object> map) throws SQLException;

	public List<Map<String, String>> selectBusCategory() throws SQLException;

	public void insertPersonalJoin(UserVO userVo) throws SQLException;

	public void insertBusinessJoin(BusinessVO busiVO) throws SQLException;

	public void insertBusJoinSvc(BusinessVO busiVO) throws SQLException;

	public void updateEmailChk(String email) throws SQLException;

	public Map<String, Object> findId(Map<String, Object> map) throws SQLException;

	public List<Map<String, Object>> findRND(Map<String, Object> map) throws SQLException;

	public void deleteRND(Map<String, Object> map) throws SQLException;

	public boolean insertRND(Map<String, Object> map) throws SQLException;

	public Map<String, Object> checkRcode(Map<String, Object> rtbMap) throws SQLException;

	public void updatePerPw(Map<String, Object> map) throws SQLException;

	public void updateBusPw(Map<String, Object> map) throws SQLException;

}
