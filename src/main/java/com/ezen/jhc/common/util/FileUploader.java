package com.ezen.jhc.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	
	static String uploadFolder = "C:\\upload\\";
	
	/**
	 * 파일명 변경하여 업로드
	 * @param uploadDir
	 * @param file
	 * @return
	 */
	public static String uploadFile(String uploadDir, MultipartFile file) {
		return uploadFile(uploadDir, file, true);
	}
	
	/**
	 * 파일명을 변경하지 않고 업로드
	 * @param uploadDir
	 * @param file
	 * @return
	 */
	public static String uploadOrignalName(String uploadDir, MultipartFile file) {
		return uploadFile(uploadDir, file, false);
	}
	

	/**
	 * 파일 업로드 처리
	 * @param uploadDir
	 * @param file
	 * @param changeName
	 * @return
	 */
	private static String uploadFile(String uploadDir, MultipartFile file, boolean changeName) {
		String fileName = null;
		String realName = null;
		
		//파일이 있으면 업로드
		if (file != null && !file.isEmpty()) {
			
			//업로드 폴더 생성
			String[] dirList = uploadDir.split("/");
			
			String filePath = "";
			
			for (String dir : dirList) {
				filePath += dir + "/";
				File fileDir = new File(filePath);
				if (!fileDir.exists()) {
					fileDir.mkdirs();
				}
			}
			
			fileName = file.getOriginalFilename();
			
			String fileExt = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
			
			if (changeName) {
				realName = getUploadFileName(uploadDir, file.getOriginalFilename());
			} else {
				realName = fileName;
			}
			fileExt=fileExt.toLowerCase();
			//upload 가능한 파일 타입 지정
	        if(fileExt.equalsIgnoreCase("jpg") ||
	        		fileExt.equalsIgnoreCase("jpeg") ||
	        		fileExt.equalsIgnoreCase("gif") ||
	        		fileExt.equalsIgnoreCase("png") ||
	        		fileExt.equalsIgnoreCase("bmp") ||
	        		fileExt.equalsIgnoreCase("mp3") ||
	        		fileExt.equalsIgnoreCase("mp4") ||
	        		fileExt.equalsIgnoreCase("xml") ||
	        		fileExt.equalsIgnoreCase("xls") ||
	        		fileExt.equalsIgnoreCase("xlsx") ||
	        		fileExt.equalsIgnoreCase("txt") ||
	        		fileExt.equalsIgnoreCase("hwp") ||
	        		fileExt.equalsIgnoreCase("pdf") ||
	        		fileExt.equalsIgnoreCase("zip") ||
	        		fileExt.equalsIgnoreCase("ppt") ||
	        		fileExt.equalsIgnoreCase("pptx") ||
	        		fileExt.equalsIgnoreCase("doc") ||
	        		fileExt.equalsIgnoreCase("avi") || 
	        		fileExt.equalsIgnoreCase("mkv") ||
	        		fileExt.equalsIgnoreCase("webm") || 
	        		fileExt.equalsIgnoreCase("ogg") || 
	        		fileExt.equalsIgnoreCase("docx") ) {
	        	 
	        	
	            try {
	            	byte[] bytes = file.getBytes();
					File outFile = new File(uploadDir + "/" + realName);
					FileOutputStream fileOutputStream = new FileOutputStream(outFile);
					fileOutputStream.write(bytes);
					fileOutputStream.close();
	            } catch(IOException e) {
	            	e.printStackTrace();
	            	realName = "";
	            }
	        } else {
	        	realName = "";
	        }
		}
		return realName;
	}
	
	/**
	 * 날짜로 파일명 생성
	 * @param uploadDir
	 * @param fileName
	 * @return
	 */
	public static String getUploadFileName(String uploadDir, String fileName) {
		
		String realName = null;
		String milName = "";
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		long milliSecond = System.currentTimeMillis();
		milName = String.valueOf(milliSecond).substring(10, 13);
		
    	realName = (sdf.format(new java.util.Date()) + milName) + "." + fileExt;
    	
    	File ckfile = new File(uploadDir + "/" + realName);
    	
		int index = 0;
		
		//동일한 파일명이 존재하면 파일명에 1을 더함
		while(ckfile.exists()) {
			index++;
			realName = String.valueOf(Long.parseLong(sdf.format(new java.util.Date()) + milName) + index) + "." + fileExt;
			ckfile = new File(uploadDir + "/" + realName);
		}
		return realName;
	}

	public static void deleteFile(File path){
		if (path != null && path.exists()) {
			File[] files = path.listFiles();
			if (files != null) {
				for(File file : files) {
					if(file.isDirectory()) {
						deleteFile(file);
					}
					else
						file.delete();					
				}
			}
		}
	}
	
	public static boolean deleteImg(String fileName) {
		
		File file = null;
		
		try {

			file = new File(uploadFolder + URLDecoder.decode(fileName, "UTF-8"));
			
			// 원본 파일 삭제
			File originFile = new File(file.getAbsolutePath().replace("s_", ""));
			File thumbnailFile = new File(file.getAbsolutePath());
			File lgImg = new File(file.getAbsolutePath().replace("s_", "lg_"));
			File mdImg = new File(file.getAbsolutePath().replace("s_", "md_"));
			File smImg = new File(file.getAbsolutePath().replace("s_", "sm_"));
			
			originFile.delete();
			thumbnailFile.delete();
			lgImg.delete();
			mdImg.delete();
			smImg.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
}
