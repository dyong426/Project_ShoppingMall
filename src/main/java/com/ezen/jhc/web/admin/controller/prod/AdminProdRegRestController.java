package com.ezen.jhc.web.admin.controller.prod;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.jhc.common.util.Utils;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.mapper.prod.SubCtgrMapper;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnails;

@Log4j2
@RestController
public class AdminProdRegRestController {

	@Autowired
	SubCtgrMapper scMapper;

	@Autowired(required = false)
	Utils util;

	@PostMapping(value = "/restful/admin/prod/reg", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<SubCtgrDTO> setSubCtgr(@RequestBody SubCtgrDTO sCtgr) {

		return scMapper.getSubCtgr(sCtgr.getM_ctgr_num());
	}

	@PostMapping("/admin/uploadAjaxAction")
	public void uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		log.info("제품등록 이미지 업로드");

		// 저장 경로 설정
		String uploadFolder = "C:\\upload";

		// 파일 이름에 사용할 현재 날짜 가져오기
		String datePath = util.getNowTime("2023-03-26", 0).replace("-", File.separator);

		// 파일 생성
		File uploadPath = new File(uploadFolder, datePath);

		// 파일 존재 유무 확인 후 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {
			// 파일 이름
			// UUID(범용 고유 식별자 : 일련번호) 생성
			String uuid = UUID.randomUUID().toString();
			// 파일 원본 이름
			String uploadFileName = multipartFile.getOriginalFilename();
			// 파일 업로드 이름 = UUID + 파일 원본 이름
			uploadFileName = uuid + "_" + uploadFileName;

			// 파일 위치, 파일 이름으 합친 File 객체
			File saveFile = new File(uploadPath, uploadFileName);

			// 파일 저장
			try {
				multipartFile.transferTo(saveFile);
				
				// thumbnailator 라이브러리
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
				// 비율
				double ratio = 3;
				// 비율에 따른 넓이 높이
				int width = (int)(bo_image.getWidth() / ratio);
				int height = (int)(bo_image.getHeight() / ratio);
				
				Thumbnails.of(saveFile).size(160, 160).toFile(thumbnailFile);
				
				/* 썸네일 비율 축소
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
				// 비율
				double ratio = 3;
				// 비율에 따른 넓이 높이
				int width = (int)(bo_image.getWidth() / ratio);
				int height = (int)(bo_image.getHeight() / ratio);
				// 썸네일 생성
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
				// Graphics2D 객체 생성
				Graphics2D graphic = bt_image.createGraphics();
				// 썸네일 만들기
				graphic.drawImage(bo_image, 0, 0, width, height, null);
				// 저장
				ImageIO.write(bt_image, "jpg", thumbnailFile);
				*/
				
				/* 썸네일 크기 설정 
				// 썸네일 이미지 파일 객체 초기화
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				// Buffered Original Image
				BufferedImage bo_image = ImageIO.read(saveFile);
				// Buffered Thumbnail Image (넓이 , 높이, 생성될 이미지 타입)
				BufferedImage bt_image = new BufferedImage(300, 500, BufferedImage.TYPE_3BYTE_BGR);

				// createGraphics() 메서드 호출을 통해 Graphics2D 객체 생성 후
				Graphics2D graphic = bt_image.createGraphics();

				// drawImgae 메서드로 bo_image를 bt_image로 변경 (원본이미지, 왼쪽 상단 x,y , 넓이 , 높이,
				// ImageObserver)
				graphic.drawImage(bo_image, 0, 0, 300, 500, null);

				// ImageIO의 write 메서드를 호출하여 파일로 저장
				ImageIO.write(bt_image, "jpg", thumbnailFile);
				 */
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}
