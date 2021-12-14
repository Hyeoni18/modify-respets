package com.teamx.respets.business.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BusinessService {
	
	public List<Map<String, Object>> selectBusinessList(HttpServletRequest request) throws Exception;
	
}
