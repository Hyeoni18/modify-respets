package com.teamx.respets.login.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamx.respets.login.service.LoginService;
import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.vo.BusinessVO;
import com.teamx.respets.user.vo.UserVO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	/**
	 * 로그인 화면
	 * @Method : loginForm
	 * @return
	 */
	@RequestMapping(value ="/loginForm")
	public String loginForm(HttpSession session) {
		if(session.getAttribute("userInfo")!=null){
			return "redirect:/tiles/index";
		}else{
			return "tiles/login/loginForm";
		}
	}
	
	/**
	 * 로그인
	 * @Method : loginProcess
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/loginProcess")
	public String loginProcess(@RequestParam Map<String, Object> map, HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		LoginVO loginVO = loginService.getUser(map);
		if(loginVO.getAlert() == null) {
			session.setAttribute("userInfo", loginVO);
		}
		model.addAttribute("alert", loginVO.getAlert());
		return loginVO.getView();
	}
	
	/**
	 * 회원가입 첫 화면 (회원선택)
	 * @Method : joinChoiceForm
	 * @return
	 */
	@RequestMapping(value ="/joinChoiceForm")
	public String joinChoiceForm() {
		return "tiles/login/joinChoiceForm";
	}
	
	/**
	 * 약관동의 (개인회원)
	 * @Method : personalJoinAgreement
	 * @return
	 */
	@RequestMapping(value ="/personalJoinAgreement")
	public String personalJoinAgreement() {
		return "tiles/login/personalJoinAgreement";
	}
	
	/**
	 * 약관동의 (기업회원)
	 * @Method : businessJoinAgreement
	 * @return
	 */
	@RequestMapping(value ="/businessJoinAgreement")
	public String businessJoinAgreement() {
		return "tiles/login/businessJoinAgreement";
	}
	
	/**
	 * 회원가입 정보 입력 화면 (개인회원)
	 * @Method : personalJoinForm
	 * @return
	 */
	@RequestMapping(value ="/personalJoinForm")
	public String personalJoinForm() {
		return "tiles/login/personalJoinForm";
	}
	
	/**
	 * 회원가입 정보 입력 화면 (기업회원)
	 * @Method : businessJoinForm
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/businessJoinForm")
	public String businessJoinForm() throws Exception {
		return "tiles/login/businessJoinForm";
	}
	
	/**
	 * 회원가입(개인회원)
	 * @Method : personalJoin
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/personalJoin") 
	public String personalJoin(Model model, UserVO userVo) throws Exception {
		loginService.insertPersonalJoin(userVo);
		model.addAttribute("email", userVo.getPerEmail());
		return "tiles/login/emailConfirmOffer";
	}
	
	/**
	 * 회원가입(기업회원)
	 * @Method : businessJoin
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/businessJoin") 
	public String businessJoin(BusinessVO busiVO) throws Exception {
		loginService.insertBusinessJoin(busiVO);
		return "tiles/index";
	}
	
	/**
	 * 회원가입 이메일 인증 완료
	 * @Method : updateEmailChk
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/emailConfirmSuccess")
	public String updateEmailChk(Model model, HttpServletRequest request) throws Exception {
		loginService.updateEmailChk(request);
		model.addAttribute("email", request.getParameter("email"));
		return "tiles/login/emailConfirmSuccess";
	}
	
	/**
	 * 아이디 찾기 화면
	 * @Method : findIdForm
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/findIdForm")
	public String findIdForm() throws Exception {
		return "tiles/login/findIdForm";
	}
	
	/**
	 * 아이디 찾기 
	 * @Method : findId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/findId")
	public String findId(@RequestParam Map<String, Object> map, Model model) throws Exception {
		Map<String, Object> resultMap = loginService.findId(map);
		model.addAttribute("paramMap", resultMap);
		String view = String.valueOf(resultMap.get("view"));
		return "tiles/login/"+view;
	}
	
	/**
	 * 비밀번호 찾기 
	 * @Method : findPw
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/findPw")
	public String findPw(@RequestParam Map<String, Object> map, Model model) throws Exception {
		model.addAttribute("alert", loginService.findPw(map));
		return "tiles/index";
	}
	
	/**
	 * 비밀번호 변경 화면 (메일을 통한)
	 * @Method : resetMyPwForm
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/resetMyPwForm")
	public String resetMyPwForm(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> resultMap = loginService.resetMyPwForm(request);
		model.addAttribute("paramMap", resultMap);
		return "tiles/"+resultMap.get("view");
	}
	
	/**
	 * 비밀번호 변경
	 * @Method : updatePw
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/updatePw")
	public String updatePw(@RequestParam Map<String, Object> map, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("userInfo")!=null){
			LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
			map.put("email", loginVO.getEmail());
			map.put("type", loginVO.getType());
		}
		loginService.updatePw(map);
		session.removeAttribute("userInfo");
		model.addAttribute("alert", "alert('비밀번호가 변경되었습니다.다시 로그인 해주세요.');");
		return "tiles/login/loginForm";
	}
		
	/**
	 * 로그아웃
	 * @Method : logout
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, Model model) throws Exception {
		session.removeAttribute("userInfo");
		model.addAttribute("alert","alert('로그아웃 되었습니다.');");
		return "tiles/index";
	}
}
