package com.neoboard.tags;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateConvert {
	/**
	* 현재 날짜 반환.
	* return String 반환형식 : YYYY-MM-DD
	*/
	public static String getDate() {
		Calendar toDay = Calendar.getInstance();
		int year			= toDay.get(Calendar.YEAR);
		int month1		= toDay.get(Calendar.MONTH)+1;
		int day1			= toDay.get(Calendar.DATE);
		
		String month	= "";
		String day		= "";

		if(month1 < 10) {
			month = "0" + month1;
		}else {
			month = new Integer(month1).toString();
		}

		if(day1 < 10) {
			day = "0" + day1;
		}else {
			day = new Integer(day1).toString();
		}

		return year + "-" + month + "-" + day ;//2004-01-04
	}
	public static int getYear(){
		Calendar toDay = Calendar.getInstance();
		return toDay.get(Calendar.YEAR);
	}
	public static int getMonth(){
		Calendar toDay = Calendar.getInstance();
		return toDay.get(Calendar.MONTH)+1;
	}
	public static int getDay(){
		Calendar toDay = Calendar.getInstance();
		return toDay.get(Calendar.DATE);
	}
	public static String getHour(){
		Calendar toDay = Calendar.getInstance();
	
		int hour=toDay.get(Calendar.HOUR_OF_DAY);
		String hour1="";
		if(hour < 10) {
			hour1 = "0" + hour;
		}else {
			hour1 = Integer.toString(hour);
		}
		return hour1;
	}
	public static int getMinute(){
		Calendar toDay = Calendar.getInstance();
		return toDay.get(Calendar.MINUTE);	
	}

	public static String getCurrentDateFormat(int code){
		int style;
		switch(code){
			case 1: style = DateFormat.FULL;	break;	//2003년 5월 21일 수요일 09시44분46초 오전 GMT+09:00
			case 2: style = DateFormat.LONG;	break;	//2003년 5월 20일 화 06시12분10초 오후
			case 3: style = DateFormat.MEDIUM;	break;	//2003-05-20 오후 6:12:45
			case 4: style = DateFormat.SHORT;	break;	//03-05-20 오후 6:13
			default: style = DateFormat.MEDIUM;
		}
		DateFormat df = DateFormat.getDateTimeInstance(style, style);
		return df.format(new java.util.Date());
	}
	/**
	 * 시작날짜와 마지막날짜의 String값을 받아서 Date객체로 포멧후
	 * Date 객체를 비교하여 시작날짜와 마지막날짜의 사이에 있으면 true,
	 * 아니면 false를 리턴하게 된다.
	 * @param sday 시작날짜
	 * @param eday 마지막날짜
	 * @param format ex) yyyy-MM-dd HH:mm:ss
	 * @return 
	 * @throws ParseException
	 */
	public static boolean compareBetween(String sday,String eday,String format) throws ParseException{
		//String form="yyyy-MM-dd HH:mm";
		SimpleDateFormat sdf = new SimpleDateFormat(format, java.util.Locale.KOREA);

		Date sd1=sdf.parse(sday);
		Date ed2=sdf.parse(eday);
		Date current =new Date();
		if(current.after(sd1) && current.before(ed2)){
			return true;
		}else{
			return false;
		}
	}
}
