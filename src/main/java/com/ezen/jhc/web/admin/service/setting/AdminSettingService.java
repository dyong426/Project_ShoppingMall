package com.ezen.jhc.web.admin.service.setting;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.dto.setting.BannerDTO;

@Service
public interface AdminSettingService {
	
	List<MainCtgrDTO> getMainCtgrs();
	
	List<SubCtgrDTO> getSubCtgr(Integer m_ctgr_num);
	
	Integer regMainCtgr(MainCtgrDTO mCtgr);
	
	Integer modifyMainCtgr(MainCtgrDTO mCtgr);
	
	Integer deleteMainCtgr(Integer m_ctgr_num);
	
	Integer regSubCtgr(SubCtgrDTO sCtgr);
	
	Integer modifySubCtgr(SubCtgrDTO sCtgr);
	
	Integer deleteSubCtgr(Integer s_ctgr_num);
	
	List<BannerDTO> getBanners();
	
	Integer regBanner(BannerDTO banner);
	
	Integer modifyBanner(BannerDTO banner);
	
	Integer deleteBanner(Integer banner_num);

}
