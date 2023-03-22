package com.ezen.jhc.web.user.controller.prod;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.jhc.web.user.dto.cart.IntoCartDTO;
import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.service.cart.CartServiceImpl;
import com.ezen.jhc.web.user.service.cstm.CstmServiceImpl;
import com.ezen.jhc.web.user.service.prod.ProductServiceImpl;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class ProdDetailRestController {

	@Autowired
	CstmServiceImpl cstmService;
	
	@Autowired
	ProductServiceImpl prodService;
	
	@Autowired
	CartServiceImpl cartService;
	
	private MemberCstmDTO cstmDto;
	
	// 커스텀 이미지 저장
	@PostMapping("/saveImage")
	public void saveImage(String img, String fileName) throws IOException {
		cstmService.saveImage(img, fileName);
	}
	
	// 장바구니 처리
	@PostMapping(value = "/insertCstm", produces = MediaType.APPLICATION_JSON_VALUE)
	public void insertCstm(@RequestBody MemberCstmDTO cstmDto) {
		this.cstmDto = cstmService.insertCstm(cstmDto);
	}
	
	@PostMapping(value = "/insertCart", produces=MediaType.APPLICATION_JSON_VALUE)
	public int insertCart(@RequestBody IntoCartDTO cartDto) {
		cartDto.setMem_num(cstmDto.getMem_num());
		cartDto.setMem_cstm_num(cstmDto.getMem_cstm_num());
		log.info(cartDto);
		int cart_num = cartService.insertCart(cstmDto, cartDto);
		
		return cart_num;
	}

}
