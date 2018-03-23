package kr.co.knoc.etc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.util.DateUtil;

public class MainCountManager {
	
	public void insertAccessCount(String url) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		try {
			con = DBUtil.getConnection();
			
			String sql = "";
			
			sql = " INSERT INTO ACCESS_COUNT "; 
			sql = sql + " ( "; 
			sql = sql + " YEAR, "; 
			sql = sql + " MONTH, "; 
			sql = sql + " DAY, "; 
			sql = sql + " PAGE_ADDR, "; 
			sql = sql + " ACC_COUNT  "; 
			sql = sql + " ) "; 
			sql = sql + " values "; 
			sql = sql + " (  "; 
			sql = sql + " TO_CHAR (SYSDATE, 'YYYY'),  "; 
			sql = sql + " TO_CHAR(SYSDATE, 'mm') ,  "; 
			sql = sql + " TO_CHAR(SYSDATE, 'DD'),  "; 
			sql = sql + " ?, "; 
			sql = sql + " 1   "; 
			sql = sql + " ) "; 
			
			
			
			int index = 1;					
			
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++, url);	
			
			
			prestmt.executeUpdate();	
			prestmt.close();
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	
	public void updateAccessCount(String url) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		try {
			con = DBUtil.getConnection();
			
			String sql = "";
			
			sql = " UPDATE ACCESS_COUNT ";
			sql = sql+" set ACC_COUNT = ACC_COUNT+1 ";
			sql = sql+" where YEAR =  TO_CHAR(SYSDATE, 'YYYY')  ";
			sql = sql+" AND MONTH =  TO_CHAR(SYSDATE, 'mm')  ";
			sql = sql+" AND DAY =  TO_CHAR(SYSDATE, 'DD')  ";
			sql = sql+" AND PAGE_ADDR = ? ";
			
			
			
			int index = 1;					
			
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++, url);	
			
			
			prestmt.executeUpdate();	
			prestmt.close();
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	
	
	public int getTodayAccessCount(String url) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		int resultCount = 0;
		
		try {
			con = DBUtil.getConnection();
			
			String sql="SELECT ACC_COUNT FROM ACCESS_COUNT WHERE  YEAR = TO_CHAR (SYSDATE, 'YYYY') AND MONTH = TO_CHAR(SYSDATE, 'mm')  AND DAY = TO_CHAR(SYSDATE, 'DD') AND  PAGE_ADDR = ?";
				   		

			int index = 1;					
			prestmt = con.prepareStatement(sql);
			
			prestmt.setString(index++, url);
			
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("ACC_COUNT");
			}
				
			prestmt.close();
			
			return resultCount;
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	/******************************* 메뉴 통계 관리 *******************************/
	
	public void insertMenuAccessCount(String mcode, String page_lang) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		try {
			con = DBUtil.getConnection();
			
			String sql = "";
			
			sql = " INSERT INTO MENU_ACCESS_COUNT "; 
			sql = sql + " ( "; 
			sql = sql + " YEAR, "; 
			sql = sql + " MONTH, "; 
			sql = sql + " DAY, "; 
			sql = sql + " PAGE_LANG, ";
			sql = sql + " MCODE, ";
			sql = sql + " ACC_DATE, ";
			sql = sql + " ACC_COUNT  "; 
			sql = sql + " ) "; 
			sql = sql + " values "; 
			sql = sql + " (  "; 
			sql = sql + " TO_CHAR (SYSDATE, 'YYYY'),  "; 
			sql = sql + " TO_CHAR(SYSDATE, 'mm') ,  "; 
			sql = sql + " TO_CHAR(SYSDATE, 'DD'),  "; 
			sql = sql + " ?, "; 
			sql = sql + " ?, ";
			sql = sql + " SYSDATE, ";
			sql = sql + " 1   "; 
			sql = sql + " ) ";
			
			int index = 1;					
			
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++, page_lang);
			prestmt.setString(index++, mcode);	
			
