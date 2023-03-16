package com.ezen.jhc.web.admin.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminBoardController {
	
	@GetMapping("/board")
	public String getBoard() {
		
		return "admin/board/admin_board";
	}
}
