package kr.co.knoc.mgr;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;


import kr.co.knoc.etc.SmsManager;
import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.secure.SecureDBUtil;
import kr.co.knoc.etc.*;

public class MgrHelper {
	/**
	 * 사용자 입력
	 * @param data
	 * @return
	 */
	public boolean insertMgr(MgrDO data){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		boolean checkid = true;
		boolean checkext = true;
		int idx = 0;
		
		checkid = checkID(data.getId());
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from member";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				idx = rs.getInt(1) + 1;
			} else {
				idx = 1;
			}
			stmt.close();
			
			sql="insert into member "
				   + " (no, id, password, name, email, tel, mobile, zipcode, addr1, addr2, letter, join_date, lastlogin, user_ip, userlevel, job, virtualno) "
				   + " values (?, ?, ? , ?, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate, ?, '8', ?, ?)"; 			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,idx);
			prestmt.setString(index++,data.getId()); 
			prestmt.setString(index++,SecureDBUtil.crypto.encrypt("knoc", "member", "password", data.getPasswd()));	
			prestmt.setString(index++,data.getName());
			prestmt.setString(index++,data.getEmail());
			prestmt.setString(index++,data.getPhoneNumber());
			prestmt.setString(index++,data.getMobileNumber());
			prestmt.setString(index++,data.getZipcode());
			prestmt.setString(index++,data.getAddr1());
			prestmt.setString(index++,data.getAddr2());
			prestmt.setString(index++,data.getLetter());			
			prestmt.setString(index++,data.getIp());
			prestmt.setString(index++,data.getJob());	
			prestmt.setString(index++,data.getVirtualno());
			
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
	 * 아이디중복체크 
	 * @param strID
	 * @return
	 */
	public boolean checkID(String strID) {
		Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String strSQL = null;
		String  user_id = "";
		boolean result = true;		

		try {
			con = DBUtil.getConnection();
			strSQL = "select id from member where id = ?";
			prestmt = con.prepareStatement(strSQL);
			prestmt.setString(1,strID);
			rs = prestmt.executeQuery();

			if(rs.next()) {
				user_id = rs.getString("id");
				result = true;
			} else {
				result = false;
			}
		}		
		catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (prestmt !=null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		
		return result;
	}
	
	/**
	 * G-PIN 가상키코드 중복확인 
	 * @param virtualNo
	 * @return
	 */
	public boolean checkVirtualNo(String virtualNo) {
		Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String strSQL = null;
		String  user_id = "";
		boolean result = true;		

		try {
			con = DBUtil.getConnection();
			strSQL = "select id from member where virtualno = ?";
			prestmt = con.prepareStatement(strSQL);
			prestmt.setString(1,virtualNo);
			rs = prestmt.executeQuery();

			if(rs.next()) {
				user_id = rs.getString("id");
				result = true;
			} else {
				result = false;
			}
		}		
		catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (prestmt !=null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		
		return result;
	}	
	
	/**
	 * 사용자 조회
	 * @param id
	 * @return
	 */
	public MgrDO queryMgr(String id){
		Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		MgrDO result = null;
		try {
			con = DBUtil.getConnection();
			String sqlstr = "select id , name, password, email, userlevel, join_date, lastlogin, user_ip, tel, mobile, zipcode, addr1, addr2, letter, job from member where id = ?";
			prestmt = con.prepareStatement(sqlstr);
			prestmt.setString(1, id);
			rs = prestmt.executeQuery();
			if(rs.next()) {
				result = new MgrDO();
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));	
				
				result.setPasswd(   rs.getString("password"));
				result.setEmail(rs.getString("email"));
				result.setLevel(rs.getString("userlevel"));				
				result.setJoinDateTime(rs.getString("join_date"));
				result.setLastLoginDateTime(rs.getString("lastlogin"));
				result.setIp(rs.getString("user_ip"));
				result.setPhoneNumber(rs.getString("tel"));
				result.setMobileNumber(rs.getString("mobile"));
				result.setZipcode(rs.getString("zipcode"));
				result.setAddr1(rs.getString("addr1"));
				result.setAddr2(rs.getString("addr2"));
				result.setLetter(rs.getString("letter"));
				result.setJob(rs.getString("job"));
				/* Mgr's organization */
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
			if(rs != null) rs.close(); rs = null;
		}
		catch (Exception e) {
			e.printStackTrace();		
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (prestmt !=null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	/**
	 * 마지막 로그인 날짜 업데이트
	 * @param strID
	 */
	public void updateLastLogin(String strID) {
		Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String strSQL = null;

		try {
			con = DBUtil.getConnection();
			strSQL = "update member set lastlogin=sysdate where id = ?";
			prestmt = con.prepareStatement(strSQL);
			prestmt.setString(1,strID);
			prestmt.executeUpdate();
		}		
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (prestmt !=null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
	}	
	
	/**
	 * 회원 리스트
	 * @param key_gbn
	 * @param key_word
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList<MgrDO> getMemberList(String key_gbn, String key_word, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<MgrDO> result = new ArrayList<MgrDO>();
 		StringBuffer query = new StringBuffer();
 		String columns = "no, id, name, password, email, userlevel, join_date, tel, mobile, lastlogin , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO";
 		String orderby = "no desc";
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
 		query.append(" SELECT * FROM (  ");
        query.append("select " + columns);
        query.append(" from member");
        if(!where.equals("")) query.append(" where " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );   
        query.append(" )A  ");
        query.append("    WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
       // query.append(" limit ?, ?");
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1,(page-1) * pageSize);
		    prestmt.setInt(2,pageSize );
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				MgrDO smd = new MgrDO();
				smd.setId(rs.getString("id"));
				smd.setName(rs.getString("name"));
				smd.setPasswd(rs.getString("password"));
				smd.setEmail(rs.getString("email"));
				smd.setLevel(rs.getString("userlevel"));
				smd.setJoinDateTime(rs.getString("join_date"));
				smd.setPhoneNumber(rs.getString("tel"));
				smd.setMobileNumber(rs.getString("mobile"));
				smd.setLastLoginDateTime(rs.getString("lastlogin"));
				result.add(smd);
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
     * 회원 목록
     * @return
     */
    public int getMemberListCount(String key_gbn, String key_word) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer();
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
        query.append("select count(*) ");
        query.append(" from member");
        if(!where.equals("")) query.append(" where " + where + "");
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
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
     * 회원 정보 수정
     * @param data
     * @return
     */
    public boolean updateMgr(MgrDO data){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update member set email=?, tel=?, mobile=?, userlevel=?, zipcode=?, addr1=?, addr2=?, letter=?, job=? where id=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);			
			prestmt.setString(index++,data.getEmail());
			prestmt.setString(index++,data.getPhoneNumber());
			prestmt.setString(index++,data.getMobileNumber());
			prestmt.setString(index++,data.getLevel());
			prestmt.setString(index++,data.getZipcode());
			prestmt.setString(index++,data.getAddr1());
			prestmt.setString(index++,data.getAddr2());
			prestmt.setString(index++,data.getLetter());
			prestmt.setString(index++,data.getJob());
			prestmt.setString(index++,data.getId());				
			
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
     * 회원 정보 삭제
     * @param userid
     * @return
     */
    public boolean deleteMgr(String userid){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from member where id=?";
				   					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,userid);;				
			
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
     * 비밀번호 암호화
     * @param passwd
     * @return
     */
    public String getMd5Passwd(String passwd){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String result = "";
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql="select md5(password('" + passwd + "'))";						
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
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
    
    public MgrDO FindId(MgrDO data) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		try {
			con = DBUtil.getConnection();
			
			String sql="select id, join_date from member where name=? and email=?";									
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,data.getName());
			prestmt.setString(2,data.getEmail());
			rs = prestmt.executeQuery();

			if (rs.next()) {
				data.setId(rs.getString("id"));
				data.setJoinDateTime(rs.getString("join_date"));
			}
			
			prestmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			    if (rs != null) rs.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		
		return data;
	}
	
	public int FindPwd(MgrDO data) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int cnt = 0;
		
		int randomInt = 0;
		java.util.Random random = new java.util.Random();
		randomInt	= random.nextInt();
		String randomStr	= String.valueOf(randomInt).substring(String.valueOf(randomInt).length()-6, String.valueOf(randomInt).length());
		
		try {
			con = DBUtil.getConnection();
			
			String sql = "update member set password=? where name=? and id =? and email=?";
			prestmt = con.prepareStatement(sql);
			
			
			prestmt.setString(1,"test1111");
			prestmt.setString(2,data.getName());
            prestmt.setString(3,data.getId());
			prestmt.setString(4,data.getEmail());
			
            cnt = prestmt.executeUpdate();
            
            prestmt.close(); prestmt = null;
            
            if (cnt > 0) {
            	String title = "문의하신 임시 비밀번호 입니다.";
            	String body = "";
            	body += "<style type='text/css'>";
            	body += "body {margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;}";
            	body += "h1 {margin:0;padding:0;height:48px;#height:67px;}";
            	body += "#pw {margin:0;padding:0;background:url("+kr.co.knoc.util.EtcUtil.DOMAIN_URL+"/images/member/bg_mail_pw.gif) no-repeat left top;height:256px;}";
            	body += "#pw h2 {padding-top:20px;padding-left:128px;}";
            	body += "#pw h3 {padding-top:10px;padding-left:156px;}";
            	body += "#pw_1 {width:629px;text-align:center;padding-top:30px;font-size:12px;font-family:'돋움';color:#666;text-decoration:none;font-weight:bold;}";
            	body += "</style>";
            	body += "<body>";
            	body += "<h1><img src='"+kr.co.knoc.util.EtcUtil.DOMAIN_URL+"/images/member/img_mail_pw_top.gif' /></h1>";
            	body += "<div id='pw'>";
            	body += "<h2><img src='"+kr.co.knoc.util.EtcUtil.DOMAIN_URL+"/images/member/img_mail_pw_text_01.gif' /></h2>";
            	body += "<h3><img src='"+kr.co.knoc.util.EtcUtil.DOMAIN_URL+"/images/member/img_mail_pw_text_02.gif' /></h3>";
            	body += "<div id='pw_1'>임시비밀번호 : "+randomStr+"</div>";
            	body += "</div>";
            	body += "<h1><img src='"+kr.co.knoc.util.EtcUtil.DOMAIN_URL+"/images/member/img_mail_bottom.gif' /></h1>";
            	
            	MailBean Mailb = new MailBean(data.email,"webmaster@knoc.co.kr",title,body,"",data.getName(),"관리자","localhost");
            	//Mailb.start();

            	if (data.getMobileNumber() != null && !data.getMobileNumber().equals("")) {
            		SmsManager.insertSmsWait(data.getMobileNumber(), "1", "문의하신 임시 비밀번호 입니다. 임시비밀번호 : "+randomStr+"");
            	}
            }
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			    if (rs != null) rs.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		
		return cnt;
	}
	
	public Vector selectYearList(String st_date, String ed_date) {
		Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String strSQL = null;
		String  user_id = "";
		Vector vSelect = new Vector();		

		try {
			con = DBUtil.getConnection();
			
			strSQL = "select distinct  TO_CHAR(join_date,'YYYY') as year, ";
			strSQL += "(select count(*) from member where  TO_CHAR(join_date,'YYYY')  = year ";
			strSQL += "and   TO_CHAR(join_date,'YYYY')  >= ? and   TO_CHAR(join_date,'YYYY') <= ?) as cnt ";
			strSQL += "from member where TO_CHAR(join_date,'YYYY') >= ? and  TO_CHAR(join_date,'YYYY')  <= ?";
			prestmt = con.prepareStatement(strSQL);
			prestmt.setString(1,st_date.substring(0,4));
			prestmt.setString(2,ed_date.substring(0,4));
			prestmt.setString(3,st_date.substring(0,4));
			prestmt.setString(4,ed_date.substring(0,4));
			rs = prestmt.executeQuery();

			while (rs.next()) {
				MgrDO data = new MgrDO();
				data.setDate(rs.getString("year"));
				data.setCount(rs.getInt("cnt"));
				vSelect.addElement(data);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}		
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (prestmt !=null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		
		return vSelect;
	}
	
	public Vector selectMonthList(String st_date, String ed_date) {
		Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String strSQL = null;
		String  user_id = "";
		Vector vSelect = new Vector();		

		try {
			con = DBUtil.getConnection();
			
			strSQL = "select distinct TO_CHAR(join_date,'YYYY-MM') as month, ";
			strSQL += "(select count(*) from member where  TO_CHAR(join_date,'YYYY-MM') = month ";
			strSQL += "and TO_CHAR(join_date,'YYYY-MM') >= ? and TO_CHAR(join_date,'YYYY-MM') <= ?) as cnt ";
			strSQL += "from member where TO_CHAR(join_date,'YYYY-MM') >= ? and TO_CHAR(join_date,'YYYY-MM') <= ?";
			prestmt = con.prepareStatement(strSQL);
			prestmt.setString(1,st_date.substring(0,7));
			prestmt.setString(2,ed_date.substring(0,7));
			prestmt.setString(3,st_date.substring(0,7));
			prestmt.setString(4,ed_date.substring(0,7));
			rs = prestmt.executeQuery();

			while (rs.next()) {
				MgrDO data = new MgrDO();
				data.setDate(rs.getString("month"));
				data.setCount(rs.getInt("cnt"));
				vSelect.addElement(data);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}		
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (prestmt !=null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		
		return vSelect;
	}
	
	public Vector selectDayList(String st_date, String ed_date) {
		Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String strSQL = null;
		String  user_id = "";
		Vector vSelect = new Vector();		

		try {
			con = DBUtil.getConnection();
			
			strSQL = "select distinct  TO_CHAR(join_date,'YYYY-MM-DD') as day, ";
			strSQL += "(select count(*) from member where  TO_CHAR(join_date,'YYYY-MM-DD') = day) as cnt ";
			strSQL += "from member where  TO_CHAR(join_date,'YYYY-MM-DD')  >= ? and  TO_CHAR(join_date,'YYYY-MM-DD')  <= ? order by join_date asc";
			prestmt = con.prepareStatement(strSQL);
			prestmt.setString(1,st_date);
			prestmt.setString(2,ed_date);
			rs = prestmt.executeQuery();

			while (rs.next()) {
				MgrDO data = new MgrDO();
				data.setDate(rs.getString("day"));
				data.setCount(rs.getInt("cnt"));
				vSelect.addElement(data);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}		
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (prestmt !=null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		
		return vSelect;
	}
	
	public Vector selectWeekList(String st_date, String ed_date) {
		Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String strSQL = null;
		String  user_id = "";
		Vector vSelect = new Vector();		

		try {
			con = DBUtil.getConnection();
			
			strSQL = "select distinct dayofweek(join_date) as week, ";
			strSQL += "(select count(*) from member where dayofweek(join_date) = week ";
			strSQL += "and  TO_CHAR(join_date,'YYYY-MM-DD')  >= ? and  TO_CHAR(join_date,'YYYY-MM-DD')  <= ?) as cnt ";
			strSQL += "from member where  TO_CHAR(join_date,'YYYY-MM-DD')   >= ? and TO_CHAR(join_date,'YYYY-MM-DD')    <= ?";
			strSQL += " order by week asc";
			prestmt = con.prepareStatement(strSQL);
			prestmt.setString(1,st_date);
			prestmt.setString(2,ed_date);
			prestmt.setString(3,st_date);
			prestmt.setString(4,ed_date);
			rs = prestmt.executeQuery();

			while (rs.next()) {
				MgrDO data = new MgrDO();
				data.setDate(rs.getString("week"));
				data.setCount(rs.getInt("cnt"));
				vSelect.addElement(data);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}		
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (prestmt !=null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		
		return vSelect;
	}
	
	/**
     * 회원 정보 수정
     * @param data
     * @return
     */
    public boolean updateMgrUser(MgrDO data){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update member set email=?, tel=?, mobile=?, zipcode=?, addr1=?, addr2=?, letter=?, job=?, password=? where id=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);			
			prestmt.setString(index++,data.getEmail());
			prestmt.setString(index++,data.getPhoneNumber());
			prestmt.setString(index++,data.getMobileNumber());
			prestmt.setString(index++,data.getZipcode());
			prestmt.setString(index++,data.getAddr1());
			prestmt.setString(index++,data.getAddr2());
			prestmt.setString(index++,data.getLetter());
			prestmt.setString(index++,data.getJob());
			prestmt.setString(index++,SecureDBUtil.crypto.encrypt("knoc", "member", "password", data.getPasswd()));
			
			prestmt.setString(index++,data.getId());				
			
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
