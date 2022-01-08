package com.teamx.respets.business.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamx.respets.login.vo.LoginVO;
import com.teamx.respets.user.vo.BusinessVO;

@Mapper
public interface BusinessMapper {

    public List<Map<String, Object>> selectSvcCdBusinessList(String svcCd) throws SQLException;
    
    public List<Map<String, Object>> selectHashTagBusinessList(String hashTag) throws SQLException;

    public List<Map<String, Object>> selectSvcCdAndHashTagBusinessList(String svcCd, String hashTag) throws SQLException;
    
    public BusinessVO selectBusinessDetail(Map<String, Object> map) throws SQLException;

	public Map<String, Object> selectServiceInfo(LoginVO loginVO) throws SQLException;
	
}
