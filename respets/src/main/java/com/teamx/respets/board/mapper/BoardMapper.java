package com.teamx.respets.board.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamx.respets.login.vo.LoginVO;

@Mapper
public interface BoardMapper {

	public List<Map<String, Object>> selectBusinessNotice(LoginVO loginVO) throws SQLException;

}
