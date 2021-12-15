package com.teamx.respets.user.web;

import java.util.HashMap;
import java.util.List;
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
import com.teamx.respets.pet.vo.PetVO;
import com.teamx.respets.user.service.UserService;
import com.teamx.respets.user.vo.BusinessVO;
import com.teamx.respets.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 나의 회원 정보
	 * @Method : myInfo
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/myInfo")
	public String myInfo(Model model, HttpSession session) throws Exception {
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		if(loginVO.getType().equals("B")) {
			session.setAttribute("businessInfo", userService.selectMyInfo(loginVO));
		}
		return "myTiles/user/myInfo";
	}
	
	/**
	 * 비밀번호 수정 화면
	 * @Method : myPwUpdateForm
	 * @return
	 */
	@RequestMapping(value = "/myPwUpdateForm")
	public String myPwUpdateForm() {
		return "myTiles/user/myPwUpdateForm";
	}

	/**
	 * 회원정보 수정 화면
	 * @Method : myInfoUpdateForm
	 * @return
	 */
	@RequestMapping(value = "/myInfoUpdateForm")
	public String myInfoUpdateForm(HttpSession session) {
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		if(loginVO.getType().equals("B")) {
			return "myTiles/user/businessInfoUpdateForm";
		} else {
			return "myTiles/user/myInfoUpdateForm";
		}
	}
	
	/**
	 * 개인회원 정보 수정
	 * @Method : updateUserInfo
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/updateUserInfo")
	public String updateUserInfo(UserVO userVo) throws Exception {
		userService.updateUserInfo(userVo);
		return "myTiles/user/myInfo";
	}
	
	/**
	 * 기업회원 정보 수정
	 * @Method : updateBusinessInfo
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/updateBusinessInfo")
	public String updateBusinessInfo(BusinessVO businessVO) throws Exception {
		userService.updateBusinessInfo(businessVO);
		return "redirect:/myInfo";
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

	/**
	 * 즐겨찾는 기업 목록 화면
	 * @Method : likeBusinessList
	 * @return
	 */
	@RequestMapping(value = "/likeBusinessList")
	public String likeBusinessList() {
		return "myTiles/user/likeBusinessList";
	}
	
	/**
	 * 즐겨찾는 기업 목록 조회
	 * @Method : selectLikeBusiness
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value = "/selectLikeBusiness")
	public Map<String, Object> selectLikeBusiness(HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		List<Map<String,Object>> likeBusinessList = userService.selectLikeBusiness(loginVO);
		Integer likeBusinessListCnt = userService.selectLikeBusinessCnt(loginVO);
		result.put("likeBusinessList", likeBusinessList);
		result.put("total", likeBusinessListCnt);
		return result;
	}
	
	/**
	 * 즐겨찾는 기업 삭제
	 * @Method : deleteLikeBusiness
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/deleteLikeBusiness")
	public String deleteLikeBusiness(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		map.put("perNo", loginVO.getNo());
		userService.deleteLikeBusiness(map); 
		return "myTiles/user/likeBusinessList";
	}
	
	/**
	 * 개인회원 전체 예약 목록
	 * @Method : personalAllBookingList
	 * @return
	 */
	@RequestMapping(value ="/personalAllBookingList")
	public String personalAllBookingList() {
		return "myTiles/user/allBookingList";
	}
	

	/**
	 * 개인회원 최근 예약 목록
	 * @Method : recentMyBookingList
	 * @return
	 */
	@RequestMapping(value = "/recentMyBookingList")
	public String myPage() {
		return "myTiles/user/recentMyBookingList";
	}
}
