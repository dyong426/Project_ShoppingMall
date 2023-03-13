package com.ezen.jhc.web.user.service.cstm;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.mapper.cstm.CstmMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CstmServiceImpl implements CstmService {

	@Autowired
	CstmMapper cstmMapper;
	
	@Override
	public void saveImage(String img, String fileName) {
		
		String file = fileName;
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String uploadFolder = "C:\\upload\\cstm_img";
		String newFolder = LocalDateTime.now().format(formatter).replace("-", File.separator);
		
		File uploadPath = new File(uploadFolder, newFolder);
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		String encodingImg = img.replace(" ", "-").replace("/", "_");
		byte[] imageBytes = Base64.getUrlDecoder().decode(encodingImg);
		
		try {
			BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageBytes));
			ImageIO.write(image, "png", new File(uploadPath, file));		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public int insertCstm(MemberCstmDTO cstmDto) {
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String filePath = "C:\\upload\\cstm_img\\" + 
							LocalDateTime.now()
							.format(formatter)
							.replace("-", File.separator) + "\\";
		
		cstmDto.setMem_cstm_path(filePath + cstmDto.getMem_cstm_path());
		
		cstmMapper.insertCstm(cstmDto);
		
		return cstmDto.getMem_cstm_num();
	}	

}
