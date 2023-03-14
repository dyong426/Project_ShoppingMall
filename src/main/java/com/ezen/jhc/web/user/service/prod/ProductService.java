package com.ezen.jhc.web.user.service.prod;

import java.util.List;
import java.util.Map;

import com.ezen.jhc.web.user.dto.cart.IntoCartDTO;
import com.ezen.jhc.web.user.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.ProductDetailDTO;

public interface ProductService {

	public Map<String, ProdColorDTO> getColors(int p_num);
	
	public ProdColorDTO getColor(int pc_num);
	
	public List<String> getSizes(int p_num);
	
	public ProdDTO getProd(int p_num);
	
	public ProdColorDTO getInitialColor(int p_num);
	
	public ProductDetailDTO getProdDetailByIntoCartDto(IntoCartDTO cartDto);
}
