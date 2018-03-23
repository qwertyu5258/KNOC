package kr.co.knoc.postbox;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import com.neoboard.mailing.MailBean;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.util.DateUtil;
import kr.co.knoc.etc.*;

public class PostBoxManager {
	public boolean insertChannel(PostBoxBean cb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from knoc_postbox";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into knoc_postbox "
				   + " (no,id, pwd, title, content, regdate, hitcount, answer) "
				   + " values (?, ?, ?, ?, ?, SYSDATE, 0, '')"; 			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,cb.getId());	
			prestmt.setString(index++,cb.getPwd());
			prestmt.setString(index++,cb.getTitle());
			prestmt.setString(index++,cb.getContent());
			
			prestmt.executeUpdate();	
			prestmt.close();
			
			String str = "e청렴 우체통에 의견이 등록되었습니다. ["+DateUtil.getFormattedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"]";

			if(cb.getMobile().equals("null") || cb.getMobile() != null){
				SmsManager.insertSmsWait(cb.getMobile(), "1", str);
			}
			
			String mailTo = cb.getEmail();
			String mailFrom = "webmaster@knoc.co.kr";
			String title = "e청렴 우체통에 의견이 등록되었습니다. ["+DateUtil.getFormattedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"]";
			String body = "제목 : " + cb.getTitle() + " <br /><br /> " + cb.getContent();
			String mailServer = "localhost";
			String toName = cb.getName();
			String fromName = "webmaster";
			MailBean Mailb = new MailBean(mailTo, mailFrom, title, body, "", toName, fromName, mailServer);
			Mailb.start();
			
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
	
	public ArrayList<PostBoxBean> getChannelListPwd(String pwd, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<PostBoxBean> result = new ArrayList<PostBoxBean>(); 		
 		StringBuffer query = new StringBuffer(); 	
 		query.append("select * from ( ");
        query.append("select no, title, regdate , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO ");
        query.append(" from knoc_postbox");
        query.append(" where pwd = ? ");
        //query.append(" order by no desc limit ?, ?");
        query.append(" order by no desc  ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, pwd);
			prestmt.setInt(2, (page-1) * pageSize);
			prestmt.setInt(3,page* pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				PostBoxBean cb = new PostBoxBean();
				cb.setNo(rs.getInt("no"));
				cb.setTitle(rs.getString("title"));
				cb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(cb);
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
	
	public int getChannelListCountPwd(String pwd) {
    	Connection con = null;
 		ResultSet rs = null;
 		Statement stmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from knoc_postbox");
        query.append(" where pwd = '"+pwd+"'");
        try {
			con = DBUtil.getConnection();
		
			stmt = con.createStatement();
			rs = stmt.executeQuery(query.toString());
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			rs.close(); rs = null;
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
	
	public ArrayList<PostBoxBean> getChannelList(int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<PostBoxBean> result = new ArrayList<PostBoxBean>(); 		
 		StringBuffer query = new StringBuffer(); 	
 		query.append("select * from ( ");
        query.append("select no, title, regdate  , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO");
        query.append(" from knoc_postbox");
        //query.append(" order by no desc limit ?, ?");
        query.append(" order by no desc  ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2, page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				PostBoxBean cb = new PostBoxBean();
				cb.setNo(rs.getInt("no"));
				cb.setTitle(rs.getString("title"));
				cb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(cb);
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
	
	public int getChannelListCount() {
    	Connection con = null;
 		ResultSet rs = null;
 		Statement stmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from knoc_postbox");
        
        try {
			con = DBUtil.getConnection();
		
			stmt = con.createStatement();
			rs = stmt.executeQuery(query.toString());
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			rs.close(); rs = null;
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
	
	public boolean checkPwd(int no, String pwd){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select pwd from knoc_postbox where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				if (pwd.equals(rs.getString("pwd"))) {
					result = true;
				}				
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
		return result;
	}
	
	public PostBoxBean getChannel(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		PostBoxBean cb = new PostBoxBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select pwd, title, content, regdate, answer,TO_CHAR(answerdate,'YYYY-MM-DD') as answerdate, hitcount from knoc_postbox where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				cb.setPwd(rs.getString("pwd"));
				cb.setTitle(rs.getString("title"));
				cb.setContent(rs.getString("content"));
				cb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				cb.setAnswer(rs.getString("answer"));
				cb.setAnswerDate(rs.getString("answerdate"));
				cb.setHitcount(rs.getInt("hitcount"));				
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
		return cb;
	}
	
	public boolean updateChannel(PostBoxBean cb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update knoc_postbox set title=?, content=? where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,cb.getTitle());			
			prestmt.setString(index++,cb.getContent());
			prestmt.setInt(index++,cb.getNo());
			
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
	
	public boolean updateReplyChannel(PostBoxBean cb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update knoc_postbox set answer=?, answerdate=SYSDATE where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,cb.getAnswer());	
			prestmt.setInt(index++,cb.getNo());
			
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
	
	public boolean deleteChannel(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from knoc_postbox where no=?";
				   					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);				
			
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
	
	
	public String getAdminId(){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String user_id = "";
		try {
			con = DBUtil.getConnection();			
			
			//String sql = "select USER_ID from knoc_postbox_user limit 1";
			String sql = "select USER_ID from knoc_postbox_user WHERE ROWNUM= 1";
				   					
			prestmt = con.prepareStatement(sql);
							
			rs = prestmt.executeQuery();
			if (rs.next()) {
				user_id = rs.getString("USER_ID");
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
		return user_id;
	}
	public String getAdminPwd(String user_id){
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String user_pwd = "";
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select USER_PWD from knoc_postbox_user where USER_ID=?";
				   					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1, user_id);				
			rs = prestmt.executeQuery();
			if (rs.next()) {
				user_pwd = rs.getString("USER_PWD");
				System.out.println("user_pwd ::::::" + user_pwd);
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
		return user_pwd;
	}
	
	public boolean updateSetAdminPwd(HashMap dataMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update knoc_postbox_user set USER_PWD=? where USER_ID=? and USER_PWD=?";
					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,dataMap.get("new_pwd").toString());
			prestmt.setString(2,dataMap.get("user_id").toString());
			prestmt.setString(3,dataMap.get("old_pwd").toString());
			
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
}
