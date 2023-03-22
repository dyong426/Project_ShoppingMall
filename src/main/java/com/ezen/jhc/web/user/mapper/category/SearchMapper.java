package com.ezen.jhc.web.user.mapper.category;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;
/**@author SUJEONG*/
public interface SearchMapper {

	@Select("SELECT * FROM PRODS WHERE P_NAME LIKE '%${keyword}%'")
	public List<ProdDTO> getProdsBySearch(String keyword);
		

}
