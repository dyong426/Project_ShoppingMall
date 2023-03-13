package com.ezen.jhc.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {
	
	/**
	 * 포맷값 넣어 현재 시간 가져오기
	 * yyyy : 2023 / MM : 03 / yyyMM : 202303 / yyyy-MM : 2023-03 / HH : 24시간 / hh : 12시간 / mm : 분 / ss : 초
	 * 
	 * @param formatType
	 * @param msec
	 * @return nowTime
	 */
	public static String getNowTime(String formatType, int msec) {
		
		long time = System.currentTimeMillis() + msec;
		
		SimpleDateFormat dayTime = new SimpleDateFormat(formatType);
		
		String nowTime = dayTime.format(new Date(time));
		
		return nowTime;
	}
	
public static Date getFormatTime(Date date) {
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		
		String formatTime = dayTime.format(date);
		System.out.println(formatTime);
		Date formatDate = new Date();
		try {
			formatDate = dayTime.parse(formatTime);
			System.out.println(dayTime.parse(formatTime));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return formatDate;
	}

}
