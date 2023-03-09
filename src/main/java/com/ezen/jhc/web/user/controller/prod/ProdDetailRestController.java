package com.ezen.jhc.web.user.controller.prod;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class ProdDetailRestController {
	
	@PostMapping("/saveImage")
	public void saveImage(@RequestParam("file") MultipartFile file) throws IOException {
		
		log.info(file.getSize());
		
		String fileName = file.getOriginalFilename();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String uploadFolder = "C:\\upload\\cstm_img";
		String newFolder = LocalDateTime.now().format(formatter).replace("-", File.separator);
		
		File uploadPath = new File(uploadFolder, newFolder);
		
		if (uploadPath.exists() == false) {
			log.info("존재 안함");
			uploadPath.mkdirs();
		}
		
		file.transferTo(new File(uploadPath, fileName));
		
	}
	
}
