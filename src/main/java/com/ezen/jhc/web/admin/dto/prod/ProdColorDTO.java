package com.ezen.jhc.web.admin.dto.prod;

import java.awt.Color;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ProdColorDTO {
	
	private Integer pc_num;
	private String pc_name;
	private String pc_code;
	private String pc_img_path;
	private Integer p_num;
	private String pc_img_uploadpath;
	private String pc_img_uuid;
	private String pc_img_filename;
	private String pc_origin_img_path;
	private String pc_thumb_img_path;
	private String pc_lg_img_path;
	private String pc_md_img_path;
	private String pc_sm_img_path;
	
	public void setOrigin_img_path(String pc_img_uploadpath, String pc_img_uuid, String pc_img_filename) {
		this.pc_origin_img_path = pc_img_uploadpath + pc_img_uuid + pc_img_filename;
	}
	
	public void setThumb_img_path(String pc_img_uploadpath, String pc_img_uuid, String pc_img_filename) {
		this.pc_thumb_img_path = pc_img_uploadpath + "s_" + pc_img_uuid + pc_img_filename;
	}

	public void setLg_img_path(String pc_img_uploadpath, String pc_img_uuid, String pc_img_filename) {
		this.pc_lg_img_path = pc_img_uploadpath + "lg_" + pc_img_uuid + pc_img_filename;
	}
	
	public void setMd_img_path(String pc_img_uploadpath, String pc_img_uuid, String pc_img_filename) {
		this.pc_md_img_path = pc_img_uploadpath + "md_" + pc_img_uuid + pc_img_filename;
	}

	public void setSm_img_path(String pc_img_uploadpath, String pc_img_uuid, String pc_img_filename) {
		this.pc_sm_img_path = pc_img_uploadpath + "sm_" + pc_img_uuid + pc_img_filename;
	}
	
	
}
