package kr.co.knoc.etc;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import kr.co.knoc.jdbc.DBUtil;

public class BoardManager {
	/**
     * 첨부 화일 쿼리
     */
    public AttachFile getAttachFile(String tablename , int articleNo){
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		AttachFile attachFile = null;
		try {
			con = DBUtil.getConnection();
			/* 파일 정보 쿼리 */
			int index = 1;
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
				
			queryBuf.append("select no, filename, filesize, new_filename, regdate from ");
		    queryBuf.append(tablename);
		    queryBuf.append(" where no = ");
		    queryBuf.append(articleNo);
		    rs = stmt.executeQuery(queryBuf.toString());
		    if(rs.next()){
		        index = 1;
		        attachFile = new AttachFile();
		        attachFile.setNo(rs.getInt("no"));
		        attachFile.setFileName(rs.getString("filename"));
		        attachFile.setFileSize(rs.getLong("filesize"));
			    attachFile.setNewFilename(rs.getString("new_filename"));			    				   
			    attachFile.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString("regdate"));
		    }			
			
			if(rs != null) rs.close(); rs = null;
			stmt.close(); stmt = null;
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
        return attachFile;
    }
  
    /**
     * 첨부화일 다운로드 카운트 증가
     */
    public void increaseDownCount(String tablename , int articleNo, String bun){
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		AttachFile attachFile = null;
		try {
			con = DBUtil.getConnection();
			/* 파일 정보 쿼리 */
			
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();			
			queryBuf.append("update ");
		    queryBuf.append(tablename);
		    queryBuf.append(" set DOWNCNT = DOWNCNT + 1");
		    queryBuf.append(" where no = ");
		    queryBuf.append(articleNo);				
		    stmt.executeUpdate(queryBuf.toString());
			
			stmt.close(); stmt = null;
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
