package kr.co.knoc.hongbo;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class HongboManager {
	public boolean insertHongbo(HongboBean hb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from HONGBO";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into HONGBO "
				   + " (no, title, filename, filesize, new_filename, ip, regdate) "
				   + " values (?, ?, ?, ?, ?, ?, SYSDATE)"; 			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,hb.getTitle());
			prestmt.setString(index++,hb.getFilename());			
			prestmt.setInt(index++,hb.getFilesize());
			prestmt.setString(index++,hb.getNewFilename());
			prestmt.setString(index++,hb.getIp());
			
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
	
	public ArrayList<HongboBean> getHongboList(String key_gbn, String key_word, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<HongboBean> result = new ArrayList<HongboBean>();
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
 		
 		StringBuffer query = new StringBuffer(); 		
 		query.append("select * from ( ");
        query.append("select no, title, filename, new_filename, regdate , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO ");
        query.append(" from HONGBO");
        if(!where.equals(""))  {
        	query.append(" where " + where + "");        	
        }
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
				HongboBean hb = new HongboBean();
				hb.setNo(rs.getInt("no"));
				hb.setTitle(rs.getString("title"));
				hb.setFilename(rs.getString("filename"));
				hb.setNewFilename(rs.getString("new_filename"));
				hb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(hb);
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
	
	public int getHongboListCount(String key_gbn, String key_word) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
 		
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from HONGBO");
        if(!where.equals(""))  {
        	query.append(" where " + where + "");        	
        }
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
	
	public HongboBean getHongbo(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		HongboBean hb = new HongboBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select no, title, filename, filesize, new_filename, ip, regdate from HONGBO where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				hb.setNo(rs.getInt("no"));
				hb.setTitle(rs.getString("title"));
				hb.setFilename(rs.getString("filename"));
				hb.setFilesize(rs.getInt("filesize"));
				hb.setNewFilename(rs.getString("new_filename"));
				hb.setIp(rs.getString("ip"));
				hb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));							
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
		return hb;
	}
	
	public boolean updateHongbo(HongboBean hb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update HONGBO set title=? ";
			sql += ", filename=?, filesize=?, new_filename=? ";
			sql += " where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,hb.getTitle());			
			prestmt.setString(index++,hb.getFilename());
			prestmt.setInt(index++,hb.getFilesize());
			prestmt.setString(index++,hb.getNewFilename());
			prestmt.setInt(index++,hb.getNo());
			
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
	
	public boolean deleteHongbo(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from HONGBO where no=?";
				   					
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
}
