package com.teamx.respets.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {

	/**
	 * 공통코드 검색
	 * @Method : selectCode
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> selectCode(String code) throws Exception;
}
