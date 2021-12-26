package com.teamx.respets.business.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.teamx.respets.user.vo.BusinessVO;

public interface BusinessService {
	
	public List<Map<String, Object>> selectBusinessList(HttpServletRequest request) throws Exception;

	public BusinessVO selectBusinessDetail(HttpServletRequest request) throws Exception;
	
}
