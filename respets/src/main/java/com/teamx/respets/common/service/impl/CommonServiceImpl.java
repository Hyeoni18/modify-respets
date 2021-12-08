package com.teamx.respets.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamx.respets.common.mapper.CommonMapper;
import com.teamx.respets.common.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private CommonMapper commonMapper;
	
	@Override
	public List<Map<String, Object>> selectCode(String code) throws Exception {
		return commonMapper.selectCode(code);
	}

}
