package com.ezen.jhc.web.user.service.cart;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.cart.OnlyCartDTO;
import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;

public interface CartService {
	
	public int insertCart(MemberCstmDTO cstmDto, OnlyCartDTO cartDto, int p_num, String pc_name, String ps_name);
}
