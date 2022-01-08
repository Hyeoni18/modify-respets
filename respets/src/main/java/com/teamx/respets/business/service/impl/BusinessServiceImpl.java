package com.teamx.respets.business.service.impl;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamx.respets.business.mapper.BusinessMapper;
import com.teamx.respets.business.service.BusinessService;
import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.vo.BusinessVO;

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
		if(svcCd != null && hashTag == null) {
            businessList = businessMapper.selectSvcCdBusinessList(svcCd);
        }
        if(svcCd == null && hashTag != null) {
            businessList = businessMapper.selectHashTagBusinessList(hashTag);
        }
        if(svcCd != null && hashTag != null) {
            businessList = businessMapper.selectSvcCdAndHashTagBusinessList(svcCd,hashTag);
        }
        return businessList;
    }
	
	@Override
	public BusinessVO selectBusinessDetail(HttpServletRequest request) throws Exception {        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("busNo", request.getParameter("busNo"));
        map.put("svcCd", request.getParameter("svcCd"));
        BusinessVO busVO = businessMapper.selectBusinessDetail(map);
        return busVO;
    }

	@Override
	public List<Map<String, Object>> serviceManagement(LoginVO loginVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void serviceInsert(LoginVO loginVO) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> selectServiceInfo(LoginVO loginVO) throws Exception {
		return businessMapper.selectServiceInfo(loginVO);
	}

}
