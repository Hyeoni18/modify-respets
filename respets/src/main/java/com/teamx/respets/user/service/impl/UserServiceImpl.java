package com.teamx.respets.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.teamx.respets.common.mapper.CommonMapper;
import com.teamx.respets.common.util.MyAuthentication;
import com.teamx.respets.common.util.UploadFileUtils;
import com.teamx.respets.user.mapper.UserMapper;
import com.teamx.respets.user.service.UserService;
import com.teamx.respets.user.vo.BusinessVO;
import com.teamx.respets.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Autowired
	private UploadFileUtils uploadFileUtils;
	
	@Value("${common.mail.title}")
	private String joinTitle;
	
	@Value("${common.mail.content}")
	private String joinContent;
	
	@Value("${common.mail.findTitle}")
	private String findTitle;
	
	@Value("${common.mail.findContent}")
	private String findContent;
	
	@Override
	public void insertPersonalJoin(UserVO userVo) throws Exception {
		if (!userVo.getUpload().isEmpty()) {
			Map<String, Object> fileMap = uploadFileUtils.fileUpload(userVo.getUpload());
			
			commonMapper.insertFile(fileMap);
			userVo.setPer_file_id(String.valueOf(fileMap.get("FILE_ID")));
		}
		
		userMapper.insertPersonalJoin(userVo);
		String email = userVo.getPer_email();
        String title = "[Respets] 계정 인증 메일";
        String content = "링크를 클릭해주세요. http://localhost:8080/emailConfirmSuccess?per_email=" + userVo.getPer_email();
		mailSending(email, title, content);
	}
	

	@Override
	public void insertBusinessJoin(BusinessVO busiVO) throws Exception {
		//사업자등록증 사진 등록
		Map<String, Object> fileMap = uploadFileUtils.fileUpload(busiVO.getBusLicense());
		commonMapper.insertFile(fileMap);
		busiVO.setBus_lcno_file_id(String.valueOf(fileMap.get("FILE_ID")));
		
		// 대표 사진 이미지가 있을 경우 대표 사진 넣기
		if(!busiVO.getMainPhoto().isEmpty()) {
			fileMap = uploadFileUtils.fileUpload(busiVO.getMainPhoto());
			commonMapper.insertFile(fileMap);
			busiVO.setBus_file_id(String.valueOf(fileMap.get("FILE_ID")));
		}

		userMapper.insertBusinessJoin(busiVO); // 기업 회원 테이블
		busiVO.setBus_no("B" + busiVO.getBus_seq());
		
		userMapper.insertBusJoinSvc(busiVO); // 서비스 테이블
	}
	
	public void mailSending(String tomail, String title, String content) throws Exception {
		System.setProperty("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
        System.setProperty("mail.smtp.port", "587"); // gmail 포트
		System.setProperty("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
        System.setProperty("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
        System.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        System.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        //구글 인증
        Authenticator auth = new MyAuthentication();
        Message message = new MimeMessage(Session.getDefaultInstance(System.getProperties(), auth));
		//받는사람
        InternetAddress[] tos = InternetAddress.parse(tomail);
        message.setRecipients(Message.RecipientType.TO, tos);
        
        //한글을 위한 인코딩
        message.setHeader("Content-Type", "text/plain; charset=UTF-8");
        //제목
        message.setSubject(title);
        message.setText(content);
        Transport.send(message);
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


	@Override
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = userMapper.findId(map);

		if(resultMap != null) {
			String email = (String) resultMap.get("email");
			String[] word = email.split("@"); // @ 를기준으로 문자열을 잘라 배열에 넣어준다.
			String[] perid = word[0].split(""); // 잘린 문자열 중 메일부분이 아닌 아이디 부분을 다시 잘라준다.
			String findEmail = ""; // 잘린 문자열을 합쳐줄 변수선언.
			for (int i = perid.length - 3; i < perid.length; i++) {
				// 아이디 중 뒷 문자 3개를 찾기 위해 돌리는 반복문.
				perid[i] = "*"; // 찾은 문자들을 치환.
			}
			for (int i = 0; i < perid.length; i++) {
				// 잘랐던 문자들을 하나로 합치기 위해 돌리는 반복문.
				findEmail += perid[i]; // 문자열 합체.
			}
			email = findEmail + "@" + word[1]; // 작업하기 위해 잘랐던 모든 문자열을 합체.
			resultMap.put("showEmail", email); // ***로 치환된 이메일
			resultMap.put("view", "findPwForm");
		} else { // 맞는 정보가 없을 경우.
			resultMap = new HashMap<String, Object>();
			String text = "<script>alert('찾으시는 아이디 정보가 없습니다.');</script>";
			resultMap.put("none", text);
			resultMap.put("view", "findIdForm");
		}
		
		return resultMap;
	}


	@Override
	public String findPw(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> rndList = userMapper.findRND(map);
		if (rndList.size() != 0) {
			userMapper.deleteRND(map);
		}
		
		Random rnd = new Random();
		String temp = "";
		for (int i = 0; i < 6; i++) {
			int rIndex = rnd.nextInt(3); // 0,1,2 범위 내 랜덤하게 숫자를 부르겠다는 의미.
											// switch 문을 통해 숫자,소문자,대문자를 무작위로 조합하기 위한 작업.
			switch (rIndex) {
			case 0:
				// a-z 소문자, a의 아스키 값은 '97'
				temp += ((char) ((int) (rnd.nextInt(26)) + 97));
				// 알파벳 개수만큼만 숫자를 랜덤으로 뽑아냄
				// 그리고 소문자 첫번째 자리의 아스키 값을 더해준다.
				// 마지막으로 해당 수를 문자열로 변경.
				break;
			case 1:
				// A-Z 대문자, A의 아스키 값은 '65'
				temp += ((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp += ((rnd.nextInt(10)));
				break;
			}
		}
		map.put("rndCode", temp);
		boolean result = userMapper.insertRND(map);
		if(result) {
			String content = findContent+"per_email=" + map.get("email") + "&code=" + temp	+ "&type=" + map.get("type");
			System.err.println(content);
			mailSending(String.valueOf(map.get("email")), findTitle, content);
		}
		
		return "<script>alert('이메일로 비밀번호 재설정 링크를 보냈습니다.');</script>";
		
	}

	@Override
	public Map<String, Object> loginProcess(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = userMapper.loginProcess(map);
		if(resultMap != null) {
			request.getSession().setAttribute("no", resultMap.get("no"));
			//탈퇴회원 구분
			if(resultMap.get("leave").equals("O")) {
				String alert = "alert('탈퇴한 회원의 이메일 입니다. 로그인 할 수 없습니다.');";
				resultMap.put("alert", alert);
				resultMap.put("view", "tiles/user/loginForm");
				request.getSession().invalidate();
			} else {
				//블랙리스트 구분
				Integer outNumber = userMapper.selectBlackList(map);
				
				if(outNumber != null && (outNumber == 1 || outNumber == 2)) {
					String alert = "alert('이용이 정지된 계정입니다. 로그인 할 수 없습니다.');";
					resultMap.put("alert", alert);
					resultMap.put("view", "tiles/user/loginForm");
					request.getSession().invalidate(); 
				}
			}
			
			//인증회원 확인
			if(resultMap.get("emchk").equals("O")) {
				resultMap.put("view", "tiles/index");
			} else {
				String tomail = String.valueOf(resultMap.get("email"));
				String title = "[Respets] 계정 인증 메일";
				String content = "링크를 클릭해주세요. http://localhost/emailConfirmSuccess?per_email="
						+ tomail;
				mailSending(tomail, title, content);
				request.getSession().invalidate();
				String alert = "alert('미인증 회원입니다. 인증을 완료해주세요.');";
				resultMap.put("alert", alert);
				resultMap.put("view", "tiles/user/emailConfirmOffer");
			}
		} else {
			String alert = "alert('로그인에 실패하였습니다. \\n계정과 비밀번호를 확인해주세요.')";
			resultMap = new HashMap<String, Object>();
			resultMap.put("alert", alert);
			resultMap.put("view", "tiles/user/loginForm");
		}
		return resultMap;
	}
	
}
