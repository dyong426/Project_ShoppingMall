package com.ezen.jhc.web.user.controller.cs;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.jhc.web.user.dto.contact.AttachImageDTO;

import net.coobird.thumbnailator.Thumbnails;

@RestController
public class CsRestController {
	/**@author JIEUN
	 * 
	 * **/
	/* 첨부 파일 업로드 */
	
	@PostMapping(value="/uploadAjaxAction_contact", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageDTO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		System.out.println("uploadAjaxActionPOST..........");
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				System.out.println("MIME TYPE: " + type);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageDTO> list = null;
				
			}
			
		} //for
		
		
		
		String uploadFolder = "C:\\upload\\contact";
		
		
		// 날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		//이미지 정보 담는 객체
		List<AttachImageDTO> list = new ArrayList();
		
		// 향상된 for
		for(MultipartFile multipartFile : uploadFile) {
			// 이미지 정보 객체
			AttachImageDTO vo = new AttachImageDTO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();			
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
			
				/* 썸네일 생성(ImageIO) */
				/*
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
					
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
				// 비율 
				double ratio = 3;
				
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);		
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
								
				Graphics2D graphic = bt_image.createGraphics();
				
				graphic.drawImage(bo_image, 0, 0, width, height, null);
					
				ImageIO.write(bt_image, "jpg", thumbnailFile);
			
				*/
				/* 방법 2 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
			list.add(vo);
		
		} //for
		
		ResponseEntity<List<AttachImageDTO>> result = new ResponseEntity<List<AttachImageDTO>>(list, HttpStatus.OK);
		
		return result;
	
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		System.out.println("getImage()........." + fileName);
		
		File file = new File("c:\\upload\\contact\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/con/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		System.out.println("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\contact\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			System.out.println("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		} //catch 
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
		
	}
	
	
	
	
}
