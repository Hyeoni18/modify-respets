package com.teamx.respets.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.pet.vo.PetVO;
import com.teamx.respets.user.vo.BusinessVO;
import com.teamx.respets.user.vo.UserVO;

public interface UserService {

	public Map<String, Object> selectMyInfo(LoginVO loginVO) throws Exception;

	public void updateUserInfo(UserVO userVo) throws Exception;

	public boolean deleteUser(LoginVO loginVO) throws Exception;

	public List<Map<String, Object>> selectLikeBusiness(LoginVO loginVO) throws Exception;

	public Integer selectLikeBusinessCnt(LoginVO loginVO) throws Exception;

	public void deleteLikeBusiness(Map<String, Object> map) throws Exception;

	public void updateBusinessInfo(BusinessVO businessVO) throws Exception;

}
