package kr.co.knoc.popup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class PopupNewManager {
	public boolean insertPopupNew(PopupNewBean pnb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from POPUPNEW";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into POPUPNEW "
				   + " (no, start_date, end_date, visibility, title, content, width, height, scroll, cookie, regdate) "
				   + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)"; 			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,pnb.getStartDate());
			prestmt.setString(index++,pnb.getEndDate());
			prestmt.setString(index++,pnb.getVisibility());
			prestmt.setString(index++,pnb.getTitle());
			prestmt.setString(index++,pnb.getContent());
			prestmt.setInt(index++,pnb.getWidth());
			prestmt.setInt(index++,pnb.getHeight());
			prestmt.setString(index++,pnb.getScroll());
			prestmt.setString(index++,pnb.getCookie());	
			
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
	
	public ArrayList<PopupNewBean> getPopupNewList(int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<PopupNewBean> result = new ArrayList<PopupNewBean>(); 		
 		StringBuffer query = new StringBuffer(); 	
 		query.append("select * from ( ");
        query.append("select no, title, start_date, end_date, width, height, scroll, cookie, regdate  , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO ");
        query.append(" from POPUPNEW");
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
				PopupNewBean pnb = new PopupNewBean();
				pnb.setNo(rs.getInt("no"));
                pnb.setTitle(rs.getString("title"));
                pnb.setStartDate(rs.getString("start_date"));
                pnb.setEndDate(rs.getString("end_date"));
                pnb.setWidth(rs.getInt("width"));
                pnb.setHeight(rs.getInt("height"));
                pnb.setScroll(rs.getString("scroll"));
                pnb.setCookie(rs.getString("cookie"));
                pnb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(pnb);
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
	
	public int getPopupNewListCount() {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from POPUPNEW");
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
	
	public PopupNewBean getPopupNew(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		PopupNewBean pnb = new PopupNewBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select no, start_date, end_date, visibility, title, content, width, height, scroll, cookie, regdate from POPUPNEW where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				pnb.setNo(rs.getInt("no"));
				pnb.setStartDate(rs.getString("start_date"));
				pnb.setEndDate(rs.getString("end_date"));
				pnb.setVisibility(rs.getString("visibility"));
				pnb.setTitle(rs.getString("title"));
				pnb.setContent(rs.getString("content"));
				pnb.setWidth(rs.getInt("width"));
				pnb.setHeight(rs.getInt("height"));
				pnb.setScroll(rs.getString("scroll"));
				pnb.setCookie(rs.getString("cookie"));
				pnb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));							
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
		return pnb;
	}
	
	public boolean updatePopupNew(PopupNewBean pnb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update POPUPNEW set start_date=?, end_date=?, visibility=? ";
			sql += ", title=?, content=?, width=?, height=?, scroll=?, cookie=? ";
			sql += " where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,pnb.getStartDate());
			prestmt.setString(index++,pnb.getEndDate());			
			prestmt.setString(index++,pnb.getVisibility());
			prestmt.setString(index++,pnb.getTitle());
			prestmt.setString(index++,pnb.getContent());
			prestmt.setInt(index++,pnb.getWidth());
			prestmt.setInt(index++,pnb.getHeight());
			prestmt.setString(index++,pnb.getScroll());
			prestmt.setString(index++,pnb.getCookie());
			prestmt.setInt(index++,pnb.getNo());
			
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
	
	public boolean deletePopupNew(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from POPUPNEW where no=?";
				   					
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
	
	public ArrayList<PopupNewBean> getPopupNew() {
    	Connection con = null;
 		ResultSet rs = null;
 		Statement stmt = null;
 		ArrayList<PopupNewBean> result = new ArrayList<PopupNewBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
        query.append("select no, title, start_date, end_date, width, height, scroll, cookie, regdate ");
        query.append(" from POPUPNEW");
       // query.append(" where visibility = 'Y' and start_date <= date_format(now(),'%Y%m%d') and end_date >= date_format(now(),'%Y%m%d')");
        query.append(" where visibility = 'Y' and start_date <= TO_CHAR(sysdate,'YYYYmmdd') and end_date >= TO_CHAR(sysdate,'YYYYmmdd')");
        query.append(" order by no asc");
        System.out.println(query);
		try {
			con = DBUtil.getConnection();
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query.toString());
			
			while(rs.next()) {
				PopupNewBean pnb = new PopupNewBean();
				pnb.setNo(rs.getInt("no"));
                pnb.setTitle(rs.getString("title"));
                pnb.setStartDate(rs.getString("start_date"));
                pnb.setEndDate(rs.getString("end_date"));
                pnb.setWidth(rs.getInt("width"));
                pnb.setHeight(rs.getInt("height"));
                pnb.setScroll(rs.getString("scroll"));
                pnb.setCookie(rs.getString("cookie"));
                pnb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(pnb);
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
