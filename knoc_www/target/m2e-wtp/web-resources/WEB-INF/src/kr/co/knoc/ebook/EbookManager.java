package kr.co.knoc.ebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class EbookManager {
	public boolean insertEbook(EbookBean eb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from EBOOK";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into EBOOK "
				   + " (no, menu, title, link, filename, filesize, new_filename, image, image_size, new_imagename, ip, regdate) "
				   + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)"; 			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,eb.getMenu());
			prestmt.setString(index++,eb.getTitle());
			prestmt.setString(index++,eb.getLink());
			prestmt.setString(index++,eb.getFilename());			
			prestmt.setInt(index++,eb.getFilesize());
			prestmt.setString(index++,eb.getNewFilename());
			prestmt.setString(index++,eb.getImage());
			prestmt.setInt(index++,eb.getImageSize());
			prestmt.setString(index++,eb.getNewImagename());
			prestmt.setString(index++,eb.getIp());
			
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
	
	public ArrayList<EbookBean> getEbookList(String menu, String key_gbn, String key_word, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<EbookBean> result = new ArrayList<EbookBean>();
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
 		
 		StringBuffer query = new StringBuffer(); 
 		query.append("select * from ( ");
        query.append("select no, menu, title, link, filename, new_filename, image, new_imagename , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO");
        query.append(" from EBOOK");
        if(!where.equals(""))  {
        	query.append(" where " + where + "");
        	if (menu != null && !menu.equals("")) {
        		query.append(" and menu = '" + menu + "'");
        	}
        } else {
        	if (menu != null && !menu.equals("")) {
        		query.append(" where menu = '" + menu + "'");
        	}
        }
        //query.append(" order by no desc limit ?, ?");
        query.append(" order by no desc  ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2,page* pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				EbookBean eb = new EbookBean();
				eb.setNo(rs.getInt("no"));
				eb.setMenu(rs.getString("menu"));
				eb.setTitle(rs.getString("title"));
				eb.setLink(rs.getString("link"));
				eb.setFilename(rs.getString("filename"));
				eb.setNewFilename(rs.getString("new_filename"));
				eb.setImage(rs.getString("image"));
				eb.setNewImagename(rs.getString("new_imagename"));
				result.add(eb);
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
	
	public int getEbookListCount(String menu, String key_gbn, String key_word) {
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
        query.append(" from EBOOK");
        if(!where.equals(""))  {
        	query.append(" where " + where + "");
        	if (menu != null && !menu.equals("")) {
        		query.append(" and menu = '" + menu + "'");
        	}
        } else {
        	if (menu != null && !menu.equals("")) {
        		query.append(" where menu = '" + menu + "'");
        	}
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
	
	public EbookBean getEbook(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		EbookBean eb = new EbookBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select no, menu, title, link, filename, filesize, new_filename, image, image_size, new_imagename, ip, regdate from EBOOK where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				eb.setNo(rs.getInt("no"));
				eb.setMenu(rs.getString("menu"));
				eb.setTitle(rs.getString("title"));
				eb.setLink(rs.getString("link"));
				eb.setFilename(rs.getString("filename"));
				eb.setFilesize(rs.getInt("filesize"));
				eb.setNewFilename(rs.getString("new_filename"));
				eb.setImage(rs.getString("image"));
				eb.setImageSize(rs.getInt("image_size"));
				eb.setNewImagename(rs.getString("new_imagename"));
				eb.setIp(rs.getString("ip"));
				eb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));							
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
		return eb;
	}
	
	public boolean updateEbook(EbookBean eb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update EBOOK set menu=?, title=?, link=? ";
			sql += ", filename=?, filesize=?, new_filename=? ";
			sql += ", image=?, image_size=?, new_imagename=? where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,eb.getMenu());
			prestmt.setString(index++,eb.getTitle());			
			prestmt.setString(index++,eb.getLink());
			prestmt.setString(index++,eb.getFilename());
			prestmt.setInt(index++,eb.getFilesize());
			prestmt.setString(index++,eb.getNewFilename());
			prestmt.setString(index++,eb.getImage());
			prestmt.setInt(index++,eb.getImageSize());
			prestmt.setString(index++,eb.getNewImagename());
			prestmt.setInt(index++,eb.getNo());
			
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
	
	public boolean deleteEbook(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from EBOOK where no=?";
				   					
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
