package com.ezen.jhc.web.user.dto.contact;

import java.util.Date;

import com.ezen.jhc.web.user.dto.member.MemberDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ContactDTO {

	Integer contact_num;
	Integer mem_num;
	Integer contact_ctgr;
	String contact_title;
	String contact_content;
	String contact_image_path;
	String contact_regdate;
	String admin_reply;
}
