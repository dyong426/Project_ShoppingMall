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
	
	private String contact_image_path;
	
	
	public String setContact_image_path(String uuid, String fileName, String uploadPath) {
		return contact_image_path = uploadPath+uuid+fileName;
	}
	@Override
	public String toString() {
		return "ImageListDTO [uploadPath= " + uploadPath + ", "
				+ "uuid= " + uuid + ", " + "fileName= " + fileName + ", "
				+ "contact_num= " + contact_num + "] ";
	}
}
