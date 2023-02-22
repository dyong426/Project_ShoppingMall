package com.ezen.jhc.web.user.controller.prod_detail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProdDetailController {

	@GetMapping("/prodDetail")
	public String prodDetail() {
		return "user/prod/product_details";
	}
}
