package kr.co.knoc.banner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class BannerManager {
	public boolean insertBanner(BannerBean pb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from BANNER";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into BANNER "
				   + " (no, start_date, end_date, visibility, shownum, title, linkurl, linktype, filename, filesize, new_filename, alttext, regdate, page_lang) "
				   + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)"; 			
			System.out.println("insert into BANNER  (no, start_date, end_date, visibility, shownum, title, linkurl, linktype, filename, filesize, new_filename, alttext, regdate) "
				   + " values ("+no+", '"+pb.getStartDate()+"', '"+pb.getEndDate()+"', '"+pb.getVisibility()+"', "+pb.getShownum()+", '"+pb.getTitle()+"', '"+pb.getLinkUrl()+"', '"+pb.getLinkType()+"', '"+pb.getFilename()+"', "+pb.getFilesize()+", '"+pb.getNewFilename()+"', '"+pb.getAlttext()+"', sysdate, '" + pb.getPageLang() + "')");
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,pb.getStartDate());
			prestmt.setString(index++,pb.getEndDate());
			prestmt.setString(index++,pb.getVisibility());			
			prestmt.setInt(index++,pb.getShownum());
			prestmt.setString(index++,pb.getTitle());
			prestmt.setString(index++,pb.getLinkUrl());
			prestmt.setString(index++,pb.getLinkType());
			prestmt.setString(index++,pb.getFilename());
			prestmt.setInt(index++,pb.getFilesize());
			prestmt.setString(index++,pb.getNewFilename());
			prestmt.setString(index++,pb.getAlttext());
			prestmt.setString(index++,pb.getPageLang());
			
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
	
	public ArrayList<BannerBean> getBannerList(int page, int pageSize, String page_lang) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<BannerBean> result = new ArrayList<BannerBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
 		query.append("select * from ( ");
        query.append("select no, new_filename, title, start_date, end_date, alttext, regdate, ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO ");
        query.append(" from BANNER");
        query.append(" where page_lang = ? ");
        query.append(" order by no desc  ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, page_lang);
			prestmt.setInt(2, (page-1) * pageSize);
			prestmt.setInt(3, page*pageSize);
			
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				BannerBean pb = new BannerBean();
				pb.setNo(rs.getInt("no"));
				pb.setNewFilename(rs.getString("new_filename"));
				pb.setTitle(rs.getString("title"));
				pb.setStartDate(rs.getString("start_date"));
				pb.setEndDate(rs.getString("end_date"));
				pb.setAlttext(rs.getString("alttext"));
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
	
	public int getBannerListCount(String page_lang){
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from BANNER");
        query.append(" where page_lang = ?");
        
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setString(1, page_lang);
		    
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
	
	public BannerBean getBanner(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		BannerBean pb = new BannerBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select no, start_date, end_date, visibility, shownum, title, linkurl, linktype, filename, filesize, new_filename, alttext, regdate, page_lang from BANNER where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				pb.setNo(rs.getInt("no"));
				pb.setStartDate(rs.getString("start_date"));
				pb.setEndDate(rs.getString("end_date"));
				pb.setVisibility(rs.getString("visibility"));
				pb.setShownum(rs.getInt("shownum"));
				pb.setTitle(rs.getString("title"));
				pb.setLinkUrl(rs.getString("linkurl"));
				pb.setLinkType(rs.getString("linktype"));
				pb.setFilename(rs.getString("filename"));
				pb.setFilesize(rs.getInt("filesize"));
				pb.setNewFilename(rs.getString("new_filename"));
				pb.setAlttext(rs.getString("alttext"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));		
				pb.setPageLang(rs.getString("page_lang"));
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
	
	public boolean updateBanner(BannerBean pb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update BANNER set start_date=?, end_date=?, visibility=? ";
			sql += ", shownum=?, title=?, linkurl=?, linktype=?, filename=?, filesize=? ";
			sql += ", new_filename=?, alttext=?, page_lang=? where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,pb.getStartDate());
			prestmt.setString(index++,pb.getEndDate());			
			prestmt.setString(index++,pb.getVisibility());
			prestmt.setInt(index++,pb.getShownum());
			prestmt.setString(index++,pb.getTitle());
			prestmt.setString(index++,pb.getLinkUrl());
			prestmt.setString(index++,pb.getLinkType());
			prestmt.setString(index++,pb.getFilename());
			prestmt.setInt(index++,pb.getFilesize());
			prestmt.setString(index++,pb.getNewFilename());
			prestmt.setString(index++,pb.getAlttext());
			prestmt.setString(index++,pb.getPageLang());
			prestmt.setInt(index++,pb.getNo());
			
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
	
	public boolean deleteBanner(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from BANNER where no=?";
				   					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);				
			
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
	
	public ArrayList<BannerBean> getBanner(String page_lang) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		ArrayList<BannerBean> result = new ArrayList<BannerBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
        query.append("select no, new_filename, title, start_date, end_date, alttext, regdate, linkurl, linktype ");
        query.append(" from BANNER");
        query.append(" where page_lang = ? and visibility = 'Y' and start_date <= to_char(sysdate,'YYYYMMDD') and end_date >= to_char(sysdate,'YYYYMMDD')");
        query.append(" order by shownum, no asc");
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, page_lang);				
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BannerBean pb = new BannerBean();
				pb.setNo(rs.getInt("no"));
				pb.setNewFilename(rs.getString("new_filename"));
				pb.setTitle(rs.getString("title"));
				pb.setStartDate(rs.getString("start_date"));
				pb.setEndDate(rs.getString("end_date"));
				pb.setAlttext(rs.getString("alttext"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				pb.setLinkType(rs.getString("linktype"));
				pb.setLinkUrl(rs.getString("linkurl"));
				result.add(pb);
			}
			rs.close(); rs = null;
			pstmt.close(); pstmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (pstmt != null) pstmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }
}
