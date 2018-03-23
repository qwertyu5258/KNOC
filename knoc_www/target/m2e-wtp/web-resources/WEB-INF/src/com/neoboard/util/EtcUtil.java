package com.neoboard.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.StringTokenizer;
import java.net.*;
import java.io.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class EtcUtil {

	/* 운영 */
	/*
	public static final String DOMAIN_URL = "http://www.knoc.co.kr";
	public static final String DOMAIN_NAME = "knoc.co.kr";
	public static final String SSL_DOMAIN_URL = "https://www.knoc.co.kr";
	*/
  
	/* 개발 */     
	public static final String DOMAIN_URL = "http://localhost:8080";
	public static final String DOMAIN_NAME = "http://localhost:8080";
	public static final String SSL_DOMAIN_URL = "http://localhost:8080";


	/**
	 * 파일 카피
	 * @param in
	 * @param out
	 * @throws Exception
	 */
	public static void copyFile(File in, File out) throws Exception {
		FileInputStream fis  = null;
	    FileOutputStream fos = null;
	    try {
			fis  = new FileInputStream(in);
		    fos = new FileOutputStream(out);
		    byte[] buf = new byte[1024];
		    int i = 0;
		    while((i=fis.read(buf))!=-1) {
		    	fos.write(buf, 0, i);
		    	}
		    fis.close();
		    fos.close();
	    }catch(Exception e) {
	    	throw new Exception(e);
	    }finally{
	    	try { fis.close(); } catch(Exception e) {}
	    	try { fos.close(); } catch(Exception e) {}
	    }
	}
	//**********************************************************************************************************//
	// NULL 체킹
	//**********************************************************************************************************//
	public static String checkNull(String s)
    {
        if(s == null)
            s = "";
        return s;
    }

	//**********************************************************************************************************//
	// SQL-Injection 필터링
	//**********************************************************************************************************//
	public static String InjectionDefender(String sql_str){
		String str = "";

		if (sql_str != null && !sql_str.equals("")) {
			str = sql_str;
			str = str.trim();

			str = str.replace("'","''");
			str = str.replace(";","");
			str = str.replace("--","");
			str = str.replace("@variable ","");
			str = str.replace("@@variable ","");
			str = str.replace("+","");
			str = str.replace("print ","");
			str = str.replace("set ","");
			str = str.replace("%","");
			str = str.replace("union ","");
			str = str.replace("insert ","");
			str = str.replace("select ","");
			str = str.replace("update ","");
			str = str.replace("create ","");
			str = str.replace("drop ","");
			str = str.replace("openrowset ","");
			str = str.replace("exec ","");
		}

		return str;
	}

	public static String nullNo(int no){
		return no==0? "": Integer.toString(no);
	}
	//**********************************************************************************************************//
	// XSSScript, SQL-Injection 필터링
	//**********************************************************************************************************//
	public static String strBlockSpecialTags(String source){
		String str = "";

		if (source != null && !source.equals("")) {
			str = source;
			//str = str.toLowerCase();
			str = str.trim();

			str = str.replace("script:", "script :");
			str = str.replace("cookie", "cook!e");
			str = str.replace("document.", "d0cument.");
			str = str.replace("iframe", "1frame");
			str = str.replace("'", "&acute;");
			str = str.replace("<", "&lt");
			str = str.replace(">", "&gt");
			//str = str.replace("(", "&#40");
			//str = str.replace(")", "&#41");
			str = str.replace("#", "&#35");
			str = str.replace("&", "&#38");
		}
		//try{		str = new String(str.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
		return str;
	}

	public static String strBlockSpecialTags2(String source){
		String str = "";

		if (source != null && !source.equals("")) {
			str = source;
			//str = str.toLowerCase();
			str = str.trim();

			str = str.replace("script:", "script :");
			str = str.replace("cookie", "cook!e");
			str = str.replace("document.", "d0cument.");
			str = str.replace("iframe", "1frame");
			str = str.replace("'", "&acute;");
			str = str.replace("<", "&lt");
			str = str.replace(">", "&gt");
			//str = str.replace("(", "&#40");
			//str = str.replace(")", "&#41");
			str = str.replace("#", "&#35");
			//str = str.replace("&", "&#38");
		}
		//try{		str = new String(str.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
		return str;
	}
	public static String strBlockSpecialTags(String source, String enc){
		String str = "";

		if (source != null && !source.equals("")) {
			str = source;
			//str = str.toLowerCase();
			str = str.trim();

			str = str.replace("script:", "script :");
			str = str.replace("cookie", "cook!e");
			str = str.replace("document.", "d0cument.");
			str = str.replace("iframe", "1frame");
			str = str.replace("'", "&acute;");
			str = str.replace("<", "&lt");
			str = str.replace(">", "&gt");
			//str = str.replace("(", "&#40");
			//str = str.replace(")", "&#41");
			str = str.replace("#", "&#35");
			str = str.replace("&", "&#38");
		}
		try{		str = new String(str.getBytes(enc),"EUC-KR"); } catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		return str;
	}

	public void setCookie(HttpServletResponse httpservletresponse, String s, String s1, String domain)
    {
        Cookie cookie = new Cookie(s, s1);
        cookie.setPath("/");
        cookie.setDomain(domain);
        cookie.setMaxAge(3600);
        httpservletresponse.addCookie(cookie);
    }

	public void setCookie(HttpServletResponse httpservletresponse, String s, String s1, int i, String domain)
    {
        Cookie cookie = new Cookie(s, s1);
        cookie.setPath("/");
        cookie.setDomain(domain);
        cookie.setMaxAge(i);
        httpservletresponse.addCookie(cookie);
    }

	//**********************************************************************************************************//
	// 이름변환
	//**********************************************************************************************************//
	public String changeName(String name)
    {
		String re_name = "";
		if (name != null && !name.equals("")) {
			re_name = name.substring(0,1);
			for (int n=1; n < name.length(); n++) {
				re_name = re_name + "*";
			}
		}
        return re_name;
    }

	public static int checkNullInt(String s, int i)
    {
        int j = 0;
        if(s == null || s.equals(""))
            j = i;
        else
            try
            {
                j = Integer.parseInt(s);
            }
            catch(NumberFormatException numberformatexception)
            {
                numberformatexception.printStackTrace(System.err);
            }
        return j;
    }

	//050718 파라미터 버퍼 오버 플로우 차단위해 추가
	public String replace_pro(String s)
	{
			s=replace_10(s);
			s=replace_1(s);
			s=replace_2(s);
			s=replace_3(s);
			s=replace_4(s);
			s=replace_5(s);
			s=replace_6(s);
			s=replace_7(s);
			s=replace_8(s);
			s=replace_9(s);
			s=replace_11(s);

	 return s;
	}


	 public String replace_1(String s)
	{
	  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == '<')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == '<')
	           stringbuffer.append("&lt;");
	       else
	           stringbuffer.append(s.charAt(l));
			}
	   return stringbuffer.toString();
	}

	public String replace_2(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == '>')
	           j++;
			}

	  StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == '>')
	           stringbuffer.append("&gt;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	public String replace_3(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == '(')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == '(')
	           stringbuffer.append("&#40;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	public String replace_4(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == ')')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == ')')
	           stringbuffer.append("&#41;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	public String replace_5(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == '\"')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == '\"')
	           stringbuffer.append("&quot;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	public String replace_6(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == '\\')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == '\\')
	           stringbuffer.append("&#92;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	public String replace_7(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == '%')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == '%')
	           stringbuffer.append("&#37;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	public String replace_8(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == '=')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == '=')
	           stringbuffer.append("&#61;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	public String replace_9(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == '-')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == '-')
	           stringbuffer.append("&#45;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	public String replace_10(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == ';')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == ';')
	           stringbuffer.append("&#59;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	public String replace_11(String s)
	{
		  int i = s.length();
	   int j = 0;
	   boolean flag = false;
	   for(int k = 0; k < i; k++){
	       if(s.charAt(k) == '\'')
	           j++;
			}

	   StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	   for(int l = 0; l < i; l++){
	       if(s.charAt(l) == '\'')
	           stringbuffer.append("&#39;");
	       else
	           stringbuffer.append(s.charAt(l));
			}

	   return stringbuffer.toString();
	}

	// 글내용 엔터변환
	public String replaceCL(String s)
    {
		if (s != null && !s.equals("")) {
	        int i = s.length();
	        int j = 0;
	        boolean flag = false;
	        for(int k = 0; k < i; k++)
	            if(s.charAt(k) == '\n')
	                j++;

	        StringBuffer stringbuffer = new StringBuffer(i + j * 3);
	        for(int l = 0; l < i; l++)
	            if(s.charAt(l) == '\n')
	                stringbuffer.append("<br>");
	            else
	                stringbuffer.append(s.charAt(l));

        	return stringbuffer.toString();
		} else {
			return "";
		}
    }

	// 디렉토리 생성
    public void u_dircreate(String dir) {
          File f = new File(dir);
          f.mkdir();
    }

    public String NullToZero(String s)
    {
        if(s == null || s.equals(""))
            s = "0";
        return s;
    }

    public static String checkNullString(String s, String s1)
    {
        if(s == null || s.equals(""))
            s = s1;
        return s;
    }

    public static String changeHTMLOneLine(String s)
    {
        StringBuffer stringbuffer = new StringBuffer();
        for(int i = 0; i < s.length(); i++)
            if(s.charAt(i) == '\n')
                stringbuffer.append("<br>");
            else
            if(s.charAt(i) == '\r')
                stringbuffer.append("");
            else
                stringbuffer.append(s.charAt(i));

        return stringbuffer.toString();
    }

    public String getReplace(String s, String s1)
	    throws IOException
	{
    	System.out.println("test");
	    String s2 = "";
	    for(StringTokenizer stringtokenizer = new StringTokenizer(s, s1); stringtokenizer.hasMoreTokens();)
	        s2 = s2 + stringtokenizer.nextToken();

	    return s2;
	}

    /**
     * 지정한 파일 경로 구하기
     * @param name
     * @return
     */
    public File getFile(String name) {
    	ClassLoader loader = Thread.currentThread().getContextClassLoader();
    	File mapLoader = new File(loader.getResource(name).getFile());
    	String classPath = mapLoader.getParent();
    	return new File(loader.getResource(name).getFile());
	}

    /**
     * 루트경로 구하기
     * @param name
     * @return
     */
    public String getRoot(String name) {
    	ClassLoader loader = Thread.currentThread().getContextClassLoader();
    	File mapLoader = new File(loader.getResource(name).getFile());
    	String classPath = mapLoader.getParent();
    	// WEB-INF 폴더명의 위치를 알아낸다
    	int positionNo = classPath.indexOf("WEB-INF");
    	return classPath.substring(0, positionNo);
	}



}