package com.teamx.respets.user.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamx.respets.common.mapper.CommonMapper;
import com.teamx.respets.common.util.UploadFileUtils;
import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.mapper.UserMapper;
import com.teamx.respets.user.service.UserService;
import com.teamx.respets.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Override
	public Map<String, Object> selectMyInfo(HttpServletRequest request) throws Exception {
		String no = String.valueOf(request.getAttribute("no"));
		return userMapper.selectMyInfo(no);
	}


	@Override
	public int myPwCheck(String now, HttpServletRequest request) throws Exception {
		UserVO userVO = new UserVO();
		userVO.setPer_no(request.getSession().getAttribute("no").toString());
		userVO.setPer_pw(now);
		int result = userMapper.myPwCheck(userVO);
		return result;
	}

	@Override
	public void updateUserInfo(UserVO userVo) throws Exception {
		
		if(!userVo.getUpload().isEmpty()) {
			Map<String, Object> fileMap = uploadFileUtils.fileUpload(userVo.getUpload());
			commonMapper.insertFile(fileMap);
			userVo.setPer_file_id(String.valueOf(fileMap.get("FILE_ID")));
		}

		userMapper.updateUserInfo(userVo); // 회원정보 수정
	}


	@Override
	public boolean deleteUser(LoginVO loginVO) throws Exception {
		String no = loginVO.getNo();
		return userMapper.deleteUser(no);
	}

}
