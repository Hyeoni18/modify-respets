package com.teamx.respets.board.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamx.respets.board.vo.BoardVO;

@Mapper
public interface BoardMapper {

	public List<Map<String, Object>> selectBusinessNotice(Map<String, Object> map) throws SQLException;

	public void insertBoard(BoardVO boardVO) throws SQLException;

	public void deleteBoard(BoardVO boardVO) throws SQLException;

	public Map<String, Object> selectBoard(BoardVO boardVO) throws SQLException;

	public void updateBoard(BoardVO boardVO) throws SQLException;

	public List<Map<String, Object>> selectMainNotice(Map<String, Object> map) throws SQLException;

}
