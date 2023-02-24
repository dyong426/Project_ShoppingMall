package com.ezen.jhc.web.user.mapper.prod;

import java.util.List;

import com.ezen.jhc.web.user.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.ProdSizeDTO;

public interface ProductMapper {

	List<ProdColorDTO> getProdColorsByNum(int p_num);
	
	ProdColorDTO getProdColorByNum(int pc_num);
	
	List<ProdSizeDTO> getProdSizesByNum(int p_num);
	
	ProdDTO getProdByNum(int p_num);
}
