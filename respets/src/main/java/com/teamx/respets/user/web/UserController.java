package com.teamx.respets.user.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}
