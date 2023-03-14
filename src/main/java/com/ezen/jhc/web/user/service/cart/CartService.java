package com.ezen.jhc.web.user.service.cart;

import com.ezen.jhc.web.user.dto.cart.IntoCartDTO;
import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;

public interface CartService {
	
	public int insertCart(MemberCstmDTO cstmDto, IntoCartDTO cartDto);
}
