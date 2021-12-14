package com.teamx.respets.business.service.impl;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamx.respets.business.mapper.BusinessMapper;
import com.teamx.respets.business.service.BusinessService;

@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Autowired
	private BusinessMapper businessMapper;

	@Override
	public List<Map<String, Object>> selectBusinessList(HttpServletRequest request) throws Exception {
		//선택한 업종
		String svcCd = request.getParameter("svcCd");
		//선택한 해시태그
		String hashTag = request.getParameter("hashTag");
		List<Map<String, Object>> businessList = new ArrayList<Map<String, Object>>();
		if(svcCd != null) {
			businessList = businessMapper.selectBusinessList(svcCd);
		}
		if(hashTag != null) {
			businessList = businessMapper.selectHashTagBusinessList(hashTag);
		}
		return businessList;
	}

}
