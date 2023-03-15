package com.ezen.jhc.web.user.controller.cs;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class CsRestController {
	
	/* 첨부 파일 업로드 */
	
	@PostMapping("/uploadAjaxAction_contact")
	public void uploadAjaxActionPOST(@RequestParam MultipartFile[] uploadFile) {
		System.out.println("uploadAjaxActionPOST..........");
		System.out.println(uploadFile.length);
		// 향상된 for
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("-----------------------------------------------");
			System.out.println("파일 이름 : " + multipartFile.getOriginalFilename());
			System.out.println("파일 타입 : " + multipartFile.getContentType());
			System.out.println("파일 크기 : " + multipartFile.getSize());
	
		}
		
		//기본 for
		for(int i = 0; i < uploadFile.length; i++) {
			System.out.println("-----------------------------------------------");
			System.out.println("파일 이름 : " + uploadFile[i].getOriginalFilename());
			System.out.println("파일 타입 : " + uploadFile[i].getContentType());
			System.out.println("파일 크기 : " + uploadFile[i].getSize());
		}
	}
}
