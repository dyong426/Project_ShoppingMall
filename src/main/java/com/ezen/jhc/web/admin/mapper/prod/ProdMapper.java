package com.ezen.jhc.web.admin.mapper.prod;

import java.util.List;

import com.ezen.jhc.web.admin.dto.prod.ProdDTO;

public interface ProdMapper {
	
	public List<ProdDTO> getProds();
	
	public ProdDTO getProd(Integer p_num);
	
	public Integer regProd(ProdDTO prodDTO);
	
	Integer deleteProd(Integer p_num);
	
	Integer deleteProdImage(Integer p_num);

}
