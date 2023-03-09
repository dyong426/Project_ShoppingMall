package com.ezen.jhc.common.util;

import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends javax.mail.Authenticator {
    // SMTP 인증 아이디
    private String userid = null;
    // SMTP 인증 비밀번호
    private String pwd = null;

    public SMTPAuthenticator(String id, String pwd){
        this.userid = id;
        this.pwd = pwd;
    }
    public PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(this.userid, this.pwd); // id, pwd
    }
}