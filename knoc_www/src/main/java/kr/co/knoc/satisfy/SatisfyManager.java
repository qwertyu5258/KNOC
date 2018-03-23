package kr.co.knoc.satisfy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class SatisfyManager {
	public boolean insertSatisfy(SatisfyBean sfb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();		
			con.setAutoCommit(false);
			
			stmt = con.createStatement();
			
			String sql = "select max(no) from SATISFY";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into SATISFY "
				   + " (no, mcode, score1, score2, score3, score4, score5) "
				   + " values (?, ?, ?, ?, ?, ?, ?)"; 			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,sfb.getMcode());	
			prestmt.setInt(index++,sfb.getScore1());
			prestmt.setInt(index++,sfb.getScore2());
			prestmt.setInt(index++,sfb.getScore3());
			prestmt.setInt(index++,sfb.getScore4());
			prestmt.setInt(index++,sfb.getScore5());
			
			prestmt.executeUpdate();	
			prestmt.close();
			
			if (sfb.getComment() != null && !sfb.getComment().equals("")) {
				insertSatisfyCmt(sfb);
			}
			
			con.commit();
			result = true;
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
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
	
	public int updateSatisfy(SatisfyBean sfb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int result = 0;
		
		try {
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
			
			String sql = "update SATISFY set ";
			if (sfb.getScore1() > 0) {
				sql += " score1 = score1+1 ";
			} else if (sfb.getScore2() > 0) {
				sql += " score2 = score2+1 ";
			} else if (sfb.getScore3() > 0) {
				sql += " score3 = score3+1 ";
			} else if (sfb.getScore4() > 0) {
				sql += " score4 = score4+1 ";
			} else if (sfb.getScore5() > 0) {
				sql += " score5 = score5+1 ";
			}
			sql += " where mcode=?";
				   			
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,sfb.getMcode());
			
			result = prestmt.executeUpdate();	
			prestmt.close();
			
			if (result > 0 && sfb.getComment() != null && !sfb.getComment().equals("")) {
				insertSatisfyCmt(sfb);
			}
			
			con.commit();
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) { ex.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
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
	
	public void insertSatisfyCmt(SatisfyBean sfb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from SATISFY_CMT";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into SATISFY_CMT "
				   + " (no, mcode, coment, score, id, ip, regdate) "
				   + " values (?, ?, ?, ?, ?, ?, sysdate)"; 			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,sfb.getMcode());	
			prestmt.setString(index++,sfb.getComment());
			if (sfb.getScore1() > 0) {
				prestmt.setInt(index++,1);
			} else if (sfb.getScore2() > 0) {
				prestmt.setInt(index++,2);
			} else if (sfb.getScore3() > 0) {
				prestmt.setInt(index++,3);
			} else if (sfb.getScore4() > 0) {
				prestmt.setInt(index++,4);
			} else if (sfb.getScore5() > 0) {
				prestmt.setInt(index++,5);
			}
			prestmt.setString(index++,sfb.getId());
			prestmt.setString(index++,sfb.getIp());
			
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
	
	public ArrayList<SatisfyBean> getSatisfyList(int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<SatisfyBean> result = new ArrayList<SatisfyBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
 		query.append("select * from ( ");
        query.append("select no, mcode, score1, score2, score3, score4, score5, (score1 + score2 + score3 + score4 + score5) as total , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO  ");
        query.append(" from SATISFY  WHERE MCODE != ' ' ");
        query.append(" order by mcode asc  ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2, page* pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				SatisfyBean sfb = new SatisfyBean();
				sfb.setNo(rs.getInt("no"));
				sfb.setMcode(rs.getString("mcode"));
				sfb.setScore1(rs.getInt("score1"));
				sfb.setScore2(rs.getInt("score2"));
				sfb.setScore3(rs.getInt("score3"));
				sfb.setScore4(rs.getInt("score4"));
				sfb.setScore5(rs.getInt("score5"));
				sfb.setTotal(rs.getInt("total"));
				result.add(sfb);
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
	
	public int getSatisfyListCount() {
    	Connection con = null;
 		ResultSet rs = null;
 		Statement stmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append(" select count(*) ");
        query.append(" from SATISFY WHERE MCODE != ' '  ");
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
	
	public ArrayList<SatisfyBean> getSatisfyCmtList(String mcode, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<SatisfyBean> result = new ArrayList<SatisfyBean>(); 		
 		StringBuffer query = new StringBuffer(); 
 		query.append("select * from ( ");
        query.append("select no, mcode, coment, score, id, ip, regdate , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO ");
        query.append(" from SATISFY_CMT");
        query.append(" where mcode = ? ");
        //query.append(" order by no desc limit ?, ?");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, mcode);
			prestmt.setInt(2, (page-1) * pageSize);
			prestmt.setInt(3, page * pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				SatisfyBean sfb = new SatisfyBean();
				sfb.setNo(rs.getInt("no"));
				sfb.setMcode(rs.getString("mcode"));
				sfb.setComment(rs.getString("coment"));
				sfb.setScore1(rs.getInt("score"));
				sfb.setId(rs.getString("id"));				
				sfb.setIp(rs.getString("ip"));
				sfb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(sfb);
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
	
	public int getSatisfyCmtListCount(String mcode) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from SATISFY_CMT");
        query.append(" where mcode = ?");
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setString(1, mcode);
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
	
	public SatisfyBean getSatisfyTotal(String mcode) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null; 		
 		SatisfyBean sfb = new SatisfyBean();
 		StringBuffer query = new StringBuffer(); 		
        query.append("select sum(score1) as score1, sum(score2) as score2, sum(score3) as score3, sum(score4) as score4, sum(score5) as score5, (sum(score1) + sum(score2) + sum(score3) + sum(score4) + sum(score5)) as total ");
        query.append(" from SATISFY");
        query.append(" where substr(mcode,1,6) = ?");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, mcode);
			rs = prestmt.executeQuery();
			
			if(rs.next()) {
				sfb.setScore1(rs.getInt("score1"));
				sfb.setScore2(rs.getInt("score2"));
				sfb.setScore3(rs.getInt("score3"));
				sfb.setScore4(rs.getInt("score4"));
				sfb.setScore5(rs.getInt("score5"));
				sfb.setTotal(rs.getInt("total"));
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
        return sfb;
    }
}
