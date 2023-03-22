package com.ezen.jhc.web.admin.dto.image;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class AttachImageDTO {
	
	// 경로
	private String uploadPath;
	
	// UUID
	private String uuid;
	
	// 파일 이름
	private String fileName;
	
	private String origin_img_path;
	private String thumb_img_path;
	private String lg_img_path;
	private String md_img_path;
	private String sm_img_path;
	
	// 상품 id
	private Integer p_num;
	
	public void setOrigin_img_path(String uploadPath, String uuid, String fileName) {
		this.origin_img_path = uploadPath + uuid + fileName;
	}
	
	public void setThumb_img_path(String uploadPath, String uuid, String fileName) {
		this.thumb_img_path = uploadPath + "s_" + uuid + fileName;
	}

	public void setLg_img_path(String uploadPath, String uuid, String fileName) {
		this.lg_img_path = uploadPath + "lg_" + uuid + fileName;
	}
	
	public void setMd_img_path(String uploadPath, String uuid, String fileName) {
		this.md_img_path = uploadPath + "md_" + uuid + fileName;
	}

	public void setSm_img_path(String uploadPath, String uuid, String fileName) {
		this.sm_img_path = uploadPath + "sm_" + uuid + fileName;
	}
	
	
	
}
