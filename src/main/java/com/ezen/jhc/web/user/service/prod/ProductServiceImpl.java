package com.ezen.jhc.web.user.service.prod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.cart.IntoCartDTO;
import com.ezen.jhc.web.user.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.user.dto.prod.ProductDetailDTO;
import com.ezen.jhc.web.user.mapper.prod.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper prodMapper;
	
	// colors 받아서 controller에서 attribute에 실어놓고 컬러 클릭하면 attribute에서 해당 값 받아와서 RestContoller 통해 리로딩
	@Override
	public Map<String, ProdColorDTO> getColors(int p_num) {
		
		Map<String, ProdColorDTO> colors = new HashMap();
		
		for (ProdColorDTO pcd : prodMapper.getProdColorsByNum(p_num)) {
			colors.put(pcd.getPc_code(), pcd);
		}
		return colors;
	}
	
	@Override
	public ProdColorDTO getColor(int pc_num) {		
		return prodMapper.getProdColorByNum(pc_num);
	}

	@Override
	public List<ProdSizeDTO> getSizes(int p_num) {
		
		List<ProdSizeDTO> sizes = prodMapper.getProdSizesByNum(p_num);
		
		return sizes;
	}
	
	@Override
	public ProdDTO getProd(int p_num) {
		return prodMapper.getProdByNum(p_num);
	}
	
	@Override
	public ProdColorDTO getInitialColor(int p_num) {
		return prodMapper.getInitialColorByNum(p_num);
	}
	
	@Override
	public ProductDetailDTO getProdDetailByIntoCartDto(IntoCartDTO cartDto) {
		return prodMapper.getProdDetailByIntoCartDto(cartDto);
	}

}
