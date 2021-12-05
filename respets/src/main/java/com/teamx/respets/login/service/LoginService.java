package com.teamx.respets.login.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.vo.BusinessVO;
import com.teamx.respets.user.vo.UserVO;

public interface LoginService {

	public LoginVO getUser(Map<String, Object> map) throws Exception;

	public String selectBusCategory() throws Exception;

	public void insertPersonalJoin(UserVO userVo) throws Exception;

	public void insertBusinessJoin(BusinessVO busiVO) throws Exception;

	public void updateEmailChk(HttpServletRequest request) throws Exception;

	public Map<String, Object> findId(Map<String, Object> map) throws Exception;

	public String findPw(Map<String, Object> map) throws Exception;

	public Map<String, Object> resetMyPwForm(HttpServletRequest request) throws Exception;

	public void updatePw(Map<String, Object> map) throws Exception;

}
