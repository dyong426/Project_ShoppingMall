package com.ezen.jhc.web.admin.dto.contact;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ContactDTO {

	// 테이블 : contact
	Integer contact_num;
	String cs_ctgr_name;
	String contact_title;
	String contact_content;
	Date contact_regdate;
	
	// 테이블 조인 : members
	Integer mem_num;
	String mem_email;
	String mem_name;

	String admin_reply;
	
	public String getContact_regdate() {
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		
		String formatTime = dayTime.format(this.contact_regdate);
		
		return formatTime;
	}
}
