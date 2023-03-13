package com.ezen.jhc.web.user.service.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.cart.OnlyCartDTO;
import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.mapper.cart.CartMapper;
import com.ezen.jhc.web.user.mapper.cstm.CstmMapper;
import com.ezen.jhc.web.user.mapper.prod.ProductMapper;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	ProductMapper prodMapper;
	
	@Autowired
	CstmMapper cstmMapper;
	
	@Override
	public int insertCart(MemberCstmDTO cstmDto, OnlyCartDTO cartDto, int p_num, String pc_name, String ps_name) {
		cstmMapper.insertCstm(cstmDto);
		int mem_cstm_num = cstmDto.getMem_cstm_num();
		
		int pd_num = prodMapper.getProdDetailByPNum(p_num, pc_name, ps_name).getPd_num();
		
		cartDto.setMem_cstm_num(mem_cstm_num);
		cartDto.setPd_num(pd_num);
		
		return cartMapper.insertCart(cartDto);
	}

}
