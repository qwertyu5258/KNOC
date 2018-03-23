<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import = "java.net.*"%>
<%@ page import = "java.io.*"%>

    
<%!
	public HashMap<String, String> getPetronetEngNewsFromDB(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		HashMap<String, String> hashMap = new HashMap<String,String>();
		
		try{
			con = DBUtil.getConnection();		
			stmt = con.createStatement();
			rs = stmt.executeQuery(" SELECT CONTENTS, ACCESS_DATE FROM PETRONET_ENG_NEWS ");
			
			if(rs.next()){
				hashMap.put("contents", rs.getString("CONTENTS"));
				hashMap.put("access_date", rs.getString("ACCESS_DATE"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return hashMap;
	}

	public void updatePetronetEngNewsAccessDate(){
		Connection con = null;
		Statement stmt = null;
		try{
			con = DBUtil.getConnection();		
			stmt = con.createStatement();
			stmt.executeUpdate(" UPDATE PETRONET_ENG_NEWS SET ACCESS_DATE = TO_CHAR(SYSDATE, 'YYYYMMDD') ");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	public void updatePetronetEngNews(String contents){
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			/**
			 * 2016.3.21 JSM
			 * 보안약점 조치
			 */
			if(contents == null){contents = "";}
			con = DBUtil.getConnection();		
			pstmt = con.prepareStatement(" UPDATE PETRONET_ENG_NEWS SET CONTENTS = ?, ACCESS_DATE = TO_CHAR(SYSDATE, 'YYYYMMDD') ");
			pstmt.setString(1, contents);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	public String getPetronetEngNewsFromPetronet(){
		String contents = "";
		
		try{
			String news_path = "http://www.petronet.co.kr/KNOC/KNOC_eng_news.jsp";
			URL newsUrl = new URL(news_path); 
			URLConnection news_uc = newsUrl.openConnection(); 
			if(news_uc == null) throw new Exception("Got a null URLConnection object!"); 
			
			InputStream news_is = news_uc.getInputStream(); 
			if(news_is == null) throw new Exception ( "Got a null content object!" ) ; 
			 
			StringBuffer nputBackTogether = new StringBuffer(); 
			Reader nr = new InputStreamReader(news_is, "euc-kr"); 
			char[] ncb = new char[2048]; 
			
			try{
				int namtRead = nr.read(ncb); 
				while(namtRead > 0){  
					nputBackTogether.append(ncb, 0, namtRead); 
					namtRead = nr.read(ncb); 
				}  
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(nr != null){
					nr.close();
					nr = null;
				}
				if(news_is != null){
					news_is.close();
					news_is=null;
				}
			}
			
			contents = nputBackTogether.toString();
			
		}catch(Exception e){
			e.printStackTrace();
		}

		return contents;
	}
%>

<%
	SimpleDateFormat pSdf = new SimpleDateFormat("yyyyMMdd");
	String pToday = pSdf.format(new Date());

	HashMap<String, String> newsMap = getPetronetEngNewsFromDB();
	
	String contents = newsMap.get("contents");
	
	if(!pToday.equals(newsMap.get("access_date"))){
		updatePetronetEngNewsAccessDate(); // ACCESS_DATE 갱신(아래에서 컨텐츠를 불러오지 못하더라도 재 호출 방지)
		contents = getPetronetEngNewsFromPetronet();
		if(contents != null && contents.length() > 0){
			updatePetronetEngNews(contents);
		}
	}

	out.println(contents);
%>