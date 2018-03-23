package com.neoboard.tags;

import java.io.*;
import java.text.*;
import java.sql.*;
import java.util.*;

public class JUtil {
/////////////////////////////////////////////////////////////////////////////////
	// 현재 작업중인 시스템이 Test서버인지 Real서버인지 구별해서
	// 빈파일의 위치를 알려줌
	/////////////////////////////////////////////////////////////////////////////////
	public static String getBeanDir(){
		String sPath = new File("").getAbsolutePath();
		if(sPath.startsWith("/wasT"))
			return "/web-root/welfare/";
		else
			return "/web-root/welfare/";
	}


	//**********************************************************************************************************//
	// 로그 파일 작성
	//**********************************************************************************************************//
	public static void log(String s) throws Exception{
		//log(getCurrentDateFormat(3) + " \t" + s, getBeanDir() + "/usr/local/tomcat/webapps/logs/gj_session.log");
	}

	public static void log(String s, String logFile) throws Exception{
		PrintWriter pw = null;
		try{
			pw = new PrintWriter(new FileWriter(logFile, true), true);
			pw.println(s);
			pw.flush();
		}finally{
			if(pw != null){
				try{
					pw.close();
				}catch(Exception e){}
			}
		}
	}

	//**********************************************************************************************************//
	// 영어 ==> 한글 변환
	//**********************************************************************************************************//
	public static String e2h(String str){
		String dum = null;
		if(str == null)
			throw new NullPointerException("Parameter is Null");
		try{
			dum = new String(str.getBytes("ISO8859-1"), "ksc5601");
		}catch(java.io.UnsupportedEncodingException ue){
			throw new RuntimeException(ue.getMessage());
		}
		return dum;
	}

	//**********************************************************************************************************//
	// 한글 ==> 영어 변환
	//**********************************************************************************************************//
	public static String h2e(String str){
		String dum = null;
		if(str == null)
			throw new NullPointerException("Parameter is Null");
		try{
			dum = new String(str.getBytes("ksc5601"), "ISO8859-1");
		}catch(java.io.UnsupportedEncodingException ue){
			throw new RuntimeException(ue.getMessage());
		}
		return dum;
	}

	//**********************************************************************************************************//
	// 8859_1 ==> KSC5601
	//**********************************************************************************************************//
	public static String ascTouni(String str){
		try{
			return new String(str.getBytes("8859_1"), "KSC5601");
		}catch(UnsupportedEncodingException e){	return str;	}
	}

	//**********************************************************************************************************//
	// 지정된 위치에서 반올림 해주는 메서드
	//**********************************************************************************************************//
	public static double round(double dValue, int sca){
		try{
			return new java.math.BigDecimal(dValue).setScale(sca, java.math.BigDecimal.ROUND_HALF_EVEN).doubleValue();
		}catch(Exception e){ return dValue; }
	}

	//**********************************************************************************************************//
	// 지정된 위치에서 올림 해주는 메서드
	//**********************************************************************************************************//
	public static double roundUp(double dValue, int sca){
		try{
			return new java.math.BigDecimal(dValue).setScale(sca, java.math.BigDecimal.ROUND_UP).doubleValue();
		}catch(Exception e){ return dValue; }
	}

	//**********************************************************************************************************//
	// 지정된 위치에서 버림 해주는 메서드
	//**********************************************************************************************************//
	public static double roundDown(double dValue, int sca){
		try{
			return new java.math.BigDecimal(dValue).setScale(sca, java.math.BigDecimal.ROUND_DOWN).doubleValue();
		}catch(Exception e){ return dValue; }
	}

	//**********************************************************************************************************//
	// 현재 날짜와 시간 을 포멧에 맞게 가져옴
	//**********************************************************************************************************//
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

	public static int[] getCurrentDateHour(){
		int[] dh = new int[2];
		dh[0] = Integer.parseInt(getCurrentDateForm("yyyyMMdd"));
		dh[1] = Integer.parseInt(getCurrentDateForm("HHmm"));
		return dh;
	}

	//**********************************************************************************************************//
	// 현재 날짜와 시간 을 포멧에 맞게 가져옴
	//	@param	pattern		ex)"yyyyMMdd", "HHmm", "yyyy", "MM", "dd", "HH", "mm"
	//**********************************************************************************************************//
	public static String getCurrentDateForm(String pattern){
		SimpleDateFormat df1 = new SimpleDateFormat();
		java.util.Date date = new java.util.Date();
		df1.applyPattern(pattern);
		return df1.format(date);
	}

	//**********************************************************************************************************//
	// JSP 일괄 리로드
	//**********************************************************************************************************//
	public int reloadJSP(String jspPath, String currentIP){
		String fKey = ".JSP";
		String root = jspPath;
		String separator = System.getProperty("file.separator");
		long curTime = new java.util.Date().getTime();
		int cnt = 0;

		if(!root.endsWith(separator)) root.concat(separator);

		Vector dirs = new Vector();
		dirs.add(root);
		File f;
		int i;
		String[] filelist;
		while(dirs.size() != 0){
			f = new File(root = (String)dirs.remove(0));
			filelist = f.list();
			if(filelist == null)
				continue;
			for(i = filelist.length-1; i >= 0; i--){
				f = new File(root, filelist[i]);
				if(f.isDirectory()){
					dirs.add(root + separator + filelist[i]);
				}else{
					if(filelist[i].toUpperCase().endsWith(fKey)){
						f.setLastModified(curTime);
						cnt++;
					}
				}
			}
		}
		System.out.println(JUtil.getCurrentDateFormat(3) + "\t" + currentIP + "\t" + jspPath + "\t" + cnt + " JSP FILES RELOADED");
		return cnt;
	}

	
	
	
	public static String codeConvert(String str, String chrset) {
		if(str  ==  null) return null;
		if(chrset == null) return null;
		
		String result   =  str;
		byte[] rawBytes =  null;

		try {
				rawBytes  =  str.getBytes("8859_1");
				result  =  new String(rawBytes , chrset);
		} catch(java.io.UnsupportedEncodingException e ) {

		}
		return result;
	}
	
	//**********************************************************************************************************//
	// XSSScript, SQL-Injection 필터링
	//**********************************************************************************************************//
	public static String strBlockSpecialTags(String source){
		String str = "";
				
		if (source != null && !source.equals("")) {
			str = source;
			str = str.toLowerCase();
			str = str.trim();
			str = str.replace("<html", "<hHTML");
			str = str.replace("</html", "</hHTML");
			str = str.replace("<meta", "<hMETA");
			str = str.replace("<link", "<hLink");
			str = str.replace("<head", "<hHEAD");
			str = str.replace("</head", "</hHEAD");
			str = str.replace("<body", "<hBODY");
			str = str.replace("</body", "</hBODY");
			str = str.replace("<form", "<hFORM");
			str = str.replace("</form", "</hFORM");
			str = str.replace("<script", "<hSCRIPT");
			str = str.replace("</script", "</hSCRIPT");
			str = str.replace("<style", "<hSTYLE");
			str = str.replace("</style", "</hSTYLE");
			str = str.replace("script:", "script :");
			str = str.replace("cookie", "cook!e");
			str = str.replace("document.", "d0cument.");
			str = str.replace("iframe", "1frame");
			str = str.replace("'", "&acute;");
			str = str.replace("<", "&lt");
			str = str.replace(">", "&gt");
			str = str.replace("(", "&#40");
			str = str.replace(")", "&#41");
			str = str.replace("#", "&#35");
			str = str.replace("&", "&#38");
		}
		
		return str;
	}
}