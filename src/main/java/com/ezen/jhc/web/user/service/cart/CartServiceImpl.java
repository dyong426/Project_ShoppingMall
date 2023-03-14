package com.ezen.jhc.web.user.service.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.cart.IntoCartDTO;
import com.ezen.jhc.web.user.dto.cart.OnlyCartDTO;
import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.dto.prod.ProductDetailDTO;
import com.ezen.jhc.web.user.mapper.cart.CartMapper;
import com.ezen.jhc.web.user.mapper.cstm.CstmMapper;
import com.ezen.jhc.web.user.mapper.prod.ProductMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CartServiceImpl implements CartService {

	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	ProductMapper prodMapper;
	
	@Autowired
	CstmMapper cstmMapper;
	
	@Override
	public int insertCart(MemberCstmDTO cstmDto, IntoCartDTO cartDto) {
		
		ProductDetailDTO prodDetailDto = prodMapper.getProdDetailByIntoCartDto(cartDto);
		prodDetailDto.setP_name(cartDto.getP_name());
		
		int pd_num = prodDetailDto.getPd_num();
		
		OnlyCartDTO onlyCartDto = new OnlyCartDTO(cstmDto.getMem_num(), pd_num, cstmDto.getMem_cstm_num(), cartDto.getP_price());
		
		return cartMapper.insertCart(onlyCartDto);
	}

}
