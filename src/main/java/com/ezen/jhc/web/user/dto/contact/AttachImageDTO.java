package com.ezen.jhc.web.user.dto.contact;

import lombok.Data;

@Data
public class AttachImageDTO {
	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 상품 id */
	private int contact_num;
	
	private String contact_img;
	
	
	public String setContact_img(String contact_img) {
		return this.contact_img = contact_img;
	}
	

}
