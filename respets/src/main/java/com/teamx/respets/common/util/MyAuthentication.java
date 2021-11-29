package com.teamx.respets.common.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {
	private PasswordAuthentication pa;
    private String id;
    private String pw;

    public MyAuthentication() {
        id = "respets2018"; // 구글 ID
        pw = "teamx2018!"; // 구글 비밀번호
        pa = new PasswordAuthentication(id, pw);
    }

    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
