package com.ezen.jhc.web.user.mapper.category;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.SubCtgrDTO;

public interface CategoryMapper {

	
	// 메인 카테고리
	@Select("SELECT m_ctgr_name FROM main_ctgr WHERE m_ctgr_num = #{m_ctgr_num}")
	public String getMainCategory(Integer m_ctgr_num);
	
	// 서브 카테고리
	@Select("SELECT s_ctgr_name FROM sub_ctgr WHERE m_ctgr_num = #{m_ctgr_num}")
	public List<SubCtgrDTO> getSubCategories(Integer m_ctgr_num);
	
	// 상품 정보
	@Select("select * from prods inner join (select * from main_ctgr inner join sub_ctgr using(m_ctgr_num)) using(s_ctgr_num) where m_ctgr_num = #{m_ctgr_num}")
	public List<ProdDTO> getAll(Integer m_ctgr_num);
	
	@Select("select * from prods inner join (select * from main_ctgr inner join sub_ctgr using(m_ctgr_num)) using(s_ctgr_num) where s_ctgr_num = #{s_ctgr_num}")
	public List<ProdDTO> getAllSubProds(Integer s_ctgr_num);
}
