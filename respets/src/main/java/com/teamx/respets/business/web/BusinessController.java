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
import com.teamx.respets.login.vo.LoginVO;
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
	
	/**
     * 기업(업체) 상세정보 화면
     * @Method : businessDetail
     * @return
     * @throws Exception 
     */
    @RequestMapping(value ="/businessDetail")
    public String businessDetail(HttpServletRequest request, Model model) throws Exception {        
        BusinessVO busVO = businessService.selectBusinessDetail(request);
        model.addAttribute("businessInfo", busVO);
        return "tiles/business/businessDetail";
    }
	
	/**
     * 마이페이지 - 서비스 관리
     * @Method : serviceManagement
     * @return
     * @throws Exception 
     */
    @RequestMapping(value ="/serviceManagement")
    public String serviceManagement(LoginVO loginVO, Model model) throws Exception {        
    	List<Map<String, Object>> serviceList = businessService.serviceManagement(loginVO);
        model.addAttribute("serviceList", serviceList);
        return "myTiles/business/serviceManagement";
    }
	
	/**
     * 마이페이지 - 서비스 관리 - 서비스 등록 화면
     * @Method : serviceInsertForm
     * @return
     * @throws Exception 
     */
    @RequestMapping(value ="/serviceInsertForm")
    public String serviceInsertForm() throws Exception {
        return "myTiles/business/serviceInsertForm";
    }
	
	/**
     * 마이페이지 - 서비스 관리 - 서비스 등록
     * @Method : serviceInsert
     * @return
     * @throws Exception 
     */
    @RequestMapping(value ="/serviceInsert")
    public String serviceInsert(LoginVO loginVO, Model model) throws Exception {        
    	businessService.serviceInsert(loginVO);
        return "myTiles/business/serviceManagement";
    }
}
