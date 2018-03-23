package kr.co.knoc.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import kr.co.knoc.jdbc.DBUtil;

public class FileManager {
	
	
	public HashMap getFileInfo(int fileNid){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		HashMap hash = new HashMap();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	ORG_FILENM, SAVE_FILENM, FILE_PATH, FILE_NID ";
			sql = sql+ "   FROM FILE_MST ";
			sql = sql+ "   WHERE FILE_NID = ? ";
			
			
			prestmt = con.prepareStatement(sql);
			int index=1;
			
			prestmt.setInt(index++, fileNid);
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){					
				
				hash.put("FILE_NID", rs.getInt("FILE_NID"));
				hash.put("ORG_FILENM", rs.getString("ORG_FILENM"));
				hash.put("SAVE_FILENM", rs.getString("SAVE_FILENM"));
				hash.put("FILE_PATH", rs.getString("FILE_PATH"));	
				
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
		return hash;
	}
}
