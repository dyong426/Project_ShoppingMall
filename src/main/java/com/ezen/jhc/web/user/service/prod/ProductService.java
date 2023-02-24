package com.ezen.jhc.web.user.service.prod;

import java.util.List;
import java.util.Map;

import com.ezen.jhc.web.user.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;

public interface ProductService {

	public Map<String, ProdColorDTO> getColors(int p_num);
	
	public ProdColorDTO getColor(int pc_num);
	
	public List<String> getSizes(int p_num);
	
	public ProdDTO getProd(int p_num);
}
