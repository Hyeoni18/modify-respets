package com.teamx.respets.pet.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PetController {

	/**
	 * 반려동물 목록 조회
	 * @Method : petList
	 * @return
	 */
	@RequestMapping(value ="/petList")
	public String petList(HttpSession session) {
		//목록조회
		return "myTiles/pet/petList";
	}
	
	/**
	 * 반려동물 등록 화면
	 * @Method : petInsertForm
	 * @return
	 */
	@RequestMapping(value ="/petInsertForm")
	public String petInsertForm(HttpSession session) {
		return "myTiles/pet/petInsertForm";
	}

	/**
	 * 반려동물 등록
	 * @Method : insertPet
	 * @return
	 */
	@RequestMapping(value ="/insertPet")
	public String insertPet(HttpSession session) {
		//등록
		return "myTiles/pet/petList";
	}
	
}
