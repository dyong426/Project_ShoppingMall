package com.ezen.jhc.web.user.mapper.cs;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.faq.FaqDTO;



public interface FaqMapper {
	
	// 카테고리별로 받아오기
	@Select("SELECT * FROM faqs WHERE faq_ctgr = #{faq_ctgr} ORDER BY faq_num;")
	List<FaqDTO> get(Integer faq_ctgr);
	
	
}
