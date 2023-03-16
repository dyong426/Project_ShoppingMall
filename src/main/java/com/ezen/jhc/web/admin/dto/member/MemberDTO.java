package com.ezen.jhc.web.admin.dto.member;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	
	private Integer mem_num;
	private String mem_email;
	private String mem_pw;
	private String mem_birth;
	private String mem_name;
	private String mem_phone;
	private Integer mem_point;
	private String mem_note;
	private Date   mem_regdate;
	
	public String getMem_regdate() {
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		
		String formatTime = dayTime.format(this.mem_regdate);
		
		return formatTime;
	}
}
