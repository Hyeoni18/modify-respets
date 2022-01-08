package com.teamx.respets.business.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.vo.BusinessVO;

public interface BusinessService {
	
	public List<Map<String, Object>> selectBusinessList(HttpServletRequest request) throws Exception;

	public BusinessVO selectBusinessDetail(HttpServletRequest request) throws Exception;

	public List<Map<String, Object>> serviceManagement(LoginVO loginVO) throws Exception;

	public void serviceInsert(LoginVO loginVO) throws Exception;

	public Map<String, Object> selectServiceInfo(LoginVO loginVO) throws Exception;
	
}
