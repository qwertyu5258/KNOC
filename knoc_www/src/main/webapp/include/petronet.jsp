<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.net.*"%>
<%@ page import = "java.io.*"%>    
<%
	String path = "http://www.petronet.co.kr/KNOC/KNOC_home.jsp";
	URL testUrl = new URL ( path ) ; 
	URLConnection uc = testUrl.openConnection (  ) ; 
	if  ( uc == null )   {  
		throw new Exception ( "Got a null URLConnection object!" ) ; 
	}  
	InputStream is = uc.getInputStream (  ) ; 
	if  ( is == null )   {  
		throw new Exception ( "Got a null content object!" ) ; 
	}  
	StringBuffer putBackTogether = new StringBuffer (  ) ; 
	Reader r = new InputStreamReader ( is, "euc-kr" ) ; 
	char [  ]  cb = new char [ 2048 ] ; 
	
	
	int amtRead = r.read ( cb ) ; 
	while  ( amtRead  >  0 )   {  
		putBackTogether.append ( cb, 0, amtRead ) ; 
		amtRead = r.read ( cb ) ; 
	}  
	String pageSource = putBackTogether.toString (  ) ;

	out.println(pageSource);
	
%>