package kr.co.knoc.recruit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class RecruitManager {
	public boolean insertRecruit(RecruitBean rb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from RECRUIT";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into RECRUIT "
				   + " (no, id, name, company, email, phone, mobile, zipcode, addr1, addr2, visit_date, person, content, ip, regdate) "
				   + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)"; 			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,rb.getId());
			prestmt.setString(index++,rb.getName());
			prestmt.setString(index++,rb.getCompany());
			prestmt.setString(index++,rb.getEmail());
			prestmt.setString(index++,rb.getPhone());
			prestmt.setString(index++,rb.getMobile());
			prestmt.setString(index++,rb.getZipcode());
			prestmt.setString(index++,rb.getAddr1());
			prestmt.setString(index++,rb.getAddr2());
			prestmt.setString(index++,rb.getVisitDate());
			prestmt.setInt(index++,rb.getPerson());
			prestmt.setString(index++,rb.getContent());
			prestmt.setString(index++,rb.getIp());
			
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
	
	public ArrayList<RecruitBean> getRecruitList(String key_gbn, String key_word, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<RecruitBean> result = new ArrayList<RecruitBean>();
 		String where = "";
 		if (key_gbn != null && !key_gbn.equals("")) {
 			where = key_gbn + " like '%" + key_word + "%'";
 		}
 		
 		StringBuffer query = new StringBuffer(); 	
 		query.append("select * from ( ");
        query.append("select no, id, name, company, email, phone, mobile, zipcode, addr1, addr2, visit_date, person, regdate , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO  ");
        query.append(" from RECRUIT");
        if(!where.equals(""))  {
        	query.append(" where " + where + "");        	
        }
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
				RecruitBean rb = new RecruitBean();
				rb.setNo(rs.getInt("no"));
				rb.setId(rs.getString("id"));
				rb.setName(rs.getString("name"));
				rb.setCompany(rs.getString("company"));
				rb.setEmail(rs.getString("email"));
				rb.setPhone(rs.getString("phone"));
				rb.setMobile(rs.getString("mobile"));
				rb.setZipcode(rs.getString("zipcode"));
				rb.setAddr1(rs.getString("addr1"));
				rb.setAddr2(rs.getString("addr2"));
				rb.setVisitDate(rs.getString("visit_date"));
				rb.setPerson(rs.getInt("person"));
				rb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(rb);
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
	
	public int getRecruitListCount(String key_gbn, String key_word) {
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
        query.append(" from RECRUIT");
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
	
	public RecruitBean getRecruit(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		RecruitBean rb = new RecruitBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select no, id, name, company, email, phone, mobile, zipcode, addr1, addr2, visit_date, person, content, ip, regdate from RECRUIT where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				rb.setNo(rs.getInt("no"));
				rb.setId(rs.getString("id"));
				rb.setName(rs.getString("name"));
				rb.setCompany(rs.getString("company"));
				rb.setEmail(rs.getString("email"));
				rb.setPhone(rs.getString("phone"));
				rb.setMobile(rs.getString("mobile"));
				rb.setZipcode(rs.getString("zipcode"));
				rb.setAddr1(rs.getString("addr1"));
				rb.setAddr2(rs.getString("addr2"));
				rb.setVisitDate(rs.getString("visit_date"));
				rb.setPerson(rs.getInt("person"));
				rb.setContent(rs.getString("content"));
				rb.setIp(rs.getString("ip"));
				rb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));							
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
		return rb;
	}
	
	public boolean updateRecruit(RecruitBean rb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update RECRUIT set name=?, company=?, email=?, phone=?, mobile=? ";
			sql += ", zipcode=?, addr1=?, addr2=?, visit_date=?, person=?, content=? ";
			sql += " where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,rb.getName());
			prestmt.setString(index++,rb.getCompany());
			prestmt.setString(index++,rb.getEmail());
			prestmt.setString(index++,rb.getPhone());
			prestmt.setString(index++,rb.getMobile());
			prestmt.setString(index++,rb.getZipcode());
			prestmt.setString(index++,rb.getAddr1());
			prestmt.setString(index++,rb.getAddr2());
			prestmt.setString(index++,rb.getVisitDate());
			prestmt.setInt(index++,rb.getPerson());
			prestmt.setString(index++,rb.getContent());
			prestmt.setInt(index++,rb.getNo());
			
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
	
	public boolean deleteRecruit(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from RECRUIT where no=?";
				   					
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
