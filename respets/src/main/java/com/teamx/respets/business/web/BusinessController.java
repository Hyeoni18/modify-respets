package com.teamx.respets.business.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamx.respets.business.service.BusinessService;
import com.teamx.respets.user.vo.BusinessVO;

@Controller
public class BusinessController {
	
	@Autowired
	private BusinessService businessService;
	
	/**
	 * 기업(업체) 목록 화면
	 * @Method : businessList
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/businessList")
	public String businessList(HttpServletRequest request, Model model) throws Exception {		
		List<Map<String, Object>> businessList = businessService.selectBusinessList(request);
		model.addAttribute("businessList", businessList);
		return "tiles/business/businessList";
	}
}
