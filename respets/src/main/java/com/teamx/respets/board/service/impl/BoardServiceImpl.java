package com.teamx.respets.board.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamx.respets.board.mapper.BoardMapper;
import com.teamx.respets.board.service.BoardService;
import com.teamx.respets.login.vo.LoginVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<Map<String, Object>> selectBusinessNotice(LoginVO loginVO) throws Exception {
		return boardMapper.selectBusinessNotice(loginVO);
	}

	@Override
	public Integer selectBusinessNoticeCnt(LoginVO loginVO) throws Exception {
		return null;
	}

}
