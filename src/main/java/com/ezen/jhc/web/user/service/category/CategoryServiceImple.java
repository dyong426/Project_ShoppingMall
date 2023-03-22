package com.ezen.jhc.web.user.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.mapper.category.CategoryMapper;
/**@author SUJEONG*/
@Service
public class CategoryServiceImple implements CategoryService {

	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public List<SubCtgrDTO> getSubCategories(Integer m_ctgr_num) {
		// TODO Auto-generated method stub
		return categoryMapper.getSubCategories(m_ctgr_num);
	}

	@Override
	public List<ProdDTO> getProdsAll(Integer m_ctgr_num) {
		// TODO Auto-generated method stub
		return categoryMapper.getProdsAll(m_ctgr_num);
	}

	@Override
	public List<ProdDTO> getAllSubProds(Integer s_ctgr_num) {
		// TODO Auto-generated method stub
		return categoryMapper.getAllSubProds(s_ctgr_num);
	}

	@Override
	public String getMainCtgrNameBySubCtgr(Integer s_ctgr_num) {
		// TODO Auto-generated method stub
		return categoryMapper.getMainCtgrNameBySubCtgr(s_ctgr_num);
	}

	@Override
	public List<SubCtgrDTO> getSubCategoriesBySubNum(Integer s_ctgr_num) {
		// TODO Auto-generated method stub
		return categoryMapper.getSubCategoriesBySubNum(s_ctgr_num);
	}

	@Override
	public String getMainCategory(Integer m_ctgr_num) {
		// TODO Auto-generated method stub
		return categoryMapper.getMainCategory(m_ctgr_num);
	}
	
	

}
