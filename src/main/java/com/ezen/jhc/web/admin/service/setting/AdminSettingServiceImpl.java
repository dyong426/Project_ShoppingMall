package com.ezen.jhc.web.admin.service.setting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.dto.setting.BannerDTO;
import com.ezen.jhc.web.admin.mapper.prod.CtgrMapper;
import com.ezen.jhc.web.admin.mapper.setting.AdminSettingMapper;

@Service
public class AdminSettingServiceImpl implements AdminSettingService{
	
	@Autowired
	CtgrMapper ctgrMapper;
	
	@Autowired
	AdminSettingMapper settingMapper;
	
	@Override
	public List<MainCtgrDTO> getMainCtgrs() {
		
		return ctgrMapper.getMainCtgr();
	}
	
	@Override
	public List<SubCtgrDTO> getSubCtgr(Integer m_ctgr_num) {
		
		return ctgrMapper.getSubCtgr(m_ctgr_num);
	}
	
	@Override
	public Integer regMainCtgr(MainCtgrDTO mCtgr) {
		
		return settingMapper.regMainCtgr(mCtgr);
	}
	
	@Override
	public Integer modifyMainCtgr(MainCtgrDTO mCtgr) {
		
		return settingMapper.modifyMainCtgr(mCtgr);
	}
	
	@Override
	public Integer deleteMainCtgr(Integer m_ctgr_num) {
		
		return settingMapper.deleteMainCtgr(m_ctgr_num);
	}
	
	@Override
	public Integer regSubCtgr(SubCtgrDTO sCtgr) {
		
		return settingMapper.regSubCtgr(sCtgr);
	}
	
	@Override
	public Integer modifySubCtgr(SubCtgrDTO sCtgr) {
		
		return settingMapper.modifySubCtgr(sCtgr);
	}
	
	@Override
	public Integer deleteSubCtgr(Integer s_ctgr_num) {
		
		return settingMapper.deleteSubCtgr(s_ctgr_num);
	}
	
	@Override
	public List<BannerDTO> getBanners() {
		
		return settingMapper.getBanners();
	}
	
	@Override
	public Integer regBanner(BannerDTO banner) {
		
		return settingMapper.regBanner(banner);
	}
	
	@Override
	public Integer modifyBanner(BannerDTO banner) {
		
		return settingMapper.modifyBanner(banner);
	}
	
	@Override
	public Integer deleteBanner(Integer banner_num) {
		
		return settingMapper.deleteBanner(banner_num);
	}
	
}
