package com.ezen.jhc.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.image.AttachImageListDTO;
import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdColorListDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeListDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
/**
 * 
 * @author Duha
 *
 *	제품 등록 페이지 Service 
 */
@Service
public interface AdminProdRegService {
	
	/**
	 * 
	 * @return List<MainCtgrDTO>
	 */
	public List<MainCtgrDTO> getMainCtgrList();
	/**
	 * 
	 * @param m_ctgr_num
	 * @return List<SubCtgrDTO>
	 */
	public List<SubCtgrDTO> getSubCtgrList(Integer m_ctgr_num);
	
	/**
	 * 
	 * @param prodDTO
	 * @param imageList
	 * @param prodColors
	 * @param prodSizes
	 * @return Integer result
	 */
	public Integer regNewProd(ProdDTO prodDTO, AttachImageListDTO imageList, ProdColorListDTO prodColors, ProdSizeListDTO prodSizes,StringBuilder p_explain,StringBuilder p_info);
}