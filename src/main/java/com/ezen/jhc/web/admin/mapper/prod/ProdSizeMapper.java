package com.ezen.jhc.web.admin.mapper.prod;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.jhc.web.admin.dto.prod.ProdSizeDTO;

@Mapper
public interface ProdSizeMapper {

	public List<ProdSizeDTO> getProdSizes(Integer p_num);
}
