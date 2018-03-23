package kr.co.knoc.popup;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class PopupManager {
	public boolean insertPopup(PopupBean pb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from POPUP";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into POPUP "
				   + " (no, start_date, end_date, visibility, shownum, title, linkurl, linktype, filename, filesize, new_filename, alttext, regdate) "
				   + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)"; 			
			System.out.println("insert into POPUP  (no, start_date, end_date, visibility, shownum, title, linkurl, linktype, filename, filesize, new_filename, alttext, regdate) "
				   + " values ("+no+", '"+pb.getStartDate()+"', '"+pb.getEndDate()+"', '"+pb.getVisibility()+"', "+pb.getShownum()+", '"+pb.getTitle()+"', '"+pb.getLinkUrl()+"', '"+pb.getLinkType()+"', '"+pb.getFilename()+"', "+pb.getFilesize()+", '"+pb.getNewFilename()+"', '"+pb.getAlttext()+"', sysdate)");
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
	
	public ArrayList<PopupBean> getPopupList(int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<PopupBean> result = new ArrayList<PopupBean>(); 		
 		StringBuffer query = new StringBuffer(); 	
 		query.append("select * from ( ");
        query.append("select no, new_filename, title, start_date, end_date, alttext, regdate , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO ");
        query.append(" from POPUP");
        //query.append(" order by no desc limit ?, ?");
        query.append(" order by no desc  ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2, page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				PopupBean pb = new PopupBean();
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
	
	public int getPopupListCount() {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from POPUP");
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
	
	public PopupBean getPopup(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		PopupBean pb = new PopupBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select no, start_date, end_date, visibility, shownum, title, linkurl, linktype, filename, filesize, new_filename, alttext, regdate from POPUP where no=?";
				   				
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
	
	public boolean updatePopup(PopupBean pb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update POPUP set start_date=?, end_date=?, visibility=? ";
			sql += ", shownum=?, title=?, linkurl=?, linktype=?, filename=?, filesize=? ";
			sql += ", new_filename=?, alttext=? where no=?";
				   
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
	
	public boolean deletePopup(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from POPUP where no=?";
				   					
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
	
	public ArrayList<PopupBean> getPopup() {
    	Connection con = null;
 		ResultSet rs = null;
 		Statement stmt = null;
 		ArrayList<PopupBean> result = new ArrayList<PopupBean>(); 		
 		StringBuffer query = new StringBuffer(); 	
 		/*
        query.append("select no, title, linkurl, linktype, filename, filesize, new_filename, alttext ");
        query.append(" from POPUP");
        query.append(" where visibility = 'Y' and start_date <= date_format(now(),'%Y%m%d') and end_date >= date_format(now(),'%Y%m%d')");
        query.append(" order by shownum, no asc limit 0, 10");
        */
 		query.append("select no, title, linkurl, linktype, filename, filesize, new_filename, alttext  ");
        query.append(" from POPUP");
        query.append(" where visibility = 'Y' and start_date <= TO_CHAR(SYSDATE,'YYYYMMDD') and end_date >=  TO_CHAR(SYSDATE,'YYYYMMDD')");
        query.append(" AND      ROWNUM <= 12   ");
        query.append(" ORDER BY SHOWNUM, NO ASC  ");
		try {
			con = DBUtil.getConnection();
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query.toString());
			
			while(rs.next()) {
				PopupBean pb = new PopupBean();
				pb.setNo(rs.getInt("no"));
                pb.setTitle(rs.getString("title"));
                pb.setLinkUrl(rs.getString("linkurl"));
                pb.setLinkType(rs.getString("linktype"));
                pb.setFilename(rs.getString("filename"));
                pb.setFilesize(rs.getInt("filesize"));
                pb.setNewFilename(rs.getString("new_filename"));
                pb.setAlttext(rs.getString("alttext"));                
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
}
