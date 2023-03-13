package com.ezen.jhc.web.user.mapper.prod;

import java.util.List;

import com.ezen.jhc.web.user.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDetailDTO;
import com.ezen.jhc.web.user.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.user.dto.prod.ProductDetailDTO;

public interface ProductMapper {

	List<ProdColorDTO> getProdColorsByNum(int p_num);
	
	ProdColorDTO getProdColorByNum(int pc_num);
	
	List<ProdSizeDTO> getProdSizesByNum(int p_num);
	
	ProdDTO getProdByNum(int p_num);
	
	ProdColorDTO getInitialColorByNum(int p_num);
	
	ProductDetailDTO getProdDetailByPNum(int p_num, String pc_name, String ps_name);
}
