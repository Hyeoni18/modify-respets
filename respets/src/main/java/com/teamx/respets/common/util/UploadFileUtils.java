package com.teamx.respets.common.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;


@Service
public class UploadFileUtils {
	
	public Map<String, Object> fileUpload(MultipartFile file) {
		
		HttpServletRequest request =((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String realPath=request.getSession().getServletContext().getRealPath("/");	
		String dirPath = realPath + "resources\\upload\\";
		File dir = new File(realPath);
		if(!dir.isDirectory()){
			dir.mkdirs();
		}
		
		Map<String, Object> fileInfoMap = new HashMap<String, Object>();
		
		String originalName = file.getOriginalFilename();
		fileInfoMap.put("FILE_ORGINL_NM", originalName);
		
		//겹쳐지지 않는 파일명을 위한 유니크한 값 생성
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString() + "_" + originalName;;
		fileInfoMap.put("FILE_NM", fileName);
		fileInfoMap.put("FILE_COURS", dirPath + fileName);
		fileInfoMap.put("FILE_SIZE", file.getSize());
		//저장할 파일준비
		File target = new File(dirPath + fileName);

		try {
			//파일을 저장
			file.transferTo(target);			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return fileInfoMap;
	}

}
