package kr.co.knoc.etc;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import kr.co.knoc.jdbc.DBUtil;

public class ZipcodeManager {
	//우편번호검색
	public ArrayList<ZipcodeBean> searchZipcode(String strKeyword) {
		Connection con = null;
		Statement stmt = null;
		String strSQL = "";
		ResultSet rs = null;
		ArrayList<ZipcodeBean> result = new ArrayList<ZipcodeBean>();
		
		try {
        	con = DBUtil.getConnection();
			stmt = con.createStatement();
			
			strSQL = "select zipcode, sido, gugun, dong, bunji ";
			strSQL += " from ZIPCODE ";
			strSQL += " where dong like '%"+strKeyword+"%' ";
			strSQL += "ORDER BY seq ASC ";

			rs = stmt.executeQuery(strSQL);
			
			while(rs.next()) {
				ZipcodeBean zBean = new ZipcodeBean();
				
				zBean.setZipcode(rs.getString("zipcode"));
				zBean.setSido(rs.getString("sido"));
				zBean.setGugun(rs.getString("gugun"));
				zBean.setDong(rs.getString("dong"));
				zBean.setBunji(rs.getString("bunji"));
				
				result.add(zBean);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}

		return result;
	}	
}
