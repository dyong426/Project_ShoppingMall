package com.ezen.jhc.web.user.dto.contact;

import java.util.List;

import lombok.Data;

@Data
public class AttachImageListDTO {

	AttachImageDTO image;
	
	/* 이미지 정보 */
	private List<AttachImageDTO> imageList;
	
	@Override
	public String toString() {
		return "ImageListDTO [uploadPath= " + uploadPath + ", "
				+ "uuid= " + uuid + ", " + "fileName= " + fileName + ", "
				+ "contact_num= " + contact_num + "] ";
	}
}
