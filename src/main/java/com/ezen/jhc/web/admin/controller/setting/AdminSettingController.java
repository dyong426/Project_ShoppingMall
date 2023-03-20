package com.ezen.jhc.web.admin.controller.setting;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jhc.common.util.FileUploader;
import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.dto.setting.BannerDTO;
import com.ezen.jhc.web.admin.service.setting.AdminSettingServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin/setting")
public class AdminSettingController {
	
	@Autowired
	AdminSettingServiceImpl settingService;
	
	@Autowired(required = false)
	List<MainCtgrDTO> mCtgrs;
	
	@Autowired(required = false)
	List<SubCtgrDTO> sCtgrs;
	
	@Autowired(required = false)
	List<BannerDTO> banners;
	
	@GetMapping(value={"/mctgr", "/"})
	public String setMctgr(Model model) {
		
		mCtgrs = settingService.getMainCtgrs();
		
		model.addAttribute("mCtgrs", mCtgrs);
		
		return "admin/setting/admin_setting_mainCtgr";
	}
	
	@PostMapping("/mctgr/reg")
	public String regMctgr(HttpServletRequest req, MainCtgrDTO mCtgr) {

		log.info(mCtgr);
		
		if (mCtgr.getM_ctgr_name() == "" || mCtgr.getM_ctgr_icon_path() == null) return "redirect:/admin/setting/mctgr";
		
		int result = settingService.regMainCtgr(mCtgr);
		
		log.info("insert MainCtgr : " + result);

		return "redirect:/admin/setting/mctgr";
	}
	
	@PostMapping("/mctgr/delete")
	public String deleteMctgr(Integer m_ctgr_num, String m_ctgr_icon_path) {
		log.info(m_ctgr_num);
		log.info(m_ctgr_icon_path);
		
		int result = settingService.deleteMainCtgr(m_ctgr_num);
		FileUploader fileUploader = new FileUploader();
		if (result == 1) log.info(fileUploader.deleteImg(m_ctgr_icon_path));
		
		
		log.info("delete result : " + result);
		
		return "redirect:/admin/setting/mctgr";
	}
	
	@PostMapping("/mctgr/modify")
	public String modifyMctgr(MainCtgrDTO mCtgr) {
		
		log.info("modify : " + mCtgr);
		
		if (mCtgr.getM_ctgr_name() == "" || mCtgr.getM_ctgr_icon_path() == null) return "redirect:/admin/setting/mctgr";
		
		int result = settingService.modifyMainCtgr(mCtgr);
		
		log.info("modify result: "+ result);
		
		return "redirect:/admin/setting/mctgr";
	}
	
	@GetMapping("/sctgr")
	public String setSctgr(Model model, Integer m_ctgr_num) {
		
		log.info(m_ctgr_num);
		
		mCtgrs = settingService.getMainCtgrs();
		
		model.addAttribute("mCtgrs", mCtgrs);
		
		
		if (m_ctgr_num == null) return "admin/setting/admin_setting_subCtgr";
		
		
		sCtgrs = settingService.getSubCtgr(m_ctgr_num);
		log.info(sCtgrs.get(0));
		model.addAttribute("sCtgrs", sCtgrs);
		model.addAttribute("m_ctgr_num", m_ctgr_num);
		
		return "admin/setting/admin_setting_subCtgr";
	}
	
	@PostMapping("/sctgr/reg")
	public String regSctgr(SubCtgrDTO sCtgr) {
		
		log.info(sCtgr);
		
		int result = settingService.regSubCtgr(sCtgr);
		
		log.info("reg sctgr : " + result);
		
		return "redirect:/admin/setting/sctgr?m_ctgr_num=" + sCtgr.getM_ctgr_num();
	}
	
	@PostMapping("/sctgr/modify")
	public String modifySctgr(SubCtgrDTO sCtgr) {
		
		log.info(sCtgr);
		
		int result = settingService.modifySubCtgr(sCtgr);
		
		log.info("modify sctgr : " + result);
		
		return "redirect:/admin/setting/sctgr?m_ctgr_num=" + sCtgr.getM_ctgr_num();
	}
	
	@PostMapping("/sctgr/delete")
	public String deleteSctgr(SubCtgrDTO sCtgr) {
		
		log.info(sCtgr);
		
		int result = settingService.deleteSubCtgr(sCtgr.getS_ctgr_num());
		
		log.info("delete sctgr : " + result);
		
		return "redirect:/admin/setting/sctgr?m_ctgr_num=" + sCtgr.getM_ctgr_num();
	}
	
	@GetMapping("/bn")
	public String setBanner(Model model) {
		
		banners = settingService.getBanners();
		
		log.info(banners);
		
		model.addAttribute("banners", banners);
		
		return "admin/setting/admin_setting_banner";
	}
	
	@PostMapping("/bn/reg")
	public String regBanner(BannerDTO banner) {
		
		log.info(banner);
		
		int result = settingService.regBanner(banner);
		
		log.info("reg banner : " + result);
		
		return "redirect:/admin/setting/bn";
		
	}
	
	@PostMapping("/bn/modify")
	public String modifyBanner(BannerDTO banner) {
		
		log.info(banner);
		
		int result = settingService.modifyBanner(banner);
		
		log.info("modify banner : " + result);
		
		
		return "redirect:/admin/setting/bn";
	}
	
	@PostMapping("/bn/delete")
	public String deleteBanner(BannerDTO banner) {
		
		log.info(banner);
		
		int result = settingService.deleteBanner(banner.getBanner_num());
		
		log.info("delete banner : " + result);
		
		return "redirect:/admin/setting/bn";
	}
	
}
