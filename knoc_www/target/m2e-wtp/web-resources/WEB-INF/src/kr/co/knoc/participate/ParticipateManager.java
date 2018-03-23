package kr.co.knoc.participate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import oracle.jdbc.OraclePreparedStatement;

import kr.co.knoc.participate.ParticipateBean;
import kr.co.knoc.popup.PopupNewBean;
import kr.co.knoc.jdbc.DBUtil;

public class ParticipateManager {
	
	/**
	 * 관리자 사보 독자 참여 게시판 질문 등록
	 * @param pnb
	 * @return
	 */
	
	public boolean insertQuestion(ParticipateNewBean pnb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int question_No = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select nvl(max(question_nid),0)+1 from PARTICIPATE_QUESTION";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				question_No = rs.getInt(1);
			}
			stmt.close();
			
			sql="insert into PARTICIPATE_QUESTION "
				   + " (question_nid, question_contents, regi_dt) "
				   + " values (?, ?, sysdate)"; 			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,question_No);
			prestmt.setString(index++,pnb.getQuestionText());
			
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
	
	/**
	 * 관리자 사보 독자 참여 게시판 질문 수정
	 * @param pnb
	 * @return
	 */
	public boolean updateQuestion(ParticipateNewBean pnb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update PARTICIPATE_QUESTION set question_contents=?, modi_dt=sysdate ";
			sql += " where question_nid=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,pnb.getQuestionText());
			prestmt.setInt(index++,pnb.getQuestionNo());
			
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
	
	
	/**
	 * 사보 독자 참여 게시판  등록
	 * @param pnb
	 * @return
	 */
	
	public boolean insertParticipateBbs(ParticipateNewBean pnb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		//OraclePreparedStatement prestmt = null;
		PreparedStatement prestmt =null;
		boolean result = false;
		int participate_bbs_no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select nvl(max(participate_bbs_nid),0)+1 from READER_PARTICIPATE_BBS where question_nid=1";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				participate_bbs_no = rs.getInt(1);
			}
			stmt.close();
			
			sql="insert into READER_PARTICIPATE_BBS "
				   + " (question_nid, participate_bbs_nid, writer, bbs_pass, bbs_cellphone, bbs_email,"
				   + " begin_contents, bbs_title, bbs_contents, hit, regi_dt, status_no)" 
				   + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, sysdate, 1)"; 			
			
			int index = 1;					
			//prestmt =(OraclePreparedStatement) con.prepareStatement(sql);
			prestmt =  con.prepareStatement(sql);
			prestmt.setInt(index++,pnb.getQuestionNo());
			prestmt.setInt(index++,participate_bbs_no);
			prestmt.setString(index++,pnb.getWriter());
			prestmt.setString(index++,pnb.getBbs_pass());
			prestmt.setString(index++,pnb.getBbs_cellphone());
			prestmt.setString(index++,pnb.getBbs_email());
			prestmt.setString(index++,pnb.getBegin_title());
			prestmt.setString(index++,pnb.getBbs_title());
			//prestmt.setStringForClob(index++,pnb.getBbs_contents());
			prestmt.setString(index++,pnb.getBbs_contents());
			
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
	
	/**
	 * 사보 독자 참여 게시판 수정
	 * @param pnb
	 * @return
	 */
	public boolean updateParticipateBbs(ParticipateNewBean pnb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update READER_PARTICIPATE_BBS set " +
					"writer = ?, bbs_pass = ?, bbs_cellphone = ?, bbs_email = ?, " +
					"begin_contents = ?, bbs_title = ?, bbs_contents = ? ,modi_dt = sysdate ";
			sql += " where question_nid=? and participate_bbs_nid=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,pnb.getWriter());
			prestmt.setString(index++,pnb.getBbs_pass());
			prestmt.setString(index++,pnb.getBbs_cellphone());
			prestmt.setString(index++,pnb.getBbs_email());
			prestmt.setString(index++,pnb.getBegin_title());
			prestmt.setString(index++,pnb.getBbs_title());
			prestmt.setString(index++,pnb.getBbs_contents());
			prestmt.setInt(index++,pnb.getQuestionNo());
			prestmt.setInt(index++,pnb.getParticipate_bbs_seq());
			
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
	
	/**
	 * 사보 독자 참여 게시판 삭제
	 * @param pnb
	 * @return
	 */
	public boolean deleteParticipateBbs(ParticipateNewBean pnb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update READER_PARTICIPATE_BBS set " +
					"status_no = -1, modi_dt = sysdate ";
			sql += " where question_nid=? and participate_bbs_nid=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,pnb.getQuestionNo());
			prestmt.setInt(index++,pnb.getParticipate_bbs_seq());
			
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
	
	/**
	 * 사보 독자 참여 게시판 비밀번호 체크 카운트
	 * @param question_nid
	 * @return
	 */
	public int bbs_pass_check(ParticipateNewBean pnb) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from READER_PARTICIPATE_BBS");
        query.append(" where status_no > 0 ");
        query.append(" and question_nid = ? ");
        query.append(" and participate_bbs_nid = ? ");
        query.append(" and bbs_pass = ? ");
		try {
			con = DBUtil.getConnection();
			
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1, pnb.getQuestionNo());
		    prestmt.setInt(2,pnb.getParticipate_bbs_seq());
		    prestmt.setString(3, pnb.getBbs_pass());
		    
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
	
	/**
	 * 사보독자참여게시판 - 질문 상세 
	 * @param question_nid
	 * @return
	 */
	public ParticipateBean getParticipateQuestion(int question_nid){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ParticipateBean pb = new ParticipateBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select question_nid,question_contents from PARTICIPATE_QUESTION where question_nid=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,question_nid);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				pb.setQuestion_nid(rs.getInt("question_nid"));
				pb.setQuestion_contents(rs.getString("question_contents"));
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
	
	
	/**
	 * 사보 독자 참여 게시판 리스트
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList<ParticipateBean> getParticipateBbsList(int page, int pageSize,int question_nid , String schType, String schText) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<ParticipateBean> result = new ArrayList<ParticipateBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
 		
 		String searchQuery = "";
 		if (schType != null && !schType.equals("")) {
 			searchQuery = schType + " like '%" + schText + "%'";
 		}
 		
       // query.append("select participate_bbs_nid, writer, bbs_pass, bbs_cellphone, bbs_email,begin_contents,bbs_title, bbs_contents, hit, date_format(regi_dt,'%Y-%m-%d') as regi_dt,modi_dt,status_no ");
 		query.append(" SELECT * FROM ( ");
 		query.append("select participate_bbs_nid, writer, bbs_pass, bbs_cellphone, bbs_email,begin_contents,bbs_title, bbs_contents, hit, TO_CHAR(regi_dt,'YYYY-MM-DD') as regi_dt,modi_dt,status_no , ROW_NUMBER() OVER(ORDER BY participate_bbs_nid desc) AS PAGE_NO ");
        query.append(" from READER_PARTICIPATE_BBS");
        query.append(" where status_no > 0 ");
        query.append(" and question_nid = ? ");
        if(!searchQuery.equals("")) query.append(" and " + searchQuery + "");
        //query.append(" order by participate_bbs_nid desc limit ?, ?");
        query.append(" order by participate_bbs_nid desc ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, question_nid);
			prestmt.setInt(2, (page-1) * pageSize);
			prestmt.setInt(3,page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				ParticipateBean pb = new ParticipateBean();
				pb.setParticipate_bbs_nid(rs.getInt("participate_bbs_nid"));
				pb.setWriter(rs.getString("writer")); 
				pb.setBbs_pass(rs.getString("bbs_pass"));
				pb.setBbs_cellphone(rs.getString("bbs_cellphone"));
				pb.setBbs_email(rs.getString("bbs_email"));
				pb.setBegin_title(rs.getString("begin_contents"));
				pb.setBbs_title(rs.getString("bbs_title"));
				pb.setBbs_contents(rs.getString("bbs_contents"));
				pb.setHit(rs.getInt("hit"));
				pb.setRegi_dt(rs.getDate("regi_dt"));
				pb.setModi_dt(rs.getDate("modi_dt"));
				pb.setStatus_no(rs.getInt("status_no"));
				result.add(pb);
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
	
	/**
	 * 사보 독자 참여 게시판 리스트 카운트
	 * @param question_nid
	 * @return
	 */
	public int getParticipateBbsListCount(int question_nid, String schType, String schText) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 	

 		String searchQuery = "";
 		if (schType != null && !schType.equals("")) {
 			searchQuery = schType + " like '%" + schText + "%'";
 		}
 		
        query.append("select count(*) ");
        query.append(" from READER_PARTICIPATE_BBS");
        query.append(" where status_no > 0 ");
        query.append(" and question_nid = ? ");
        if(!searchQuery.equals("")) query.append(" and " + searchQuery + "");
		try {
			con = DBUtil.getConnection();
			
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1, question_nid);
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
	
	/**
	 * 사보 독자 참여 게시판 상세 
	 * @param questionSeq
	 * @param participateSeq
	 * @return
	 * @throws Exception
	 */
	public HashMap getParticipateBbsInfo(int questionSeq,int participateSeq) throws Exception{
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		HashMap hash = new HashMap();	
			
		try {
			con = DBUtil.getConnection();			
			
			String sql = " select ";
			sql = sql+ "   	question_nid,participate_bbs_nid, writer, bbs_pass, bbs_cellphone, ";
			sql = sql+ "   	bbs_email,begin_contents, bbs_title, bbs_contents, hit,  ";
			sql = sql+ "   	to_char(regi_dt,'YYYY-MM-DD') as regi_dt, to_char(modi_dt,'YYYY-MM-DD') as modi_dt ";
			sql = sql+ "    from READER_PARTICIPATE_BBS  ";
			sql = sql+ "    where status_no > 0  ";
			sql = sql+ "    and question_nid = ?  ";
			sql = sql+ "    and participate_bbs_nid = ?  ";
			
			prestmt = con.prepareStatement(sql);
			int index=1;
			
			prestmt.setInt(index++, questionSeq);
			prestmt.setInt(index++, participateSeq);
			
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				
				hash.put("QUESTION_NID", rs.getInt("question_nid"));
				hash.put("PARTICIPATE_BBS_NID", rs.getInt("participate_bbs_nid"));

				hash.put("WRITER", rs.getString("writer"));
				hash.put("BBS_PASS", rs.getString("bbs_pass"));
				hash.put("BBS_CELLPHONE", rs.getString("bbs_cellphone"));
				hash.put("BBS_EMAIL", rs.getString("bbs_email"));
				hash.put("BBS_TITLE", rs.getString("bbs_title"));
				hash.put("BEGIN_TITLE", rs.getString("begin_contents"));
				hash.put("BBS_CONTENTS", rs.getString("bbs_contents"));
				hash.put("REGI_DT", rs.getString("regi_dt"));
				
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
