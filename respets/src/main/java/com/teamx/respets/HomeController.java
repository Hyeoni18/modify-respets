package com.teamx.respets;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamx.respets.common.service.CommonService;

@Controller
public class HomeController {

	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception {
		return "tiles/index";
	}
	
	/**
	 * 서비스 코드 조회
	 * @Method : selectSvcCode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selectSvcCode")
	public Map<String, Object> selectSvcCode(Model model) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("svcCode", commonService.selectCode("SVC"));
		return result;
	}	
	
}
