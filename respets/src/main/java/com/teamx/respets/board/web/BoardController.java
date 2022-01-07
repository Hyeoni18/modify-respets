package com.teamx.respets.board.web;

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

import com.teamx.respets.board.service.BoardService;
import com.teamx.respets.board.vo.BoardVO;
import com.teamx.respets.login.vo.LoginVO;

@Controller
@RequestMapping(value="/board")
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
	public Map<String, Object> selectBusinessNotice(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		map.put("no", loginVO.getNo());
		map.put("type", loginVO.getType());
		List<Map<String,Object>> selectBusinessNotice = boardService.selectBusinessNotice(map);
		Integer selectBusinessNoticeCnt = boardService.selectBusinessNoticeCnt(map);
		result.put("selectBusinessNotice", selectBusinessNotice);
		result.put("total", selectBusinessNoticeCnt);
		return result;
	}

	/**
	 * 기업 공지사항 글등록 화면
	 * @Method : businessNoticeWriteForm
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/businessNoticeWriteForm")
	public String businessNoticeWriteForm(BoardVO boardVO, Model model) throws Exception {
		if(null != boardVO.getBoardNo()) {
			model.addAttribute("boardInfo", boardService.selectBoard(boardVO));
		}
		return "myTiles/board/businessNoticeWriteForm";
	}	
	
	/**
	 * 기업 공지사항 글등록
	 * @Method : insertBoard
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/insertBoard")
	public String insertBoard(BoardVO boardVO, HttpSession session) throws Exception {
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		boardVO.setInputNo(loginVO.getNo());
		boardService.insertBoard(boardVO);
		return "myTiles/board/businessNoticeList"; //디테일화면
	}	
	
	/**
	 * 기업 공지사항 글삭제
	 * @Method : deleteBoard
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/deleteBoard")
	public String deleteBoard(BoardVO boardVO, HttpSession session) throws Exception {
		//관리자는 모두 삭제 가능, type is not A 는 글 작성자가 같을 경우에만 삭제 가능
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		if(loginVO.getType().equals("A") || loginVO.getNo().equals(boardVO.getInputNo())) {
			boardService.deleteBoard(boardVO);
		} else {
			System.err.println("권한없음");
		}
		return "myTiles/board/businessNoticeList";
	}
	
	/**
	 * 기업 공지사항 게시글 화면
	 * @Method : businessNoticeDetail
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/businessNoticeDetail")
	public String businessNoticeDetail(BoardVO boardVO, Model model) throws Exception {
		model.addAttribute("boardInfo", boardService.selectBoard(boardVO));
		return "myTiles/board/businessNoticeDetail";
	}	
	
	/**
	 * 기업 공지사항 글 수정
	 * @Method : updateBoard
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/updateBoard")
	public String updateBoard(BoardVO boardVO, HttpSession session) throws Exception {
		LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
		if(loginVO.getNo().equals(boardVO.getInputNo())) { //수정은 작성자만 가능
			boardService.updateBoard(boardVO);
		} else {
			System.err.println("권한없음");
		}
		return "myTiles/board/businessNoticeList"; //디테일화면
	}	
	
	/**
	 * 메인화면 공지사항 조회 (완)
	 * @Method : selectMainNotice
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value = "/selectMainNotice")
	public Map<String, Object> selectMainNotice(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if(session.getAttribute("userInfo")!=null){
			LoginVO loginVO = (LoginVO) session.getAttribute("userInfo");
			map.put("type", loginVO.getType());
		} else {
			map.put("type", "P");
		}
		List<Map<String,Object>> selectMainNotice = boardService.selectMainNotice(map);
		result.put("selectMainNotice", selectMainNotice);
		return result;
	}
	
}
