package com.ezen.jhc.web.user.service.category;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;

@Service
public interface SearchService {

	
	public List<ProdDTO> getProdsBySearch(String keyword);
}
