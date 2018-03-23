package kr.co.knoc.recruit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class RecruitPersonManager {
	public boolean insertRecruitPerson(RecruitPersonBean rpb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from RECRUIT_PERSON";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into RECRUIT_PERSON "
				   + " (no, id, name, email, mobile, academic, school, bunya, ip, regdate) "
				   + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)"; 			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,rpb.getId());
			prestmt.setString(index++,rpb.getName());			
			prestmt.setString(index++,rpb.getEmail());
			prestmt.setString(index++,rpb.getMobile());
			prestmt.setString(index++,rpb.getAcademic());
			prestmt.setString(index++,rpb.getSchool());
			prestmt.setString(index++,rpb.getBunya());
			prestmt.setString(index++,rpb.getIp());
			
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
	
	public ArrayList<RecruitPersonBean> getRecruitPersonList(String key_gbn, String key_word, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<RecruitPersonBean> result = new ArrayList<RecruitPersonBean>();
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
 		
 		StringBuffer query = new StringBuffer();
 		query.append("select * from ( ");
        query.append("select no, id, name, email, mobile, academic, school, bunya, regdate , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO ");
        query.append(" from RECRUIT_PERSON");
        if(!where.equals(""))  {
        	query.append(" where " + where + "");        	
        }
        query.append(" order by no desc ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2, page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				RecruitPersonBean rpb = new RecruitPersonBean();
				rpb.setNo(rs.getInt("no"));
				rpb.setId(rs.getString("id"));
				rpb.setName(rs.getString("name"));
				rpb.setEmail(rs.getString("email"));
				rpb.setMobile(rs.getString("mobile"));
				rpb.setAcademic(rs.getString("academic"));
				rpb.setSchool(rs.getString("school"));
				rpb.setBunya(rs.getString("bunya"));
				rpb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(rpb);
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
	
	public int getRecruitPersonListCount(String key_gbn, String key_word) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
 		
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from RECRUIT_PERSON");
        if(!where.equals(""))  {
        	query.append(" where " + where + "");        	
        }
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
	
	public RecruitPersonBean getRecruitPerson(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		RecruitPersonBean rpb = new RecruitPersonBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select no, id, name, email, mobile, academic, school, bunya, ip, regdate from RECRUIT_PERSON where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				rpb.setNo(rs.getInt("no"));
				rpb.setId(rs.getString("id"));
				rpb.setName(rs.getString("name"));
				rpb.setEmail(rs.getString("email"));
				rpb.setMobile(rs.getString("mobile"));
				rpb.setAcademic(rs.getString("academic"));
				rpb.setSchool(rs.getString("school"));
				rpb.setBunya(rs.getString("bunya"));
				rpb.setIp(rs.getString("ip"));
				rpb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));							
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
		return rpb;
	}
	
	public boolean updateRecruitPerson(RecruitPersonBean rpb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update RECRUIT_PERSON set name=? ";
			sql += ", email=?, mobile=?, academic=?, school=?, bunya=? ";
			sql += " where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,rpb.getName());			
			prestmt.setString(index++,rpb.getEmail());
			prestmt.setString(index++,rpb.getMobile());
			prestmt.setString(index++,rpb.getAcademic());
			prestmt.setString(index++,rpb.getSchool());
			prestmt.setString(index++,rpb.getBunya());
			prestmt.setInt(index++,rpb.getNo());
			
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
	
	public boolean deleteRecruitPerson(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from RECRUIT_PERSON where no=?";
				   					
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
}
