package com.ezen.jhc.web.admin.service.prod;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.common.util.Utils;
import com.ezen.jhc.web.admin.dto.image.AttachImageDTO;
import com.ezen.jhc.web.admin.dto.image.AttachImageListDTO;
import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdColorListDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeListDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.mapper.prod.CtgrMapper;
import com.ezen.jhc.web.admin.mapper.prod.ProdRegMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AdminProdRegServiceImpl implements AdminProdRegService {

	@Autowired
	CtgrMapper ctgrMapper;

	@Autowired
	ProdRegMapper prodRegMapper;

	@Autowired(required = false)
	Utils util;

	@Override
	public List<MainCtgrDTO> getMainCtgrList() {

		return ctgrMapper.getMainCtgr();
	}

	@Override
	public List<SubCtgrDTO> getSubCtgrList(Integer m_ctgr_num) {

		return ctgrMapper.getSubCtgr(m_ctgr_num);
	}

	@Override
	public Integer regNewProd(ProdDTO prodDTO, AttachImageListDTO imageList, ProdColorListDTO prodColors,
			ProdSizeListDTO prodSizes, StringBuilder p_explain, StringBuilder p_info) {

		for (AttachImageDTO image : imageList.getImageList()) {
			image.setOrigin_img_path(image.getUploadPath(), image.getUuid(), image.getSm_img_path());
			image.setThumb_img_path(image.getUploadPath(), image.getUuid(), image.getSm_img_path());
			image.setLg_img_path(image.getUploadPath(), image.getUuid(), image.getSm_img_path());
			image.setMd_img_path(image.getUploadPath(), image.getUuid(), image.getSm_img_path());
			image.setSm_img_path(image.getUploadPath(), image.getUuid(), image.getSm_img_path());
		}
		List<ProdColorDTO> pcList = prodColors.getProdColors();
		for (int i = 0; i < pcList.size(); i++) {
			if (pcList.get(i).getPc_code() == null && pcList.get(i).getPc_name() == null) {
				pcList.remove(i);
			}
			
			pcList.get(i).setOrigin_img_path(pcList.get(i).getPc_img_uploadpath(), pcList.get(i).getPc_img_uuid(), pcList.get(i).getPc_img_filename());
			pcList.get(i).setThumb_img_path(pcList.get(i).getPc_img_uploadpath(), pcList.get(i).getPc_img_uuid(), pcList.get(i).getPc_img_filename());
			pcList.get(i).setLg_img_path(pcList.get(i).getPc_img_uploadpath(), pcList.get(i).getPc_img_uuid(), pcList.get(i).getPc_img_filename());
			pcList.get(i).setMd_img_path(pcList.get(i).getPc_img_uploadpath(), pcList.get(i).getPc_img_uuid(), pcList.get(i).getPc_img_filename());
			pcList.get(i).setSm_img_path(pcList.get(i).getPc_img_uploadpath(), pcList.get(i).getPc_img_uuid(), pcList.get(i).getPc_img_filename());
		}
		
		prodColors.setProdColors(pcList);
		
		String explainPath = getTextPath(prodDTO, p_explain);
		String infoPath = getTextPath(prodDTO, p_info);
		
		log.info(explainPath);
		log.info(infoPath);
		prodDTO.setP_explain_path(infoPath);
		prodDTO.setP_info_path(infoPath);
		
		log.info("ProdDTO : " + prodDTO);
		int resultProd = prodRegMapper.regProd(prodDTO);

		log.info(prodDTO);
		log.info(imageList);
		log.info(prodColors);

		imageList.getImageList().forEach(attach -> {

			attach.setP_num(prodDTO.getP_num());
			log.info(prodRegMapper.regProdImage(attach));
		});

		prodColors.getProdColors().forEach(color -> {

			color.setP_num(prodDTO.getP_num());
			log.info(prodRegMapper.regProdColors(color));
		});

		prodSizes.getProdSizes().forEach(size -> {

			size.setP_num(prodDTO.getP_num());
			log.info(prodRegMapper.regProdSizes(size));
		});
		
		int resultProdDetails = prodRegMapper.regProdDetails(prodDTO.getP_num());

		log.info(resultProd);
		log.info("prodDetails result : " + resultProdDetails);

		return resultProd;
	}

	public String getTextPath(ProdDTO prodDTO, StringBuilder sb) {

		// 저장 경로 설정
		String uploadPath = "C:\\Java\\gitRepos2\\Project_ShoppingMall\\src\\main\\webapp\\";
		String uploadFolder = uploadPath + "assets\\common\\upload\\";
		// 파일 이름에 사용할 현재 날짜 가져오기
		String datePath = util.getNowTime("yyyy-MM-dd", 0).replace("-", File.separator);

		// 파일 생성
		File uploadAbsolutePath = new File(uploadFolder, datePath);

		// 파일 존재 유무 확인 후 생성
		if (uploadAbsolutePath.exists() == false) {
			uploadAbsolutePath.mkdirs();
		}

		String fileName = prodDTO.getP_name() + ".txt";
		String uuid = UUID.randomUUID().toString();

		String uploadTextFileName = uuid + "_" + fileName;

		// 파일 위치, 파일 이름으 합친 File 객체
		File saveFile = new File(uploadAbsolutePath, uploadTextFileName);
		
		
		try (
				BufferedWriter bw = new BufferedWriter(new FileWriter(saveFile));
				){
			bw.write(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return saveFile.getAbsolutePath().replace(uploadPath,"");
	}

}
