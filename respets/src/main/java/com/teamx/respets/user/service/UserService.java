package com.teamx.respets.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.vo.UserVO;

public interface UserService {

	public Map<String, Object> selectMyInfo(HttpServletRequest request) throws Exception;

	public int myPwCheck(String now, HttpServletRequest request) throws Exception;

	public void updateUserInfo(UserVO userVo) throws Exception;

	public boolean deleteUser(LoginVO loginVO) throws Exception;
	
}
