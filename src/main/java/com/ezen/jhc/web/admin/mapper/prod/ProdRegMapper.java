package com.ezen.jhc.web.admin.mapper.prod;

import com.ezen.jhc.web.admin.dto.image.AttachImageDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeDTO;

public interface ProdRegMapper {
	
	public Integer regProd(ProdDTO prodDTO);
	
	public Integer regProdImage(AttachImageDTO attach);
	
	public Integer regProdColors(ProdColorDTO prodColorDTO);
	
	public Integer regProdSizes(ProdSizeDTO prodSizeDTO);
	
	Integer regProdDetails(Integer p_num);
}
