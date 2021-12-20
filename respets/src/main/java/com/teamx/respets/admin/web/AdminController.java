package com.teamx.respets.admin.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamx.respets.admin.service.AdminService;
import com.teamx.respets.login.vo.LoginVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	/**
	 * 관리자 로그인 화면
	 * @Method : adminLoginForm
	 * @return
	 */
	@RequestMapping(value = "/admin")
	public String adminLoginForm() {
		return "admin/adminLoginForm";
	}
	
	/**
	 * 관리자 로그인
	 * @Method : adminLogin
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/adminLogin")
	public String adminLogin(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		LoginVO loginVO = adminService.adminLogin(map);
		String view = "";
		if(loginVO.getNo() != null) {
			session.setAttribute("userInfo", loginVO);
			view = "myTiles/admin/unconfirmBusiness";
		} else {
			view = "admin/adminLoginForm";
		}
		return view;
	}
}
