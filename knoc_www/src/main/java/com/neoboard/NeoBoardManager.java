package com.neoboard;

import java.io.CharArrayReader;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Date;
import java.util.Vector;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.util.DateUtil;

import com.neoboard.data.*;
import com.neoboard.jdbc.*;
import com.neoboard.session.UserSession;
import com.neoboard.tags.JUtil;
import com.neoboard.util.MD5class;
import com.neoboard.util.MySqlFunction;



/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class NeoBoardManager {
    /**
     * 자기 글인지 검사
     * @param boardID
     * @param num
     * @param userID
     * @return
     */
    public boolean checkMyArticle(String boardID, String num, String userID){
    	Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		boolean result = false;
		try {
			con = DBUtil.getConnection();
			/* 게시물 쿼리 */
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("select id from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(boardID.toUpperCase());
		    queryBuf.append(" where no = ");
		    queryBuf.append(num);
			rs = stmt.executeQuery(queryBuf.toString());
			if(rs.next()) {
				String id = rs.getString(1);
			    if(id!=null) id=id.trim();
			    System.out.println("===id===========>"+id);
			    System.out.println("===userID===========>"+userID);
			    if (id != null && !id.equals("") && !id.equals("guest") && userID != null && !userID.equals("")) {
			    //if (id != null && !id.equals("")  && userID != null && !userID.equals("")) {
				    if(id.equals(userID)) {
				        result = true;
				    }
				    else {
				        result = false;
				    }
				} else {
					result = false;
				}
			}
			else {
			    result = false;
			}
			if(rs != null) rs.close(); rs = null;
			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }

    /**
     * 자기글인지 검사 추가 20130528
     * @param boardID
     * @param num
     * @param userID
     * @param virtualNo
     * @return
     */
    public boolean checkMyArticleNew(String boardID, String num, String userID, String p_virtualno){
    	Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		boolean result = false;
		try {
			con = DBUtil.getConnection();
			/* 게시물 쿼리 */
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("select id, virtualNo from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(boardID.toUpperCase());
		    queryBuf.append(" where no = ");
		    queryBuf.append(num);
			rs = stmt.executeQuery(queryBuf.toString());
			if(rs.next()) {
				String id = rs.getString(1);
			    if(id!=null) id=id.trim();
			    String virtualno = rs.getString(2);
			    if(virtualno!=null) virtualno=virtualno.trim();

			    if(id != null && id.length() > 0){
			    	if("guest".equals(id)){
			    		if(p_virtualno != null && p_virtualno.length() > 0
			    				&& virtualno != null && virtualno.length() > 0
			    				&& p_virtualno.equals(virtualno)
			    				){
			    			result = true;
			    		}else{
			    			result = false;
			    		}
			    	}else{
			    		if(userID != null && userID.length() > 0){
			    			if(id.equals(userID)) {
						        result = true;
						    }
						    else {
						        result = false;
						    }
			    		}else{
			    			result = false;
			    		}
			    	}
			    }else{
			    	result = false;
			    }

			}else{
			    result = false;
			}
			if(rs != null) rs.close(); rs = null;
			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }

    /**
     * 자기 댓글인지 검사
     * @param boardID
     * @param num
     * @param cno
     * @param userID
     * @return
     */
    public boolean checkMyComment(String boardID, String num, String cno, String userID){
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		boolean result = false;
		try {
			con = DBUtil.getConnection();
			/* 게시물 쿼리 */
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("select id from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(boardID.toUpperCase());
		    queryBuf.append("CMT");
		    queryBuf.append(" where no = ");
		    queryBuf.append(cno);
		    queryBuf.append(" and bno = ");
		    queryBuf.append(num);
			rs = stmt.executeQuery(queryBuf.toString());
			if(rs.next()) {
			    String id = rs.getString(1);
			    if(id.equals(userID)) {
			        result = true;
			    }
			    else {
			        result = false;
			    }
			}
			else {
			    result = false;
			}
			if(rs != null) rs.close(); rs = null;
			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }

    public String checkId(String boardID, String num){
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String id = "";
		try {
			con = DBUtil.getConnection();

			/* 게시물 쿼리 */
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("select id from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(boardID.toUpperCase());
		    queryBuf.append(" where no = ");
		    queryBuf.append(num);
			rs = stmt.executeQuery(queryBuf.toString());
			if(rs.next()) {
			    id = rs.getString(1);
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
        return id;
    }

    public int checkNo(String boardID, String num){
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int no = 0;
		try {
			con = DBUtil.getConnection();
			/* 게시물 쿼리 */
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("select no, ref, reflevel, secret from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(boardID.toUpperCase());
		    queryBuf.append(" where no = ");
		    queryBuf.append(num);
			rs = stmt.executeQuery(queryBuf.toString());
			if(rs.next()) {
			    no = rs.getInt(1);
			    int ref = rs.getInt(2);
			    int reflevel = rs.getInt(3);
			    String secret = rs.getString(4);
			    if (secret.equals("1") && reflevel > 0) {
				    no = ref;
				}
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
        return no;
    }

    /**
     * 코멘트 숫자 업뎃
     * @param property
     * @param articleNo
     */
    public void adjustCommentCount(Property property , int articleNo) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();

			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("update ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(property.getBoardID());
		    queryBuf.append(" set CMTCNT = ");
		    queryBuf.append("	(select count(no) from ");
		    queryBuf.append(	Property.TABLE_PREFIX);
		    queryBuf.append(	property.getBoardID());
		    queryBuf.append("CMT where bno = ");
		    queryBuf.append(	articleNo);
		    queryBuf.append("	) ");
		    queryBuf.append(" where no = ");
		    queryBuf.append(articleNo);

		    stmt.executeUpdate(queryBuf.toString());

			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }
    /**
     * 조회수 증가
     * @param property
     * @param articleNo
     */
    public void increaseHitCount(Property property , int articleNo) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getConnection();
			/* 파일 정보 쿼리 */

			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();

			queryBuf.setLength(0);
		    queryBuf.append("update ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(property.getBoardID());
		    queryBuf.append(" set HITCNT = HITCNT + 1");
		    queryBuf.append(" where no = ");
		    queryBuf.append(articleNo);

		    stmt.executeUpdate(queryBuf.toString());

			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }
    /**
     * 첨부화일 다운로드 카운트 증가
     * @param property
     * @param articleNo
     * @param fileNo
     */
    public void increaseDownCount(Property property , int articleNo, int fileNo){
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		try {
			con = DBUtil.getConnection();
			/* 파일 정보 쿼리 */

			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("update ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(property.getBoardID());
		    queryBuf.append("FILE");
		    queryBuf.append(" set DOWNCNT = DOWNCNT + 1");
		    queryBuf.append(" where no = ");
		    queryBuf.append(fileNo);
		    queryBuf.append(" and bno = ");
		    queryBuf.append(articleNo);

		    stmt.executeUpdate(queryBuf.toString());

		    queryBuf.setLength(0);
		    queryBuf.append("update ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(property.getBoardID());
		    queryBuf.append(" set DOWNCNT = DOWNCNT + 1");
		    queryBuf.append(" where no = ");
		    queryBuf.append(articleNo);

		    stmt.executeUpdate(queryBuf.toString());

			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }
    /**
     * 첨부 화일 쿼리
     * @param property
     * @param articleNo
     * @param fileNo
     * @return
     */
    public AttachFile getAttachFile(Property property , int articleNo, int fileNo){
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		AttachFile attachFile = null;
		try {
			con = DBUtil.getConnection();
			/* 파일 정보 쿼리 */
			int index = 1;
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("select * from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(property.getBoardID());
		    queryBuf.append("FILE");
		    queryBuf.append(" where no = ");
		    queryBuf.append(fileNo);
		    queryBuf.append(" and bno = ");
		    queryBuf.append(articleNo);
		    rs = stmt.executeQuery(queryBuf.toString());
		    if(rs.next()){
		        index = 1;
		        attachFile = new AttachFile();
		        attachFile.setNo(rs.getInt(index++));
		        attachFile.setBno(rs.getInt(index++));
		        attachFile.setFileName(rs.getString(index++));
		        attachFile.setFileSize(rs.getLong(index++));
			    attachFile.setDowncnt(rs.getInt(index++));
			    attachFile.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(index++));
			    attachFile.setState(rs.getString(index++));
			    attachFile.setFolder(rs.getString(index++));
			    attachFile.setNewFileName(rs.getString(index++));
			    attachFile.setBun(rs.getString(index++));

		    }

			if(rs != null) rs.close(); rs = null;
			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return attachFile;
    }
    /**
     * 댓글 삭제
     * @param property
     * @param commentNo
     * @param userID
     * @param passwd
     * @param isManager  : 관리자 유무
     * @param isCheckMyId  : 아이디검사
     * @return
     */
    public boolean deleteComment(Property property, int commentNo,
            String userID, String passwd ,boolean isManager, boolean isCheckMyId) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + property.getBoardID() + "CMT";
        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("delete from ");
        queryBuf.append(tableName);
        queryBuf.append(" where no = ?");

        passwd = getMd5Passwd(passwd);

		try {
			con = DBUtil.getConnection();
			if(!isManager && !isCheckMyId){
				/* 아이디 또는 비밀번호 검사 */
			    // 비밀번호 검사
			    stmt = con.createStatement();
			    rs = stmt.executeQuery("select passwd from " + tableName + " where no = " + new Integer(commentNo).toString());
			    if(rs.next()) {
			        String qPwd = rs.getString(1);
			        if(qPwd!= null) {
			            if(!qPwd.equals(passwd)) {
			                return false;
			            }
			        }
			        else {
			            return false;
			        }
			    }
			    else {
			        return false;
			    }
			    rs.close(); rs = null;
			    stmt.close(); stmt = null;
			}

			stmt = con.createStatement();
			rs = stmt.executeQuery("select bno from " + Property.TABLE_PREFIX + property.getBoardID() + "CMT where no = " + Integer.toString(commentNo));
			int articleNo = 0;
			if(rs.next()) {
			    articleNo = rs.getInt(1);
			}
			rs.close(); rs = null;

			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setInt(1,commentNo);
			prestmt.executeUpdate();
			prestmt.close();

			queryBuf.setLength(0);
			queryBuf.append("update ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(property.getBoardID());
		    queryBuf.append(" set CMTCNT = ");
		    queryBuf.append("	(select count(*) from ");
		    queryBuf.append( tableName );
		    queryBuf.append(" where bno = ");
		    queryBuf.append(Integer.toString(articleNo));
		    queryBuf.append("	) ");
		    queryBuf.append(" where no = ");
		    queryBuf.append(Integer.toString(articleNo));

		    stmt.executeUpdate(queryBuf.toString());

			stmt.close(); stmt = null;
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 비밀번호체킹
     */
    public boolean checkPasswd(String BoardID, String passwd, int commentNo) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		String tableName = Property.TABLE_PREFIX + BoardID;
		passwd = getMd5Passwd(passwd);

		try {
			con = DBUtil.getConnection();

			// 비밀번호 검사
		    stmt = con.createStatement();
		    rs = stmt.executeQuery("select passwd from " + tableName + " where no = " + new Integer(commentNo).toString());
		    if(rs.next()) {
		        String qPwd = rs.getString(1);
		        if(qPwd!= null) {
		        	System.out.println(qPwd);
		            if(!qPwd.trim().equals(passwd)) {
		                return false;
		            }
		        }
		        else {
		            return false;
		        }
		    }
		    else {
		        return false;
		    }
		    rs.close(); rs = null;
		    stmt.close(); stmt = null;

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 비밀번호체킹2 (게시글 사용자 CI체크 추가)
     */
    public boolean checkPasswd2(String BoardID, String passwd, String vno, int commentNo) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		String tableName = Property.TABLE_PREFIX + BoardID;
		passwd = getMd5Passwd(passwd);

		try {
			con = DBUtil.getConnection();

			// 비밀번호 검사
		    stmt = con.createStatement();
		    rs = stmt.executeQuery("select passwd, virtualno from " + tableName + " where no = " + new Integer(commentNo).toString());
		    if(rs.next()) {
		        String qPwd = rs.getString(1);
		        String vPwd = rs.getString(2);
		        if(qPwd!= null) {
		        	System.out.println(qPwd);
		            if(!qPwd.trim().equals(passwd)) {
		                return false;
		            }
		        }
		        if(vPwd!= null) {
		        	//System.out.println(qPwd);
		            if(!vPwd.trim().equals(vno)) {
		                return false;
		            }
		        }
		        else {
		            return false;
		        }
		    }
		    else {
		        return false;
		    }
		    rs.close(); rs = null;
		    stmt.close(); stmt = null;

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 덧글 입력
     * @param property
     * @param cmt
     * @return
     */
    public boolean addComment(Property property, Comment cmt) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + property.getBoardID() + "CMT";
        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("insert into ");
        queryBuf.append(tableName);
        queryBuf.append(" (no, bno, id, name, passwd, coment, ip, regdate) ");
        //queryBuf.append("values(?,?,?,?,md5(password('"+cmt.getPasswd()+"')),?,?,sysdate)");
        queryBuf.append("values(?,?,?,?,'"+ getMd5Passwd(cmt.getPasswd())+"',?,?,sysdate)");

		try {
			con = DBUtil.getConnection();
			/* MAX(no) 쿼리 */
			String query = "select MAX(no) from " + tableName;
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()){
			    cmt.setNo(rs.getInt(1) + 1);
			}
			else {
			    cmt.setNo(1);
			}
			rs.close(); rs = null;
			stmt.close(); stmt = null;

			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setInt(1,cmt.getNo());
			prestmt.setInt(2,cmt.getBno());
			prestmt.setString(3,cmt.getId());
			prestmt.setString(4,cmt.getName());
			prestmt.setString(5,cmt.getComment());
			prestmt.setString(6,cmt.getIp());
			//prestmt.setString(8,cmt.getRegDateString("yyyy-MM-dd HH:mm:ss"));
			prestmt.executeUpdate();

			prestmt.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }
    /**
     * 게시물 답변
     * @param property
     * @param articleNo
     * @param reply
     * @return
     */
    public int replyArticle(Property property , int articleNo, Article reply ) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
		String fileTableName = tableName + "FILE";
        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("insert into ");
        queryBuf.append(tableName);
        queryBuf.append(" (no, ref, refstep, reflevel, id, name, passwd, subject, email, content, ip, regdate, hitcnt, cmtcnt, filecnt, downcnt, html, notice, secret, grp, editdate, phone, zipcode, addr1, addr2, is_delete, rss_yn, url, virtualno) ");
        //queryBuf.append("values(?,?,?,?,?,?,md5(password('"+reply.getPasswd()+"')),?,?,?,?,sysdate,?,?,?,?,?,?,?,?,sysdate,?,?,?,?,'N',?,?,?)");
        queryBuf.append("values(?,?,?,?,?,?, '"+getMd5Passwd(reply.getPasswd())+"',?,?,?,?,sysdate,?,?,?,?,?,?,?,?,sysdate,?,?,?,?,'N',?,?,?)");
        System.out.println(queryBuf.toString());
        int result = 0;
        String replyQuery = "select ref,refstep,reflevel,notice,secret from " + tableName + " where no = " + new Integer(articleNo).toString();
		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
			/* MAX(no) 쿼리 */
			String query = "select MAX(no) from " + tableName;
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()){
			    reply.setNo(rs.getInt(1) + 1);
			}
			else {
			    reply.setNo(1);
			}
			result = reply.getNo();

			rs.close(); rs = null;
			rs = stmt.executeQuery(replyQuery);
			if(rs.next()) {
			    reply.setRef(rs.getInt(1));
			    reply.setRefStep(rs.getInt(2)+1);
			    reply.setRefLevel(rs.getInt(3)+1);
			    reply.setNotice(rs.getString(4));
			    if (!reply.getSecret().equals("1"))reply.setSecret(rs.getString(5));
			}
			else {
			    reply.setRef(1);
			    reply.setRefStep(1);
			    reply.setRefLevel(0);
			}
			rs.close(); rs = null;

			String adjustsql = "update " + tableName + " set refstep = refstep + 1 where ref = ? and refstep > ?";
			prestmt = con.prepareStatement(adjustsql);
			prestmt.setInt(1,reply.getRef());
			prestmt.setInt(2,reply.getRefStep()-1);
			prestmt.executeUpdate();
			prestmt.close(); prestmt = null;

			int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setInt(index++,reply.getNo());
			prestmt.setInt(index++,reply.getRef());
			prestmt.setInt(index++,reply.getRefStep());
			prestmt.setInt(index++,reply.getRefLevel());
			prestmt.setString(index++,reply.getId());
			prestmt.setString(index++,reply.getName());
			prestmt.setString(index++,reply.getSubject());
			prestmt.setString(index++,reply.getEmail());
			prestmt.setString(index++,reply.getContent());
			prestmt.setString(index++,reply.getIp());
			prestmt.setInt(index++,reply.getHitcnt());
			prestmt.setInt(index++,reply.getCmtcnt());
			prestmt.setInt(index++,reply.getFilecnt());
			prestmt.setInt(index++,reply.getDowncnt());
			prestmt.setString(index++,reply.getHtml());
			prestmt.setString(index++,reply.getNotice());
			prestmt.setString(index++,reply.getSecret());
			prestmt.setString(index++,reply.getGrp());
			prestmt.setString(index++,reply.getPhone());
			prestmt.setString(index++,reply.getZipcode());
			prestmt.setString(index++,reply.getAddr1());
			prestmt.setString(index++,reply.getAddr2());
			prestmt.setString(index++,reply.getRssYn());
			prestmt.setString(index++,reply.getUrl());
			prestmt.setString(index++,reply.getVirtualno());
			System.out.println(prestmt);
			prestmt.executeUpdate();

			prestmt.close();
			prestmt = null;

			/* AttachFile insert */
			AttachFiles attachFiles = reply.getFiles();
			if(attachFiles != null) {
			    prestmt = con.prepareStatement("insert into " + fileTableName + " values(?,?,?,?,?,sysdate,?,?,?,?)");
				for( int i = 0 ; i < attachFiles.size(); i++) {
				    AttachFile attachFile = attachFiles.getAttachFile(i);
				    attachFile.setBno(reply.getNo());
				    /* 최대 번호 구함 */
				    rs = stmt.executeQuery("select max(no) from " + fileTableName);
				    if(rs.next()) {
				        attachFile.setNo(rs.getInt(1) + 1);
				    }
				    else {
				        attachFile.setNo(1);
				    }
				    rs.close(); rs = null;
				    /* 입력 */
				    prestmt.setInt(1,attachFile.getNo());
				    prestmt.setInt(2,attachFile.getBno());
				    prestmt.setString(3,attachFile.getFileName());
				    prestmt.setLong(4,attachFile.getFileSize());
				    prestmt.setInt(5,attachFile.getDowncnt());
				    prestmt.setString(6,"1");
				    prestmt.setString(7,property.getBoardID());
				    prestmt.setString(8,attachFile.getNewFileName());
				    prestmt.setString(9,attachFile.getBun());

				    prestmt.executeUpdate();
				}

			}
			stmt.close(); stmt = null;

			/* 검색 등록 */
			if (property.getUseSearch().equals("1")) {
				addBoardSearch(property,reply);
			}

			con.commit();

		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		    result = 0;
		} finally {
			try {  if (rs != null) rs.close(); } catch(Exception e){}
			try {	con.setAutoCommit(true); } catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
		return result;
    }

   /**
    * 게시물 삭제
    * @param property
    * @param articleNo
    * @param qUserID
    * @param qPasswd
    * @param isMaster
    * @return
    */
    public boolean deleteArticle(Property property, int articleNo, String qUserID, String qPasswd, boolean isMaster, String ip) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
		String fileTableName = tableName + "FILE";
		String cmtTableName = tableName + "CMT";
        StringBuffer queryBuf = new StringBuffer();
        String qId = "";
        qPasswd = getMd5Passwd(qPasswd);

        try {
        	con = DBUtil.getConnection();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			/* 사용자 검사 */

			if(!isMaster) {
				if(property.getUseAuth().equals("1")) {
				    // 아이디 검사
				    rs = stmt.executeQuery("select id, passwd from " + tableName + " where no = " + new Integer(articleNo).toString());
				    if(rs.next()) {
				        qId = rs.getString(1);
				        String qPwd = rs.getString(2);
				        if(qId!= null) {
				        	if (qId.equals("guest")) {
				        		if(qPwd!= null) {
						            if(!qPwd.equals(getMd5Passwd(qPasswd))) {
						                return false;
						            }
						        }
						        else {
						            return false;
						        }
				        	} else if(!qId.equals(qUserID)) {
				                return false;
				            }
				        }
				        else {
				            return false;
				        }
				    }
				    else {
				        return false;
				    }
				    rs.close(); rs = null;
				}
				else {
				    // 비밀번호 검사
				    rs = stmt.executeQuery("select passwd, id from " + tableName + " where no = " + new Integer(articleNo).toString());
				    if(rs.next()) {
				        String qPwd = rs.getString(1);
				        qId = rs.getString(2);
				        if(qPwd!= null) {
				            if(!qPwd.equals(qPasswd)) {
				                return false;
				            }
				        }
				        else {
				            return false;
				        }
				    }
				    else {
				        return false;
				    }
				    rs.close(); rs = null;
				}
			}

			/* 코멘트 삭제 */
			queryBuf.setLength(0);
		    queryBuf.append("delete from ");
		    queryBuf.append(cmtTableName);
		    queryBuf.append(" where bno = ");
		    queryBuf.append(articleNo);
		    //stmt.executeUpdate(queryBuf.toString());

			/* 파일 삭제 */
			Vector deletedFileNames = null;
			deletedFileNames = new Vector();
			//파일 이름 검색
		    queryBuf.setLength(0);
		    queryBuf.append("select new_filename from ");
		    queryBuf.append(fileTableName);
		    queryBuf.append(" where bno = ");
		    queryBuf.append(articleNo);
		    rs = stmt.executeQuery(queryBuf.toString());
		    while(rs.next()) {
		        deletedFileNames.add(rs.getString(1));
		    }
		    queryBuf.setLength(0);
		    queryBuf.append("delete from ");
		    queryBuf.append(fileTableName);
		    queryBuf.append(" where bno = ");
		    queryBuf.append(articleNo);
		    //stmt.executeUpdate(queryBuf.toString());

			/* 게시물 삭제 */
		    queryBuf.setLength(0);
		    queryBuf.append("select refstep, reflevel, id, name from ");
		    queryBuf.append(tableName);
		    queryBuf.append(" where no = ");
		    queryBuf.append(articleNo);
		    rs = stmt.executeQuery(queryBuf.toString());
		    int refstep = 0;
		    int reflevel = 0;
		    String id = "";
		    String name = "";
		    if(rs.next()) {
		        refstep = rs.getInt(1);
		        reflevel = rs.getInt(2);
		        id = rs.getString(3);
		        name = rs.getString(4);
		    }
		    queryBuf.setLength(0);
		    queryBuf.append("update " + tableName + " set is_delete='Y' ");
		    queryBuf.append(" where no = ");
		    queryBuf.append(articleNo);
		    stmt.executeUpdate(queryBuf.toString());

		    queryBuf.setLength(0);
		    queryBuf.append("update " + tableName + " set is_delete='Y' ");
		    queryBuf.append(" where ref = ");
		    queryBuf.append(articleNo);
		    queryBuf.append(" and refstep > ");
		    queryBuf.append(refstep);
		    queryBuf.append(" and reflevel > ");
		    queryBuf.append(reflevel);
		    stmt.executeUpdate(queryBuf.toString());

			stmt.close(); stmt = null;

			/* 검색 삭제 */
			if (property.getUseSearch().equals("1")) {
				deleteBoardSearch(property,articleNo,"Y");
			}

			// 로그삽입
		    StringBuffer queryBufLog = new StringBuffer();
			queryBufLog.append("insert into ");
			queryBufLog.append("NEOBOARDLOG");
			queryBufLog.append(" (BOARDID, BNO, LOGNO, LOGQUERY, USERID, USERNAME, LOGREGDT, IP) ");
			queryBufLog.append("values(?,?,?,?,?,?,sysdate,?)");

			/* MAX(no) 쿼리 */
			String queryLog = "select MAX(LOGNO) from NEOBOARDLOG";
			stmt = con.createStatement();
			rs = stmt.executeQuery(queryLog);
			int logno = 0;
			if(rs.next()){
			    logno = rs.getInt(1) + 1;
			}
			else {
				logno = 1;
			}
			rs.close(); rs = null;

			int index = 1;
			prestmt = con.prepareStatement(queryBufLog.toString());
			prestmt.setString(index++,property.getBoardID());
			prestmt.setInt(index++,articleNo);
			prestmt.setInt(index++,logno);
			prestmt.setString(index++,"D");
			prestmt.setString(index++,id);
			prestmt.setString(index++,name);
			prestmt.setString(index++,ip);
			prestmt.executeUpdate();

			prestmt.close();

			con.commit();

			/* 디비 성공시에 파일 삭제 */
			if( deletedFileNames != null ) {
				String path = Property.UPLOAD_ROOT + "/" + property.getBoardID() + "/";
				for(int i = 0 ; i < deletedFileNames.size();i++) {
				    File dfile = new File(path + (String)deletedFileNames.get(i));
				    if(dfile.exists() && dfile.isFile()) {
				        //dfile.delete();
				    }
				}
			}

			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		    return false;
		} finally {
			try { if (rs != null) rs.close(); }catch(Exception e) {}
			try { con.setAutoCommit(true); } catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }
    /**
     *
     * @param property
     * @param editted
     * @param isMaster
     * @param deletingFileNo
     * @return
     */
    public boolean editArticle(Property property, Article editted, String qUserID, String qPasswd, boolean isMaster, String[] deletingFileNo) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
		String fileTableName = tableName + "FILE";
        StringBuffer queryBuf = new StringBuffer();

        queryBuf.append("update ");
        queryBuf.append(tableName);
        queryBuf.append(" set subject = ?, name=?, content = ? ,email = ?, html = ? ,Filecnt = (select count(*) from " + fileTableName + " where bno = ? ), notice = ? , secret = ?, grp = ?, phone=?, zipcode=?, addr1=?, addr2=?, editDate=sysdate, rss_yn=?, url=? ");
        queryBuf.append(" where no = ?");

        try {
        	con = DBUtil.getConnection();
			con.setAutoCommit(false);

			/* 사용자 검사 */
			if(!isMaster) {
				if(property.getUseAuth().equals("1")) {
				    // 아이디 검사
				    stmt = con.createStatement();
				    rs = stmt.executeQuery("select id, passwd from " + tableName + " where no = " + new Integer(editted.getNo()).toString());
				    if(rs.next()) {
				        String qId = rs.getString(1);
				        String qPwd = rs.getString(2);
				        if(qId!= null) {
				        	if (qId.equals("guest")) {
				        		if(qPwd!= null) {
						            if(!qPwd.equals(getMd5Passwd(qPasswd))) {
						                return false;
						            }
						        }
						        else {
						            return false;
						        }
				        	} else if(!qId.equals(qUserID)) {
				                return false;
				            }
				        }
				        else {
				            return false;
				        }
				    }
				    else return false;
				    rs.close(); rs = null;
				    stmt.close(); stmt = null;
				}
				else {
				    // 비밀번호 검사
				    stmt = con.createStatement();
				    rs = stmt.executeQuery("select passwd from " + tableName + " where no = " + new Integer(editted.getNo()).toString());
				    if(rs.next()) {
				        String qPwd = rs.getString(1);
				        if(qPwd!= null) {
				            if(!qPwd.equals(getMd5Passwd(qPasswd))) {
				                return false;
				            }
				        }
				        else {
				            return false;
				        }
				    }
				    else return false;
				    rs.close(); rs = null;
				    stmt.close(); stmt = null;
				}
			}

			/* 파일 입력 */
			stmt = con.createStatement();
			AttachFiles attachFiles = editted.getFiles();
			if(attachFiles != null) {
			    prestmt = con.prepareStatement("insert into " + fileTableName + " values(?,?,?,?,?,sysdate,?,?,?,?)");
				for( int i = 0 ; i < attachFiles.size(); i++) {
				    AttachFile attachFile = attachFiles.getAttachFile(i);
				    attachFile.setBno(editted.getNo());
				    /* 최대 번호 구함 */
				    rs = stmt.executeQuery("select max(no) from " + fileTableName);
				    if(rs.next()) {
				        attachFile.setNo(rs.getInt(1) + 1);
				    }
				    else {
				        attachFile.setNo(1);
				    }
				    rs.close(); rs = null;
				    /* 입력 */
				    prestmt.setInt(1,attachFile.getNo());
				    prestmt.setInt(2,attachFile.getBno());
				    prestmt.setString(3,attachFile.getFileName());
				    prestmt.setLong(4,attachFile.getFileSize());
				    prestmt.setInt(5,attachFile.getDowncnt());
				    prestmt.setString(6,"1");
				    prestmt.setString(7,property.getBoardID());
				    prestmt.setString(8,attachFile.getNewFileName());
				    prestmt.setString(9,attachFile.getBun());
				    prestmt.executeUpdate();
				}
			}
			if(prestmt != null) { prestmt.close(); prestmt = null; }

			Vector deletedFileNames = null;
			if(deletingFileNo!=null) {

				/* 파일 삭제 */
				StringBuffer fileDeleteQuery = new StringBuffer();
				deletedFileNames = new Vector(deletingFileNo.length);
				for(int i = 0 ; i < deletingFileNo.length ; i++) {
				    if(deletingFileNo[i] == null) continue;
				    /* 파일 이름 검색 */

				    fileDeleteQuery.setLength(0);
				    fileDeleteQuery.append("select new_filename from ");
				    fileDeleteQuery.append(fileTableName);
				    fileDeleteQuery.append(" where no = ");
				    fileDeleteQuery.append(deletingFileNo[i]);
				    fileDeleteQuery.append(" and bno = ");
				    fileDeleteQuery.append(editted.getNo());
				    rs = stmt.executeQuery(fileDeleteQuery.toString());
				    if(rs.next()) {
				        deletedFileNames.add(rs.getString(1));
				    }
				    /* DB 삭제 */
				    fileDeleteQuery.setLength(0);
				    fileDeleteQuery.append("delete from ");
				    fileDeleteQuery.append(fileTableName);
				    fileDeleteQuery.append(" where no = ");
				    fileDeleteQuery.append(deletingFileNo[i]);
				    fileDeleteQuery.append(" and bno = ");
				    fileDeleteQuery.append(editted.getNo());
				    stmt.executeUpdate(fileDeleteQuery.toString());

				}

			}
			stmt.close(); stmt = null;

			/* 게시물 수정 */
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setString(1,editted.getSubject());
			prestmt.setString(2,editted.getName());
			prestmt.setString(3,editted.getContent());
			prestmt.setString(4,editted.getEmail());
			prestmt.setString(5,editted.getHtml());
			prestmt.setInt(6,editted.getNo());
			prestmt.setString(7,editted.getNotice());
			prestmt.setString(8,editted.getSecret());
			prestmt.setString(9,editted.getGrp());
			prestmt.setString(10,editted.getPhone());
			prestmt.setString(11,editted.getZipcode());
			prestmt.setString(12,editted.getAddr1());
			prestmt.setString(13,editted.getAddr2());
			prestmt.setString(14,editted.getRssYn());
			prestmt.setString(15,editted.getUrl());
			prestmt.setInt(16,editted.getNo());

			prestmt.executeUpdate();
			prestmt.close();
			prestmt = null;

			if (property.getBoardType().equals("SANGDAM") && editted.getContGubun() != null && !editted.getContGubun().equals("")) {
				editSangdamArticle(property,editted);
			} else if (property.getBoardType().equals("INFOOPEN")) {
				editInfoArticle(property,editted);
			}

			/* 검색 수정 */
			if (property.getUseSearch().equals("1")) {
				editBoardSearch(property,editted);
			}

			// 로그 업데이트
			StringBuffer queryBufLog = new StringBuffer();
			queryBufLog.append("insert into ");
			queryBufLog.append("NEOBOARDLOG");
			queryBufLog.append(" (BOARDID, BNO, LOGNO, LOGQUERY, USERID, USERNAME, LOGREGDT, IP) ");
			queryBufLog.append("values(?,?,?,?,?,?,sysdate,?)");

			/* MAX(no) 쿼리 */
			String queryLog = "select MAX(LOGNO) from NEOBOARDLOG";
			stmt = con.createStatement();
			rs = stmt.executeQuery(queryLog);
			if(rs.next()){
				editted.setLogNo(rs.getInt(1) + 1);
			}
			else {
				editted.setLogNo(1);
			}
			rs.close(); rs = null;

			int index = 1;
			prestmt = con.prepareStatement(queryBufLog.toString());
			prestmt.setString(index++,property.getBoardID());
			prestmt.setInt(index++,editted.getNo());
			prestmt.setInt(index++,editted.getLogNo());
			prestmt.setString(index++,"U");
			prestmt.setString(index++,editted.getId());
			prestmt.setString(index++,editted.getName());
			prestmt.setString(index++,editted.getIp());
			prestmt.executeUpdate();

			prestmt.close();

			con.commit();

			/* 디비 성공시에 파일 삭제 */
			if( deletedFileNames != null ) {
				String path = Property.UPLOAD_ROOT + "/" + property.getBoardID() + "/";
				for(int i = 0 ; i < deletedFileNames.size();i++) {
				    File dfile = new File(path + (String)deletedFileNames.get(i));
				    if(dfile.exists() && dfile.isFile()) {
				        dfile.delete();
				    }

				    File dfile2 = new File(path + "T" + (String)deletedFileNames.get(i));
				    if(dfile2.exists() && dfile2.isFile()) {
				        dfile2.delete();
				    }
				}
			}

			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		    return false;
		} finally {
			try { if (rs != null) rs.close(); } catch(Exception e){}
			try { con.setAutoCommit(true); }	catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    public void editSangdamArticle(Property property, Article editted) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
        StringBuffer queryBuf = new StringBuffer();

        queryBuf.append("update ");
        queryBuf.append(" NEOBOARDSANGDAM ");
        queryBuf.append(" set cont_gubun = ?, ");
        queryBuf.append(" job = ? ");
        queryBuf.append(" where bno = ? and boardid = ?");

        try {
        	con = DBUtil.getConnection();
			con.setAutoCommit(false);


			/* 게시물 수정 */
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setString(1,editted.getContGubun());
			prestmt.setString(2,editted.getJob());
			prestmt.setInt(3,editted.getNo());
			prestmt.setString(4,property.getBoardID());

			prestmt.executeUpdate();
			prestmt.close();
			prestmt = null;

			con.commit();

		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		} finally {
			try { if (rs != null) rs.close(); } catch(Exception e){}
			try { con.setAutoCommit(true); }	catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }


    public boolean editSangdamArticle(Property property, Article editted, String[] deletingFileNo) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int result = 0;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
		String fileTableName = tableName + "FILE";
        StringBuffer queryBuf = new StringBuffer();

        queryBuf.append("update ");
        queryBuf.append(" NEOBOARDSANGDAM ");
        queryBuf.append(" set status = ?, buse=?, ans_email = ? ,ans_phone = ?, answer = ? , ip=?, regdate=sysdate ");
        queryBuf.append(" where bno = ? and boardid = ?");

        try {
        	con = DBUtil.getConnection();
			con.setAutoCommit(false);

			/* 파일 입력 */
			stmt = con.createStatement();
			AttachFiles attachFiles = editted.getFiles();
			if(attachFiles != null) {
			    prestmt = con.prepareStatement("insert into " + fileTableName + " values(?,?,?,?,?,sysdate,?,?,?,?)");

				for( int i = 0 ; i < attachFiles.size(); i++) {
				    AttachFile attachFile = attachFiles.getAttachFile(i);
				    attachFile.setBno(editted.getNo());
				    /* 최대 번호 구함 */
				    rs = stmt.executeQuery("select max(no) from " + fileTableName);
				    if(rs.next()) {
				        attachFile.setNo(rs.getInt(1) + 1);
				    }
				    else {
				        attachFile.setNo(1);
				    }
				    rs.close(); rs = null;
				    /* 입력 */
				    prestmt.setInt(1,attachFile.getNo());
				    prestmt.setInt(2,attachFile.getBno());
				    prestmt.setString(3,attachFile.getFileName());
				    prestmt.setLong(4,attachFile.getFileSize());
				    prestmt.setInt(5,attachFile.getDowncnt());
				    prestmt.setString(6,"2");
				    prestmt.setString(7,property.getBoardID());
				    prestmt.setString(8,attachFile.getNewFileName());
				    prestmt.setString(9,attachFile.getBun());
				    prestmt.executeUpdate();
				}
			}
			if(prestmt != null) { prestmt.close(); prestmt = null; }

			Vector deletedFileNames = null;
			if(deletingFileNo!=null) {

				/* 파일 삭제 */
				StringBuffer fileDeleteQuery = new StringBuffer();
				deletedFileNames = new Vector(deletingFileNo.length);
				for(int i = 0 ; i < deletingFileNo.length ; i++) {
				    if(deletingFileNo[i] == null) continue;
				    /* 파일 이름 검색 */

				    fileDeleteQuery.setLength(0);
				    fileDeleteQuery.append("select new_filename from ");
				    fileDeleteQuery.append(fileTableName);
				    fileDeleteQuery.append(" where no = ");
				    fileDeleteQuery.append(deletingFileNo[i]);
				    fileDeleteQuery.append(" and bno = ");
				    fileDeleteQuery.append(editted.getNo());
				    rs = stmt.executeQuery(fileDeleteQuery.toString());
				    if(rs.next()) {
				        deletedFileNames.add(rs.getString(1));
				    }
				    /* DB 삭제 */
				    fileDeleteQuery.setLength(0);
				    fileDeleteQuery.append("delete from ");
				    fileDeleteQuery.append(fileTableName);
				    fileDeleteQuery.append(" where no = ");
				    fileDeleteQuery.append(deletingFileNo[i]);
				    fileDeleteQuery.append(" and bno = ");
				    fileDeleteQuery.append(editted.getNo());
				    stmt.executeUpdate(fileDeleteQuery.toString());

				}

			}
			stmt.close(); stmt = null;


			/* 게시물 수정 */
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setString(1,editted.getStatus());
			prestmt.setString(2,editted.getBuse());
			prestmt.setString(3,editted.getAnsEmail());
			prestmt.setString(4,editted.getAnsPhone());
			prestmt.setString(5,editted.getAnswer());
			prestmt.setString(6,editted.getIp());
			prestmt.setInt(7,editted.getNo());
			prestmt.setString(8,property.getBoardID());

			result = prestmt.executeUpdate();
			prestmt.close();
			prestmt = null;

			if (result <= 0) {
				addSangdamArticle(property, editted);
			}

			// 답변등록일 업데이트
			StringBuffer queryBufAnsDate = new StringBuffer();
			queryBufAnsDate.append("update ");
			queryBufAnsDate.append(tableName);
			queryBufAnsDate.append(" set ansdate = sysdate ");
			queryBufAnsDate.append(" where no = ?");

	        prestmt = con.prepareStatement(queryBufAnsDate.toString());
	        prestmt.setInt(1,editted.getNo());
	        prestmt.executeUpdate();
	        prestmt.close();
			prestmt = null;

			con.commit();

			/* 디비 성공시에 파일 삭제 */
			if( deletedFileNames != null ) {
				String path = Property.UPLOAD_ROOT + "/" + property.getBoardID() + "/";
				for(int i = 0 ; i < deletedFileNames.size();i++) {
				    File dfile = new File(path + (String)deletedFileNames.get(i));
				    if(dfile.exists() && dfile.isFile()) {
				        dfile.delete();
				    }

				    File dfile2 = new File(path + "T" + (String)deletedFileNames.get(i));
				    if(dfile2.exists() && dfile2.isFile()) {
				        dfile2.delete();
				    }
				}
			}

			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		    return false;
		} finally {
			try { if (rs != null) rs.close(); } catch(Exception e){}
			try { con.setAutoCommit(true); }	catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    public void editInfoArticle(Property property, Article editted) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
        StringBuffer queryBuf = new StringBuffer();

        queryBuf.append("update ");
        queryBuf.append(" NEOBOARDINFOOPEN ");
        queryBuf.append(" set view_status = ?, kind=?, object=?, cut=?, cut_content = ? ");
        queryBuf.append(" where bno = ? and boardid = ?");

        try {
        	con = DBUtil.getConnection();
			con.setAutoCommit(false);


			/* 게시물 수정 */
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setString(1,editted.getViewStatus());
			prestmt.setString(2,editted.getKind());
			prestmt.setString(3,editted.getObject());
			prestmt.setString(4,editted.getCut());
			prestmt.setString(5,editted.getCutContent());
			prestmt.setInt(6,editted.getNo());
			prestmt.setString(7,property.getBoardID());

			prestmt.executeUpdate();
			prestmt.close();
			prestmt = null;

			con.commit();

		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		} finally {
			try { if (rs != null) rs.close(); } catch(Exception e){}
			try { con.setAutoCommit(true); }	catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    public boolean editInfoArticle(Property property, Article editted, String[] deletingFileNo) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
		String fileTableName = tableName + "FILE";
        StringBuffer queryBuf = new StringBuffer();

        queryBuf.append("update ");
        queryBuf.append(" NEOBOARDINFOOPEN ");
        queryBuf.append(" set status = ?, buse=?, answer = ? , ip=?, regdate=sysdate ");
        queryBuf.append(" where bno = ? and boardid = ?");

        try {
        	con = DBUtil.getConnection();
			con.setAutoCommit(false);

			/* 파일 입력 */
			stmt = con.createStatement();
			AttachFiles attachFiles = editted.getFiles();
			if(attachFiles != null) {
			    prestmt = con.prepareStatement("insert into " + fileTableName + " values(?,?,?,?,?,sysdate,?,?,?,?)");
				for( int i = 0 ; i < attachFiles.size(); i++) {
				    AttachFile attachFile = attachFiles.getAttachFile(i);
				    attachFile.setBno(editted.getNo());
				    /* 최대 번호 구함 */
				    rs = stmt.executeQuery("select max(no) from " + fileTableName);
				    if(rs.next()) {
				        attachFile.setNo(rs.getInt(1) + 1);
				    }
				    else {
				        attachFile.setNo(1);
				    }
				    rs.close(); rs = null;
				    /* 입력 */
				    prestmt.setInt(1,attachFile.getNo());
				    prestmt.setInt(2,attachFile.getBno());
				    prestmt.setString(3,attachFile.getFileName());
				    prestmt.setLong(4,attachFile.getFileSize());
				    prestmt.setInt(5,attachFile.getDowncnt());
				    prestmt.setString(6,"2");
				    prestmt.setString(7,property.getBoardID());
				    prestmt.setString(8,attachFile.getNewFileName());
				    prestmt.setString(9,attachFile.getBun());
				    prestmt.executeUpdate();
				}
			}
			if(prestmt != null) { prestmt.close(); prestmt = null; }

			Vector deletedFileNames = null;
			if(deletingFileNo!=null) {

				/* 파일 삭제 */
				StringBuffer fileDeleteQuery = new StringBuffer();
				deletedFileNames = new Vector(deletingFileNo.length);
				for(int i = 0 ; i < deletingFileNo.length ; i++) {
				    if(deletingFileNo[i] == null) continue;
				    /* 파일 이름 검색 */

				    fileDeleteQuery.setLength(0);
				    fileDeleteQuery.append("select new_filename from ");
				    fileDeleteQuery.append(fileTableName);
				    fileDeleteQuery.append(" where no = ");
				    fileDeleteQuery.append(deletingFileNo[i]);
				    fileDeleteQuery.append(" and bno = ");
				    fileDeleteQuery.append(editted.getNo());
				    rs = stmt.executeQuery(fileDeleteQuery.toString());
				    if(rs.next()) {
				        deletedFileNames.add(rs.getString(1));
				    }
				    /* DB 삭제 */
				    fileDeleteQuery.setLength(0);
				    fileDeleteQuery.append("delete from ");
				    fileDeleteQuery.append(fileTableName);
				    fileDeleteQuery.append(" where no = ");
				    fileDeleteQuery.append(deletingFileNo[i]);
				    fileDeleteQuery.append(" and bno = ");
				    fileDeleteQuery.append(editted.getNo());
				    stmt.executeUpdate(fileDeleteQuery.toString());

				}

			}
			stmt.close(); stmt = null;


			/* 게시물 수정 */
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setString(1,editted.getStatus());
			prestmt.setString(2,editted.getBuse());
			prestmt.setString(3,editted.getAnswer());
			prestmt.setString(4,editted.getIp());
			prestmt.setInt(5,editted.getNo());
			prestmt.setString(6,property.getBoardID());

			prestmt.executeUpdate();
			prestmt.close();
			prestmt = null;

			// 답변등록일 업데이트
			StringBuffer queryBufAnsDate = new StringBuffer();
			queryBufAnsDate.append("update ");
			queryBufAnsDate.append(tableName);
			queryBufAnsDate.append(" set ansdate = sysdate ");
			queryBufAnsDate.append(" where no = ?");

	        prestmt = con.prepareStatement(queryBufAnsDate.toString());
	        prestmt.setInt(1,editted.getNo());
	        prestmt.executeUpdate();
	        prestmt.close();
			prestmt = null;

			con.commit();

			/* 디비 성공시에 파일 삭제 */
			if( deletedFileNames != null ) {
				String path = Property.UPLOAD_ROOT + "/" + property.getBoardID() + "/";
				for(int i = 0 ; i < deletedFileNames.size();i++) {
				    File dfile = new File(path + (String)deletedFileNames.get(i));
				    if(dfile.exists() && dfile.isFile()) {
				        dfile.delete();
				    }

				    File dfile2 = new File(path + "T" + (String)deletedFileNames.get(i));
				    if(dfile2.exists() && dfile2.isFile()) {
				        dfile2.delete();
				    }
				}
			}

			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		    return false;
		} finally {
			try { if (rs != null) rs.close(); } catch(Exception e){}
			try { con.setAutoCommit(true); }	catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 게시물 입력
     * @param property : 게시판 설정
     * @param article : 게시물
     * @return 0: 성공 , else : 실패
     */
    public boolean addArticle(Property property , Article article) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String passwd="";
		MySqlFunction mySqlFunction=new MySqlFunction();
		passwd=MD5class.MD5(mySqlFunction.password(article.getPasswd()));
		String tableName = Property.TABLE_PREFIX + property.getBoardID();
		String fileTableName = tableName + "FILE";
        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("insert into ");
        queryBuf.append(tableName);
        queryBuf.append(" (no, ref, refstep, reflevel, id, name, passwd, subject, email, content, ip, regdate, hitcnt, cmtcnt, filecnt, downcnt, html, notice, secret, grp, editdate, phone, zipcode, addr1, addr2, is_delete, rss_yn, url, virtualno) ");
        queryBuf.append("values(?,?,?,?,?,?, '"+passwd+"' ,?,?,?,?,sysdate,?,?,?,?,?,?,?,?,sysdate,?,?,?,?,'N',?,?,?)");

		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
			
			String boardId = property.getBoardID();
			String cont = article.getContent();
			String query = "";

			if(boardId.equals("CARDN") ){	// 카드뉴스일 경우 게시물을 석유공사 게시물과 그외 기관 게시물 게시순서를 달리한다  start

				if(cont.substring(cont.length()-1, cont.length()).equals("부") ||
				   cont.substring(cont.length()-1, cont.length()).equals("원") ||
				   cont.substring(cont.length()-1, cont.length()).equals("청") ||
				   cont.substring(cont.length()-1, cont.length()).equals("대") ||
				   cont.substring(cont.length()-1, cont.length()).equals("과")){

					query = "select MAX(no) from " + tableName;
									
				}else{
					query = "select MAX(no) from " + tableName + "  where no < 500 ";
				}

			} // 카드뉴스일 경우 게시물을 석유공사 게시물과 그외 기관 게시물 게시순서를 달리한다  end
						
			else{
				/* MAX(no) 쿼리 */
				 query = "select MAX(no) from " + tableName;
				
			}

			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()){
			    article.setNo(rs.getInt(1) + 1);
			    article.setRef(article.getNo());
			}
			else {
			    article.setNo(1);
			    article.setRef(1);
			}
			rs.close(); rs = null;

			int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setInt(index++,article.getNo());
			prestmt.setInt(index++,article.getRef());
			prestmt.setInt(index++,article.getRefStep());
			prestmt.setInt(index++,article.getRefLevel());
			prestmt.setString(index++,article.getId());
			prestmt.setString(index++,article.getName());
			prestmt.setString(index++,article.getSubject());
			prestmt.setString(index++,article.getEmail());
			prestmt.setString(index++,article.getContent());
			prestmt.setString(index++,article.getIp());
			prestmt.setInt(index++,article.getHitcnt());
			prestmt.setInt(index++,article.getCmtcnt());
			prestmt.setInt(index++,article.getFilecnt());
			prestmt.setInt(index++,article.getDowncnt());
			prestmt.setString(index++,article.getHtml());
			prestmt.setString(index++,article.getNotice());
			prestmt.setString(index++,article.getSecret());
			prestmt.setString(index++,article.getGrp());
			prestmt.setString(index++,article.getPhone());
			prestmt.setString(index++,article.getZipcode());
			prestmt.setString(index++,article.getAddr1());
			prestmt.setString(index++,article.getAddr2());
			prestmt.setString(index++,article.getRssYn());
			prestmt.setString(index++,article.getUrl());
			prestmt.setString(index++,article.getVirtualno());

			prestmt.executeUpdate();

			prestmt.close(); prestmt = null;

			int dotIndex = 0;
			String filename = "";
			String tmpStr = "";
			String fileExe = "";
			String photo = "N";

			/* AttachFile insert */
			AttachFiles attachFiles = article.getFiles();
			if(attachFiles != null) {
			    prestmt = con.prepareStatement("insert into " + fileTableName + " values(?,?,?,?,?,sysdate,?,?,?,?)");
				for( int i = 0 ; i < attachFiles.size(); i++) {
				    AttachFile attachFile = attachFiles.getAttachFile(i);
				    attachFile.setBno(article.getNo());
				    /* 최대 번호 구함 */
				    rs = stmt.executeQuery("select max(no) from " + fileTableName);
				    if(rs.next()) {
				        attachFile.setNo(rs.getInt(1) + 1);
				    }
				    else {
				        attachFile.setNo(1);
				    }
				    rs.close(); rs = null;
				    /* 입력 */
				    prestmt.setInt(1,attachFile.getNo());
				    prestmt.setInt(2,attachFile.getBno());
				    prestmt.setString(3,attachFile.getFileName());
				    prestmt.setLong(4,attachFile.getFileSize());
				    prestmt.setInt(5,attachFile.getDowncnt());
				    prestmt.setString(6,"1");
				    prestmt.setString(7,property.getBoardID());
				    prestmt.setString(8,attachFile.getNewFileName());
				    prestmt.setString(9,attachFile.getBun());
				    prestmt.executeUpdate();

				    filename = attachFile.getFileName();

				    dotIndex = filename.lastIndexOf(".");
					if(dotIndex != -1){
						fileExe = filename.substring(dotIndex);					// '.'이 포함됨
					}
					tmpStr = fileExe.toLowerCase();
					if(tmpStr.indexOf("jpg") != -1 || tmpStr.indexOf("jpeg") != -1 || tmpStr.indexOf("gif") != -1 || tmpStr.indexOf("bmp") != -1 || tmpStr.indexOf("ico") != -1){
						photo = "Y";
					}
				}

			}
			stmt.close(); stmt = null;


			if (property.getBoardType().equals("SANGDAM") && article.getContGubun() != null && !article.getContGubun().equals("")) {
				addSangdamArticle(property,article);
			} else if (property.getBoardType().equals("INFOOPEN")) {
				addInfoArticle(property,article);
			}

			/* 검색 등록 */
			if (property.getUseSearch().equals("1")) {
				addBoardSearch(property,article);
			}

			/* 로그 등록 */
			StringBuffer queryBufLog = new StringBuffer();
			queryBufLog.append("insert into ");
			queryBufLog.append("NEOBOARDLOG");
			queryBufLog.append(" (BOARDID, BNO, LOGNO, LOGQUERY, USERID, USERNAME, logregdt, IP) ");
			queryBufLog.append("values(?,?,?,?,?,?,sysdate,?)");

			/* MAX(no) 쿼리 */
			String queryLog = "select MAX(LOGNO) from NEOBOARDLOG";
			stmt = con.createStatement();
			rs = stmt.executeQuery(queryLog);
			if(rs.next()){
			    article.setLogNo(rs.getInt(1) + 1);
			}
			else {
				article.setLogNo(1);
			}
			rs.close(); rs = null;

			index = 1;
			prestmt = con.prepareStatement(queryBufLog.toString());
			prestmt.setString(index++,property.getBoardID());
			prestmt.setInt(index++,article.getNo());
			prestmt.setInt(index++,article.getLogNo());
			prestmt.setString(index++,"C");
			prestmt.setString(index++,article.getId());
			prestmt.setString(index++,article.getName());
			prestmt.setString(index++,article.getIp());
			prestmt.executeUpdate();

			prestmt.close();

			con.commit();
			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		    return false;
		} finally {
			try { if (rs != null) rs.close();} catch (Exception e) {}
			try {   con.setAutoCommit(true);	} catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 게시판검색 등록
     * @param property
     * @param article
     */
    public void addBoardSearch(Property property , Article article) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int no = 0;

        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("insert into NEOBOARDSEARCH");
        queryBuf.append(" (NO, BNO, BOARDID, BOARDNAME, SUBJECT, CONTENT, URL, REGDATE, IS_DELETE, GRP) ");
        queryBuf.append("values(?,?,?,?,?,?,?,sysdate,'N',?)");

		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);

			/* MAX(no) 쿼리 */
			String query = "select MAX(no) from NEOBOARDSEARCH";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()){
			    no = rs.getInt(1) + 1;
			}
			else {
			    no = 1;
			}
			rs.close(); rs = null;

			int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setInt(index++,no);
			prestmt.setInt(index++,article.getNo());
			prestmt.setString(index++,property.getBoardID());
			prestmt.setString(index++,property.getBoardName());
			prestmt.setString(index++,article.getSubject());
			prestmt.setString(index++,article.getContent());
			if (property.getPageUrl() != null && !property.getPageUrl().equals("")) {
				prestmt.setString(index++,property.getPageUrl());
			} else {
				prestmt.setString(index++,article.getCallback());
			}
			prestmt.setString(index++,article.getGrp());

			prestmt.executeUpdate();
			prestmt.close(); prestmt = null;

			con.commit();
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		} finally {
			try { if (rs != null) rs.close();} catch (Exception e) {}
			try {   con.setAutoCommit(true);	} catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 검색데이터 수정
     * @param property
     * @param article
     */
    public void editBoardSearch(Property property , Article article) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("update NEOBOARDSEARCH set");
        queryBuf.append(" subject=?, content=?, grp=? where bno=? and boardid=?");

		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);

			int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setString(index++,article.getSubject());
			prestmt.setString(index++,article.getContent());
			prestmt.setString(index++,article.getGrp());
			prestmt.setInt(index++,article.getNo());
			prestmt.setString(index++,property.getBoardID());
			prestmt.executeUpdate();
			prestmt.close(); prestmt = null;

			con.commit();
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		} finally {
			try { if (rs != null) rs.close();} catch (Exception e) {}
			try {   con.setAutoCommit(true);	} catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 검색데이터 삭제
     * @param property
     * @param article_no
     */
    public void deleteBoardSearch(Property property , int article_no, String is_delete) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("update NEOBOARDSEARCH set is_delete=?");
        queryBuf.append(" where bno=? and boardid=?");

		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);

			int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setString(index++,is_delete);
			prestmt.setInt(index++,article_no);
			prestmt.setString(index++,property.getBoardID());
			prestmt.executeUpdate();
			prestmt.close(); prestmt = null;

			con.commit();
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		} finally {
			try { if (rs != null) rs.close();} catch (Exception e) {}
			try {   con.setAutoCommit(true);	} catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    public void addSangdamArticle(Property property , Article article) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int no = 0;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("insert into NEOBOARDSANGDAM");
        queryBuf.append(" (no, bno, boardid, cont_gubun, status, buse, ans_email, ans_phone, ip, job ,answer ) ");
        queryBuf.append("values(?,?,?,?,?,?,?,?,?,?,?)");

		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);

			/* MAX(no) 쿼리 */
			String query = "select MAX(no) from NEOBOARDSANGDAM";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()){
			    no = rs.getInt(1) + 1;
			}
			else {
			    no = 1;
			}
			rs.close(); rs = null;

			int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setInt(index++,no);
			prestmt.setInt(index++,article.getNo());
			prestmt.setString(index++,property.getBoardID());
			prestmt.setString(index++,article.getContGubun());
			prestmt.setString(index++,article.getStatus());
			prestmt.setString(index++,article.getBuse());
			prestmt.setString(index++,article.getAnsEmail());
			prestmt.setString(index++,article.getAnsPhone());
			prestmt.setString(index++,article.getIp());
			prestmt.setString(index++,article.getJob());
			prestmt.setString(index++,article.getAnswer());

			prestmt.executeUpdate();
			prestmt.close(); prestmt = null;

			con.commit();
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		} finally {
			try { if (rs != null) rs.close();} catch (Exception e) {}
			try {   con.setAutoCommit(true);	} catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    public void addInfoArticle(Property property , Article article) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int no = 0;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("insert into NEOBOARDINFOOPEN");
        queryBuf.append(" (no, bno, boardid, view_status, kind, object, cut, cut_content) ");
        queryBuf.append("values(?,?,?,?,?,?,?,?)");

		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);

			/* MAX(no) 쿼리 */
			String query = "select MAX(no) from NEOBOARDINFOOPEN";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()){
			    no = rs.getInt(1) + 1;
			}
			else {
			    no = 1;
			}
			rs.close(); rs = null;

			int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setInt(index++,no);
			prestmt.setInt(index++,article.getNo());
			prestmt.setString(index++,property.getBoardID());
			prestmt.setString(index++,article.getViewStatus());
			prestmt.setString(index++,article.getKind());
			prestmt.setString(index++,article.getObject());
			prestmt.setString(index++,article.getCut());
			prestmt.setString(index++,article.getCutContent());

			prestmt.executeUpdate();
			prestmt.close(); prestmt = null;

			con.commit();
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		} finally {
			try { if (rs != null) rs.close();} catch (Exception e) {}
			try {   con.setAutoCommit(true);	} catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 게시물 중복 입력
     * @param property : 게시판 설정
     * @param article : 게시물
     * @param movebid : 새로 입력할 게시판아이디
     * @return 0: 성공 , else : 실패
     */
    public boolean addMoveArticle(Property property , Article article, String movebid) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + movebid;
		String oldtableName = Property.TABLE_PREFIX + property.getBoardID();
		String fileTableName = tableName + "FILE";
		String cmtTableName = tableName + "CMT";
        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append("insert into ");
        queryBuf.append(tableName);
        queryBuf.append(" (no, ref, refstep, reflevel, id, name, passwd, subject, email, content, ip, regdate, hitcnt, cmtcnt, filecnt, downcnt, html, notice, secret, grp, editdate, phone, zipcode, addr1, addr2, is_delete, rss_yn, url, virtualno) ");
        //queryBuf.append("values(?,?,?,?,?,?,md5(password('"+article.getPasswd()+"')),?,?,?,?,sysdate,?,?,?,?,?,?,?,?,sysdate,?,?,?,?,'N',?,?,?)");
        queryBuf.append("values(?,?,?,?,?,?, '"+getMd5Passwd(article.getPasswd())+"',?,?,?,?,sysdate,?,?,?,?,?,?,?,?,sysdate,?,?,?,?,'N',?,?,?)");

        Search sch = new Search();
        article = getArticle(article.getNo(), property, sch);

		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
			/* MAX(no) 쿼리 */
			String query = "select MAX(no) from " + tableName;
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			int no = 0;
			int ref = 0;
			if(rs.next()){
			    no = rs.getInt(1) + 1;
			    ref = no;
			}
			else {
				no = 1;
				ref = 1;
			}
			rs.close(); rs = null;

			int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setInt(index++,no);
			prestmt.setInt(index++,ref);
			prestmt.setInt(index++,article.getRefStep());
			prestmt.setInt(index++,article.getRefLevel());
			prestmt.setString(index++,article.getId());
			prestmt.setString(index++,article.getName());
			prestmt.setString(index++,article.getSubject());
			prestmt.setString(index++,article.getEmail());
			prestmt.setString(index++,article.getContent());
			prestmt.setString(index++,article.getIp());
			//prestmt.setString(index++,article.getRegDateString("yyyy-MM-dd HH:mm:ss"));
			prestmt.setInt(index++,article.getHitcnt());
			prestmt.setInt(index++,article.getCmtcnt());
			prestmt.setInt(index++,article.getFilecnt());
			prestmt.setInt(index++,article.getDowncnt());
			prestmt.setString(index++,article.getHtml());
			prestmt.setString(index++,article.getNotice());
			prestmt.setString(index++,article.getSecret());
			prestmt.setString(index++,article.getGrp());
			prestmt.setString(index++,article.getPhone());
			prestmt.setString(index++,article.getZipcode());
			prestmt.setString(index++,article.getAddr1());
			prestmt.setString(index++,article.getAddr2());
			prestmt.setString(index++,article.getRssYn());
			prestmt.setString(index++,article.getUrl());
			prestmt.setString(index++,article.getVirtualno());

			prestmt.executeUpdate();

			prestmt.close(); prestmt = null;

			int dotIndex = 0;
			String filename = "";
			String tmpStr = "";
			String fileExe = "";
			String photo = "N";

			/* 첨부 화일 쿼리 */
			queryBuf.setLength(0);
		    queryBuf.append("select * from ");
		    queryBuf.append(oldtableName);
		    queryBuf.append("FILE where bno = ");
		    queryBuf.append(article.getNo());
		    queryBuf.append(" order by bun asc");
		    rs = stmt.executeQuery(queryBuf.toString());
			while(rs.next()) {
			    index = 1;
			    AttachFile file = new AttachFile();
			    file.setNo(rs.getInt(index++));
			    file.setBno(rs.getInt(index++));
			    file.setFileName(rs.getString(index++));
			    file.setFileSize(rs.getLong(index++));
			    file.setDowncnt(rs.getInt(index++));
			    file.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(index++));
			    file.setState(rs.getString(index++));
			    file.setFolder(rs.getString(index++));
			    file.setNewFileName(rs.getString(index++));
			    file.setBun(rs.getString(index++));
			    article.addFile(file);
			}
			rs.close(); rs = null;

			/* AttachFile insert */
			AttachFiles attachFiles = article.getFiles();
			if(attachFiles != null) {
			    prestmt = con.prepareStatement("insert into " + fileTableName + " values(?,?,?,?,?,sysdate,?,?,?,?)");
				for( int i = 0 ; i < article.getFilecnt(); i++) {
				    AttachFile attachFile = attachFiles.getAttachFile(i);
				    attachFile.setBno(no);
				    /* 최대 번호 구함 */
				    rs = stmt.executeQuery("select max(no) from " + fileTableName);
				    if(rs.next()) {
				        attachFile.setNo(rs.getInt(1) + 1);
				    }
				    else {
				        attachFile.setNo(1);
				    }
				    rs.close(); rs = null;
				    /* 입력 */
				    prestmt.setInt(1,attachFile.getNo());
				    prestmt.setInt(2,attachFile.getBno());
				    prestmt.setString(3,attachFile.getFileName());
				    prestmt.setLong(4,attachFile.getFileSize());
				    prestmt.setInt(5,attachFile.getDowncnt());
				    prestmt.setString(6,"1");
				    prestmt.setString(7,property.getBoardID());
				    prestmt.setString(8,attachFile.getNewFileName());
				    prestmt.setString(9,attachFile.getBun());
				    prestmt.executeUpdate();

				    filename = attachFile.getFileName();

				    dotIndex = filename.lastIndexOf(".");
					if(dotIndex != -1){
						fileExe = filename.substring(dotIndex);					// '.'이 포함됨
					}
					tmpStr = fileExe.toLowerCase();
					if(tmpStr.indexOf("jpg") != -1 || tmpStr.indexOf("jpeg") != -1 || tmpStr.indexOf("gif") != -1 || tmpStr.indexOf("bmp") != -1 || tmpStr.indexOf("ico") != -1){
						photo = "Y";
					}
				}
				prestmt.close(); prestmt = null;

			}

			/* 코멘트 쿼리 */
			if(property.getUseComment().equals("1")) {
			    queryBuf.setLength(0);
			    queryBuf.append("select * from ");
			    queryBuf.append(oldtableName);
			    queryBuf.append("CMT where bno = ");
			    queryBuf.append(article.getNo());
			    queryBuf.append(" order by no desc");
			    rs = stmt.executeQuery(queryBuf.toString());

				while(rs.next()) {
				    index = 1;
				    Comment cmt = new Comment();
				    cmt.setNo(rs.getInt(index++));
				    cmt.setBno(rs.getInt(index++));
				    cmt.setId(rs.getString(index++));
				    cmt.setName(rs.getString(index++));
				    cmt.setPasswd(rs.getString(index++));
				    cmt.setComment(rs.getString(index++));
				    cmt.setIp(rs.getString(index++));
				    cmt.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(index++));
				    article.addComment(cmt);
				}
			}
			if(rs!= null) { rs.close();	rs = null; }

			Comments cmts = article.getComments();
			if(cmts != null) {
			    prestmt = con.prepareStatement("insert into " + cmtTableName + " values(?,?,?,?,?,?,?,sysdate)");
			    for(int i = 0 ; i < cmts.size() ; i++) {
			    	Comment cmt = cmts.getComment(i);
			    	cmt.setBno(no);
				    /* 최대 번호 구함 */
				    rs = stmt.executeQuery("select max(no) from " + cmtTableName);
				    if(rs.next()) {
				    	cmt.setNo(rs.getInt(1) + 1);
				    }
				    else {
				    	cmt.setNo(1);
				    }
				    rs.close(); rs = null;
				    /* 입력 */
				    prestmt.setInt(1,cmt.getNo());
				    prestmt.setInt(2,cmt.getBno());
				    prestmt.setString(3,cmt.getId());
				    prestmt.setString(4,cmt.getName());
				    prestmt.setString(5,cmt.getPasswd());
				    prestmt.setString(6,cmt.getComment());
				    prestmt.setString(7,cmt.getIp());
				    prestmt.executeUpdate();
				}
			    prestmt.close(); prestmt = null;

			}
			stmt.close(); stmt = null;


			Property propertySch = PropertyManager.getPropertyInfo(movebid);
			if (propertySch.getUseSearch().equals("1")) {
				/* 검색 등록 */
				StringBuffer queryBufSch = new StringBuffer();
				queryBufSch.append("insert into NEOBOARDSEARCH");
				queryBufSch.append(" (NO, BNO, BOARDID, BOARDNAME, SUBJECT, CONTENT, URL, REGDATE, IS_DELETE) ");
				queryBufSch.append("values(?,?,?,?,?,?,?,sysdate,'N')");

				/* MAX(no) 쿼리 */
				int sno = 0;
				String querys = "select MAX(no) from NEOBOARDSEARCH";
				stmt = con.createStatement();
				rs = stmt.executeQuery(querys);
				if(rs.next()){
				    sno = rs.getInt(1) + 1;
				}
				else {
				    sno = 1;
				}
				rs.close(); rs = null;

				prestmt = con.prepareStatement(queryBufSch.toString());
				prestmt.setInt(1,sno);
				prestmt.setInt(2,no);
				prestmt.setString(3,movebid);
				prestmt.setString(4,PropertyManager.getBoardName(movebid));
				prestmt.setString(5,article.getSubject());
				prestmt.setString(6,article.getContent());
				if (PropertyManager.getBoardPageUrl(movebid) != null && !PropertyManager.getBoardPageUrl(movebid).equals("")) {
					prestmt.setString(7,PropertyManager.getBoardPageUrl(movebid));
				} else {
					prestmt.setString(7,article.getCallback());
				}

				prestmt.executeUpdate();
				prestmt.close(); prestmt = null;
			}

			String boardname = PropertyManager.getBoardName(movebid);
			String move_subject = "관리자에 의해 이동되었습니다.";
			String move_content = "해당 글이 관리자에 의해 ["+boardname+"]로 이동되었습니다.";
			String queryOld = "update " + oldtableName + " set move_bid='" + movebid +"', subject='"+move_subject+"', content='"+move_content+"' where no="+article.getNo();
			stmt = con.createStatement();
			stmt.executeUpdate(queryOld);
			stmt.close(); stmt = null;

			/* 검색 수정 */
			StringBuffer queryBufSearch = new StringBuffer();
			queryBufSearch.append("update NEOBOARDSEARCH set");
			queryBufSearch.append(" subject=?, content=? where bno=? and boardid=?");
			prestmt = con.prepareStatement(queryBufSearch.toString());
			prestmt.setString(1,move_subject);
			prestmt.setString(2,move_content);
			prestmt.setInt(3,article.getNo());
			prestmt.setString(4,property.getBoardID());
			prestmt.executeUpdate();
			prestmt.close(); prestmt = null;

			queryOld = "delete from " + oldtableName + "FILE where bno="+article.getNo();
			stmt = con.createStatement();
			stmt.executeUpdate(queryOld);
			stmt.close(); stmt = null;

			queryOld = "delete from " + oldtableName + "CMT where bno="+article.getNo();
			stmt = con.createStatement();
			stmt.executeUpdate(queryOld);
			stmt.close(); stmt = null;

			StringBuffer queryBufLog = new StringBuffer();
			queryBufLog.append("insert into ");
			queryBufLog.append("NEOBOARDLOG");
			queryBufLog.append(" (BOARDID, BNO, LOGNO, LOGQUERY, USERID, USERNAME, LOGREGDT, IP) ");
			queryBufLog.append("values(?,?,?,?,?,?,sysdate,?)");

			/* MAX(no) 쿼리 */
			String queryLog = "select MAX(LOGNO) from NEOBOARDLOG";
			stmt = con.createStatement();
			rs = stmt.executeQuery(queryLog);
			if(rs.next()){
			    article.setLogNo(rs.getInt(1) + 1);
			}
			else {
				article.setLogNo(1);
			}
			rs.close(); rs = null;

			index = 1;
			prestmt = con.prepareStatement(queryBufLog.toString());
			prestmt.setString(index++,property.getBoardID());
			prestmt.setInt(index++,article.getNo());
			prestmt.setInt(index++,article.getLogNo());
			prestmt.setString(index++,"U");
			prestmt.setString(index++,article.getId());
			prestmt.setString(index++,article.getName());
			prestmt.setString(index++,article.getIp());
			prestmt.executeUpdate();

			prestmt.close();

			con.commit();
			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		    return false;
		} finally {
			try {  if (rs != null) rs.close(); } catch(Exception e){}
			try {  con.setAutoCommit(true);	} catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 게시물 내용 쿼리
     * @param property 게시판 설정
     * @param num 읽어올 게시물 넘버
     * @return
     */
    public Article getArticle(int num, final Property property , final Search sch) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ResultSet rsFile = null;
		Article article = null;

		try {
			con = DBUtil.getConnection();
			/* 게시물 쿼리 */
			article = new Article();
			int index = 1;
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("select * from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(property.getBoardID());
		    queryBuf.append(" where no = ");
		    queryBuf.append(num);
		    //queryBuf.append(" and is_delete = 'N'");
			rs = stmt.executeQuery(queryBuf.toString());
			if(rs.next()) {
			    index = 1;
			    article.setNo(rs.getInt("no"));
			    article.setRef(rs.getInt("ref"));
			    article.setRefStep(rs.getInt("refstep"));
			    article.setRefLevel(rs.getInt("reflevel"));
			    article.setId(rs.getString("id"));
			    article.setName(rs.getString("name"));
			    article.setPasswd(rs.getString("passwd"));
			    article.setSubject(rs.getString("subject"));
			    article.setEmail(rs.getString("email"));
			    article.setContent(rs.getString("content"));
			    article.setIp(rs.getString("ip"));
			    article.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString("regdate"));
			    article.setHitcnt(rs.getInt("hitcnt"));
			    article.setCmtcnt(rs.getInt("cmtcnt"));
			    article.setFilecnt(rs.getInt("filecnt"));
			    article.setDowncnt(rs.getInt("downcnt"));
			    article.setHtml(rs.getString("html"));
			    article.setNotice(rs.getString("notice"));
			    article.setSecret(rs.getString("secret"));
			    article.setGrp(rs.getString("grp"));
			    article.setEditDateString("yyyy-MM-dd HH:mm:ss", rs.getString("editdate"));
			    if (rs.getString("ansdate") != null && !rs.getString("ansdate").equals("")) {
			    article.setAnsDateString("yyyy-MM-dd HH:mm:ss", rs.getString("ansdate"));
			    }
			    article.setPhone(rs.getString("phone"));
			    article.setZipcode(rs.getString("zipcode"));
			    article.setAddr1(rs.getString("addr1"));
			    article.setAddr2(rs.getString("addr2"));
			    article.setIsDelete(rs.getString("is_delete"));
			    article.setRssYn(rs.getString("rss_yn"));
			    article.setMoveBid(rs.getString("move_bid"));
			    article.setUrl(rs.getString("url"));
			    article.setVirtualno(rs.getString("virtualno"));
			}
			rs.close(); rs = null;

			if (property.getBoardType().equals("SANGDAM")) {
				/* 게시물 쿼리 */
				index = 1;
				stmt = con.createStatement();
				queryBuf = new StringBuffer();
				queryBuf.append("select * from NEOBOARDSANGDAM ");
			    queryBuf.append(" where bno = " + num);
			    queryBuf.append(" and boardid = '" +property.getBoardID() + "'");
				rs = stmt.executeQuery(queryBuf.toString());
				if(rs.next()) {
				    index = 1;
				    article.setContGubun(rs.getString("cont_gubun"));
				    article.setStatus(rs.getString("status"));
				    article.setBuse(rs.getString("buse"));
				    article.setAnsEmail(rs.getString("ans_email"));
				    article.setAnsPhone(rs.getString("ans_phone"));
				    article.setAnswer(rs.getString("answer"));
				    article.setJob(rs.getString("job"));
				}
				rs.close(); rs = null;
			} else if (property.getBoardType().equals("INFOOPEN")) {
				/* 게시물 쿼리 */
				index = 1;
				stmt = con.createStatement();
				queryBuf = new StringBuffer();
				queryBuf.append("select * from NEOBOARDINFOOPEN ");
			    queryBuf.append(" where bno = " + num);
			    queryBuf.append(" and boardid = '" +property.getBoardID() + "'");
				rs = stmt.executeQuery(queryBuf.toString());
				if(rs.next()) {
				    index = 1;
				    article.setViewStatus(rs.getString("view_status"));
				    article.setKind(rs.getString("kind"));
				    article.setObject(rs.getString("object"));
				    article.setCut(rs.getString("cut"));
				    article.setCutContent(rs.getString("cut_content"));
				    article.setAnswer(rs.getString("answer"));
				    article.setBuse(rs.getString("buse"));
				    article.setStatus(rs.getString("status"));
				}
				rs.close(); rs = null;
			}

			/* 첨부 화일 쿼리 */

			queryBuf.setLength(0);
		    queryBuf.append("select * from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(property.getBoardID());
		    queryBuf.append("FILE where bno = ");
		    queryBuf.append(num);
		    queryBuf.append(" and state = '1' ");
		    queryBuf.append(" order by bun asc");
		    rs = stmt.executeQuery(queryBuf.toString());
			while(rs.next()) {
			    index = 1;
			    AttachFile file = new AttachFile();
			    file.setNo(rs.getInt(index++));
			    file.setBno(rs.getInt(index++));
			    file.setFileName(rs.getString(index++));
			    file.setFileSize(rs.getLong(index++));
			    file.setDowncnt(rs.getInt(index++));
			    file.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(index++));
			    file.setState(rs.getString(index++));
			    file.setFolder(rs.getString(index++));
			    file.setNewFileName(rs.getString(index++));
			    file.setBun(rs.getString(index++));
			    article.addFile(file);
			}
			rs.close(); rs = null;

			/* 답변첨부 화일 쿼리 */
			queryBuf.setLength(0);
		    queryBuf.append("select * from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(property.getBoardID());
		    queryBuf.append("FILE where bno = ");
		    queryBuf.append(num);
		    queryBuf.append(" and state = '2' ");
		    queryBuf.append(" order by bun asc");
		    rs = stmt.executeQuery(queryBuf.toString());
			while(rs.next()) {
			    index = 1;
			    AttachFile file = new AttachFile();
			    file.setNo(rs.getInt(index++));
			    file.setBno(rs.getInt(index++));
			    file.setFileName(rs.getString(index++));
			    file.setFileSize(rs.getLong(index++));
			    file.setDowncnt(rs.getInt(index++));
			    file.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(index++));
			    file.setState(rs.getString(index++));
			    file.setFolder(rs.getString(index++));
			    file.setNewFileName(rs.getString(index++));
			    file.setBun(rs.getString(index++));
			    article.addAnsFile(file);
			}
			rs.close(); rs = null;


			// 코멘트를 사용할 경우만
			if(property.getUseComment().equals("1")) {
				/* 코멘트 쿼리 */
				if(property.getUseComment().equals("1")) {
				    queryBuf.setLength(0);
				    queryBuf.append("select * from ");
				    queryBuf.append(Property.TABLE_PREFIX);
				    queryBuf.append(property.getBoardID());
				    queryBuf.append("CMT where bno = ");
				    queryBuf.append(num);
				    queryBuf.append(" order by no desc");
				    rs = stmt.executeQuery(queryBuf.toString());

					while(rs.next()) {
					    index = 1;
					    Comment cmt = new Comment();
					    cmt.setNo(rs.getInt(index++));
					    cmt.setBno(rs.getInt(index++));
					    cmt.setId(rs.getString(index++));
					    cmt.setName(rs.getString(index++));
					    cmt.setPasswd(rs.getString(index++));
					    cmt.setComment(rs.getString(index++));
					    cmt.setIp(rs.getString(index++));
					    cmt.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(index++));
					    article.addComment(cmt);
					}
				}
				if(rs!= null) { rs.close();	rs = null; }
			}
			/* 답변을 사용할 경우에만 */
			if(property.getUseReply().equals("1")) {
				/* 관련글 쿼리 */
			    queryBuf.setLength(0);
				queryBuf.append("select no, ref, refstep, reflevel, id, name, subject, email, content, grp, regdate, hitcnt, cmtcnt, filecnt, downcnt from ");
				queryBuf.append(Property.TABLE_PREFIX + property.getBoardID());
				queryBuf.append(" where ref = ");
				queryBuf.append(article.getRef());
				if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
					queryBuf.append(" and (grp = '"+ sch.getGroup()+ "') ");
		        }
				queryBuf.append(" and is_delete = 'N'");

				queryBuf.append(" order by " + sch.makeOrdering(" ref desc , refstep asc ","").trim());

				rs = stmt.executeQuery(queryBuf.toString());
				Articles acs = new Articles();
				int seq = 1;
				while(rs.next()){
				    index = 1;
				    Article a = new Article();
				    a.setSeq(seq++);
				    a.setNo(rs.getInt(index++));
				    a.setRef(rs.getInt(index++));
				    a.setRefStep(rs.getInt(index++));
				    a.setRefLevel(rs.getInt(index++));
				    a.setId(rs.getString(index++));
				    a.setName(rs.getString(index++));
				    a.setSubject(rs.getString(index++));
				    a.setEmail(rs.getString(index++));
				    a.setContent(rs.getString(index++));
				    a.setGrp(rs.getString(index++));
				    a.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(index++));
				    a.setHitcnt(rs.getInt(index++));
				    a.setCmtcnt(rs.getInt(index++));
				    a.setFilecnt(rs.getInt(index++));
				    a.setDowncnt(rs.getInt(index++));
				    article.addRelativeArticle(a);
				    acs.addArticle(a);
				}

				rs.close(); rs = null;

				/* 답변 첨부 화일 쿼리 */
				String fileQuery="select b.* from "
					+ Property.TABLE_PREFIX + property.getBoardID() + " a,"
					+ Property.TABLE_PREFIX + property.getBoardID() + "FILE b where a.no=" + num + " and b.bno = ? "
					+ "order by b.bun asc";
			    prestmt = con.prepareStatement(fileQuery);

			    Articles ras = article.getRelativeArticles();
				for(int i = 0 ; i < ras.size(); i++) {
					Article ra = ras.getArticle(i);
				    if(ra.getFilecnt() > 0) {
				        prestmt.setInt(1,ra.getNo());
				        rs = prestmt.executeQuery();
				        while(rs.next()) {
				        	index = 1;
						    AttachFile rf = new AttachFile();
						    rf.setNo(rs.getInt(index++));
						    rf.setBno(rs.getInt(index++));
						    rf.setFileName(rs.getString(index++));
						    rf.setFileSize(rs.getLong(index++));
						    rf.setDowncnt(rs.getInt(index++));
						    rf.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(index++));
						    rf.setState(rs.getString(index++));
						    rf.setFolder(rs.getString(index++));
						    rf.setNewFileName(rs.getString(index++));
						    rf.setBun(rs.getString(index++));
						    article.addRelativeFile(rf);
						    ra.addFile(rf);
				        }
				        rs.close();
				    }
				}
				prestmt.close(); prestmt=null;
				rs = null;

			}
			/* 다음글(글타래) 쿼리 */
			queryBuf.setLength(0);
			queryBuf.append("select  *  from ( ");
			queryBuf.append("select a.* , rownum row_no  from ( ");
			queryBuf.append(" select no, id, subject,regdate  from ");
			queryBuf.append(Property.TABLE_PREFIX + property.getBoardID());
			queryBuf.append(" where ref < ");
			queryBuf.append(article.getRef());
			if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
				queryBuf.append(" and grp = '"+ sch.getGroup()+ "' ");
	        }
			queryBuf.append(" and is_delete = 'N' ");
			//queryBuf.append(" order by ref desc, refstep asc limit 0,1");
			queryBuf.append(" order by ref desc, refstep asc ");
			queryBuf.append(" ) a ");
			queryBuf.append(" ) b where row_no =1");

			System.out.println(queryBuf.toString());

			rs = stmt.executeQuery(queryBuf.toString());

			if(rs.next()) {
			    Article a = new Article();
			    a.setNo(rs.getInt("no"));
			    a.setId(rs.getString("id"));
			    a.setSubject(rs.getString("subject"));
			    a.setRegDateString("yyyy-MM-dd HH:mm:ss",rs.getString("regdate"));
			    article.setNextArticle(a);
			}
			rs.close(); rs = null;

			/* 이전글(글타래) 쿼리 */
			queryBuf.setLength(0);
			queryBuf.append(" SELECT * FROM ( ");
			queryBuf.append(" SELECT a.* ,  ROWNUM AS ROW_NO FROM ( ");
			queryBuf.append(" select no, id, subject,regdate   from ");
			queryBuf.append(Property.TABLE_PREFIX + property.getBoardID());
			queryBuf.append(" where ref > ");
			queryBuf.append(article.getRef());
			if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
				queryBuf.append(" and grp = '"+ sch.getGroup()+ "' ");
	        }
			queryBuf.append(" and is_delete = 'N' ");
			queryBuf.append(" order by ref asc, refstep desc  ");
			queryBuf.append(" ) A  ");
			queryBuf.append(" ) b WHERE ROW_NO=1 ");

			rs = stmt.executeQuery(queryBuf.toString());
			if(rs.next()) {
			    Article a = new Article();
			    a.setNo(rs.getInt("no"));
			    a.setId(rs.getString("id"));
			    a.setSubject(rs.getString("subject"));
			    a.setRegDateString("yyyy-MM-dd HH:mm:ss",rs.getString("regdate"));
			    article.setPrevArticle(a);
			}
			if(rs != null) rs.close(); rs = null;
			stmt.close(); stmt = null;

		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try { if (rsFile != null) rsFile.close(); } catch(Exception e) {}
			try { if (rs != null) rs.close(); } catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return article;
    }
    /**
     * 현재글에서 이전글/다음글 들 가져오기
     * @param property
     * @param sch
     * @param article
     * @param direction
     * @param type 1:원글만
     * @param count 가져올 글 갯수
     * @return
     */

    public Articles getPrevNext(Property property, Search sch,Article article, String direction, int type,int count){
    	Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Articles acs = new Articles();
		try{
			con = DBUtil.getConnection();
			stmt = con.createStatement();
	    	StringBuffer queryBuf = new StringBuffer();

	    	queryBuf.setLength(0);
			queryBuf.append(" select no, id, subject,regdate from ");
			queryBuf.append(Property.TABLE_PREFIX + property.getBoardID());
			queryBuf.append(" where ref " + direction + " ");
			queryBuf.append(article.getRef());
			if (type==1){ //원글만
				queryBuf.append(" and refstep=0 and reflevel=0 ");
			}
			if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
				queryBuf.append(" and grp = '"+ sch.getGroup()+ "' ");
	        }
			queryBuf.append(" and is_delete = 'N' ");
			queryBuf.append(" order by ref asc, refstep ");
			if (direction.equals("<")){ // 다음글들은 숫자가 큰  순서로
				queryBuf.append(" desc");
			} else {
				queryBuf.append(" asc");
			}
			queryBuf.append(" limit 0," + count);

			rs = stmt.executeQuery(queryBuf.toString());
			while(rs.next()) {
			    Article a = new Article();
			    a.setNo(rs.getInt("no"));
			    a.setId(rs.getString("id"));
			    a.setSubject(rs.getString("subject"));
			    a.setRegDateString("yyyy-MM-dd HH:mm:ss",rs.getString("regdate"));
			    acs.addArticle(a);
			}

		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try { if (rs != null) rs.close();} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    return acs;
    }

    /**
     * 게시물 목록을 쿼리 (페이징 하여)
     * @param userSession 사용자 세션
     * @param page 페이지 빈
     * @param sch 검색 빈
     * @param property 게시판 설정 빈
     * @param auth 게시판 권한 빈
     * @return Articles 게시물 목록
     */
    public Articles getArticles(final UserSession userSession , final PageAttribute page, final Search sch,
            final Property property, final Authority auth) {

        String tableName = Property.TABLE_PREFIX + property.getBoardID();
        String columns1 = "";
        String columns2 = "";

        if(tableName.equals("NEOBOARD_CARDN")){ // 카드뉴스일 경우
             columns1 = " case when no < 500 then no+1000 else no+0 end tmp, no, ref, refstep, reflevel, id, name, subject, email, content, regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, phone, zipcode, addr1, addr2, IS_DELETE, rss_yn, move_bid, url     ";
             columns2 = " case when no < 500 then no+1000 else no+0 end tmp, no, ref, refstep, reflevel, id, name, subject, email, content, regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, phone, zipcode, addr1, addr2, IS_DELETE, rss_yn, move_bid, url     ";        	
        }
        
        else{        	
	         columns1 = " no, ref, refstep, reflevel, id, name, subject, email, content, regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, phone, zipcode, addr1, addr2, IS_DELETE, rss_yn, move_bid, url ,   ROW_NUMBER() OVER(  ORDER BY  no desc) AS PAGE_NO    ";
	         columns2 = " no, ref, refstep, reflevel, id, name, subject, email, content, regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, phone, zipcode, addr1, addr2, IS_DELETE, rss_yn, move_bid, url ,   ROW_NUMBER() OVER(  ORDER BY  no desc) AS PAGE_NO    ";
    	}
        String where = "";
        String where_gul = "";
        // 공지사항이 아닌 글만
        where_gul = " (notice = '0') ";
        // 해당 그룹 코드가 넘어올경우 글 그룹을 사용 경우
        if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
        	//where_gul += " and grp = '"+ sch.getGroup()+ "' "; //20110408_org
        	where_gul += " and grp = ? "; //20110408_new
        }
        // 관리자가 아닐 경우만 안 지워진 글 조회 , 관리자일 경우 모두 조회
        if (!NeoBoardManager.checkManager(auth, property, userSession)) {
	        where_gul = where_gul + " and is_delete='N' ";
        }

        where = sch.makeCondition(where_gul,"").trim();
    	String orderby = "";
        
        if(tableName.equals("NEOBOARD_CARDN")){ // 카드뉴스일 경우
        	 orderby = sch.makeOrdering(" tmp desc, ref desc , refstep asc ","").trim();
        }
        else if(tableName.equals("NEOBOARD_BUSIDATA")){
        	orderby = sch.makeOrdering(" regdate desc , ref desc , refstep asc ","").trim();
        }
        else{
             orderby = sch.makeOrdering(" ref desc , refstep asc ","").trim();        	
        }


        String query = makePagingQuery(tableName,columns1,columns2,where,orderby,(page.getNPage()-1)*page.getNPageSize(),page.getNPage()*page.getNPageSize() );

        String cntQuery = makeCountQuery(tableName,where);

        String fileQuery = "select * from " + tableName + "FILE where bno = ? order by bun asc";
        Connection con = null;
		//Statement stmt = null; //20110408_org
		ResultSet rs = null;
		ResultSet rsFile = null;
		PreparedStatement prestmt = null;

		Articles acs = new Articles(page.getNPageSize());
		try {
			con = DBUtil.getConnection();
			/* 게시물 카운트 */
			prestmt = con.prepareStatement(cntQuery);
			if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) { //20110408_new
			  prestmt.setString(1, sch.getGroup());
			}
		    rs = prestmt.executeQuery();
			if(rs.next()) {
			    acs.setTotalCount(rs.getInt(1));
			}
			rs.close();
			rs = null;
			int topseq = acs.getTotalCount()-(page.getNPage()-1) * page.getNPageSize();
			/* 페이징 쿼리 */
			/******************** 20110408_new ********************/
			prestmt=null;
			prestmt =con.prepareStatement(query);
			if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
				  prestmt.setString(1, sch.getGroup());
			}
			rs =prestmt.executeQuery();	//20110408_new
			/*******************************************************/
			//rs = prestmt.executeQuery(query);		20110408_old
			while(rs.next()) {
			    Article article = new Article();
			    article.setNo(rs.getInt("no"));
			    article.setRef(rs.getInt("ref"));
			    article.setRefStep(rs.getInt("refstep"));
			    article.setRefLevel(rs.getInt("reflevel"));
			    article.setId(rs.getString("id"));
			    article.setName(rs.getString("name"));
			    article.setSubject(rs.getString("subject"));
			    article.setEmail(rs.getString("email"));
			    article.setContent(rs.getString("content"));
			    article.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString("regdate"));
			    article.setHitcnt(rs.getInt("hitcnt"));
			    article.setCmtcnt(rs.getInt("cmtcnt"));
			    article.setFilecnt(rs.getInt("filecnt"));
			    article.setDowncnt(rs.getInt("downcnt"));
			    article.setNotice(rs.getString("notice"));
			    article.setSecret(rs.getString("secret"));
			    article.setGrp(rs.getString("grp"));
			    article.setPhone(rs.getString("phone"));
			    article.setZipcode(rs.getString("zipcode"));
			    article.setAddr1(rs.getString("addr1"));
			    article.setAddr2(rs.getString("addr2"));
			    article.setIsDelete(rs.getString("is_delete"));
			    article.setRssYn(rs.getString("rss_yn"));
			    article.setMoveBid(rs.getString("move_bid"));
			    article.setUrl(rs.getString("url"));
			    if(!article.getNotice().equals("1")) {
				    article.setSeq(topseq);
				    topseq--;
			    }
			    acs.addArticle(article);

			}
			rs.close(); rs = null;
			if(prestmt != null) prestmt.close();

			/* 화일이 있을 경우 화일 테이블 쿼리 */
			prestmt = con.prepareStatement(fileQuery);
			for(int i = 0 ; i < acs.size(); i++) {
			    Article article = acs.getArticle(i);
			    if(article.getFilecnt() > 0) {
			        prestmt.setInt(1,article.getNo());
			        rsFile = prestmt.executeQuery();
			        while(rsFile.next()) {
			            AttachFile file = new AttachFile();
			            file.setNo(rsFile.getInt(1));
			            file.setBno(rsFile.getInt(2));
			            file.setFileName(rsFile.getString(3));
			            file.setFileSize(rsFile.getLong(4));
			            file.setDowncnt(rsFile.getInt(5));
			            file.setRegDateString("yyyy-MM-dd HH:mm:ss" , rsFile.getString(6));
			            file.setState(rsFile.getString(7));
			            file.setFolder(rsFile.getString(8));
			            file.setNewFileName(rsFile.getString(9));
			            file.setBun(rsFile.getString(10));
			            article.addFile(file);
			        }
			        rsFile.close();
			    }
			}
		    if(prestmt != null) { prestmt.close(); prestmt = null; }


			//stmt.close();	20110408_old
			//stmt = null;	20110408_old


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			//try {  if (stmt != null) stmt.close();	} catch (Exception e) {}	20110408_old
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return acs;
    }
    /**
     * 공지사항 게시물 목록을 쿼리
     * @param userSession
     * @param page
     * @param sch
     * @param property
     * @param auth
     * @return
     */
    public Articles getArticlesNotice(final UserSession userSession , final PageAttribute page, final Search sch,
            final Property property, final Authority auth) {

    	String tableName = Property.TABLE_PREFIX + property.getBoardID();
        String columns1 = " no, ref, refstep, reflevel, id, name, subject, email, content, regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, phone, zipcode, addr1, addr2, IS_DELETE, rss_yn, move_bid, url ,   ROW_NUMBER() OVER(  ORDER BY  no desc) AS PAGE_NO    ";
        String columns2 = " no, ref, refstep, reflevel, id, name, subject, email, content, regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, phone, zipcode, addr1, addr2, IS_DELETE, rss_yn, move_bid, url ,   ROW_NUMBER() OVER(  ORDER BY  no desc) AS PAGE_NO    ";
        String where = "";
        String where_gul = "";
        // 공지사항이 아닌 글만
        where_gul = " (notice = '1') ";
        // 해당 그룹 코드가 넘어올경우 글 그룹을 사용 경우
        if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
        	where_gul += " and grp = '"+ sch.getGroup()+ "' ";
        }
        // 관리자가 아닐 경우만 안 지워진 글 조회 , 관리자일 경우 모두 조회
        if (!NeoBoardManager.checkManager(auth, property, userSession)) {
	        where_gul = where_gul + " and is_delete='N' ";
        }

        where = sch.makeCondition(where_gul,"").trim();
        String orderby = "";

        if(tableName.equals("NEOBOARD_BUSIDATA")){
        	orderby = sch.makeOrdering(" notice desc, regdate desc , ref desc , refstep asc ","").trim();
        }
        else{
        	orderby = sch.makeOrdering("notice desc,  ref desc , refstep asc ","").trim();
        }
         

        String query = makeQueryNotice(tableName,columns1,columns2,where,orderby,(page.getNPage()-1)*page.getNPageSize(),page.getNPage()* page.getNPageSize() );

        String cntQuery = makeCountQuery(tableName,where);
        String fileQuery = "select * from " + tableName + "FILE where bno = ? order by bun asc";
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rsFile = null;
		PreparedStatement prestmt = null;

		Articles acs = new Articles(page.getNPageSize());
		try {
			con = DBUtil.getConnection();
			/* 게시물 카운트 */
			stmt = con.createStatement();
		    rs = stmt.executeQuery(cntQuery);
			if(rs.next()) {
			    acs.setTotalCount(rs.getInt(1));
			}
			rs.close();
			rs = null;
			int topseq = acs.getTotalCount()-(page.getNPage()-1) * page.getNPageSize();
			/* 페이징 쿼리 */

			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Article article = new Article();
			    article.setNo(rs.getInt("no"));
			    article.setRef(rs.getInt("ref"));
			    article.setRefStep(rs.getInt("refstep"));
			    article.setRefLevel(rs.getInt("reflevel"));
			    article.setId(rs.getString("id"));
			    article.setName(rs.getString("name"));
			    article.setSubject(rs.getString("subject"));
			    article.setEmail(rs.getString("email"));
			    article.setContent(rs.getString("content"));
			    article.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString("regdate"));
			    article.setHitcnt(rs.getInt("hitcnt"));
			    article.setCmtcnt(rs.getInt("cmtcnt"));
			    article.setFilecnt(rs.getInt("filecnt"));
			    article.setDowncnt(rs.getInt("downcnt"));
			    article.setNotice(rs.getString("notice"));
			    article.setSecret(rs.getString("secret"));
			    article.setGrp(rs.getString("grp"));
			    article.setPhone(rs.getString("phone"));
			    article.setZipcode(rs.getString("zipcode"));
			    article.setAddr1(rs.getString("addr1"));
			    article.setAddr2(rs.getString("addr2"));
			    article.setIsDelete(rs.getString("is_delete"));
			    article.setRssYn(rs.getString("rss_yn"));
			    article.setMoveBid(rs.getString("move_bid"));
			    article.setUrl(rs.getString("url"));
			    if(!article.getNotice().equals("1")) {
				    article.setSeq(topseq);
				    topseq--;
			    }
			    acs.addArticle(article);

			}
			rs.close(); rs = null;
			if(prestmt != null) prestmt.close();

			/* 화일이 있을 경우 화일 테이블 쿼리 */
			prestmt = con.prepareStatement(fileQuery);
			for(int i = 0 ; i < acs.size(); i++) {
				Article article = acs.getArticle(i);
			    if(article.getFilecnt() > 0) {
			        prestmt.setInt(1,article.getNo());
			        rsFile = prestmt.executeQuery();
			        while(rsFile.next()) {
			            AttachFile file = new AttachFile();
			            file.setNo(rsFile.getInt(1));
			            file.setBno(rsFile.getInt(2));
			            file.setFileName(rsFile.getString(3));
			            file.setFileSize(rsFile.getLong(4));
			            file.setDowncnt(rsFile.getInt(5));
			            file.setRegDateString("yyyy-MM-dd HH:mm:ss" , rsFile.getString(6));
			            file.setState(rsFile.getString(7));
			            file.setFolder(rsFile.getString(8));
			            file.setNewFileName(rsFile.getString(9));
			            file.setBun(rsFile.getString(10));
			            article.addFile(file);
			        }
			        rsFile.close();
			    }
			}
		    if(prestmt != null) { prestmt.close(); prestmt = null; }


			stmt.close();
			stmt = null;


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return acs;
    }

    /**
     * 게시물 목록을 쿼리 (페이징 하여)
     * @param userSession 사용자 세션
     * @param page 페이지 빈
     * @param sch 검색 빈
     * @param property 게시판 설정 빈
     * @param auth 게시판 권한 빈
     * @return Articles 게시물 목록
     */
    public Articles getSangdamArticles(final UserSession userSession , final PageAttribute page, final Search sch,
            final Property property, final Authority auth) {



        String tableName = Property.TABLE_PREFIX + property.getBoardID();
        String columns1 = " a.no as no, ref, refstep, reflevel, id, name, subject as subject, email, a.regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, IS_DELETE, rss_yn, cont_gubun, status, buse, virtualno,  ROW_NUMBER() OVER(  ORDER BY a.no desc) AS PAGE_NO    ";
        String columns2 = " a.no as no, ref, refstep, reflevel, id, name, subject as subject, email, a.regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, IS_DELETE, rss_yn, cont_gubun, status, buse, virtualno,  ROW_NUMBER() OVER(  ORDER BY  a.no desc) AS PAGE_NO    ";
        String where = "";
        String where_gul = "";
        // 공지사항이 아닌 글만
        where_gul = " (notice = '0') ";
        // 해당 그룹 코드가 넘어올경우 글 그룹을 사용 경우
        if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
        	where_gul += " and grp = '"+ sch.getGroup()+ "' ";
        }
        // 관리자가 아닐 경우만 안 지워진 글 조회 , 관리자일 경우 모두 조회
        if (!NeoBoardManager.checkManager(auth, property, userSession)) {
	        where_gul = where_gul + " and is_delete='N' ";
        }

        where = sch.makeCondition(where_gul,"").trim();

        String orderby = sch.makeOrdering(" ref desc , refstep asc ","").trim();

        String query = makeQuerySangdam(tableName,columns1,columns2,where,orderby,(page.getNPage()-1)*page.getNPageSize(),page.getNPage()*page.getNPageSize(), property.getBoardID() );

        String cntQuery = makeCountQuery(tableName,where);

        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rsFile = null;
		PreparedStatement prestmt = null;

		Articles acs = new Articles(page.getNPageSize());
		try {
			con = DBUtil.getConnection();
			/* 게시물 카운트 */
			stmt = con.createStatement();
		    rs = stmt.executeQuery(cntQuery);
			if(rs.next()) {
			    acs.setTotalCount(rs.getInt(1));
			}
			rs.close();
			rs = null;
			int topseq = acs.getTotalCount()-(page.getNPage()-1) * page.getNPageSize();
			/* 페이징 쿼리 */

			rs = stmt.executeQuery(query);
			while(rs.next()) {
			    Article article = new Article();
			    article.setNo(rs.getInt("no"));
			    article.setRef(rs.getInt("ref"));
			    article.setRefStep(rs.getInt("refstep"));
			    article.setRefLevel(rs.getInt("reflevel"));
			    article.setId(rs.getString("id"));
			    article.setName(rs.getString("name"));
			    article.setSubject(rs.getString("subject"));
			    article.setEmail(rs.getString("email"));
			    article.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString("regdate"));
			    article.setHitcnt(rs.getInt("hitcnt"));
			    article.setCmtcnt(rs.getInt("cmtcnt"));
			    article.setFilecnt(rs.getInt("filecnt"));
			    article.setDowncnt(rs.getInt("downcnt"));
			    article.setNotice(rs.getString("notice"));
			    article.setSecret(rs.getString("secret"));
			    article.setGrp(rs.getString("grp"));
			    article.setIsDelete(rs.getString("is_delete"));
			    article.setRssYn(rs.getString("rss_yn"));
			    article.setContGubun(rs.getString("cont_gubun"));
			    article.setStatus(rs.getString("status"));
			    article.setBuse(rs.getString("buse"));
			    article.setVirtualno(rs.getString("virtualno"));
			    if(!article.getNotice().equals("1")) {
				    article.setSeq(topseq);
				    topseq--;
			    }
			    acs.addArticle(article);

			}
			rs.close(); rs = null;
			if(prestmt != null) prestmt.close();


			stmt.close();
			stmt = null;


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return acs;
    }

    public Articles getInfoArticles(final UserSession userSession , final PageAttribute page, final Search sch,
            final Property property, final Authority auth) {

        String tableName = Property.TABLE_PREFIX + property.getBoardID();
        String columns1 = " a.no as no, ref, refstep, reflevel, id, name, subject as subject, email, content, a.regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, phone, zipcode, addr1, addr2, IS_DELETE, rss_yn, move_bid, url, status, buse ,   ROW_NUMBER() OVER(  ORDER BY  a.no desc) AS PAGE_NO   ";
        String columns2 = " a.no as no, ref, refstep, reflevel, id, name, subject as subject, email, content, a.regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, phone, zipcode, addr1, addr2, IS_DELETE, rss_yn, move_bid, url, status, buse ,   ROW_NUMBER() OVER(  ORDER BY  a.no desc) AS PAGE_NO   ";
        String where = "";
        String where_gul = "";
        // 공지사항이 아닌 글만
        where_gul = " (notice = '0') ";
        // 해당 그룹 코드가 넘어올경우 글 그룹을 사용 경우
        if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
        	where_gul += " and grp = '"+ sch.getGroup()+ "' ";
        }
        // 관리자가 아닐 경우만 안 지워진 글 조회 , 관리자일 경우 모두 조회
        if (!NeoBoardManager.checkManager(auth, property, userSession)) {
	        where_gul = where_gul + " and is_delete='N' ";
        }

        where = sch.makeCondition(where_gul,"").trim();

        String orderby = sch.makeOrdering(" ref desc , refstep asc ","").trim();

        String query = makeQueryInfo(tableName,columns1,columns2,where,orderby,(page.getNPage()-1)*page.getNPageSize(),page.getNPage()*page.getNPageSize(), property.getBoardID() );

        String cntQuery = makeCountQuery(tableName,where);

        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rsFile = null;
		PreparedStatement prestmt = null;

		Articles acs = new Articles(page.getNPageSize());
		try {
			con = DBUtil.getConnection();
			/* 게시물 카운트 */
			stmt = con.createStatement();
		    rs = stmt.executeQuery(cntQuery);
			if(rs.next()) {
			    acs.setTotalCount(rs.getInt(1));
			}
			rs.close();
			rs = null;
			int topseq = acs.getTotalCount()-(page.getNPage()-1) * page.getNPageSize();
			/* 페이징 쿼리 */


			rs = stmt.executeQuery(query);
			while(rs.next()) {
			    Article article = new Article();
			    article.setNo(rs.getInt("no"));
			    article.setRef(rs.getInt("ref"));
			    article.setRefStep(rs.getInt("refstep"));
			    article.setRefLevel(rs.getInt("reflevel"));
			    article.setId(rs.getString("id"));
			    article.setName(rs.getString("name"));
			    article.setSubject(rs.getString("subject"));
			    article.setEmail(rs.getString("email"));
			    article.setContent(rs.getString("content"));
			    article.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString("regdate"));
			    article.setHitcnt(rs.getInt("hitcnt"));
			    article.setCmtcnt(rs.getInt("cmtcnt"));
			    article.setFilecnt(rs.getInt("filecnt"));
			    article.setDowncnt(rs.getInt("downcnt"));
			    article.setNotice(rs.getString("notice"));
			    article.setSecret(rs.getString("secret"));
			    article.setGrp(rs.getString("grp"));
			    article.setPhone(rs.getString("phone"));
			    article.setZipcode(rs.getString("zipcode"));
			    article.setAddr1(rs.getString("addr1"));
			    article.setAddr2(rs.getString("addr2"));
			    article.setIsDelete(rs.getString("is_delete"));
			    article.setRssYn(rs.getString("rss_yn"));
			    article.setMoveBid(rs.getString("move_bid"));
			    article.setUrl(rs.getString("url"));
			    article.setStatus(rs.getString("status"));
			    article.setBuse(rs.getString("buse"));
			    if(!article.getNotice().equals("1")) {
				    article.setSeq(topseq);
				    topseq--;
			    }
			    acs.addArticle(article);

			}
			rs.close(); rs = null;
			if(prestmt != null) prestmt.close();


			stmt.close();
			stmt = null;


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return acs;
    }

    /**
     * 게시물 목록을 쿼리 (페이징 하여)
     * @param userSession 사용자 세션
     * @param page 페이지 빈
     * @param sch 검색 빈
     * @param property 게시판 설정 빈
     * @param auth 게시판 권한 빈
     * @return Articles 게시물 목록
     */
    public Articles getSangdamArticlesCk(final UserSession userSession , final PageAttribute page, final Search sch,
            final Property property, final Authority auth) {

        String tableName = Property.TABLE_PREFIX + property.getBoardID();
        String columns1 = " a.no as no, ref, refstep, reflevel, id, name, subject as subject, email, a.regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, IS_DELETE, rss_yn, cont_gubun, status, buse , virtualno,   ROW_NUMBER() OVER(  ORDER BY  a.no desc) AS PAGE_NO   ";
        String columns2 = " a.no as no, ref, refstep, reflevel, id, name, subject as subject, email, a.regdate, hitcnt, cmtcnt, filecnt, downcnt, notice, secret, grp, IS_DELETE, rss_yn, cont_gubun, status, buse , virtualno,   ROW_NUMBER() OVER(  ORDER BY  a.no desc) AS PAGE_NO   ";
        String where = "";
        String where_gul = "";
        // 공지사항이 아닌 글만
        where_gul = " (notice = '0') ";
        where_gul += " and name = '"+ sch.getName()+ "' and passwd = '"+ getMd5Passwd(sch.getPassword()) +"' and a.no = '" + sch.getBno() + "' ";
        // 해당 그룹 코드가 넘어올경우 글 그룹을 사용 경우
        if (property.getUseGroup() != null && property.getUseGroup().equals("1") && sch.getGroup()!=null && !sch.getGroup().equals("")) {
        	where_gul += " and grp = '"+ sch.getGroup()+ "' ";
        }
        // 관리자가 아닐 경우만 안 지워진 글 조회 , 관리자일 경우 모두 조회
        if (!NeoBoardManager.checkManager(auth, property, userSession)) {
	        where_gul = where_gul + " and is_delete='N' ";
        }

        where = sch.makeCondition(where_gul,"").trim();

        String orderby = sch.makeOrdering(" ref desc , refstep asc ","").trim();

        String query = makeQuerySangdam(tableName,columns1,columns2,where,orderby,(page.getNPage()-1)*page.getNPageSize(),page.getNPage()*page.getNPageSize(), property.getBoardID() );

        String cntQuery = makeCountQuerySangdam(tableName,where, property.getBoardID());

        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rsFile = null;
		PreparedStatement prestmt = null;

		Articles acs = new Articles(page.getNPageSize());
		try {
			con = DBUtil.getConnection();
			/* 게시물 카운트 */
			stmt = con.createStatement();
		    rs = stmt.executeQuery(cntQuery);
			if(rs.next()) {
			    acs.setTotalCount(rs.getInt(1));
			}
			rs.close();
			rs = null;
			int topseq = acs.getTotalCount()-(page.getNPage()-1) * page.getNPageSize();
			/* 페이징 쿼리 */

			rs = stmt.executeQuery(query);
			while(rs.next()) {
			    Article article = new Article();
			    article.setNo(rs.getInt("no"));
			    article.setRef(rs.getInt("ref"));
			    article.setRefStep(rs.getInt("refstep"));
			    article.setRefLevel(rs.getInt("reflevel"));
			    article.setId(rs.getString("id"));
			    article.setName(rs.getString("name"));
			    article.setSubject(rs.getString("subject"));
			    article.setEmail(rs.getString("email"));
			    article.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString("regdate"));
			    article.setHitcnt(rs.getInt("hitcnt"));
			    article.setCmtcnt(rs.getInt("cmtcnt"));
			    article.setFilecnt(rs.getInt("filecnt"));
			    article.setDowncnt(rs.getInt("downcnt"));
			    article.setNotice(rs.getString("notice"));
			    article.setSecret(rs.getString("secret"));
			    article.setGrp(rs.getString("grp"));
			    article.setIsDelete(rs.getString("is_delete"));
			    article.setRssYn(rs.getString("rss_yn"));
			    article.setContGubun(rs.getString("cont_gubun"));
			    article.setStatus(rs.getString("status"));
			    article.setBuse(rs.getString("buse"));
			    article.setVirtualno(rs.getString("virtualno"));
			    if(!article.getNotice().equals("1")) {
				    article.setSeq(topseq);
				    topseq--;
			    }
			    acs.addArticle(article);

			}
			rs.close(); rs = null;
			if(prestmt != null) prestmt.close();


			stmt.close();
			stmt = null;


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return acs;
    }

    /**
     * A 글에 대한 답글에서 A글의 작성자 ID 가져오기
     * @param property
     * @param ref			A 글에 대한 답글 : ref = A 번호
     * @return
     */
    public String getArticleIdOfRef(final Property property, int ref) {
    	String result	= null;
        String tableName = Property.TABLE_PREFIX + property.getBoardID();
        String query = "select id from " + tableName + " where no = " + ref;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		try {
			con = DBUtil.getConnection();

			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			/* Get ID */
			if(rs.next()) result = rs.getString(1);

			rs.close(); rs = null;
			if(prestmt != null) prestmt.close();

			stmt.close(); stmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }

    /**
     * 해당 페이지의 데이터를 쿼리하는 쿼리문을 만든다.
     * @param tableName 테이블 이름
     * @param columns1 조회하고자 하는 컬럼들
     * @param columns2 조회하고자 하는 컬럼들(인라인 쿼리)
     * @param where 조회 조건
     * @param orderby 정렬 조건
     * @param pageStart 시작 레코드
     * @param pageEnd 끝 레코드
     * @return 쿼리문
     */
    private String makePagingQuery(String tableName, String columns1, String columns2, String where, String orderby, int pageStart, int pageEnd) {
    	StringBuffer query = new StringBuffer();
    	/*
        query.append("select ");
        query.append(columns1);
        query.append(" from " + tableName);
        if(!where.equals("")) query.append(" where " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );
        query.append(" limit " + pageStart + "," + pageEnd);*/

    	if(tableName.equals("NEOBOARD_CARDN")){ // 카드뉴스일 경우
    		query.append("select * from (");
        	query.append("select a.*, ROW_NUMBER() OVER(  ORDER BY  tmp desc) AS PAGE_NO from ( ");
            query.append("select ");
            query.append(columns1);
            query.append(" from " + tableName);
            if(!where.equals("")) query.append(" where " + where + "");
            if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );
            query.append(") a ");
            query.append(") WHERE  PAGE_NO >"+pageStart+"    AND PAGE_NO <= "+pageEnd+"");
            
    	} // 카드뉴스일 경우
    	
    	else{
        	query.append("select * from ( ");
            query.append("select ");
            query.append(columns1);
            query.append(" from " + tableName);
            if(!where.equals("")) query.append(" where " + where + "");
            if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );
            query.append(") a ");
            query.append(" WHERE  PAGE_NO >"+pageStart+"    AND PAGE_NO <= "+pageEnd+"");    		
    	}


        return query.toString();
    }
    /**
     * 공지사항 데이터를 쿼리하는 쿼리문을 만든다.
     * @param tableName
     * @param columns1
     * @param columns2
     * @param where
     * @param orderby
     * @param pageStart
     * @param pageEnd
     * @return
     */
    private String makeQueryNotice(String tableName, String columns1, String columns2, String where, String orderby, int pageStart, int pageEnd) {
        StringBuffer query = new StringBuffer();
        query.append("select " + columns1);
        query.append(" from " + tableName);
        if(!where.equals("")) query.append(" where " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );

        return query.toString();
    }

    /**
     * 상담게시판 데이터를 쿼리하는 쿼리문을 만든다.
     * @param tableName
     * @param columns1
     * @param columns2
     * @param where
     * @param orderby
     * @param pageStart
     * @param pageEnd
     * @return
     */
    private String makeQuerySangdam(String tableName, String columns1, String columns2, String where, String orderby, int pageStart, int pageEnd, String boardid) {
        StringBuffer query = new StringBuffer();
    	query.append("select * from ( ");
        query.append("select " + columns1);
        query.append(" from " + tableName + "   a left join NEOBOARDSANGDAM   b ");
        query.append(" on a.no = b.bno and b.boardid = '" + boardid + "'");
        if(!where.equals("")) query.append(" where " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );
        query.append(" ) a ");
        query.append(" WHERE  PAGE_NO >"+pageStart+"    AND PAGE_NO <= "+pageEnd+" ");
      //  query.append(" limit " + pageStart + "," + pageEnd);
        System.out.println(query.toString());
        return query.toString();
    }
    /**
     * 정보공개게시판 데이터를 쿼리하는 쿼리문을 만든다.
     * @param tableName
     * @param columns1
     * @param columns2
     * @param where
     * @param orderby
     * @param pageStart
     * @param pageEnd
     * @return
     */
    private String makeQueryInfo(String tableName, String columns1, String columns2, String where, String orderby, int pageStart, int pageEnd, String boardid) {
        StringBuffer query = new StringBuffer();
        query.append("select * from ( ");
        query.append("select " + columns1);
        query.append(" from " + tableName + "  a, NEOBOARDINFOOPEN  b ");
        query.append(" where a.no = b.bno and b.boardid = '" + boardid + "'");
        if(!where.equals("")) query.append(" and " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );
        query.append(") a ");
        query.append(" WHERE  PAGE_NO >"+pageStart+"    AND PAGE_NO <= "+pageEnd+"");
        //query.append(" limit " + pageStart + "," + pageEnd);
        System.out.println( query.toString());
        return query.toString();
    }
    /**
     * 해장 조건의 레코드  개수 쿼리문 생성
     * @param tableName 테이블 이름
     * @param where 조건문
     * @return 쿼리
     */
    private String makeCountQuery(String tableName, String where) {
        StringBuffer query = new StringBuffer();
        query.append("select count(*) as count from ");
        query.append(tableName);
        if(!where.equals("")) query.append(" where " + where);
        //System.out.println(query.toString());
        return query.toString();
    }

    /**
     * 해장 조건의 레코드  개수 쿼리문 생성
     * @param tableName 테이블 이름
     * @param where 조건문
     * @return 쿼리
     */
    private String makeCountQuerySangdam(String tableName, String where, String boardid) {
        StringBuffer query = new StringBuffer();
        query.append("select count(*) as count from ");
        query.append(tableName + "   a left join NEOBOARDSANGDAM   b ");
        query.append(" on a.no = b.bno and b.boardid = '" + boardid + "'");
        if(!where.equals("")) query.append(" where " + where);
        //System.out.println(query.toString());
        return query.toString();
    }

    /**
     * 최신 글 번호 가져오기
     * @param property
     * @param sch
     * @param type default:of all, 1:of original ,2:of reply
     * @return no
     */
    public int getNo(final Property property , final Search sch , int type) {
    	int no = 0;
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
        try{
        	con = DBUtil.getConnection();
        	String sql = "select max(no) from " + Property.TABLE_PREFIX + property.getBoardID();
        	switch (type){
        	case 1: sql += " where is_delete='N' and refstep=0 and reflevel=0"; break;
        	case 2: sql += " where is_delete='N' and refstep>0 and reflevel>0"; break;
        	default : break;
        	}
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql) ;
            if (rs.next()){
               no = rs.getInt(1);
            }
        }catch(Exception e){
        	e.printStackTrace();
        } finally {
        	try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
        }
        return no;
    }

    /**
     * 아이디 검사
     * @param boardID
     * @param num
     * @param userID
     * @return
     */
    public boolean checkID(String boardID, String num){
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		try {
			con = DBUtil.getConnection();
			/* 게시물 쿼리 */
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("select id from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(boardID.toUpperCase());
		    queryBuf.append(" where no = ");
		    queryBuf.append(num);
			rs = stmt.executeQuery(queryBuf.toString());
			if(rs.next()) {
			    String id = rs.getString(1);
			    if (id != null && !id.equals("") && !id.equals("guest")) {
				    result = true;
				} else {
					result = false;
				}
			}
			else {
			    result = false;
			}
			if(rs != null) rs.close(); rs = null;
			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }

    /**
     * 코멘트 아이디 검사
     * @param boardID
     * @param num
     * @param userID
     * @return
     */
    public boolean checkCommentID(String boardID, String num){
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		try {
			con = DBUtil.getConnection();
			/* 게시물 쿼리 */
			stmt = con.createStatement();
			StringBuffer queryBuf = new StringBuffer();
			queryBuf.append("select id from ");
		    queryBuf.append(Property.TABLE_PREFIX);
		    queryBuf.append(boardID.toUpperCase());
		    queryBuf.append("CMT");
		    queryBuf.append(" where no = ");
		    queryBuf.append(num);
			rs = stmt.executeQuery(queryBuf.toString());
			if(rs.next()) {
			    String id = rs.getString(1);
			    if (id != null && !id.equals("") && !id.equals("guest")) {
				    result = true;
				} else {
					result = false;
				}
			}
			else {
			    result = false;
			}
			if(rs != null) rs.close(); rs = null;
			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }

    /**
     * 복원기능
     * @param property
     * @param articleNo
     * @param qUserID
     * @param qPasswd
     * @param isMaster
     * @param ip
     * @return
     */
    public boolean restoreArticle(Property property, int articleNo, String qUserID, String qPasswd, boolean isMaster, String ip) {
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;

		String tableName = Property.TABLE_PREFIX + property.getBoardID();
        StringBuffer queryBuf = new StringBuffer();
        String qId = "";

        try {
        	con = DBUtil.getConnection();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			/* 사용자 검사 */

			if(!isMaster) {
				if(property.getUseAuth().equals("1")) {
				    // 아이디 검사
				    rs = stmt.executeQuery("select id from " + tableName + " where no = " + new Integer(articleNo).toString());
				    if(rs.next()) {
				        qId = rs.getString(1);
				        if(qId!= null) {
				            if(!qId.equals(qUserID)) {
				                return false;
				            }
				        }
				        else {
				            return false;
				        }
				    }
				    else {
				        return false;
				    }
				    rs.close(); rs = null;
				}
				else {
				    // 비밀번호 검사
				    rs = stmt.executeQuery("select passwd, id from " + tableName + " where no = " + new Integer(articleNo).toString());
				    if(rs.next()) {
				        String qPwd = rs.getString(1);
				        qId = rs.getString(2);
				        if(qPwd!= null) {
				            if(!qPwd.equals(getMd5Passwd(qPasswd))) {
				                return false;
				            }
				        }
				        else {
				            return false;
				        }
				    }
				    else {
				        return false;
				    }
				    rs.close(); rs = null;
				}
			}

			/* 게시물 복원 */
		    queryBuf.setLength(0);
		    queryBuf.append("select refstep, reflevel, id, name from ");
		    queryBuf.append(tableName);
		    queryBuf.append(" where no = ");
		    queryBuf.append(articleNo);
		    rs = stmt.executeQuery(queryBuf.toString());
		    int refstep = 0;
		    int reflevel = 0;
		    String id = "";
		    String name = "";
		    if(rs.next()) {
		        refstep = rs.getInt(1);
		        reflevel = rs.getInt(2);
		        id = rs.getString(3);
		        name = rs.getString(4);
		    }
		    queryBuf.setLength(0);
		    queryBuf.append("update " + tableName + " set is_delete='N' ");
		    queryBuf.append(" where no = ");
		    queryBuf.append(articleNo);
		    stmt.executeUpdate(queryBuf.toString());

		    queryBuf.setLength(0);
		    queryBuf.append("update " + tableName + " set is_delete='N' ");
		    queryBuf.append(" where ref = ");
		    queryBuf.append(articleNo);
		    queryBuf.append(" and refstep > ");
		    queryBuf.append(refstep);
		    queryBuf.append(" and reflevel > ");
		    queryBuf.append(reflevel);

		    stmt.executeUpdate(queryBuf.toString());

			stmt.close(); stmt = null;

			/* 검색 복원 */
			deleteBoardSearch(property,articleNo,"N");

			con.commit();

			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
		    return false;
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }

    /**
     * 관리자 체킹
     * @param a
     * @param p
     * @param ses
     * @return
     */
    public static boolean checkManager(Authority a, Property p, final UserSession ses) {
        if(ses == null) return false;
        /* 총괄 게시판 관리자인지 검사 */
        if (a.getMaster() != null && !a.getMaster().equals("")) {
	        if(Property.findAllowedID(a.getMaster(),ses.getUserID())) {
	            return true;
	        }
        }
        /* 전체 관리자 */
        if(ses.getUserLevel().equals("1")) return true;

        return false;
    }

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

		strSQL = " SELECT * FROM (";
		strSQL += " SELECT bno, logno, logquery, userid, username, logregdt, ip FROM NEOBOARDLOG  where boardid='"+bid+"'";
		if (num > 0) {
			strSQL += " and bno=" + num;
		}
		strSQL += " order by bno desc ";
		strSQL += " ) A ";
		strSQL += " WHERE  PAGE_NO >"+nStartNum+"    AND PAGE_NO <= "+nEndNum+" ";

		//strSQL += " order by bno desc limit " + nStartNum + "," + nEndNum;

		try {
			con = DBUtil.getConnection();
			stmt = con.createStatement();

			rs = stmt.executeQuery(strSQL);
			while(rs.next()) {
				Article article = new Article();

				article.setNo(rs.getInt(1));
				article.setLogNo(rs.getInt(2));
				article.setLogQuery(rs.getString(3));
				article.setId(rs.getString(4));
				article.setName(rs.getString(5));
				article.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(6));
				article.setIp(rs.getString(7));

				vLog.addElement(article);
			}
			rs.close(); rs = null;
			stmt.close(); stmt = null;
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

			strSQL = "SELECT COUNT(*) From NEOBOARDLOG ";
			strSQL += " where boardid='"+bid+"'";
			if (num > 0) {
				strSQL += " and bno=" + num;
			}

			rs = stmt.executeQuery(strSQL);
			while (rs.next()) {
				nRetValue = rs.getInt(1);
			}
			rs.close(); rs = null;
			stmt.close(); stmt = null;
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

	/**
	 * RSS 게시물목록
	 * @param tablename
	 * @param limit
	 * @param secret
	 * @return
	 */
	public Vector getNeoBoard(String tablename, int limit, String secret) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vBoard = new Vector();
		String strSQL = "";
		String flag = "N";

		strSQL = "SELECT *(";
		strSQL += "SELECT A.*, ROWNUM AS ROW_NO (";
		strSQL += "  SELECT no, subject, regdate, name,filecnt FROM "+tablename+"  where is_delete='N' ";
		if (secret != null && !secret.equals("")) {
			if (secret.equals("0")) {
				strSQL += " and (secret='"+secret+"' or secret is null) ";
			} else {
				strSQL += " and secret='"+secret+"' ";
			}
		}

		//strSQL += "order by no desc limit 0, "+limit;
		strSQL += "order by no desc ";
		strSQL += ") A";
		strSQL += ") B WHERE ROW_NO =<"+limit;

		try {
        	con = DBUtil.getConnection();
			stmt = con.createStatement();

			rs = stmt.executeQuery(strSQL);

			while(rs.next()) {
				Article article = new Article();

				article.setNo(rs.getInt(1));
				article.setSubject(rs.getString(2));
				article.setRegDateString("yyyyy-MM-dd HH:mm:ss", rs.getString(3));
				article.setName(rs.getString(4));
				article.setFilecnt(rs.getInt(5));
				vBoard.addElement(article);
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) { rs.close(); }
				if (stmt != null) { stmt.close(); }
				if (con != null) { con.close(); }
			} catch (Exception e) {
			}
		}

		return vBoard;
	}

	/**
     * 비밀번호 암호화
     * @param passwd
     * @return
     */
    public String getMd5Passwd(String passwd){

    	MySqlFunction mySqlFunction=new MySqlFunction();
    	String result = "";
    	result=MD5class.MD5(mySqlFunction.password(passwd));
    	System.out.println("getMd5Passwd===>"+result);
		/*Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String result = "";

		try {
			con = DBUtil.getConnection();
			stmt = con.createStatement();

			String sql="select md5(password('" + passwd + "')) from dual ";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = rs.getString(1);
			}
			rs.close(); rs = null;
			stmt.close(); stmt = null;
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {
			    if (rs != null) rs.close();
			    if (stmt !=null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}*/
		return result;
	}

    /**
     * SMS 발송
     */
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
				   + "(?,?,'0522162114',1,?,sysdate,sysdate)";

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