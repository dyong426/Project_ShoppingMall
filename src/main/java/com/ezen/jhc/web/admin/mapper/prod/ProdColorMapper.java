package com.ezen.jhc.web.admin.mapper.prod;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.jhc.web.admin.dto.prod.ProdColorDTO;

@Mapper
public interface ProdColorMapper {
	
	public List<ProdColorDTO> getProdColors(Integer p_num);
}
