package com.neoboard.log;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import com.neoboard.jdbc.*;


public class NeoboardLogManager {
	/** 로그 리스트 
	 * num : 게시물 번호
	 * bid : 게시판아이디
	 * nStartNum : 페이징 시작번호
	 * nEndNum : 페이징 종료번호
	 */
	public Vector getLogList(int num, String bid, int nStartNum, int nEndNum) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vLog = new Vector();		
		String strSQL = "";
		
		strSQL = "SELECT bno, logno, log_query, user_id, user_name, log_regdt, conn_ip FROM NEOBOARD_LOG ";
		strSQL += " where boardid='"+bid+"'";
		if (num > 0) {
			strSQL += " and bno=" + num;
		}
		strSQL += " order by bno desc limit "+ nStartNum + " , " +nEndNum;
		
		try {
			con = DBUtil.getConnection();
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(strSQL);
			
			while(rs.next()) {
				NeoboardLogBean nlb = new NeoboardLogBean();
				
				nlb.setBno(rs.getInt(1));
				nlb.setLogno(rs.getInt(2));
				nlb.setLogQuery(rs.getString(3));
				nlb.setUserID(rs.getString(4));
				nlb.setUserName(rs.getString(5));
				nlb.setLogRegdtString("yyyy-MM-dd HH:mm:ss", rs.getString(6));
				nlb.setConnIp(rs.getString(7));
					
				vLog.addElement(nlb);
			}
			rs.close();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
		
		return vLog;
	}
	
	/** 로그 카운트 
	 * num : 게시물 번호
	 * bid : 게시판아이디
	 */
	public int getLogCount(int num, String bid) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int nRetValue = 0;
		String strSQL = "";
		
		try {
			con = DBUtil.getConnection();
			stmt = con.createStatement();
			
			strSQL = "SELECT COUNT(*) From NEOBOARD_LOG ";			
			strSQL += " where boardid='"+bid+"'";
			if (num > 0) {
				strSQL += " and bno=" + num;
			}			
			
			rs = stmt.executeQuery(strSQL);
			
			while (rs.next()) {
				nRetValue = rs.getInt(1);
			}
			rs.close();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
		
		return nRetValue;
	}
}
