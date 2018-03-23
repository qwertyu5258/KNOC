package kr.co.knoc.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.content.MenuBean;
import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.sitectrl.mgr.MgrDO;

public class FaqManager {
	public boolean insertFaq(FaqBean fb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from FAQ";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into FAQ "
				   + " (no, menu, gubun, title, content, regdate) "
				   + " values (?, ?, ?, ?, ?, SYSDATE)"; 			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,fb.getMenu());	
			prestmt.setString(index++,fb.getGubun());
			prestmt.setString(index++,fb.getTitle());
			prestmt.setString(index++,fb.getContent());
			
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
	
	public ArrayList<FaqBean> getFaqList(String menu, String gubun, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<FaqBean> result = new ArrayList<FaqBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
 		query.append(" select * from ( ");
        query.append(" select no, title, content , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO ");
        query.append(" from FAQ");
        query.append(" where menu = ? and gubun = ? ");
        //query.append(" order by no asc limit ?, ?");
        query.append(" order by no asc  ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, menu);
			prestmt.setString(2, gubun);
			prestmt.setInt(3, (page-1) * pageSize);
			prestmt.setInt(4,page* pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) { 
				FaqBean fb = new FaqBean();
				fb.setNo(rs.getInt("no"));
				fb.setTitle(rs.getString("title"));
				fb.setContent(rs.getString("content"));
				result.add(fb);
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
	
	public int getFaqListCount(String menu, String gubun) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from FAQ");
        query.append(" where menu = ? and gubun = ?");
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setString(1, menu);
		    prestmt.setString(2, gubun);
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
	
	public FaqBean getFaq(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		FaqBean fb = new FaqBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select no, menu, gubun, title, content from FAQ where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				fb.setNo(rs.getInt("no"));
				fb.setMenu(rs.getString("menu"));
				fb.setGubun(rs.getString("gubun"));
				fb.setTitle(rs.getString("title"));
				fb.setContent(rs.getString("content"));
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
		return fb;
	}
	
	public boolean updateFaq(FaqBean fb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update FAQ set gubun=?, title=?, content=? where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,fb.getGubun());
			prestmt.setString(index++,fb.getTitle());			
			prestmt.setString(index++,fb.getContent());
			prestmt.setInt(index++,fb.getNo());
			
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
	
	public boolean deleteFaq(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from FAQ where no=?";
				   					
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
