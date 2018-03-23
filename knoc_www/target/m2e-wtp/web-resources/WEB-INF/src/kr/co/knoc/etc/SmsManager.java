package kr.co.knoc.etc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.*;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.util.*;

public class SmsManager {
	public static void insertSmsWait(String mobile, String idx, String str){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Date today = new Date();
		String time = DateUtil.getFormattedDate(today, "yyyyMMddHHmmss");
		
		try {
			con = DBUtil.getConnection();
			
			String sql="insert into sms_wait (serialno, destcallno, callbackno, type, smsdata, jeobsu_time, yeyak_time) values"
				   + "(?,?,'0522162114',1,?,SYSDATE,SYSDATE)"; 	 			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,time+idx);	
			prestmt.setString(index++,mobile.replaceAll("-", ""));
			prestmt.setString(index++,str);
			
			prestmt.executeUpdate();	
			prestmt.close();
		} catch (Exception e) {
		    e.printStackTrace();
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
