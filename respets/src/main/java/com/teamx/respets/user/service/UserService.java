package com.teamx.respets.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamx.respets.user.vo.BusinessVO;

public interface UserService {

	public void insertPersonalJoin(Map<String, Object> paramMap, MultipartHttpServletRequest multi) throws Exception;

	public void insertBusinessJoin(BusinessVO busiVO, MultipartHttpServletRequest multi) throws Exception;

	public void emailConfirmSuccess(HttpServletRequest request) throws Exception;

	public String selectBusCategory() throws Exception;

}
