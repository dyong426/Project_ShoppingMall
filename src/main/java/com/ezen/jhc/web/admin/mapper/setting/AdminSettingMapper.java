package com.ezen.jhc.web.admin.mapper.setting;

import java.util.List;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.dto.setting.BannerDTO;

public interface AdminSettingMapper {
	
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
