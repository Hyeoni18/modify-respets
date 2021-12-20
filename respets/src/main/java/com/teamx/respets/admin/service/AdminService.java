package com.teamx.respets.admin.service;

import java.util.Map;

import com.teamx.respets.login.vo.LoginVO;

public interface AdminService {

	public LoginVO adminLogin(Map<String, Object> map) throws Exception;

}
