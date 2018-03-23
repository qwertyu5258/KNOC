package com.neoboard.rss;

import java.io.*;
import java.text.*;
import java.util.*;
import java.util.Date;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.*;

/**
 *	각 subsystem 별로 일정한 header와 footer HTML을
 *	제공함으로써 일관된 인터페이스를 가능하게 한다.
 *
 */
 
public class CommonUtil {
  public static String decodeXML(String sData){
    String[] before= {"&amp;", "&quot;", "&apos;", "&lt;", "&gt;"};
    String[] after = {"&", "\"", "\'", "<", ">"};

    if(sData != null){
      for(int i = 0; i<before.length; i++){
        sData = replace(sData, before[i], after[i]);
      }
    }else{ 
      sData = " ";
    }
    return sData;
  }
  public static String decodeXMLPart(String sData){
    String[] before= {"&amp;", "&quot;", "&apos;"};
    String[] after = {"&", "\"", "\'"};

    if(sData != null){
      for(int i = 0; i<before.length; i++){
        sData = replace(sData, before[i], after[i]);
      }
    }else{ 
      sData = " ";
    }
    return sData;
  }
  public static String dencodeXML(String sData){
    String[] before= {"&amp;", "&quot;", "&apos;","<", ">"};
    String[] after = {"&", "\"", "\'","&lt;", "&gt;"};

    if(sData != null){
      for(int i = 0; i<before.length; i++){
        sData = replace(sData, before[i], after[i]);
      }
    }else{ 
      sData = " ";
    }
    return sData;
  }
  public static String encodeXML(String sData){
    String[] before = {"&", "\"", "\'", "<", ">"};
    String[] after = {"&amp;", "&quot;", "&apos;", "&lt;", "&gt;"};

    if(sData != null){
      for(int i = 0; i<before.length; i++){
        sData = replace(sData, before[i], after[i]);
      }
    }else{ 
      sData = " ";
    }
    return sData;
  }
  public static String encodeXMLPart(String sData){
    String[] before = {"&", "\"", "\'"};
    String[] after = {"&amp;", "&quot;", "&apos;"};

    if(sData != null){
      for(int i = 0; i<before.length; i++){
        sData = replace(sData, before[i], after[i]);
      }
    }else{ 
      sData = " ";
    }
    return sData;
  }
  public static String quotEncoding(String sData){
    String[] before = {"\""};
    String[] after = {"\\\""};

    if(sData != null){
      for(int i = 0; i<before.length; i++){
        sData = replace(sData, before[i], after[i]);
      }
    }else{ 
      sData = " ";
    }
    return sData;
  }
  public static char[] readerToChar(Reader reader){
    CharArrayWriter charArrayOut = new CharArrayWriter();
    char[] buffer = new char[256];
    int numberRead;
    
    try{
      while ((numberRead = reader.read(buffer)) > -1){
        charArrayOut.write (buffer, 0, numberRead);
      }//end while
    }catch(IOException e){
      System.out.println("IOException is created : " + e.getMessage());
    }catch(Exception e){
       System.out.println("IOException is created : " + e.getMessage());
    }
    
    char[] result = charArrayOut.toCharArray() ;
    charArrayOut.close();     
    return result;
  }
  public static String readerToString(Reader reader){
    CharArrayWriter charArrayOut = new CharArrayWriter();
    char[] buffer = new char[256];
    int numberRead;
    
    try{
      while ((numberRead = reader.read(buffer)) > -1){
        charArrayOut.write (buffer, 0, numberRead);
      }//end while
    }catch(IOException e){
      System.out.println("IOException is created : " + e.getMessage());
    }catch(Exception e){
       System.out.println("IOException is created : " + e.getMessage());
    }
    
    String result = charArrayOut.toString();
    charArrayOut.close();     
    return result;
  }
  
