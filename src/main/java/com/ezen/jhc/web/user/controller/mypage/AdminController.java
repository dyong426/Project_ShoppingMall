package com.ezen.jhc.web.user.controller.mypage;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.jhc.web.user.dto.review.AttachImageVO;

import net.coobird.thumbnailator.Thumbnails;

@RestController
public class AdminController {
	
	private static Logger logger = LogManager.getLogger(AdminController.class);
	
	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		logger.info("uploadAjaxActionPOST..........");
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		}
		
		
		
		String uploadFolder = "C:\\upload";
		
		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList<>();
		
		// 향상된 for
				for(MultipartFile multipartFile : uploadFile) {
					
					/* 이미지 정보 객체 */
					AttachImageVO vo = new AttachImageVO();
					
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
				}
				
				ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
				
				return result;
				
		
	}
	
	


}
