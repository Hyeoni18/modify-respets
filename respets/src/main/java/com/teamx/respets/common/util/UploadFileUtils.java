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
		String location = "resources/upload/";
		String dirPath = realPath + location;
		File dir = new File(dirPath);
		if(!dir.isDirectory()){
			dir.mkdirs();
		}
		
		Map<String, Object> fileInfoMap = new HashMap<String, Object>();
		
		String originalName = file.getOriginalFilename();
		fileInfoMap.put("fileOrginlNm", originalName);
		
		//겹쳐지지 않는 파일명을 위한 유니크한 값 생성
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString() + "_" + originalName;;
		fileInfoMap.put("fileNm", fileName);
		fileInfoMap.put("fileCours", location + fileName);
		fileInfoMap.put("fileSize", file.getSize());
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
