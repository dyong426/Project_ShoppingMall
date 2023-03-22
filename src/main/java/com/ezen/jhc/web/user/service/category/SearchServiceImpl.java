package com.ezen.jhc.web.user.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.mapper.category.SearchMapper;
/**@author SUJEONG*/
@Service
public class SearchServiceImpl implements SearchService{

	
	@Autowired
	SearchMapper searchMapper;
	@Override
	public List<ProdDTO> getProdsBySearch(String keyword) {
		// TODO Auto-generated method stub
		return searchMapper.getProdsBySearch(keyword);
	}
	
	

}
