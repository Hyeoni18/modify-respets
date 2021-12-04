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

import com.teamx.respets.user.service.UserService;
import com.teamx.respets.user.vo.BusinessVO;
import com.teamx.respets.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 로그인 화면
	 * @Method : loginForm
	 * @return
	 */
	@RequestMapping(value ="/loginForm")
	public String loginForm(HttpSession session) {
		return "tiles/user/loginForm";
	}
	
	/**
	 * 로그인
	 * @Method : loginProcess
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/loginProcess")
	public String loginProcess(@RequestParam Map<String, Object> map, HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> resultMap = userService.loginProcess(map, request);
		model.addAttribute("paramMap", resultMap);
		String view = String.valueOf(resultMap.get("view"));
		return view;
	}
	
	/**
	 * 회원가입 첫 화면 (회원선택)
	 * @Method : joinChoiceForm
	 * @return
	 */
	@RequestMapping(value ="/joinChoiceForm")
	public String joinChoiceForm() {
		return "tiles/user/joinChoiceForm";
	}
	
	/**
	 * 약관동의 (개인회원)
	 * @Method : personalJoinAgreement
	 * @return
	 */
	@RequestMapping(value ="/personalJoinAgreement")
	public String personalJoinAgreement() {
		return "tiles/user/personalJoinAgreement";
	}
	
	/**
	 * 약관동의 (기업회원)
	 * @Method : businessJoinAgreement
	 * @return
	 */
	@RequestMapping(value ="/businessJoinAgreement")
	public String businessJoinAgreement() {
		return "tiles/user/businessJoinAgreement";
	}
	
	/**
	 * 회원가입 정보 입력 화면 (개인회원)
	 * @Method : personalJoinForm
	 * @return
	 */
	@RequestMapping(value ="/personalJoinForm")
	public String personalJoinForm() {
		return "tiles/user/personalJoinForm";
	}
	
	/**
	 * 회원가입 정보 입력 화면 (기업회원)
	 * @Method : businessJoinForm
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/businessJoinForm")
	public String businessJoinForm(Model model) throws Exception {
		String sb = userService.selectBusCategory();
		model.addAttribute("input", sb);
		return "tiles/user/businessJoinForm";
	}
	
	/**
	 * 회원가입(개인회원)
	 * @Method : personalJoin
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/personalJoin") 
	public String personalJoin(Model model, UserVO userVo) throws Exception {
		userService.insertPersonalJoin(userVo);
		model.addAttribute("email", userVo.getPer_email());
		return "tiles/user/emailConfirmOffer";
	}
	
	/**
	 * 회원가입(기업회원)
	 * @Method : businessJoin
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/businessJoin") 
	public String businessJoin(BusinessVO busiVO) throws Exception {
		userService.insertBusinessJoin(busiVO);
		return "tiles/index";
	}
	
	/**
	 * 회원가입 이메일 인증 완료
	 * @Method : emailConfirmSuccess
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/emailConfirmSuccess")
	public String emailConfirmSuccess(Model model, HttpServletRequest request) throws Exception {
		userService.emailConfirmSuccess(request);
		model.addAttribute("email", request.getParameter("per_email"));
		return "tiles/user/emailConfirmSuccess";
	}
	
	/**
	 * 아이디 찾기 화면
	 * @Method : findIdForm
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/findIdForm")
	public String findIdForm() throws Exception {
		return "tiles/user/findIdForm";
	}
	
	/**
	 * 아이디 찾기 
	 * @Method : findId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/findId")
	public String findId(@RequestParam Map<String, Object> map, Model model) throws Exception {
		Map<String, Object> resultMap = userService.findId(map);
		model.addAttribute("paramMap", resultMap);
		String view = String.valueOf(resultMap.get("view"));
		return "tiles/user/"+view;
	}
	
	/**
	 * 비밀번호 찾기 
	 * @Method : findPw
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/findPw")
	public String findPw(@RequestParam Map<String, Object> map, Model model) throws Exception {
		String result = userService.findPw(map);
		model.addAttribute("findPw", result);
		return "tiles/index";
	}
	
	/**
	 * 로그아웃
	 * @Method : logout
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, Model model) throws Exception {
		request.getSession().invalidate();
		model.addAttribute("alert","alert('로그아웃 되었습니다.');");
		return "tiles/index";
	}
	
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
	 * 현재 비밀번호 확인
	 * @Method : myPwCheck
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value = "/myPwCheck")
	public int myPwCheck(String now, HttpServletRequest request) throws Exception {
		int result = userService.myPwCheck(now, request);
		System.err.println(result);
		return result;
	}
	
	/**
	 * 비밀번호 변경
	 * @Method : updatePw
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/updatePw")
	public String updatePw(String newPw, HttpServletRequest request, Model model) throws Exception {
		int update = userService.updatePw(newPw, request);
		if(update == 1) {
			model.addAttribute("alert", "alert('비밀번호가 수정되었습니다.')");
			return "myTiles/user/myInfo";
		} else {
			model.addAttribute("alert", "alert('비밀번호 변경에 실패했습니다.')");
			return "myTiles/user/myPwUpdateForm";
		}
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
	public String updateUserInfo(HttpServletRequest request) throws Exception {
		userService.updateUserInfo(request);
		return "myTiles/user/myInfo";
	}
	
	/**
	 * 회원탈퇴
	 * @Method : deleteUser
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/deleteUser")
	public String deleteUser(HttpServletRequest request, Model model) throws Exception {
		boolean result = userService.deleteUser(request);
		if (result) {
			return "myTiles/user/loginForm";
		} else {
			model.addAttribute("alert", "alert('실패')");
			return "myTiles/user/myInfo";
		}
	}

}
