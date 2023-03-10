package com.ezen.jhc.web.common.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j2;

/**
 * 
 * @author LDH
 *	
 *	이미지 전달 컨트롤러
 *
 */
@Log4j2
@Controller
public class ImageViewController {
	
	
	/**
	 * 
	 * @param fileName
	 * @return 
	 */
	@GetMapping("/display/image")
	public ResponseEntity<byte[]> getImage(String fileName) {
		
		log.info("getImage()---" + fileName);
		
		File file = new File("C:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		
		log.info("deleteFile---" + fileName);
		
		File file = null;
		
		try {
			
			// 썸네일 파일 삭제
			file = new File("C:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			// 원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			log.info("OriginFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
