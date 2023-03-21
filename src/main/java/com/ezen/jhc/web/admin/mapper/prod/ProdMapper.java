package com.ezen.jhc.web.admin.mapper.prod;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.admin.dto.prod.ProdDTO;

public interface ProdMapper {
	
	List<ProdDTO> getProds();
	
	List<ProdDTO> getSearchProds(@Param("m_ctgr_num")Integer m_ctgr_num,@Param("p_name")String p_name);
	
	List<ProdDTO> getSearchKeywordProds(@Param("p_name")String p_name);

	ProdDTO getProd(Integer p_num);
	
	Integer regProd(ProdDTO prodDTO);
	
	Integer deleteProd(Integer p_num);
	
	Integer deleteProdImage(Integer p_num);

}
