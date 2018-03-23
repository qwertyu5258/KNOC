package kr.co.knoc.term;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class WebzineManager {
	public boolean insertTerm(WebzineBean pb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int webjin_nid = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(webjin_nid) from WEB_ZIN";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				webjin_nid = rs.getInt(1) + 1;
			} else {
				webjin_nid = 1;
			}
			stmt.close();
			
			sql="insert into WEB_ZIN "
				   + " (webjin_nid, img_path, link_url, alt_name, update_date) "
				   + " values (?, ?, ?, ?, now())"; 			
			System.out.println("insert into WEB_ZIN (webjin_nid, img_path, link_url, alt_name, update_date) "
				   + " values ("+webjin_nid+", '"+pb.getImg_path()+"', '"+pb.getLink_url()+"', '"+pb.getAlt_name()+"', '"+"', now())");
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,webjin_nid);
			prestmt.setString(index++,pb.getImg_path());
			prestmt.setString(index++,pb.getLink_url());
			prestmt.setString(index++,pb.getAlt_name());			
		
			prestmt.executeUpdate();	
			prestmt.close();
			result = true;
		} catch (Exception e) {
		    e.printStackTrace();
		    result = false;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	
	
	public ArrayList<WebzineBean> getTermList(int page, int pageSize) throws Exception {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<WebzineBean> result = new ArrayList<WebzineBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
        query.append("select WEBJIN_NID, IMG_PATH, LINK_URL, ALT_NAME, UPDATE_DATE ");
        query.append(" from WEB_ZIN");
        
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());			
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				WebzineBean pb = new WebzineBean();
				pb.setWebjin_nid(rs.getInt("WEBJIN_NID"));
				pb.setImg_path(rs.getString("IMG_PATH")); 
				pb.setLink_url(rs.getString("LINK_URL"));
				pb.setAlt_name(rs.getString("ALT_NAME"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("UPDATE_DATE"));
				result.add(pb);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }
	
	
	public ArrayList<WebzineBean> getTermList2(int page, int pageSize) throws Exception {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<WebzineBean> result = new ArrayList<WebzineBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
        query.append("select WEBJIN_NID, IMG_PATH, LINK_URL, ALT_NAME, UPDATE_DATE ");
        query.append(" from MOBILE_WEB_ZIN");
        
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());			
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				WebzineBean pb = new WebzineBean();
				pb.setWebjin_nid(rs.getInt("WEBJIN_NID"));
				pb.setImg_path(rs.getString("IMG_PATH")); 
				pb.setLink_url(rs.getString("LINK_URL"));
				pb.setAlt_name(rs.getString("ALT_NAME"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("UPDATE_DATE"));
				result.add(pb);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }
	
	public int getTermListCount() {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from WEB_ZIN");
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
			rs = prestmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }
	
	public WebzineBean getWebzineBean(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		WebzineBean pb = new WebzineBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select WEBJIN_NID, IMG_PATH, LINK_URL, ALT_NAME, UPDATE_DATE from WEB_ZIN where WEBJIN_NID=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				pb.setWebjin_nid(rs.getInt("WEBJIN_NID"));
				pb.setImg_path(rs.getString("IMG_PATH"));
				pb.setLink_url(rs.getString("LINK_URL"));
				pb.setAlt_name(rs.getString("ALT_NAME"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("UPDATE_DATE"));				
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {
			    if (rs != null) rs.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return pb;
	}
	
	public WebzineBean getWebzineBean2(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		WebzineBean pb = new WebzineBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select WEBJIN_NID, IMG_PATH, LINK_URL, ALT_NAME, UPDATE_DATE, LINKTYPE from MOBILE_WEB_ZIN where WEBJIN_NID=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				pb.setWebjin_nid(rs.getInt("WEBJIN_NID"));
				pb.setImg_path(rs.getString("IMG_PATH"));
				pb.setLink_url(rs.getString("LINK_URL"));
				pb.setAlt_name(rs.getString("ALT_NAME"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("UPDATE_DATE"));		
				pb.setLinkType(rs.getString("LINKTYPE"));
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {
			    if (rs != null) rs.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return pb;
	}
	

	
	public boolean updateTerm(WebzineBean pb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update WEB_ZIN set IMG_PATH=?, LINK_URL=?, ALT_NAME=? ";
			sql += " where WEBJIN_NID=?";
				   
			
			String name = "";
			
			try{  name = new String(pb.getAlt_name().getBytes("8859_1"),"EUC-KR"); } catch (Exception e){ }
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,pb.getImg_path());
			prestmt.setString(index++,pb.getLink_url());
			prestmt.setString(index++,name );
			prestmt.setInt(index++,pb.getWebjin_nid());
			
			prestmt.executeUpdate();	
			prestmt.close();
			result = true;
		} catch (Exception e) {
		    e.printStackTrace();
		    result = false;
		} finally {
			try {
			    if (rs != null) rs.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public boolean updateTerm2(WebzineBean pb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update MOBILE_WEB_ZIN set IMG_PATH=?, LINK_URL=?, ALT_NAME=?, LINKTYPE = ? ";
			sql += " where WEBJIN_NID=?";
				   			
			String name = "";
			
			try{  name = new String(pb.getAlt_name().getBytes("8859_1"),"EUC-KR"); } catch (Exception e){ }
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,pb.getImg_path());
			prestmt.setString(index++,pb.getLink_url());
			prestmt.setString(index++,name );
			prestmt.setString(index++,pb.getLinkType() );
			prestmt.setInt(index++,pb.getWebjin_nid());
			
			prestmt.executeUpdate();	
			prestmt.close();
			result = true;
		} catch (Exception e) {
		    e.printStackTrace();
		    result = false;
		} finally {
			try {
			    if (rs != null) rs.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}

	
	public boolean deleteTerm(int webjin_nid){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from WEB_ZIN where webjin_nid=?";
				   					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,webjin_nid);				
			
			prestmt.executeUpdate();	
			prestmt.close();
			result = true;
		} catch (Exception e) {
		    e.printStackTrace();
		    result = false;
		} finally {
			try {
			    if (rs != null) rs.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public ArrayList<WebzineBean> getTerm() {
    	Connection con = null;
 		ResultSet rs = null;
 		Statement stmt = null;
 		ArrayList<WebzineBean> result = new ArrayList<WebzineBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
        query.append("select webjin_nid, img_path, link_url, alt_name, update_date ");
        query.append(" from WEB_ZIN");
        query.append(" where visibility = 'Y' and start_date <= date_format(now(),'%Y%m%d') and end_date >= date_format(now(),'%Y%m%d')");
        query.append(" order by shownum, webjin_nid asc");
		try {
			con = DBUtil.getConnection();
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query.toString());			
			while(rs.next()) {
				WebzineBean pb = new WebzineBean();
				pb.setWebjin_nid(rs.getInt("webjin_nid"));
				pb.setImg_path(rs.getString("img_path"));
				pb.setLink_url(rs.getString("link_url"));
				pb.setAlt_name(rs.getString("alt_name"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("update_date"));
				result.add(pb);
			}
			rs.close(); rs = null;
			stmt.close(); stmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }
	
	public ArrayList<WebzineBean> getSearchList(String word, String search, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		
 		
 		
 		String Where = "";
 	
 		if(word.equals("1")){ 
 			Where = " where  trim(KOREAN) >= '가' and trim(KOREAN) < '나' "; 
 		}else if(word.equals("2")){ 
 			Where = " where  trim(KOREAN) >= '나' and trim(KOREAN) < '다' "; 
 		}else if(word.equals("3")){ 
 			Where = " where  trim(KOREAN) >= '다' and trim(KOREAN) < '라' "; 
 		}else if(word.equals("4")){ 
 			Where = " where  trim(KOREAN) >= '라' and trim(KOREAN) < '마' "; 
 		}else if(word.equals("5")){ 
 			Where = " where  trim(KOREAN) >= '마' and trim(KOREAN) < '바' "; 
 		}else if(word.equals("6")){ 
 			Where = " where  trim(KOREAN) >= '바' and trim(KOREAN) < '사' "; 
 		}else if(word.equals("7")){ 
 			Where = " where  trim(KOREAN) >= '사' and trim(KOREAN) < '아' "; 
 		}else if(word.equals("8")){ 
 			Where = " where  trim(KOREAN) >= '아' and trim(KOREAN) < '자' "; 
 		}else if(word.equals("9")){ 
 			Where = " where  trim(KOREAN) >= '자' and trim(KOREAN) < '차' "; 
 		}else if(word.equals("10")){ 
 			Where = " where  trim(KOREAN) >= '차' and trim(KOREAN) < '카' "; 
 		}else if(word.equals("11")){ 
 			Where = " where  trim(KOREAN) >= '카' and trim(KOREAN) < '타'"; 
 		}else if(word.equals("12")){ 
 			Where = " where  trim(KOREAN) >= '타' and trim(KOREAN) < '파' "; 
 		}else if(word.equals("13")){ 
 			Where = " where  trim(KOREAN) >= '파' and trim(KOREAN) <'하'"; 
 		}else if(word.equals("14")){ 
 			Where = "where  trim(KOREAN) >= '하' "; 
 		}else if(word.equals("A")){ 
 			Where = "where  ENGLISH LIKE 'a%'";  			
 		}else if(word.equals("B")){ 
 			Where = "where  ENGLISH LIKE 'b%'";
 		}else if(word.equals("C")){ 
 			Where = "where  ENGLISH LIKE 'c%'";
 		}else if(word.equals("D")){ 
 			Where = "where  ENGLISH LIKE 'd%'";
 		}else if(word.equals("E")){ 
 			Where = "where  ENGLISH LIKE 'e%'";
 		}else if(word.equals("F")){ 
 			Where = "where  ENGLISH LIKE 'f%'";
 		}else if(word.equals("G")){ 
 			Where = "where  ENGLISH LIKE 'g%'";
 		}else if(word.equals("H")){ 
 			Where = "where  ENGLISH LIKE 'h%'";
 		}else if(word.equals("I")){ 
 			Where = "where  ENGLISH LIKE 'i%'";
 		}else if(word.equals("J")){ 
 			Where = "where  ENGLISH LIKE 'j%'";
 		}else if(word.equals("K")){ 
 			Where = "where  ENGLISH LIKE 'k%'";
 		}else if(word.equals("L")){ 
 			Where = "where  ENGLISH LIKE 'l%'";
 		}else if(word.equals("M")){ 
 			Where = "where  ENGLISH LIKE 'm%'";
 		}else if(word.equals("N")){ 
 			Where = "where  ENGLISH LIKE 'n%'";
 		}else if(word.equals("O")){ 
 			Where = "where  ENGLISH LIKE 'o%'";
 		}else if(word.equals("P")){ 
 			Where = "where  ENGLISH LIKE 'p%'";
 		}else if(word.equals("Q")){ 
 			Where = "where  ENGLISH LIKE 'q%'";
 		}else if(word.equals("R")){ 
 			Where = "where  ENGLISH LIKE 'r%'";
 		}else if(word.equals("S")){ 
 			Where = "where  ENGLISH LIKE 's%'";
 		}else if(word.equals("T")){ 
 			Where = "where  ENGLISH LIKE 't%'";
 		}else if(word.equals("U")){ 
 			Where = "where  ENGLISH LIKE 'u%'";
 		}else if(word.equals("V")){ 
 			Where = "where  ENGLISH LIKE 'v%'";
 		}else if(word.equals("W")){ 
 			Where = "where  ENGLISH LIKE 'w%'";
 		}else if(word.equals("X")){ 
 			Where = "where  ENGLISH LIKE 'x%'";
 		}else if(word.equals("Y")){ 
 			Where = "where  ENGLISH LIKE 'y%'";
 		}else if(word.equals("Z")){ 
 			Where = "where  ENGLISH LIKE 'z%'"; 			
 		}
 		
 		if(!search.equals("")){ 
  			Where = "where  KOREAN LIKE '%"+search+"%' or ENGLISH LIKE '%"+search+"%' or CHINESE LIKE '%"+search+"%' or CONTENT LIKE '%"+search+"%' "; 			
  		}

 		
 		
 		
 		ArrayList<WebzineBean> result = new ArrayList<WebzineBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
 		query.append("select * from ( ");
        query.append("select webjin_nid, img_path, link_url, alt_name, update_date , ROW_NUMBER() OVER(ORDER BY webjin_nid desc) AS PAGE_NO ");
        query.append(" from WEB_ZIN ");
        query.append(Where);
        //query.append(" order by webjin_nid asc limit ?, ?");
        query.append(" order by webjin_nid asc   ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
        
        //Logproc.LogWrite(query.toString());
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2,page* pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				WebzineBean pb = new WebzineBean();
				pb.setWebjin_nid(rs.getInt("webjin_nid"));
				pb.setImg_path(rs.getString("img_path"));
				pb.setLink_url(rs.getString("link_url"));
				pb.setAlt_name(rs.getString("alt_name"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(pb);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }	
	

	public int getSearchCount(String word , String search) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null; 		
 		

 		
 		String Where = "";
 	
 		if(word.equals("1")){ 
 			Where = " where  trim(KOREAN) >= '가' and trim(KOREAN) < '나' "; 
 		}else if(word.equals("2")){ 
 			Where = " where  trim(KOREAN) >= '나' and trim(KOREAN) < '다' "; 
 		}else if(word.equals("3")){ 
 			Where = " where  trim(KOREAN) >= '다' and trim(KOREAN) < '라' "; 
 		}else if(word.equals("4")){ 
 			Where = " where  trim(KOREAN) >= '라' and trim(KOREAN) < '마' "; 
 		}else if(word.equals("5")){ 
 			Where = " where  trim(KOREAN) >= '마' and trim(KOREAN) < '바' "; 
 		}else if(word.equals("6")){ 
 			Where = " where  trim(KOREAN) >= '바' and trim(KOREAN) < '사' "; 
 		}else if(word.equals("7")){ 
 			Where = " where  trim(KOREAN) >= '사' and trim(KOREAN) < '아' "; 
 		}else if(word.equals("8")){ 
 			Where = " where  trim(KOREAN) >= '아' and trim(KOREAN) < '자' "; 
 		}else if(word.equals("9")){ 
 			Where = " where  trim(KOREAN) >= '자' and trim(KOREAN) < '차' "; 
 		}else if(word.equals("10")){ 
 			Where = " where  trim(KOREAN) >= '차' and trim(KOREAN) < '카' "; 
 		}else if(word.equals("11")){ 
 			Where = " where  trim(KOREAN) >= '카' and trim(KOREAN) < '타'"; 
 		}else if(word.equals("12")){ 
 			Where = " where  trim(KOREAN) >= '타' and trim(KOREAN) < '파' "; 
 		}else if(word.equals("13")){ 
 			Where = " where  trim(KOREAN) >= '파' and trim(KOREAN) <'하'"; 
 		}else if(word.equals("14")){ 
 			Where = "where  trim(KOREAN) >= '하' "; 
 		}else if(word.equals("A")){ 
 			Where = "where  ENGLISH LIKE 'a%'";  			
 		}else if(word.equals("B")){ 
 			Where = "where  ENGLISH LIKE 'b%'";
 		}else if(word.equals("C")){ 
 			Where = "where  ENGLISH LIKE 'c%'";
 		}else if(word.equals("D")){ 
 			Where = "where  ENGLISH LIKE 'd%'";
 		}else if(word.equals("E")){ 
 			Where = "where  ENGLISH LIKE 'e%'";
 		}else if(word.equals("F")){ 
 			Where = "where  ENGLISH LIKE 'f%'";
 		}else if(word.equals("G")){ 
 			Where = "where  ENGLISH LIKE 'g%'";
 		}else if(word.equals("H")){ 
 			Where = "where  ENGLISH LIKE 'h%'";
 		}else if(word.equals("I")){ 
 			Where = "where  ENGLISH LIKE 'i%'";
 		}else if(word.equals("J")){ 
 			Where = "where  ENGLISH LIKE 'j%'";
 		}else if(word.equals("K")){ 
 			Where = "where  ENGLISH LIKE 'k%'";
 		}else if(word.equals("L")){ 
 			Where = "where  ENGLISH LIKE 'l%'";
 		}else if(word.equals("M")){ 
 			Where = "where  ENGLISH LIKE 'm%'";
 		}else if(word.equals("N")){ 
 			Where = "where  ENGLISH LIKE 'n%'";
 		}else if(word.equals("O")){ 
 			Where = "where  ENGLISH LIKE 'o%'";
 		}else if(word.equals("P")){ 
 			Where = "where  ENGLISH LIKE 'p%'";
 		}else if(word.equals("Q")){ 
 			Where = "where  ENGLISH LIKE 'q%'";
 		}else if(word.equals("R")){ 
 			Where = "where  ENGLISH LIKE 'r%'";
 		}else if(word.equals("S")){ 
 			Where = "where  ENGLISH LIKE 's%'";
 		}else if(word.equals("T")){ 
 			Where = "where  ENGLISH LIKE 't%'";
 		}else if(word.equals("U")){ 
 			Where = "where  ENGLISH LIKE 'u%'";
 		}else if(word.equals("V")){ 
 			Where = "where  ENGLISH LIKE 'v%'";
 		}else if(word.equals("W")){ 
 			Where = "where  ENGLISH LIKE 'w%'";
 		}else if(word.equals("X")){ 
 			Where = "where  ENGLISH LIKE 'x%'";
 		}else if(word.equals("Y")){ 
 			Where = "where  ENGLISH LIKE 'y%'";
 		}else if(word.equals("Z")){ 
 			Where = "where  ENGLISH LIKE 'z%'"; 			
 		}
 		
 		if(!search.equals("")){ 
  			Where = "where  KOREAN LIKE '%"+search+"%' or ENGLISH LIKE '%"+search+"%' or CHINESE LIKE '%"+search+"%' or CONTENT LIKE '%"+search+"%' "; 			
  		}
 			 
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from WEB_ZIN ");
        query.append(Where);
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
			rs = prestmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }	
}
