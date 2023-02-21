package com.ezen.jhc.web.user.dto.contact;

import java.util.Date;

import com.ezen.jhc.web.user.dto.member.MemberDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ContactDTO {

	// 테이블 : contact
	Integer contact_num;
	Integer contact_ctgr;
	String contact_title;
	String contact_content;
	String contact_image_path;
	Date contact_regdate;
	
	// 테이블 조인 : members
	Integer mem_num;
	String mem_email;
	String mem_name;

	String admin_reply;
}
