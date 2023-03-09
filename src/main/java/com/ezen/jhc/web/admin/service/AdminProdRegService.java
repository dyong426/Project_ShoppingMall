package com.ezen.jhc.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.image.AttachImageListDTO;
import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdColorListDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeListDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;

@Service
public interface AdminProdRegService {
	
	public List<MainCtgrDTO> getMainCtgrList();
	
	public List<SubCtgrDTO> getSubCtgrList(Integer m_ctgr_num);
	
	public Integer regNewProd(ProdDTO prodDTO, AttachImageListDTO imageList, ProdColorListDTO prodColors, ProdSizeListDTO prodSizes);
	
	public void regProdTxt(String prod_explain);
}
