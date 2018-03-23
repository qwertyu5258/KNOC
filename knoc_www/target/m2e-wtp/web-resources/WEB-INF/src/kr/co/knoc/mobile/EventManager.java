package kr.co.knoc.mobile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kr.co.knoc.jdbc.DBUtil;

public class EventManager {
	
	
	/**
	 * 이벤트 참여유정 수
	 * @return
	 */
	public int getEventUserCount(){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int resultCount = 0;
			
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	COUNT(*) CNT";
			sql = sql+ "   FROM EVENT_JOIN  ";
			
			
						
			prestmt = con.prepareStatement(sql);			
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("CNT");
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
		return resultCount;
	}
	
	/**
	 * 이벤트참여 유저 리스트(페이지)
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList getEventUserList(int page, int pageSize){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
			
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT * from ( ";
			sql = sql+ " SELECT ";
			sql = sql+ "  	EVENT_NID, EVENT_ANSWER, EVENT_NM, EVENT_PHONE, INSERT_DATE , ROW_NUMBER() OVER(ORDER BY EVENT_NID desc) AS PAGE_NO  ";
			sql = sql+ "   FROM EVENT_JOIN  ";
			sql = sql+ "   ORDER BY INSERT_DATE DESC  ";		
			sql = sql+ ") a ";
			sql = sql+ " WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ";
			
						
			prestmt = con.prepareStatement(sql);	
			prestmt.setInt(1,(page-1) * pageSize);
			prestmt.setInt(2,page*pageSize );
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("EVENT_NID", rs.getInt("EVENT_NID"));
				hash.put("EVENT_ANSWER", rs.getString("EVENT_ANSWER"));
				hash.put("EVENT_NM", rs.getString("EVENT_NM"));
				hash.put("EVENT_PHONE", rs.getString("EVENT_PHONE"));
				hash.put("INSERT_DATE", rs.getString("INSERT_DATE"));
				list.add(hash);
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
		return list;
	}
	/**
	 * 이벤트 참여유저수(ALL)
	 * @return
	 */
	public ArrayList getEventUserList(){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
			
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	EVENT_NID, EVENT_ANSWER, EVENT_NM, EVENT_PHONE, cast(INSERT_DATE AS CHAR(15)) AS INSERT_DATE ";
			sql = sql+ "   FROM EVENT_JOIN ORDER BY INSERT_DATE DESC ";
			
			 
						
			prestmt = con.prepareStatement(sql);				
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("EVENT_NID", rs.getInt("EVENT_NID"));
				hash.put("EVENT_ANSWER", rs.getString("EVENT_ANSWER"));
				hash.put("EVENT_NM", rs.getString("EVENT_NM"));
				hash.put("EVENT_PHONE", rs.getString("EVENT_PHONE"));
				hash.put("INSERT_DATE", rs.getString("INSERT_DATE"));
				list.add(hash);
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
		return list;
	}
	
	
	public EventBean getEvent(){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		EventBean pb = new EventBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = " select ";
			sql = sql+ " NO, VISIBILITY, LINKURL, LINKTYPE, FILENAME, FILESIZE, NEW_FILENAME, REGDATE ";
			sql = sql+ " from MOBILE_EVENT  ";
			
			
			prestmt = con.prepareStatement(sql);			
			rs = prestmt.executeQuery();
			
			if (rs.next()) {
				pb.setNo(rs.getInt("NO"));				
				pb.setVisibility(rs.getString("VISIBILITY"));		
				
				//System.out.println("################################# :::: "+rs.getString("LINKURL"));
				
				pb.setLinkUrl(rs.getString("LINKURL"));
				pb.setLinkType(rs.getString("LINKTYPE"));
				pb.setFilename(rs.getString("FILENAME"));
				pb.setFilesize(rs.getInt("FILESIZE"));
				pb.setNewFilename(rs.getString("NEW_FILENAME"));				
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("REGDATE"));				
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
	
	public boolean updateEvent(EventBean pb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update MOBILE_EVENT set visibility=? ";
			sql += ", linkurl=?, linktype=?, filename=?, filesize=? ";
			sql += ", new_filename=? ";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
	
			prestmt.setString(index++,pb.getVisibility());
			prestmt.setString(index++,pb.getLinkUrl());
			prestmt.setString(index++,pb.getLinkType());
			prestmt.setString(index++,pb.getFilename());
			prestmt.setInt(index++,pb.getFilesize());
			prestmt.setString(index++,pb.getNewFilename());		
			
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
	
	
	
	
// ******************************동해 가스전 방문 이벤트 201112 *********************************************************************
	
	public ArrayList getEventTwoUserList(int page, int pageSize){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
			
		try {
			con = DBUtil.getConnection();			
			
			String sql = " select * from ( ";
			sql = sql+ "   select	EVENT_NID, EVENT_GAS, EVENT_OIL, EVENT_COMPANY, EVENT_NM, EVENT_PHONE, INSERT_DATE , ROW_NUMBER() OVER(ORDER BY EVENT_NID desc) AS PAGE_NO  ";
			sql = sql+ "   FROM EVENT_JOIN_TWO  ";
			sql = sql+ "   ORDER BY INSERT_DATE DESC  ";		
			sql = sql+ " ) a ";
			sql = sql+ "  WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ";
						
			prestmt = con.prepareStatement(sql);	
			prestmt.setInt(1,(page-1) * pageSize);
			prestmt.setInt(2,page*pageSize );
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("EVENT_NID", rs.getInt("EVENT_NID"));
				hash.put("EVENT_GAS", rs.getString("EVENT_GAS"));
				hash.put("EVENT_OIL", rs.getString("EVENT_OIL"));
				hash.put("EVENT_COMPANY", rs.getString("EVENT_COMPANY"));
				hash.put("EVENT_NM", rs.getString("EVENT_NM"));
				hash.put("EVENT_PHONE", rs.getString("EVENT_PHONE"));
				hash.put("INSERT_DATE", rs.getString("INSERT_DATE"));
				list.add(hash);
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
		return list;
	}
	
	
	/**
	 * 이벤트 참여유정 수
	 * @return
	 */
	public int getEventTwoUserCount(){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int resultCount = 0;
			
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	COUNT(*) CNT";
			sql = sql+ "   FROM EVENT_JOIN_TWO  ";
			
			
						
			prestmt = con.prepareStatement(sql);			
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("CNT");
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
		return resultCount;
	}
	
	
	public boolean getEventDelList(int event_nid){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "DELETE FROM EVENT_JOIN_TWO WHERE EVENT_NID = ?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
	
			prestmt.setInt(index++,event_nid);
					
			
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
