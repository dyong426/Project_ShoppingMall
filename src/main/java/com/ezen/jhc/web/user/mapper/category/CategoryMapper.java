package com.ezen.jhc.web.user.mapper.category;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.SubCtgrDTO;
/**@author SUJEONG
 * */
public interface CategoryMapper {

	
	// 메인 카테고리
	@Select("SELECT m_ctgr_name FROM main_ctgr WHERE m_ctgr_num = #{m_ctgr_num}")
	public String getMainCategory(Integer m_ctgr_num);
	
	// 서브 카테고리
	@Select("SELECT s_ctgr_name, s_ctgr_num FROM sub_ctgr WHERE m_ctgr_num = #{m_ctgr_num}")
	public List<SubCtgrDTO> getSubCategories(Integer m_ctgr_num);
	
	// 상품 정보
	@Select("select * from prods p, prod_images pi, main_ctgr m, sub_ctgr s where p.p_num = pi.p_num and m.m_ctgr_num = s.m_ctgr_num and p.s_ctgr_num = s.s_ctgr_num and m.m_ctgr_num = #{m_ctgr_num}")
	public List<ProdDTO> getAll(Integer m_ctgr_num);
	
	// 서브
	@Select("select * from prod_images pi, prods p, main_ctgr m, sub_ctgr s where m.m_ctgr_num = s.m_ctgr_num and s.s_ctgr_num = p.s_ctgr_num and pi.p_num = p.p_num and s.s_ctgr_num = #{s_ctgr_num}")
	public List<ProdDTO> getAllSubProds(Integer s_ctgr_num);
	
	// 서브 카테고리로 메인 카테고리 구하기
	@Select("select m_ctgr_name from (select * from main_ctgr inner join sub_ctgr using (m_ctgr_num)) where s_ctgr_num = #{s_ctgr_num}")
	public String getMainCtgrNameBySubCtgr(Integer s_ctgr_num);

	// 서브 카테고리 (서브 카테고리 넘버로 구하기)
	@Select("SELECT * from sub_ctgr where m_ctgr_num = (select m_ctgr_num from sub_ctgr where s_ctgr_num = #{s_ctgr_num})")
	public List<SubCtgrDTO> getSubCategoriesBySubNum(Integer s_ctgr_num);
	

	
}

