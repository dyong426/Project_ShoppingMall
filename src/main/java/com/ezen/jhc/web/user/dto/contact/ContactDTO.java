package com.ezen.jhc.web.user.dto.contact;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

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
	//String contact_image_path;
	Date contact_regdate;
	String admin_reply;
	String cs_ctgr_name;
	
	String con_only_date;
	
	public String getContact_regdate() {
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String formatTime = dayTime.format(this.contact_regdate);
		return formatTime;
	}
	
	public String getCon_only_date() {
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String formatTime = dayTime.format(this.contact_regdate);
		return formatTime;
	}
	
	
}