			prestmt.executeUpdate();	
			prestmt.close();
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	public void updateMenuAccessCount(String mcode, String page_lang) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		try {
			con = DBUtil.getConnection();
			
			String sql = "";
			
			sql = " UPDATE MENU_ACCESS_COUNT ";
			sql = sql+" set ACC_COUNT = ACC_COUNT+1 ";
			sql = sql+" where YEAR =  TO_CHAR(SYSDATE, 'YYYY')  ";
			sql = sql+" AND MONTH =  TO_CHAR(SYSDATE, 'mm')  ";
			sql = sql+" AND DAY =  TO_CHAR(SYSDATE, 'DD')  ";
			sql = sql+" AND MCODE = ? ";
			sql = sql+" AND PAGE_LANG = ? ";
			
			int index = 1;					
			
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++, mcode);	
			prestmt.setString(index++, page_lang);
			
			prestmt.executeUpdate();	
			prestmt.close();
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	/**
	 * 메뉴별 통계
	 * @param mcode
	 * @return
	 * @throws Exception
	 */
	public int getTodayMenuAccessCount(String mcode, String page_lang) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		int resultCount = 0;
		
		try {
			con = DBUtil.getConnection();
			
			String sql="SELECT ACC_COUNT FROM MENU_ACCESS_COUNT WHERE YEAR = TO_CHAR (SYSDATE, 'YYYY') AND MONTH = TO_CHAR(SYSDATE, 'mm') AND DAY = TO_CHAR(SYSDATE, 'DD') AND  MCODE = ? AND PAGE_LANG = ?";
				   		

			int index = 1;					
			prestmt = con.prepareStatement(sql);
			
			prestmt.setString(index++, mcode);
			prestmt.setString(index++, page_lang);
			
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("ACC_COUNT");
			}
				
			prestmt.close();
			
			return resultCount;
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	/**
	 * 년도리트스
	 * @return
	 * @throws Exception
	 */
	public ArrayList getYearList() throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		ArrayList list = new ArrayList();
		
		
		try {
			con = DBUtil.getConnection();
			
			String sql=" SELECT YEAR FROM ACCESS_COUNT GROUP BY YEAR ORDER BY YEAR DESC ";
				   		

			int index = 1;					
			prestmt = con.prepareStatement(sql);
			
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();
				hash.put("year", rs.getString("YEAR"));
				
				list.add(hash);
			}
			
			return list;
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	/**
	 * 해당년도의 저장된 접속통계의 월 리스트
	 * @param year
	 * @return
	 * @throws Exception
	 */
	public ArrayList getMonthList(String year) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		ArrayList list = new ArrayList();
		
		
		try {
			con = DBUtil.getConnection();
			
			String sql=" SELECT MONTH FROM ACCESS_COUNT WHERE YEAR = ? GROUP BY MONTH ORDER BY MONTH ASC ";
				   		
			
			int index = 1;
			prestmt = con.prepareStatement(sql);
			
			prestmt.setString(index++, year);
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();
				hash.put("month", rs.getString("MONTH"));
				
				list.add(hash);
			}
			
			return list;
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	/**
	 * 해당년도의 저장된 접속통계의 월 리스트
	 * @param year
	 * @return
	 * @throws Exception
	 */
	public ArrayList getAccessList(String year, String month, String pageAddr) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		ArrayList list = new ArrayList();
		
		
		try {
			con = DBUtil.getConnection();
			
			//String sql=" SELECT YEAR, MONTH, DAY, PAGE_ADDR, ACC_COUNT FROM  ACCESS_COUNT   WHERE YEAR  = ? AND MONTH = ? AND PAGE_ADDR = ?  GROUP BY DAY ORDER BY MONTH ASC ";
			//String sql=" SELECT YEAR, MONTH, DAY, PAGE_ADDR, ACC_COUNT FROM  ACCESS_COUNT   WHERE YEAR  = ? AND MONTH = ? AND PAGE_ADDR = ?    ORDER BY DAY ASC ";
			StringBuffer sb = new StringBuffer();
			sb.append(" SELECT ");
			sb.append("		A.DAY AS NO, B.YEAR, B.MONTH, B.DAY, B.PAGE_ADDR, DECODE(B.ACC_COUNT, NULL, 0, B.ACC_COUNT) AS ACC_COUNT ");
			sb.append(" FROM");
			sb.append("		(SELECT LEVEL AS DAY FROM DUAL CONNECT BY LEVEL <= TO_CHAR(SYSDATE, 'DD')) A ");
			sb.append("		LEFT OUTER JOIN ACCESS_COUNT B ON(B.YEAR=? AND B.MONTH=? AND B.PAGE_ADDR=? AND A.DAY=B.DAY) ");
			sb.append(" ORDER BY A.DAY ");
			
			int index = 1;
			prestmt = con.prepareStatement(sb.toString());
			
			prestmt.setString(index++, year);
			prestmt.setString(index++, month);
			prestmt.setString(index++, pageAddr);
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();
				hash.put("month", rs.getString("MONTH"));
				hash.put("year", rs.getString("YEAR"));
				hash.put("day", rs.getString("NO"));
				hash.put("page_addr", rs.getString("PAGE_ADDR"));
				hash.put("acc_count", rs.getString("ACC_COUNT"));
				
				list.add(hash);
			}
			
