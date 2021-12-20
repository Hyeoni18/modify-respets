package com.teamx.respets.admin.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamx.respets.admin.mapper.AdminMapper;
import com.teamx.respets.admin.service.AdminService;
import com.teamx.respets.login.vo.LoginVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	public AdminMapper adminMapper;
	
	@Override
	public LoginVO adminLogin(Map<String, Object> map) throws Exception {
		return adminMapper.adminLogin(map);
	}

}
