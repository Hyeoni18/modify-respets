package com.teamx.respets.user.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.vo.UserVO;

@Mapper
public interface UserMapper {

	public Map<String, Object> selectMyInfo(String no) throws SQLException;

	public boolean deleteUser(String no) throws SQLException;

	public void updateUserInfo(UserVO userVo) throws SQLException;

	public List<Map<String, Object>> selectLikeBusiness(LoginVO loginVO) throws SQLException;

	public void deleteLikeBusiness(Map<String, Object> map) throws SQLException;

}
