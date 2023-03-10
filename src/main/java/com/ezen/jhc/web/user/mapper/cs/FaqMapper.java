package com.ezen.jhc.web.user.mapper.cs;

import java.util.List;

import com.ezen.jhc.web.user.dto.faq.FaqDTO;


public interface FaqMapper {
	

	List<FaqDTO> get(Integer cs_ctgr_num);
	
	List<FaqDTO> get_ctgr_num();
	
}
