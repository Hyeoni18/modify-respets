package com.teamx.respets.user.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamx.respets.common.file.FileService;
import com.teamx.respets.common.util.MyAuthentication;
import com.teamx.respets.user.mapper.UserMapper;
import com.teamx.respets.user.service.UserService;
import com.teamx.respets.user.vo.BusinessVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void insertPersonalJoin(Map<String, Object> paramMap, MultipartHttpServletRequest multi) throws Exception {

		Map<String, Object> hmap = new HashMap<String, Object>();
		String email = multi.getParameter("per_email");
		String pw = multi.getParameter("per_pw");
		String name = multi.getParameter("per_name");
		String phone = multi.getParameter("per_phone");
		hmap.put("per_email", email);
		hmap.put("per_pw", pw);
		hmap.put("per_name", name);
		hmap.put("per_phone", phone);
		
		int check = Integer.parseInt(multi.getParameter("fileCheck"));
		
		FileService upload = new FileService();
		Map<String, String> fmap = new HashMap<String, String>();
		fmap = upload.upload(multi);// 서버에 파일을 업로드, 오리지널파일명·시스템파일명·경로를 Map에 저장
		String sysFileName = fmap.get("sysFileName");
		String location = fmap.get("location");
		
		if (check == 1) {
			hmap.put("per_photo", sysFileName); 
			hmap.put("per_loc", location); 
		} else {
			hmap.put("per_photo", ""); 
			hmap.put("per_loc", ""); 
		}	
		
		userMapper.insertPersonalJoin(hmap); 

		String tomail = email;
		String title = "[Respets] 계정 인증 메일";
		String content = "링크를 클릭해주세요. http://localhost:8080/emailConfirmSuccess?per_email=" + email;
		mailSending(tomail, title, content);
		
	}
	

	@Override
	public void insertBusinessJoin(BusinessVO busiVO, MultipartHttpServletRequest multi) throws Exception {

		userMapper.insertBusinessJoin(busiVO); // 기업 회원 테이블
		busiVO.setBus_no("B" + String.valueOf(busiVO.getBus_seq()));
		userMapper.insertBusJoinSvc(busiVO); // 서비스 테이블
		
		MultipartFile busLicense = multi.getFile("busLicense");
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		FileService upload = new FileService(); 
		Map<String, String> fmap = new HashMap<String, String>();
		fmap = upload.upload(multi);// 서버에 파일을 업로드, 오리지널파일명·시스템파일명·경로를 Map에 저장
		
		hMap.put("bus_no", busiVO.getBus_no());
		hMap.put("bct_code", busiVO.getBct_code());
		userMapper.insertLicense(hMap); // 사진 테이블에 사업자등록증 사진 넣기
		/*// 대표 사진 이미지가 있을 경우 대표 사진 넣기
		if (multi.getParameter("fileCheck").equals("1")) {
			MultipartFile mainPhoto = multi.getFile("mainPhoto");
			fmap = upload.upload(multi);
			hMap = saveFile(multi, mainPhoto, hMap);
			lDao.mainPhotoInsert(hMap);
		} else { // 없을 경우 디폴트 이미지로 넣기
			lDao.mainPhotoDefault(hMap);
		} // else End
*/	}
	
	public void mailSending(String tomail, String title, String content) throws Exception {
		
		System.setProperty("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
        System.setProperty("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
        System.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        System.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com"); // smtp 서버 주소
        System.setProperty("mail.smtp.port", "587"); // gmail 포트
        //구글 인증
        Authenticator auth = new MyAuthentication();
        Message msg = new MimeMessage(Session.getDefaultInstance(System.getProperties(), auth));
        //받는사람
        InternetAddress[] tos = InternetAddress.parse(tomail);
        msg.setRecipients(Message.RecipientType.TO, tos);
        
        //한글을 위한 인코딩
        msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
        //제목
        msg.setSubject(title);
        msg.setSentDate(new Date());
        msg.setText(content);
        Transport.send(msg);
	}

	@Override
	public void emailConfirmSuccess(HttpServletRequest request) throws Exception {
		String email = request.getParameter("per_email");
		userMapper.emailConfirmSuccess(email);
	}

	@Override
	public String selectBusCategory() throws Exception {
		List<Map<String, String>> list = userMapper.selectBusCategory();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < list.size(); i++) {
			sb.append("<input type='radio' name='bct_code' class='주력 서비스' value='");
			sb.append(list.get(i).get("cmmn_cd"));
			sb.append("'/>" + list.get(i).get("cd_desc") + "</label>");
		} 
		return sb.toString();
	}
	
}
