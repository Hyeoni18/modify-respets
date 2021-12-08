package com.teamx.respets.user.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.service.UserService;
import com.teamx.respets.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 마이페이지
	 * @Method : myPage
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/myPage")
	public String myPage() throws Exception {
		return "myTiles/user/recentMyBookingList";
	}
	
	/**
	 * 나의 회원 정보
	 * @Method : myInfo
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/myInfo")
	public String myInfo(Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("paramMap", userService.selectMyInfo(request));
		return "myTiles/user/myInfo";
	}
	
	/**
	 * 비밀번호 수정 화면
	 * @Method : myPwUpdateForm
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/myPwUpdateForm")
	public String myPwUpdateForm() throws Exception {
		return "myTiles/user/myPwUpdateForm";
	}

	/**
	 * 회원정보 수정 화면
	 * @Method : myInfoUpdateForm
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/myInfoUpdateForm")
	public String myInfoUpdateForm(String newPw, HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("paramMap", userService.selectMyInfo(request));
		return "myTiles/user/myInfoUpdateForm";
	}
	
	/**
	 * 회원정보 수정
	 * @Method : updateUserInfo
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/myInfoUpdate")
	public String updateUserInfo(UserVO userVo) throws Exception {
		userService.updateUserInfo(userVo);
		return "myTiles/user/myInfo";
	}
	
	/**
	 * 회원탈퇴
	 * @Method : deleteUser
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/deleteUser")
	public String deleteUser(HttpSession session, Model model) throws Exception {
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		boolean result = userService.deleteUser(loginVO);
		session.removeAttribute("userInfo");
		if (result) {
			model.addAttribute("alert", "alert('이용해주셔서 감사합니다.')");
			return "tiles/login/loginForm";
		} else {
			model.addAttribute("alert", "alert('실패')");
			return "myTiles/user/myInfo";
		}
	}

}
