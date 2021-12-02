package com.teamx.respets.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.teamx.respets.user.vo.BusinessVO;
import com.teamx.respets.user.vo.UserVO;

public interface UserService {

	public void insertPersonalJoin(UserVO userVo) throws Exception;

	public void insertBusinessJoin(BusinessVO busiVO) throws Exception;

	public void emailConfirmSuccess(HttpServletRequest request) throws Exception;

	public String selectBusCategory() throws Exception;

	public Map<String, Object> findId(Map<String, Object> map) throws Exception;

	public String findPw(Map<String, Object> map) throws Exception;

}
