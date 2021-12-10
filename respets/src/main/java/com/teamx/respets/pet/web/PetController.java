package com.teamx.respets.pet.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamx.respets.common.service.CommonService;
import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.pet.service.PetService;
import com.teamx.respets.pet.vo.PetVO;
import com.teamx.respets.user.vo.UserVO;

@Controller
public class PetController {
	
	@Autowired
	private PetService petService;
	
	@Autowired
	private CommonService commonService;

	/**
	 * 반려동물 목록 화면
	 * @Method : petList
	 * @return
	 */
	@RequestMapping(value ="/petList")
	public String petList(HttpSession session) {
		return "myTiles/pet/petList";
	}
	
	/**
	 * 반려동물 목록 조회 
	 * @Method : selectAccdtExaminDtaList
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selectPetList")
	public Map<String, Object> selectPetList(HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		List<Map<String,Object>> petList = petService.selectPetList(loginVO);
		Integer petListCnt = petService.selectPetListCnt(loginVO);
		result.put("petList", petList);
		result.put("total", petListCnt);
		return result;
	}	
	
	/**
	 * 반려동물 등록 화면
	 * @Method : petInsertForm
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/petInsertForm")
	public String petInsertForm(HttpSession session, Model model) throws Exception {
		model.addAttribute("petInfoCode", commonService.selectCode("PCL"));
		return "myTiles/pet/petInsertForm";
	}

	/**
	 * 반려동물 등록
	 * @Method : insertPet
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/insertPet")
	public String insertPet(PetVO petVO, @RequestParam Map<String, Object> map) throws Exception {
		petService.insertPet(petVO); 
		return "myTiles/pet/petList";
	}
	
}
