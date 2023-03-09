package com.ezen.jhc.web.admin.dto.image;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class AttachImageListDTO {
	
	private List<AttachImageDTO> imageList;
}
