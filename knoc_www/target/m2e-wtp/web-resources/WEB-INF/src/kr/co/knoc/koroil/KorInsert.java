package kr.co.knoc.koroil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.jdbc.PetronetDBUtil;
import kr.co.knoc.sague.SagueBean;
import kr.co.knoc.sague.SagueFileBean;

public class KorInsert {

	public static boolean deleteKor(){
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "DELETE FROM KOR_OIL";
				   					
			stmt = con.createStatement();			
			
			stmt.executeUpdate(sql);
			stmt.close();
			result = true;
		} catch (Exception e) {
		    e.printStackTrace();
		    result = false;
		} finally {
			try {
			    if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public static boolean insertKor(KoroilBean kb) throws Exception{
		
		Connection con = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		int no = 0;
		try {
			con.setAutoCommit(false); 
			
			stmt = con.createStatement();
			
			String sql = "SELECT NVL(MAX(NO),0)+1 FROM KOR_OIL";
			rs = stmt.executeQuery(sql);
			rs.next();
			no = rs.getInt(1);
			
			StringBuffer buffer = new StringBuffer();
			
			buffer.append("INSERT INTO KOR_OIL");
			buffer.append("( NO, RECENTDT, GAS_NAME, GAS_NUM, GAS_RATE, VIA_NAME, VIA_NUM, VIA_RATE, BUTANE_NAME, BUTAIN_NUM, BUTAIN_RATE, ACCESS_DATE ");
			buffer.append(" )VALUES( ");
			buffer.append("?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYYMMDD')");
			buffer.append(" )");
			
			int index = 1;
			
			/**
			 * 2016.3.21 JSM
			 * 보안약점 조치
			 */
			if(buffer!=null){
				prestmt = con.prepareStatement(buffer.toString());			
				prestmt.setInt(index++,no);
				prestmt.setString(index++,kb.getRecentdt());
				prestmt.setString(index++,kb.getGas_name());
				prestmt.setString(index++,kb.getGas_num());			
				prestmt.setString(index++,kb.getGas_rate());
				prestmt.setString(index++,kb.getVia_name());
				prestmt.setString(index++,kb.getVia_num());
				prestmt.setString(index++,kb.getVia_rate());
				prestmt.setString(index++,kb.getButane_name());
				prestmt.setString(index++,kb.getButain_num());
				prestmt.setString(index++,kb.getButain_rate());
				prestmt.executeUpdate();
			}
			con.commit();			
			result = true;
			
		} catch (Exception e) {
			con.rollback();
		    e.printStackTrace();
		    result = false;
		} finally {
			con.setAutoCommit(true); 
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
	
	public static boolean updateKor() throws Exception{
		
		Connection con = DBUtil.getConnection();
		Statement stmt = null;
		boolean result = false;
		
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(" UPDATE KOR_OIL SET ACCESS_DATE = TO_CHAR(SYSDATE, 'YYYYMMDD') WHERE NO = 1 ");
			result = true;
			
		} catch (Exception e) {
		    e.printStackTrace();
		    result = false;
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
}
