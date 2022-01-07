package com.teamx.respets.board.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamx.respets.board.mapper.BoardMapper;
import com.teamx.respets.board.service.BoardService;
import com.teamx.respets.board.vo.BoardVO;
import com.teamx.respets.login.vo.LoginVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<Map<String, Object>> selectBusinessNotice(Map<String, Object> map) throws Exception {
		return boardMapper.selectBusinessNotice(map);
	}

	@Override
	public Integer selectBusinessNoticeCnt(Map<String, Object> map) throws Exception {
		return null;
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardMapper.insertBoard(boardVO);
	}

	@Override
	public void deleteBoard(BoardVO boardVO) throws Exception {
		boardMapper.deleteBoard(boardVO);
	}

	@Override
	public Map<String, Object> selectBoard(BoardVO boardVO) throws Exception {
		return boardMapper.selectBoard(boardVO);
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		boardMapper.updateBoard(boardVO);
	}

	@Override
	public List<Map<String, Object>> selectMainNotice(Map<String, Object> map) throws Exception {
		return boardMapper.selectMainNotice(map);
	}

}
