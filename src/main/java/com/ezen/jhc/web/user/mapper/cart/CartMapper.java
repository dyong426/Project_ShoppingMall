package com.ezen.jhc.web.user.mapper.cart;

import java.util.List;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.cart.OnlyCartDTO;

public interface CartMapper {

	public int insertCart(OnlyCartDTO cartDto);
	
	public List<CartDTO> getCarts(int mem_num);
}
