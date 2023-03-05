package com.ezen.jhc.web.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.admin.mapper.prod.ProdColorMapper;
import com.ezen.jhc.web.admin.mapper.prod.ProdMapper;
import com.ezen.jhc.web.admin.mapper.prod.ProdSizeMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AdminProdViewServiceImpl implements AdminProdViewService{
	
	@Autowired
	ProdMapper prodMapper;
	
	@Autowired
	ProdColorMapper prodColorMapper;
	
	@Autowired
	ProdSizeMapper prodSizeMapper;
	
	@Autowired(required = false)
	List<ProdDTO> prodList;
	
	@Autowired(required = false)
	List<ProdColorDTO> prodColorList;
	
	@Autowired(required = false)
	List<ProdSizeDTO> prodSizeList;
	
	@Override
	public List<ProdDTO> getProdsList() {
		
		prodList = prodMapper.getProds();
		return prodList;
	}
	
	@Override
	public List<ProdColorDTO> getProdColorList(Integer p_num) {
		
		prodColorList = prodColorMapper.getProdColors(p_num);
		return prodColorList;
	}
	
	@Override
	public List<ProdSizeDTO> getProdSizeList(Integer p_num) {
		
		prodSizeList = prodSizeMapper.getProdSizes(p_num);
		return prodSizeList;
	}
}
