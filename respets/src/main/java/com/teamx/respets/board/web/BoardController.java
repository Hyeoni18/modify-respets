package com.teamx.respets.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamx.respets.board.service.BoardService;
import com.teamx.respets.login.vo.LoginVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	/**
	 * 기업 공지사항 목록 화면
	 * @Method : businessNoticeList
	 * @return
	 */
	@RequestMapping(value = "/businessNoticeList")
	public String businessNoticeList() {
		return "myTiles/board/businessNoticeList";
	}
		
	/**
	 * 기업 공지사항 목록 조회
	 * @Method : selectBusinessNotice
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value = "/selectBusinessNotice")
	public Map<String, Object> selectBusinessNotice(HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		List<Map<String,Object>> selectBusinessNotice = boardService.selectBusinessNotice(loginVO);
		Integer selectBusinessNoticeCnt = boardService.selectBusinessNoticeCnt(loginVO);
		result.put("selectBusinessNotice", selectBusinessNotice);
		result.put("total", selectBusinessNoticeCnt);
		return result;
	}

	/**
	 * 기업 공지사항 글등록 화면
	 * @Method : businessNoticeWriteForm
	 * @return
	 */
	@RequestMapping(value = "/businessNoticeWriteForm")
	public String businessNoticeWriteForm() {
		return "myTiles/board/businessNoticeWriteForm";
	}	

}
