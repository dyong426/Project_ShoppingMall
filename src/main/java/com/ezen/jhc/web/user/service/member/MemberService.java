package com.ezen.jhc.web.user.service.member;

import org.springframework.stereotype.Service;



import com.ezen.jhc.web.user.dto.member.MemberDTO;
/**@author SUJEONG*/
@Service
public interface MemberService {
 
	 Integer checkMemByEmail(String mem_email);
	 MemberDTO getMemByEmail(String mem_email);
	 void join(MemberDTO dto);
	 Integer checkEmailPW(String mem_email, String mem_pw);
	 void changePw(String mem_pw, String mem_email);
	 void deleteAccount(int mem_num);
	 void changeMyInfo(int mem_num, String mem_birth, String mem_phone);
	 
	
}
