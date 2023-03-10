package com.ezen.jhc.web.user.controller.prod;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

import javax.imageio.ImageIO;

import org.apache.logging.log4j.util.Base64Util;
import org.springframework.http.MediaType;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class ProdDetailRestController {
	
	@PostMapping("/saveImage")
	public void saveImage(String img, String fileName) throws IOException {
		
		log.info("originalImg : " + img);
//		String encodingImg = Base64.getEncoder().encodeToString(img);
//		log.info("encodingImg : " + encodingImg);
		String encodingImg = img.replace("+", "-");//.replace("/", "_");
		log.info("encodingImg : " + encodingImg);
		byte[] imageBytes = Base64.getUrlDecoder().decode(encodingImg);
		log.info(imageBytes);
		
		BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageBytes));
		
		log.info(image);
		
		String file = fileName;
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String uploadFolder = "C:\\upload\\cstm_img";
		String newFolder = LocalDateTime.now().format(formatter).replace("-", File.separator);
		
		File uploadPath = new File(uploadFolder, newFolder);
		
		if (uploadPath.exists() == false) {
			log.info("존재 안함");
			uploadPath.mkdirs();
		}
		
		ImageIO.write(image, "png", new File(uploadPath, file));
		
	}
	
}
