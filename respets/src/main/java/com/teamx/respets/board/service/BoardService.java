package com.teamx.respets.board.service;

import java.util.List;
import java.util.Map;

import com.teamx.respets.board.vo.BoardVO;
import com.teamx.respets.login.vo.LoginVO;

public interface BoardService {

	public List<Map<String, Object>> selectBusinessNotice(LoginVO loginVO) throws Exception;

	public Integer selectBusinessNoticeCnt(LoginVO loginVO) throws Exception;

	public void insertBoard(BoardVO boardVO) throws Exception;

	public void deleteBoard(BoardVO boardVO) throws Exception;

	public Map<String, Object> selectBoard(BoardVO boardVO) throws Exception;

}
