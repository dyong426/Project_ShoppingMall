package com.ezen.jhc.web.user.mapper.products;

import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;

public interface ProductsMapper {

	@Select("select * from prods where p_num = #{p_num}")
	public ProdDTO getProdsAll(int p_num);
}
