package kr.co.knoc.util;

import java.text.*;
import java.util.Date;
import java.util.Calendar;
/**
 * 날짜 관련 메써드 모음.
 * 
 * @author 이시걸(seagull@nisko.net) 2006. 09. 04
 *
 */
public class DateUtil {
	/**
	 * 현재 날짜를 내장된 포멧으로 변환
	 * @param code : 날짜 포멧팅 코드
	 * @return String
	 */
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
	 * SimpleDateFormat 클래스를 이용하여 지정된 포맷으로 날짜를 변환
	 * @param dd : java.util.Date 날짜
	 * @param pattern : 변환 패턴 ex)"yyyyMMdd", "HHmm", "yyyy", "MM", "dd", "HH", "mm"
	 * @return
	 * @see java.util.SimpleDateFormat
	 */
	public static String getFormattedDate(java.util.Date dd, String pattern){
		SimpleDateFormat df1 = new SimpleDateFormat();
		df1.applyPattern(pattern);
		return df1.format(dd);
	}
	
	public static String getDateTime(String pattern) {
		return getFormattedDate(Calendar.getInstance().getTime(),pattern);
	}
	
	/**
	 *
	 * For example, String time = DateTime.getFormatString("yyyy-MM-dd HH:mm:ss");
	 *
	 * @param java.lang.String pattern  "yyyy, MM, dd, HH, mm, ss and more"
	 * @return formatted string representation of current day and time with  your pattern.
	 */
	public static int getNumberByPattern(String pattern) {
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat (pattern, java.util.Locale.KOREA);
		String dateString = formatter.format(new java.util.Date());
		//Date date1 = new Date();
		return Integer.parseInt(dateString);
		
	}
	
	/**
	* 현재날짜의 년도를 구하는 Method
	*
	* @param
	* @exception
	* @author
	*/
	public static int getYear() { return getNumberByPattern("yyyy"); }
	
	/**
	* 현재날짜의 월을 구하는 Method
	*
	* @param
	* @exception
	* @author
	*/
	public static int getMonth() { return getNumberByPattern("MM"); }

}
