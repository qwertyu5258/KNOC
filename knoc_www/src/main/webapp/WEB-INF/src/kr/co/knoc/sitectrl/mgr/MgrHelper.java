package kr.co.knoc.sitectrl.mgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.neoboard.util.MD5class;
import com.neoboard.util.MySqlFunction;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.sitectrl.mgr.MgrDO;

public class MgrHelper {
	/**
	 * 사용자 입력
	 * @param data
	 * @return
	 */
	
	/**
     * 비밀번호 암호화
     * @param passwd
     * @return
     */
    public String getMd5Passwd(String passwd){
    	
    	MySqlFunction mySqlFunction=new MySqlFunction();
    	String result = "";
    	result=MD5class.MD5(mySqlFunction.password(passwd)); 
    	System.out.println("getMd5Passwd : " + passwd + " -> " + result);
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
			
			String sql = "select max(no) from ADMINTABLE";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				idx = rs.getInt(1) + 1;
			} else {
				idx = 1;
			}
			stmt.close();
			
			sql="insert into ADMINTABLE "
				   + " (no, id, name, passwd, email, userlevel, joindate, lastlogin, ip, d_code, phone, mobile, fax, etc, cnterror) "
				   + " values (?, ?, ?, ?, ?, ?, SYSDATE, SYSDATE, ?, ?, ?, ?, ?, ?, '0')"; 			
			
			int index = 1;
			
			// 비밀번호 암호화
			String passwd = getMd5Passwd(data.getPasswd());
			
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,idx);
			prestmt.setString(index++,data.getId());	
			prestmt.setString(index++,data.getName());
			prestmt.setString(index++,passwd);			
			prestmt.setString(index++,data.getEmail());
			prestmt.setString(index++,data.getLevel());
			prestmt.setString(index++,data.getIp());
			prestmt.setString(index++,data.getDCode());
			prestmt.setString(index++,data.getPhone());
			prestmt.setString(index++,data.getMobile());
			prestmt.setString(index++,data.getFax());
			prestmt.setString(index++,data.getEtc());
			
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
			strSQL = "select id from ADMINTABLE where id = ?";
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
	 * 관리자 조회
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
			String sqlstr = "select id , name, passwd, email, userlevel, joindate, lastlogin, ip, d_code, phone, mobile, fax, etc, usersession, lastlogin2, ip2, cnterror from ADMINTABLE where id = ?";
			prestmt = con.prepareStatement(sqlstr);
			prestmt.setString(1, id);
			rs = prestmt.executeQuery();
			if(rs.next()) {
								
				result = new MgrDO();
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));				
				result.setPasswd(rs.getString("passwd"));
				result.setEmail(rs.getString("email"));
				result.setLevel(rs.getString("userlevel"));				
				result.setJoinDateTime(rs.getString("joindate"));
				result.setLastLoginDateTime(rs.getString("lastlogin"));
				result.setIp(rs.getString("ip"));
				result.setDCode(rs.getString("d_code"));
				result.setPhone(rs.getString("phone"));
				result.setMobile(rs.getString("mobile"));
				result.setFax(rs.getString("fax"));
				result.setEtc(rs.getString("etc"));
				result.setUserSession(rs.getString("usersession"));
				result.setLastLoginDateTime2(rs.getString("lastlogin2"));
				result.setIp2(rs.getString("ip2"));
				result.setCntError(rs.getInt("cnterror"));
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
	 * 관리자 리스트
	 * @param key_gbn
	 * @param key_word
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList<MgrDO> getAdminList(String key_gbn, String key_word, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<MgrDO> result = new ArrayList<MgrDO>();
 		StringBuffer query = new StringBuffer();
 		/*String columns = "no, id, name, d_code, phone, mobile, email, etc";
 		String orderby = "no desc";
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
        query.append("select " + columns);
        query.append(" from ADMINTABLE");
        if(!where.equals("")) query.append(" where " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );        
        query.append("limit ?, ?");*/
 		
 		String columns = "no, id, name, d_code, phone, mobile, email, ip, lastlogin, etc , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO";
 		String orderby = "no desc";
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
 		query.append("SELECT * FROM ( ");
        query.append("			select " + columns);
        query.append(" 			from ADMINTABLE");
        if(!where.equals("")) query.append(" where " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );        
        query.append(" ) A ");
        query.append(" WHERE  PAGE_NO > ?     AND A.PAGE_NO <= ? ");
 		
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1,(page-1) * pageSize);
		    prestmt.setInt(2,page*pageSize );
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				MgrDO smd = new MgrDO();
				smd.setId(rs.getString("id"));
				smd.setName(rs.getString("name"));
				smd.setDCode(rs.getString("d_code"));
				smd.setPhone(rs.getString("phone"));
				smd.setMobile(rs.getString("mobile"));
				smd.setEmail(rs.getString("email"));
				smd.setLastLoginDateTime(rs.getString("lastlogin"));
				smd.setIp(rs.getString("ip"));
				smd.setEtc(rs.getString("etc"));
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
     * 관리자 목록
     * @return
     */
    public int getAdminListCount(String key_gbn, String key_word) {
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
        query.append(" from ADMINTABLE");
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
     * 관리자 정보 수정
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
			
			String sql = "update ADMINTABLE set name=?, email=?, userlevel=?, d_code=?, phone=?, mobile=?, fax=?, etc=?, cnterror=? where id=?";
			
			// 비밀번호 암호화
			String passwd = data.getPasswd();
			if(passwd != null && !passwd.equals("")) {
				passwd = getMd5Passwd(passwd);
				sql = "update ADMINTABLE set name=?, passwd=?, email=?, userlevel=?, d_code=?, phone=?, mobile=?, fax=?, etc=?, cnterror=? where id=?";				
			}			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,data.getName());
			if(passwd != null && !passwd.equals("")) {
				prestmt.setString(index++,passwd);
			}
			prestmt.setString(index++,data.getEmail());
			prestmt.setString(index++,data.getLevel());
			prestmt.setString(index++,data.getDCode());
			prestmt.setString(index++,data.getPhone());
			prestmt.setString(index++,data.getMobile());
			prestmt.setString(index++,data.getFax());
			prestmt.setString(index++,data.getEtc());
			prestmt.setInt(index++,(int)data.getCntError());
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
     * 관리자 정보 삭제
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
			
			String sql = "delete from ADMINTABLE where id=?";
				   					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,userid);				
			
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
     * 로그인 업데이트
     * @param data
     * @return
     */
    public boolean updateMgrLogin(MgrDO data){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update ADMINTABLE set LASTLOGIN=SYSDATE, IP=?, USERSESSION=?, LASTLOGIN2=LASTLOGIN, IP2=IP where id=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,data.getIp());
			prestmt.setString(index++,data.getUserSession());
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
     * 비밀번호 오류 증가
     * @param data
     * @return
     */
    public boolean updateMgrError(String id){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update ADMINTABLE set CNTERROR = NVL(CNTERROR, 0) + 1 where id=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);			
			prestmt.setString(index++,id);				
			
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