			return list;
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	/**
	 * 해당년도의 저장된 접속통계의 월 리스트(2013.05.23 추가 - 기능개선)
	 * @param year
	 * @return
	 * @throws Exception
	 */
	public ArrayList getNewAccessList(String year) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		ArrayList list = new ArrayList();
		
		
		try {
			con = DBUtil.getConnection();
			
			//String sql=" SELECT YEAR, MONTH, DAY, PAGE_ADDR, ACC_COUNT FROM  ACCESS_COUNT   WHERE YEAR  = ? AND MONTH = ? AND PAGE_ADDR = ?  GROUP BY DAY ORDER BY MONTH ASC ";
			//String sql=" SELECT YEAR, MONTH, DAY, PAGE_ADDR, ACC_COUNT FROM  ACCESS_COUNT   WHERE YEAR  = ? AND MONTH = ? AND PAGE_ADDR = ?    ORDER BY DAY ASC ";
			StringBuffer sb = new StringBuffer();
			sb.append(" SELECT ");
			sb.append("		T1.MONTH, T1.LAST_DAY, NVL(T2.ACC_COUNT, 0) AS ACC_COUNT, ROUND(NVL(T2.ACC_COUNT, 0)/T1.LAST_DAY, 0) AS AVG_COUNT ");
			sb.append(" FROM");
			sb.append("		(SELECT LEVEL AS month, TO_CHAR(LAST_DAY(TO_DATE( ? ||LTRIM(TO_CHAR(LEVEL, '00'))||'01', 'yyyyMMdd')), 'dd') AS LAST_DAY FROM DUAL CONNECT BY LEVEL <= 12 ) T1 ");
			sb.append("		LEFT OUTER JOIN (SELECT month, SUM(acc_count) AS acc_count FROM ACCESS_COUNT WHERE year = ? GROUP BY month ) T2 ON(T1.month = T2.MONTH) ");
			sb.append(" ORDER BY month ");
			
			int index = 1;
			prestmt = con.prepareStatement(sb.toString());
			
			prestmt.setString(index++, year);
			prestmt.setString(index++, year);
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();
				hash.put("month", rs.getString("MONTH"));
				hash.put("last_day", rs.getString("LAST_DAY"));
				hash.put("acc_count", rs.getString("ACC_COUNT"));
				hash.put("avg_count", rs.getString("AVG_COUNT"));
				
				list.add(hash);
			}
			
			return list;
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	public int getTotalAccessCount() throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		int resultCount = 0;
		
		
		try {
			con = DBUtil.getConnection();
			
			String sql=" SELECT SUM(ACC_COUNT) COUNT FROM ACCESS_COUNT ";
			prestmt = con.prepareStatement(sql);
			
			rs = prestmt.executeQuery();
			
			if (rs.next()){
				resultCount = rs.getInt("COUNT");
			}
			
			return resultCount;
		} catch (Exception e) {
		    e.printStackTrace();
		    throw e;
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}
	
	
}
