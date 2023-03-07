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
	
	// 상품 id
	private Integer p_num;
}
