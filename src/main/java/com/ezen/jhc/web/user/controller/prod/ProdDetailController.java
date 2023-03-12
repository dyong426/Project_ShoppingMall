package com.ezen.jhc.web.user.controller.prod;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.service.prod.ProductServiceImpl;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProdDetailController {

	@Autowired
	ProductServiceImpl prodService;
	
	
	@GetMapping("/prodDetail")
	public String prodDetail(Model model, Integer p_num, HttpSession session) {
		
		session.setAttribute("member", new MemberDTO(1, "dslkjf@naver.com", "2132", "1985/02/21", "두리두하", "01050505050", null, new Date(810501231065145L), 7832));
		
		Map<String, ProdColorDTO> colors = prodService.getColors(p_num);
		List<String> sizes = prodService.getSizes(p_num);
		ProdColorDTO color = prodService.getInitialColor(p_num);
		ProdDTO prod = prodService.getProd(p_num);
		
		model.addAttribute("colors", colors);
		model.addAttribute("color", color);
		model.addAttribute("sizes", sizes);
		model.addAttribute("prod", prod);
		
		return "user/prod/product_details";
	}
	
	
	// 커스텀 이미지 저장
	// cstmService로 옮기기
	@PostMapping("/saveImage")
	public void saveImage(String img, String fileName) throws IOException {
		
		String encodingImg = img.replace(" ", "-").replace("/", "_");
		byte[] imageBytes = Base64.getUrlDecoder().decode(encodingImg);
		
		BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageBytes));
		
		String file = fileName;
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String uploadFolder = "C:\\upload\\cstm_img";
		String newFolder = LocalDateTime.now().format(formatter).replace("-", File.separator);
		
		File uploadPath = new File(uploadFolder, newFolder);
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		ImageIO.write(image, "png", new File(uploadPath, file));		
	}
}
