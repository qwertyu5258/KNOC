package kr.co.knoc.sague;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.nio.Buffer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.knoc.banner.BannerBean;
import kr.co.knoc.etc.SmsManager;
import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.util.DateUtil;

public class SagueManager {
	
	public boolean insertSague(SagueBean sb, SagueFileBean sf) throws Exception{
		
		Connection con = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		int nid = 0;
		int nid2 = 0;
		try {
			con.setAutoCommit(false);  //트랜젝션 처리
			
			//System.out.println("################ >>" + sf.toString());
			
			stmt = con.createStatement();
			
			String sql = "SELECT NVL(MAX(SAGUE_NID),0)+1 FROM SAGUE_MST";
			rs = stmt.executeQuery(sql);
			rs.next();
			nid = rs.getInt(1);
			
			StringBuffer buffer = new StringBuffer();
			
			buffer.append("INSERT INTO SAGUE_MST");
			buffer.append("(SAGUE_NID, SUBJECT, REASON, CONTENTS, OPINION, OPINION_TERM, DEPARTMENT, REPRESENTATIVES, TEL_NO, FAX_NO, EMAIL, REG_ID, STATUS_NO, REG_DATE )");
			buffer.append("VALUES(");
			buffer.append("?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, SYSDATE \n");
			buffer.append(")");
			
			int index = 1;					
			prestmt = con.prepareStatement(buffer.toString());
			
			prestmt.setInt(index++,nid);
			prestmt.setString(index++,sb.getSubject());
			prestmt.setString(index++,sb.getReason());
			prestmt.setString(index++,sb.getContents());			
			prestmt.setString(index++,sb.getOpinion());
			prestmt.setString(index++,sb.getOpinion_term());
			prestmt.setString(index++,sb.getDepartment());
			prestmt.setString(index++,sb.getRepresentatives());
			prestmt.setString(index++,sb.getTel_no());
			prestmt.setString(index++,sb.getFax_no());
			prestmt.setString(index++,sb.getEmail());
			prestmt.setString(index++,sb.getReg_id());
			//prestmt.setInt(index++,sb.getStatus_no());
			prestmt.executeUpdate();
			
			//파일등록
			if(sf.getOrg_filenm() != null){
				StringBuffer bufferfile = new StringBuffer();
				
				sql = "SELECT NVL(MAX(FILE_NID),0)+1 FROM SAGUE_FILE";
				rs = stmt.executeQuery(sql);
				rs.next();
				nid2 = rs.getInt(1);
				stmt.close();
				
				bufferfile.append("INSERT INTO SAGUE_FILE");
				bufferfile.append("(SAGUE_NID, FILE_NID, ORG_FILENM, SAVE_FILENM, FILE_PATH, STATUS_NO, LAST_MODIFIER, FILE_SIZE, REG_DATE");
				bufferfile.append(")VALUES(");
				bufferfile.append("?, ?, ?, ?, ?, 1, ?, ?, SYSDATE ");
				bufferfile.append(")");
				
				int index2 = 1;					
				prestmt = con.prepareStatement(bufferfile.toString());
				
				prestmt.setInt(index2++,nid);
				prestmt.setInt(index2++,nid2);
				prestmt.setString(index2++,sf.getOrg_filenm());
				prestmt.setString(index2++,sf.getSave_filenm());			
				prestmt.setString(index2++,sf.getFile_path());
				prestmt.setString(index2++,sf.getLast_modifier());
				prestmt.setInt(index2++,sf.getFile_size());
				
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
	
	public ArrayList<SagueBean> getSagueList(int page, int pageSize){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<SagueBean> result = new ArrayList<SagueBean>(); 
 		
 		StringBuffer buffer = new StringBuffer();
 		
 		buffer.append("SELECT * FROM( ");
 		buffer.append("SELECT ROW_NUMBER() OVER(ORDER BY SAGUE_NID  DESC ) AS PAGE_NO, SAGUE_NID, SUBJECT, TO_CHAR(REG_DATE, 'YYYY-MM-DD')AS REG_DATE ,NVL(CLICK_CNT, 0) AS CLICK_CNT, ");
 		buffer.append(" (SELECT COUNT(*) FROM SAGUE_COMMENT WHERE SAGUE_NID = T.SAGUE_NID AND status_no =1)AS COMMENT_CNT ");
 		buffer.append("FROM SAGUE_MST T ");
 		buffer.append("WHERE STATUS_NO =1  ");
 		buffer.append(")A ");
 		buffer.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(buffer.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2,page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				SagueBean sb = new SagueBean();
				
				sb.setSague_nid((rs.getInt("SAGUE_NID")));
				sb.setSubject(rs.getString("SUBJECT"));
				sb.setRegDateString("yyyy-MM-dd", rs.getString("REG_DATE"));
				sb.setClick_cnt((rs.getInt("CLICK_CNT")));
				sb.setComment_cnt((rs.getInt("COMMENT_CNT")));
				result.add(sb);
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
	
	public int getSaguerListCount() {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		
 		StringBuffer buffer = new StringBuffer();
 		
 		buffer.append("SELECT COUNT(*) FROM( ");
 		buffer.append("SELECT ROW_NUMBER() OVER(ORDER BY SAGUE_NID  DESC ) AS PAGE_NO, SAGUE_NID, SUBJECT, TO_CHAR(REG_DATE, 'YYYY-MM-DD')AS REG_DATE ,CLICK_CNT ");
 		buffer.append("FROM SAGUE_MST ");
 		buffer.append("WHERE STATUS_NO =1  ");
 		buffer.append(")A ");

		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(buffer.toString());
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
	
	public boolean updateSagueViewsCount(int sague_nid) throws Exception{
		
		Connection con = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			
			con.setAutoCommit(false); 
			
			stmt = con.createStatement();
			
			StringBuffer buffer = new StringBuffer();
			
			buffer.append("UPDATE SAGUE_MST SET ");
			buffer.append("		CLICK_CNT = ( ");
			buffer.append("			SELECT nvl(CLICK_CNT,0)+1 FROM SAGUE_MST ");
			buffer.append("			WHERE SAGUE_NID = ?) ");
			buffer.append("WHERE SAGUE_NID =? ");
			
			prestmt = con.prepareStatement(buffer.toString());
			
			prestmt.setInt(1, sague_nid);
			prestmt.setInt(2, sague_nid);
		
			prestmt.executeUpdate();
			
			con.commit();
			
			stmt.close();
			prestmt.close();
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
	
	public HashMap<String, Object> getSaguebeanView(int sague_nid){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		SagueBean sb = new SagueBean();
		SagueFileBean sfb = new SagueFileBean();
		
		HashMap<String, Object> hash = new HashMap<String, Object>();
		
		try {
			con = DBUtil.getConnection();		
			
			String sql =  "SELECT T1.SAGUE_NID, T1.SUBJECT, T1.REASON, T1.CONTENTS, T1.OPINION, T1.OPINION_TERM, T1.DEPARTMENT, T1.REPRESENTATIVES, T1.TEL_NO, T1.FAX_NO, T1.EMAIL, "; 
				   sql += "     T2.FILE_NID, T2.ORG_FILENM ";
				   sql += "FROM SAGUE_MST T1 LEFT OUTER JOIN SAGUE_FILE T2 ON(T1.SAGUE_NID = T2.SAGUE_NID AND T2.STATUS_NO = 1) ";
				   sql += "WHERE T1.SAGUE_NID = ? ";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1, sague_nid);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				sb.setSague_nid(rs.getInt("SAGUE_NID"));
				sb.setSubject(rs.getString("SUBJECT"));
				sb.setReason(rs.getString("REASON"));
				sb.setContents(rs.getString("CONTENTS"));
				sb.setOpinion(rs.getString("OPINION"));
				sb.setOpinion_term(rs.getString("OPINION_TERM"));
				sb.setDepartment(rs.getString("DEPARTMENT"));
				sb.setRepresentatives(rs.getString("REPRESENTATIVES"));
				sb.setTel_no(rs.getString("TEL_NO"));
				sb.setFax_no(rs.getString("FAX_NO"));
				sb.setEmail(rs.getString("EMAIL"));
				sfb.setFile_nid(rs.getInt("FILE_NID"));
				sfb.setOrg_filenm(rs.getString("ORG_FILENM"));
			}
			
			hash.put("sagueBean", sb);
			hash.put("sagueFileBean", sfb);
			
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
				e.printStackTrace();
			}
		}
		return hash;
	}

	public SagueFileBean getsagueFileBean(int sague_nid){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		SagueFileBean filebn = new SagueFileBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "SELECT FILE_NID, ORG_FILENM, SAVE_FILENM FROM SAGUE_FILE WHERE SAGUE_NID = ? AND STATUS_NO = 1";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,sague_nid);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				//filebn.setFile_nid(rs.getInt("FILE_NID"));
				filebn.setOrg_filenm(rs.getString("ORG_FILENM"));
				filebn.setSave_filenm(rs.getString("SAVE_FILENM"));
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
		return filebn;
	}
	
	public ArrayList<SagueCommentBean> getCommentList(int sague_nid, int page, int pageSize){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<SagueCommentBean> result = new ArrayList<SagueCommentBean>(); 
 		
 		StringBuffer buffer = new StringBuffer();
 		
 		buffer.append("SELECT * FROM( ");
 		buffer.append("	SELECT ROW_NUMBER() OVER(ORDER BY COMMENT_NID  ASC ) AS PAGE_NO, SAGUE_NID, COMMENT_NID, USER_NAME, TEL_NO, USER_OPINION ");
 		buffer.append("	FROM SAGUE_COMMENT ");
 		buffer.append("WHERE SAGUE_NID = ? AND STATUS_NO =1   ");
 		buffer.append(")A ");
 		buffer.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(buffer.toString());
			prestmt.setInt(1, sague_nid);
			prestmt.setInt(2, (page-1) * pageSize);
			prestmt.setInt(3,page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				SagueCommentBean scb = new SagueCommentBean();
				
				scb.setSague_nid((rs.getInt("SAGUE_NID")));
				scb.setComment_nid(rs.getInt("COMMENT_NID"));
				scb.setUser_name(rs.getString("USER_NAME"));
				scb.setTel_no(rs.getString("TEL_NO"));
				scb.setUser_opinion(rs.getString("USER_OPINION"));
				result.add(scb);
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
	
	public int getCommentListCount(int sague_nid) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		
 		StringBuffer buffer = new StringBuffer();
 		
 		buffer.append("SELECT COUNT(*) FROM( ");
 		buffer.append("	SELECT ROW_NUMBER() OVER(ORDER BY COMMENT_NID  ASC ) AS PAGE_NO, COMMENT_NID, USER_NAME, TEL_NO, USER_OPINION ");
 		buffer.append("	FROM SAGUE_COMMENT ");
 		buffer.append("WHERE SAGUE_NID = '"+sague_nid+"' AND STATUS_NO =1   ");
 		buffer.append(")A ");

		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(buffer.toString());
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
	
	public boolean updateSague(SagueBean sb, SagueFileBean sf) throws Exception{
		
		Connection con = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		String sql = "";
		int nid2 = 0;
		
		try {
			
			con.setAutoCommit(false); 
			
			stmt = con.createStatement();
			
			StringBuffer buffer = new StringBuffer();
			
			buffer.append("UPDATE SAGUE_MST SET ");
			buffer.append("		SUBJECT =? , REASON =? , CONTENTS =? , OPINION =? , OPINION_TERM =? , DEPARTMENT =? , ");
			buffer.append("		REPRESENTATIVES =? , TEL_NO =? , FAX_NO =? , EMAIL =? , MOD_DATE =SYSDATE , MOD_ID =? ");
			buffer.append("WHERE SAGUE_NID =? ");
			
			int index = 1;					
			prestmt = con.prepareStatement(buffer.toString());
			
			prestmt.setString(index++,sb.getSubject());
			prestmt.setString(index++,sb.getReason());
			prestmt.setString(index++,sb.getContents());			
			prestmt.setString(index++,sb.getOpinion());
			prestmt.setString(index++,sb.getOpinion_term());
			prestmt.setString(index++,sb.getDepartment());
			prestmt.setString(index++,sb.getRepresentatives());
			prestmt.setString(index++,sb.getTel_no());
			prestmt.setString(index++,sb.getFax_no());
			prestmt.setString(index++,sb.getEmail());
			prestmt.setString(index++,sb.getMod_id());
			prestmt.setInt(index++,sb.getSague_nid());
		
			prestmt.executeUpdate();
			
			//파일등록
			if(sf.getOrg_filenm() != null){
				StringBuffer bufferfile = new StringBuffer();
				
				sql = "SELECT NVL(MAX(FILE_NID),0)+1 FROM SAGUE_FILE";
				rs = stmt.executeQuery(sql);
				rs.next();
				nid2 = rs.getInt(1);
				stmt.close();
				
				bufferfile.append("INSERT INTO SAGUE_FILE");
				bufferfile.append("(SAGUE_NID, FILE_NID, ORG_FILENM, SAVE_FILENM, FILE_PATH, STATUS_NO, LAST_MODIFIER, FILE_SIZE, REG_DATE");
				bufferfile.append(")VALUES(");
				bufferfile.append("?, ?, ?, ?, ?, 1, ?, ?, SYSDATE ");
				bufferfile.append(")");
				
				int index2 = 1;					
				prestmt = con.prepareStatement(bufferfile.toString());
				
				prestmt.setInt(index2++,sb.getSague_nid());
				prestmt.setInt(index2++,nid2);
				prestmt.setString(index2++,sf.getOrg_filenm());
				prestmt.setString(index2++,sf.getSave_filenm());			
				prestmt.setString(index2++,sf.getFile_path());
				prestmt.setString(index2++,sf.getLast_modifier());
				prestmt.setInt(index2++,sf.getFile_size());
			}
			
			prestmt.executeUpdate();
			con.commit();
			
			stmt.close();
			prestmt.close();
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
	
	
	public int deleteFileSague(int file_nid, int sague_nid) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int resultCnt = -1;
		
		StringBuffer fileMstBuff = new StringBuffer();
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	
	    	fileMstBuff.append(" UPDATE SAGUE_FILE ");
	    	fileMstBuff.append(" SET ");
	    	fileMstBuff.append(" 	ORG_FILENM = '', SAVE_FILENM = '', MOD_DATE=sysdate , STATUS_NO = '-1' ,");
	    	fileMstBuff.append(" 	FILE_PATH = ''  ");	    	
	    	fileMstBuff.append(" WHERE FILE_NID = ? ");
	    	fileMstBuff.append(" AND SAGUE_NID = ? ");
			
			pstmt = con.prepareStatement(fileMstBuff.toString());					
			pstmt.setInt(1, file_nid);
			pstmt.setInt(2, sague_nid);
			resultCnt = pstmt.executeUpdate();	
			
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true); 
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close();				
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	public int deleteSague(int sague_nid) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		int resultCnt = -1;
		
		StringBuffer fileMstBuff = new StringBuffer();
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	
	    	fileMstBuff.append(" UPDATE SAGUE_MST ");
	    	fileMstBuff.append(" SET ");
	    	fileMstBuff.append(" 	STATUS_NO = '-1' ");
	    	fileMstBuff.append(" WHERE SAGUE_NID = ? ");
			
			pstmt = con.prepareStatement(fileMstBuff.toString());					
			pstmt.setInt(1, sague_nid);
			resultCnt = pstmt.executeUpdate();	
			
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true); 
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	
	
	public int deleteCommentSague(int sague_nid, int comment_nid) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		int resultCnt = -1;
		
		StringBuffer fileMstBuff = new StringBuffer();
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	
	    	fileMstBuff.append(" UPDATE SAGUE_COMMENT ");
	    	fileMstBuff.append(" SET ");
	    	fileMstBuff.append(" 	STATUS_NO = '-1' ");
	    	fileMstBuff.append(" WHERE SAGUE_NID = ? ");
	    	fileMstBuff.append(" AND COMMENT_NID = ? ");
			
			pstmt = con.prepareStatement(fileMstBuff.toString());					
			pstmt.setInt(1, sague_nid);
			pstmt.setInt(2, comment_nid);
			resultCnt = pstmt.executeUpdate();	
			
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true); 
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	public boolean insertCommentSague(SagueCommentBean sb) throws Exception{
		
		Connection con = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		int nid = 0;
		int nid2 = 0;
		try {
			con.setAutoCommit(false);  //트랜젝션 처리
			
			stmt = con.createStatement();
			
			String sql = "SELECT NVL(MAX(COMMENT_NID),0)+1 FROM SAGUE_COMMENT";
			rs = stmt.executeQuery(sql);
			rs.next();
			nid = rs.getInt(1);
			
			StringBuffer buffer = new StringBuffer();
			
			buffer.append("INSERT INTO SAGUE_COMMENT");
			buffer.append("(SAGUE_NID,COMMENT_NID,USER_NAME,TEL_NO,USER_OPINION,REG_DATE,MOD_DATE,STATUS_NO, VERTUAL_NO )");
			buffer.append("VALUES(");
			buffer.append("?, ?, ?, ?, ?, SYSDATE, SYSDATE, 1, ? \n");
			buffer.append(")");
			
			int index = 1;					
			prestmt = con.prepareStatement(buffer.toString());
			
			prestmt.setInt(index++,sb.getSague_nid());
			prestmt.setInt(index++,nid);
			prestmt.setString(index++,sb.getUser_name());
			prestmt.setString(index++,sb.getTel_no());			
			prestmt.setString(index++,sb.getUser_opinion());
			prestmt.setString(index++,sb.getVertual_no());
			
			//prestmt.setInt(index++,sb.getStatus_no());
			prestmt.executeUpdate();
			 
			con.commit();
			
			stmt.close();
			prestmt.close();
			result = true;
			
			////////////////SMS 전달/////////////
			String str = "사규 제·개정 예고 게시판에 의견이 등록되었습니다. ["+DateUtil.getFormattedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"]";

			//if(sb.getTel_no().equals("null") || sb.getTel_no() != null){
				SmsManager.insertSmsWait("010-3205-7997", "1", str);
			//}
			////////////////////////////////////
			
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
}
