package com.ezen.jhc.web.user.service.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.cart.IntoCartDTO;
import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;

public interface CartService {
	
	public int insertCart(MemberCstmDTO cstmDto, IntoCartDTO cartDto);
	
	public CartDTO getCartDto(int mem_num, HttpServletRequest req);
	
	public List<CartDTO> getCarts(int mem_num);
}