  public static String replace(String content, String oldWord, String newWord){
    int position = content.indexOf(oldWord);

    while(position > -1){
      content = content.substring(0, position) + newWord + content.substring(position + oldWord.length());
      position = content.indexOf(oldWord, position + newWord.length());
    }

    return content;
  }

public static String wwwlink(String str) {
	if (str==null) return "";
	
	String tmp = str;
	int itmp = 0;
	int wend = 0;

	StringBuffer sb = new StringBuffer();
	sb.append("");
	
	while(tmp.indexOf("http://")>-1) {
		itmp = tmp.indexOf("http://");
		wend = tmp.indexOf(" ",itmp);
		if (wend>tmp.indexOf(")",itmp) && tmp.indexOf(")",itmp)>-1) wend = tmp.indexOf(")",itmp);
		if (wend>tmp.indexOf("<",itmp) && tmp.indexOf("<",itmp)>-1) wend = tmp.indexOf("<",itmp);
		if (wend==-1) wend = tmp.length();
		sb.append(tmp.substring(0,itmp));
	
		if(itmp>3 && tmp.substring(itmp-3,itmp).indexOf("=")>-1) {
		wend = tmp.indexOf("</a>",itmp)+3;
		if (wend==2) wend = tmp.indexOf(">",itmp);
		sb.append(tmp.substring(itmp,wend));
		} else {
		sb.append("<a href=\""+tmp.substring(itmp,wend)+"\" >");
		sb.append(tmp.substring(itmp,wend));
		sb.append("</a>");
		}
	
		tmp=tmp.substring(wend);
	}
	sb.append(tmp);
	
	tmp = sb.toString();
	sb.setLength(0);

	while(tmp.indexOf("www.")>-1) {
		itmp = tmp.indexOf("www.");
		wend = tmp.indexOf(" ",itmp);
		if (wend>tmp.indexOf(")",itmp) && tmp.indexOf(")",itmp)>-1) wend = tmp.indexOf(")",itmp);
		if (wend>tmp.indexOf("<",itmp) && tmp.indexOf("<",itmp)>-1) wend = tmp.indexOf("<",itmp);
		if (wend==-1) wend = tmp.length();
		sb.append(tmp.substring(0,itmp));
		if(itmp>10 && tmp.substring(itmp-10,itmp).indexOf("=")>-1) {
		wend = tmp.indexOf("</a>",itmp)+3;
		if (wend==2) wend = tmp.indexOf(">",itmp);
		sb.append(tmp.substring(itmp,wend));
		} else {
		sb.append("<a href=\"http://"+tmp.substring(itmp,wend)+"\" >");
		sb.append(tmp.substring(itmp,wend));
		sb.append("</a>");

		}
	
		tmp=tmp.substring(wend);
	}
	sb.append(tmp);

	return sb.toString();
}

public static String rplc(String str, String n1, String n2) {
	int itmp = 0;
	if (str==null) return "";
	
	String tmp = str;
	StringBuffer sb = new StringBuffer();
	sb.append("");
	while (tmp.indexOf(n1)>-1) {
		itmp = tmp.indexOf(n1);
		sb.append(tmp.substring(0,itmp));
		sb.append(n2);
		tmp = tmp.substring(itmp+n1.length());
	}
	sb.append(tmp);
	return sb.toString();
}

	public static String ascToksc(String str)
        throws UnsupportedEncodingException
	{
		if(str==null || str =="")
			return null;
		//character의 코드를 바꾸어준다.	
		return new String(str.getBytes("8859_1"),"KSC5601");
	}

	public static String ascToksc(String str, boolean isEncode)
        throws UnsupportedEncodingException
	{
		String result = str;
		if(result==null || result =="")
			return null;
		//character의 코드를 바꾸어준다.
		if (isEncode) {
			result = encodeXML(result);
		}
		return new String(result.getBytes("8859_1"),"KSC5601");
	}
	
	public static String kscToasc(String str)
        throws UnsupportedEncodingException
	{
		if(str==null || str =="")
			return null;
		//character의 코드를 바꾸어준다.
		return new String(str.getBytes("KSC5601"),"8859_1");
	}	
}