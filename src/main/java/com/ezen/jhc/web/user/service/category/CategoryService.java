package com.ezen.jhc.web.user.service.category;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.SubCtgrDTO;
/**@author SUJEONG*/
@Service
public interface CategoryService {
	
	String getMainCategory(Integer m_ctgr_num);
	List<SubCtgrDTO> getSubCategories(Integer m_ctgr_num);	
	List<ProdDTO> getAll(Integer m_ctgr_num);	
	List<ProdDTO> getAllSubProds(Integer s_ctgr_num);	
	String getMainCtgrNameBySubCtgr(Integer s_ctgr_num);
	List<SubCtgrDTO> getSubCategoriesBySubNum(Integer s_ctgr_num);
	
}
