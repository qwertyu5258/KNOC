package com.neoboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import com.neoboard.data.Authority;
import com.neoboard.data.ExtAuthority;
import com.neoboard.jdbc.*;
import com.neoboard.session.UserSession;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class AuthorityManager {

    /**
     * 버튼 보임 체크
     * @param button
     * @param a
     * @param ses
     * @return
     */
    public static boolean isViewable(String button, ExtAuthority a, UserSession ses) {
        if(ses == null) return false;
        if(button.equals("registration")) {
            /* 등록의 경우 권한이 있는 사용자만 접근 가능, 사용 유무에 상관없이 */
            /* 관리자 이면 참 */
            if(a.getMaster().indexOf(ses.getUserID()) > -1 ) return true;
            /* 전체 관리자 level == 1 */
            if(ses.getUserLevel().equals("1")) return true;
            /* 등록을 허용하지만 레벨이 안되거나 관리자가 아닐 경우 */
            if(Integer.parseInt(ses.getUserLevel()) <= a.getLevelRegistration()) {
                return true;
            }
            else if(a.getRegistrationAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
            else {
                return false;
            }
        }
        else if(button.equals("edit")) {
            /* 관리자 이면 참 */
            if(a.getMaster().indexOf(ses.getUserID()) > -1 ) return true;
            /* 전체 관리자 level == 1 */
            if(ses.getUserLevel().equals("1")) return true;
            /* 수정을 허용하지만 레벨이 안되거나 관리자가 아닐 경우 */
            if(Integer.parseInt(ses.getUserLevel()) <= a.getLevelEdit()) {
                return true;
            }
            else if(a.getEditAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
            else {
                return false;
            }
        }
        else if(button.equals("reply")) {
            /* 관리자 이면 참 */
            if(a.getMaster().indexOf(ses.getUserID()) > -1 ) return true;
            /* 전체 관리자 level == 1 */
            if(ses.getUserLevel().equals("1")) return true;
            /* 답변을 허용하지만 레벨이 안되거나 관리자가 아닐 경우 */
            if(Integer.parseInt(ses.getUserLevel()) <= a.getLevelReply()) {
                return true;
            }
            else if(a.getReplyAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
            else {
                return false;
            }
        }
        else if(button.equals("delete")) {
            /* 관리자 이면 참 */
            if(a.getMaster().indexOf(ses.getUserID()) > -1 ) return true;
            /* 전체 관리자 level == 1 */
            if(ses.getUserLevel().equals("1")) return true;
            /* 삭제를 허용하지만 레벨이 안되거나 관리자가 아닐 경우 */
            if(Integer.parseInt(ses.getUserLevel()) <= a.getLevelDelete()) {
                return true;
            }
            else if(a.getDeleteAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
            else {
                return false;
            }
        }
        return false;
    }
    
    public static boolean checkManager(ExtAuthority a,UserSession ses, String m) {
        if(ses == null) return false;
        /* 총괄 게시판 관리자인지 검사 */
        if(a.getMaster().indexOf(ses.getUserID()) > -1) {
            return true;
        }
        /* 전체 관리자 */
        if(ses.getUserLevel().equals("1")) return true;
        
        /* 목록에 대한 권한 검사 */
        if(m.equals("list")) {
            // 아이디 검사
            if(a.getListAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
        }
        else if(m.equals("view")) {
            // 아이디 검사
            if(a.getViewAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
        }
        else if(m.equals("write")) {
            // 아이디 검사
            if(a.getRegistrationAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
        }
        else if(m.equals("reply")) {
            // 아이디 검사
            if(a.getReplyAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
        }
        else if(m.equals("commentwrite")) {
	        // 아이디 검사
	        if(a.getCommentWriteAllowedUser().indexOf(ses.getUserID()) > -1) {
	            return true;
	        }
	    }
        else if(m.equals("commentdelete")) {
	        // 아이디 검사
	        if(a.getCommentDeleteAllowedUser().indexOf(ses.getUserID()) > -1) {
	            return true;
	        }
	    }
        return false;
    }
    /**
     * 페이지 접근 권한 체크
     * @param boardID
     * @param mode
     * @return
     */
    public static boolean checkAuthority(ExtAuthority a,UserSession ses, String m) {
        if(ses == null) return false;
        /* 총괄 게시판 관리자인지 검사 */
        if(a.getMaster().indexOf(ses.getUserID()) > -1) {
            return true;
        }
        /* 전체 관리자 */
        if(ses.getUserLevel().equals("1")) return true;
        
        /* 목록에 대한 권한 검사 */
        if(m.equals("list")) {
            // 레벨 검사
            if(a.getLevelList() >= Integer.parseInt(ses.getUserLevel())) {
                return true;
            }
            // 아이디 검사
            if(a.getListAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
        }
        else if(m.equals("view")) {
//              레벨 검사
            if(a.getLevelView() >= Integer.parseInt(ses.getUserLevel())) {
                return true;
            }
            // 아이디 검사
            if(a.getViewAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
        }
        else if(m.equals("write")) {
//              레벨 검사
            if(a.getLevelRegistration() >= Integer.parseInt(ses.getUserLevel())) {
                return true;
            }
            // 아이디 검사
            if(a.getRegistrationAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
        }
        else if(m.equals("reply")) {
//              레벨 검사
            if(a.getLevelReply() >= Integer.parseInt(ses.getUserLevel())) {
                return true;
            }
            // 아이디 검사
            if(a.getReplyAllowedUser().indexOf(ses.getUserID()) > -1) {
                return true;
            }
        }
        else if(m.equals("commentwrite")) {
	//          레벨 검사
	        if(a.getLevelCommentWrite() >= Integer.parseInt(ses.getUserLevel())) {
	            return true;
	        }
	        // 아이디 검사
	        if(a.getCommentWriteAllowedUser().indexOf(ses.getUserID()) > -1) {
	            return true;
	        }
	    }
        else if(m.equals("commentdelete")) {
	//          레벨 검사
	        if(a.getLevelCommentDelete() >= Integer.parseInt(ses.getUserLevel())) {
	            return true;
	        }
	        // 아이디 검사
	        if(a.getCommentDeleteAllowedUser().indexOf(ses.getUserID()) > -1) {
	            return true;
	        }
	    }
        return false;
    }
    /**
     * 외부 게시판 권한 갱신 
     * @param auth
     * @return
     */
    public boolean updateExtAuthority(ExtAuthority auth) {
    	Connection con = null;
		PreparedStatement prestmt = null;
		
		StringBuffer queryBuf = new StringBuffer();
        try {
        	con = DBUtil.getConnection();
			
			queryBuf.append("update neoboardExtAuth set ");
			queryBuf.append("BOARDNAME = ?,");
			queryBuf.append("LEVELLIST = ?,");
			queryBuf.append("LISTALLOWEDUSER = ?,");
			queryBuf.append("LEVELVIEW = ?,");
			queryBuf.append("VIEWALLOWEDUSER = ?,");
			queryBuf.append("LEVELREGISTRATION = ?,");
			queryBuf.append("REGISTRATIONALLOWEDUSER = ?,");
			queryBuf.append("LEVELREPLY = ?,");
			queryBuf.append("REPLYALLOWEDUSER = ?,");
			queryBuf.append("LEVELEDIT = ?,");
			queryBuf.append("EDITALLOWEDUSER = ?,");
			queryBuf.append("LEVELDELETE = ?,");
			queryBuf.append("DELETEALLOWEDUSER = ?,");
			queryBuf.append("LEVELCOMMENTWRITE = ?,");
			queryBuf.append("COMMENTWRITEALLOWEDUSER = ?,");
			queryBuf.append("LEVELCOMMENTDELETE = ?,");
			queryBuf.append("COMMENTDELETEALLOWEDUSER = ?,");
			queryBuf.append("MASTER = ? ");
			queryBuf.append("where BOARDID = ? ");
			
			int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setString(index++,auth.getBoardName());
			prestmt.setInt(index++,auth.getLevelList());
			prestmt.setString(index++,auth.getListAllowedUser());
			prestmt.setInt(index++,auth.getLevelView());
			prestmt.setString(index++,auth.getViewAllowedUser());
			prestmt.setInt(index++,auth.getLevelRegistration());
			prestmt.setString(index++,auth.getRegistrationAllowedUser());
			prestmt.setInt(index++,auth.getLevelReply());
			prestmt.setString(index++,auth.getReplyAllowedUser());
			prestmt.setInt(index++,auth.getLevelEdit());
			prestmt.setString(index++,auth.getEditAllowedUser());
			prestmt.setInt(index++,auth.getLevelDelete());
			prestmt.setString(index++,auth.getDeleteAllowedUser());
			prestmt.setInt(index++,auth.getLevelCommentWrite());
			prestmt.setString(index++,auth.getCommentWriteAllowedUser());
			prestmt.setInt(index++,auth.getLevelCommentDelete());
			prestmt.setString(index++,auth.getCommentDeleteAllowedUser());
			prestmt.setString(index++,auth.getMaster());
			prestmt.setString(index++,auth.getBoardID());
			prestmt.executeUpdate();
			
			prestmt.close(); prestmt = null;
			
			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		    
		} finally {
			try { if (prestmt != null) prestmt.close(); } catch (Exception e) { }
			try { if (con != null) con.close(); } catch (Exception e) { }
		}
		return false;
    }
    /**
     * 외부 게시판 권한 삭제
     * @param boardID
     * @return
     */
    public boolean deleteExtAuthority(String boardID) {
        Connection con = null;
		PreparedStatement prestmt = null;
		
		String query = "delete from NEOBOARDEXTAUTH where boardID = ?";
		try {
			con = DBUtil.getConnection();
		
			prestmt = con.prepareStatement(query);
			prestmt.setString(1,boardID);
			prestmt.executeUpdate();
			
			prestmt.close();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (prestmt != null) prestmt.close(); } catch (Exception e) { }
			try { if (con != null) con.close(); } catch (Exception e) { }
		}
        return false;
    }
    /**
     * 외부 게시판 권한 생성
     * @param auth
     * @return
     */
    public boolean addExtAuthority(ExtAuthority auth) {
        Connection con = null;
		PreparedStatement prestmt = null;
		
		StringBuffer queryBuf = new StringBuffer();
		try {
			con = DBUtil.getConnection();
		
			queryBuf.append("insert into ");
	        queryBuf.append("neoboardextauth");
	        queryBuf.append(" (boardid, boardname, levellist, listallowedUser, levelView, viewAllowedUser," +
	        		"levelRegistration, registrationAllowedUser, levelReply, replyAllowedUser," +
	        		"leveledit, editAllowedUser, leveldelete, deleteAllowedUser, " +
	        		"levelCommentWrite, commentWriteAllowedUser, levelCommentDelete, commentDeleteAllowedUser," +
	        		"master ) ");
	        queryBuf.append("values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	        
	        int index = 1;
			prestmt = con.prepareStatement(queryBuf.toString());
			prestmt.setString(index++,auth.getBoardID());
			prestmt.setString(index++,auth.getBoardName());
			prestmt.setInt(index++,auth.getLevelList());
			prestmt.setString(index++,auth.getListAllowedUser());
			prestmt.setInt(index++,auth.getLevelView());
			prestmt.setString(index++,auth.getViewAllowedUser());
			prestmt.setInt(index++,auth.getLevelRegistration());
			prestmt.setString(index++,auth.getRegistrationAllowedUser());
			prestmt.setInt(index++,auth.getLevelReply());
			prestmt.setString(index++,auth.getReplyAllowedUser());
			prestmt.setInt(index++,auth.getLevelEdit());
			prestmt.setString(index++,auth.getEditAllowedUser());
			prestmt.setInt(index++,auth.getLevelDelete());
			prestmt.setString(index++,auth.getDeleteAllowedUser());
			prestmt.setInt(index++,auth.getLevelCommentWrite());
			prestmt.setString(index++,auth.getCommentWriteAllowedUser());
			prestmt.setInt(index++,auth.getLevelCommentDelete());
			prestmt.setString(index++,auth.getCommentDeleteAllowedUser());
			prestmt.setString(index++,auth.getMaster());
			prestmt.executeUpdate();
			
			prestmt.close();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (prestmt != null) prestmt.close(); } catch (Exception e) {}
			try { if (con != null) con.close(); } catch (Exception e) {}
		}
        return false;
        
       
    }
    /**
     * 외부 게시판 설정 목록 쿼리
     * @return
     */
    public Vector getExtAuthorityList() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "Select * from NEOBOARDEXTAUTH order by BOARDID";
		Vector v = new Vector();
		try {
			con = DBUtil.getConnection();
		
		    stmt = con.createStatement();
		    rs = stmt.executeQuery(query);
			int index = 1;
			while(rs.next()) {
			    index = 1;
			    ExtAuthority auth = new ExtAuthority();
			    auth.setBoardID(rs.getString(index++));
			    auth.setBoardName(rs.getString(index++));
			    auth.setLevelList(rs.getInt(index++));
			    auth.setListAllowedUser(rs.getString(index++));
			    auth.setLevelView(rs.getInt(index++));
			    auth.setViewAllowedUser(rs.getString(index++));
			    auth.setLevelRegistration(rs.getInt(index++));
			    auth.setRegistrationAllowedUser(rs.getString(index++));
			    auth.setLevelReply(rs.getInt(index++));
			    auth.setReplyAllowedUser(rs.getString(index++));
			    auth.setLevelEdit(rs.getInt(index++));
			    auth.setEditAllowedUser(rs.getString(index++));
			    auth.setLevelDelete(rs.getInt(index++));
			    auth.setDeleteAllowedUser(rs.getString(index++));
			    auth.setLevelCommentWrite(rs.getInt(index++));
			    auth.setCommentWriteAllowedUser(rs.getString(index++));
			    auth.setLevelCommentDelete(rs.getInt(index++));
			    auth.setCommentDeleteAllowedUser(rs.getString(index++));
			    auth.setMaster(rs.getString(index++));
			    v.add(auth);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(query);
		} finally {
			try { if (rs != null) rs.close(); 	} catch (Exception e) {	}
			try { if (stmt != null) stmt.close(); 	} catch (Exception e) {	}
			try { if (con != null) con.close(); 	} catch (Exception e) {	}
		}
        return v;
    }
    /**
     * 외부 게시판 권한 질의
     * @param boardID
     * @return
     */
    public ExtAuthority getExtAuthority(String boardID) {
        
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		ExtAuthority auth = null;
		
		String query = "Select * from NEOBOARDEXTAUTH where boardid = ?";
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query);
		    prestmt.setString(1,boardID);
			rs = prestmt.executeQuery();
			int index = 1;
			if(rs.next()) {
			    auth = new ExtAuthority();
			    auth.setBoardID(rs.getString(index++));
			    auth.setBoardName(rs.getString(index++));
			    auth.setLevelList(rs.getInt(index++));
			    auth.setListAllowedUser(rs.getString(index++));
			    auth.setLevelView(rs.getInt(index++));
			    auth.setViewAllowedUser(rs.getString(index++));
			    auth.setLevelRegistration(rs.getInt(index++));
			    auth.setRegistrationAllowedUser(rs.getString(index++));
			    auth.setLevelReply(rs.getInt(index++));
			    auth.setReplyAllowedUser(rs.getString(index++));
			    auth.setLevelEdit(rs.getInt(index++));
			    auth.setEditAllowedUser(rs.getString(index++));
			    auth.setLevelDelete(rs.getInt(index++));
			    auth.setDeleteAllowedUser(rs.getString(index++));
			    auth.setLevelCommentWrite(rs.getInt(index++));
			    auth.setCommentWriteAllowedUser(rs.getString(index++));
			    auth.setLevelCommentDelete(rs.getInt(index++));
			    auth.setCommentDeleteAllowedUser(rs.getString(index++));
			    auth.setMaster(rs.getString(index++));
			}
			rs.close();
			prestmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(query);
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return auth;
    }
    /**
     * 통합보드 권한 질의
     * @param boardID
     * @return
     */
    public Authority getAuthority(String boardID){
        Authority auth = null;
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		String query = "Select BOARDID, LEVELLIST, LISTALLOWEDUSER, LEVELVIEW, VIEWALLOWEDUSER, LEVELREGISTRATION, REGISTRATIONALLOWEDUSER, LEVELREPLY, REPLYALLOWEDUSER, LEVELEDIT, EDITALLOWEDUSER, LEVELDELETE, DELETEALLOWEDUSER, LEVELCOMMENTWRITE, COMMENTWRITEALLOWEDUSER, LEVELCOMMENTDELETE, COMMENTDELETEALLOWEDUSER, MASTER, LEVELNOTICE, NOTICEALLOWEDUSER, LEVELDOWN, DOWNALLOWEDUSER from NEOBOARDAUTHORITY where boardid = ? ";
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query);
		    prestmt.setString(1,boardID);
			rs = prestmt.executeQuery();
			int index = 1;
			if(rs.next()) {
			    auth = new Authority();
			    auth.setBoardID(rs.getString(index++));
			    auth.setLevelList(rs.getInt(index++));
			    auth.setListAllowedUser(rs.getString(index++));
			    auth.setLevelView(rs.getInt(index++));
			    auth.setViewAllowedUser(rs.getString(index++));
			    auth.setLevelRegistration(rs.getInt(index++));
			    auth.setRegistrationAllowedUser(rs.getString(index++));
			    auth.setLevelReply(rs.getInt(index++));
			    auth.setReplyAllowedUser(rs.getString(index++));
			    auth.setLevelEdit(rs.getInt(index++));
			    auth.setEditAllowedUser(rs.getString(index++));
			    auth.setLevelDelete(rs.getInt(index++));
			    auth.setDeleteAllowedUser(rs.getString(index++));
			    auth.setLevelCommentWrite(rs.getInt(index++));
			    auth.setCommentWriteAllowedUser(rs.getString(index++));
			    auth.setLevelCommentDelete(rs.getInt(index++));
			    auth.setCommentDeleteAllowedUser(rs.getString(index++));
			    auth.setMaster(rs.getString(index++));
			    auth.setLevelNotice(rs.getInt(index++));
			    auth.setNoticeAllowedUser(rs.getString(index++));
			    auth.setLevelDown(rs.getInt(index++));
			    auth.setDownAllowedUser(rs.getString(index++));
			}
			rs.close();
			prestmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return auth;
    }
}