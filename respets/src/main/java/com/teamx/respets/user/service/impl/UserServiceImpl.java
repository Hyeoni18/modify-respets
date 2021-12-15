package com.teamx.respets.user.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.teamx.respets.common.mapper.CommonMapper;
import com.teamx.respets.common.util.UploadFileUtils;
import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.pet.vo.PetVO;
import com.teamx.respets.user.mapper.UserMapper;
import com.teamx.respets.user.service.UserService;
import com.teamx.respets.user.vo.BusinessVO;
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
	public void updateUserInfo(UserVO userVO) throws Exception {
		HttpServletRequest request =((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		LoginVO loginVO = (LoginVO) request.getSession().getAttribute("userInfo");
		if(!userVO.getUpload().isEmpty()) {
			Map<String, Object> fileMap = uploadFileUtils.fileUpload(userVO.getUpload());
			commonMapper.insertFile(fileMap);
			userVO.setPerFileId(String.valueOf(fileMap.get("fileId")));
			loginVO.setFileId(String.valueOf(fileMap.get("fileCours")));
		}

		userMapper.updateUserInfo(userVO); // 회원정보 수정
		loginVO.setPhone(userVO.getPerPhone());
		request.getSession().setAttribute("userInfo", loginVO);
	}


	@Override
	public boolean deleteUser(LoginVO loginVO) throws Exception {
		String no = loginVO.getNo();
		return userMapper.deleteUser(no);
	}

	@Override
	public List<Map<String, Object>> selectLikeBusiness(LoginVO loginVO) throws Exception {
		return userMapper.selectLikeBusiness(loginVO);
	}

	@Override
	public Integer selectLikeBusinessCnt(LoginVO loginVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteLikeBusiness(Map<String, Object> map) throws Exception {
		userMapper.deleteLikeBusiness(map);
	}

}
