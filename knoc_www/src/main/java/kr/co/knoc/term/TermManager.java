package kr.co.knoc.term;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import kr.co.knoc.jdbc.DBUtil;

public class TermManager {
	public boolean insertTerm(TermBean pb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from TERM";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into TERM "
				   + " (no, korean, english, chinese, content, regdate) "
				   + " values (?, ?, ?, ?, ?, sysdate)"; 			
			System.out.println("insert into TERM (no, korean, english, chinese, content,regdate) "
				   + " values ("+no+", '"+pb.getKorean()+"', '"+pb.getEnglish()+"', '"+pb.getChinese()+"', '"+pb.getContent()+"', sysdate)");
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,pb.getKorean());
			prestmt.setString(index++,pb.getEnglish());
			prestmt.setString(index++,pb.getChinese());			
			prestmt.setString(index++,pb.getContent());
		
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
	
	
	
	public ArrayList<TermBean> getTermList(int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<TermBean> result = new ArrayList<TermBean>(); 		
 		StringBuffer query = new StringBuffer(); 
 		query.append("select * from ( ");
        query.append("select no, korean, english, chinese, content, regdate , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO ");
        query.append(" from TERM");
        query.append(" order by no asc  ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2, page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				TermBean pb = new TermBean();
				pb.setNo(rs.getInt("no"));
				pb.setKorean(rs.getString("korean"));
				pb.setEnglish(rs.getString("english"));
				pb.setChinese(rs.getString("chinese"));
				pb.setContent(rs.getString("content"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
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
	
	public int getTermListCount() {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from TERM");
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
	
	public TermBean getTerm(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		TermBean pb = new TermBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select no, korean, english, chinese, content, regdate from TERM where no=?";
				   				
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,no);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				pb.setNo(rs.getInt("no"));
				pb.setKorean(rs.getString("korean"));
				pb.setEnglish(rs.getString("english"));
				pb.setChinese(rs.getString("chinese"));
				pb.setContent(rs.getString("content"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));				
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
	

	
	public boolean updateTerm(TermBean pb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update TERM set korean=?, english=?, chinese=? ";
			sql += ", content=? where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,pb.getKorean());
			prestmt.setString(index++,pb.getEnglish());
			prestmt.setString(index++,pb.getChinese());
			prestmt.setString(index++,pb.getContent());
			prestmt.setInt(index++,pb.getNo());
			
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

	
	public boolean deleteTerm(int no){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from TERM where no=?";
				   					
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
	
	public ArrayList<TermBean> getTerm() {
    	Connection con = null;
 		ResultSet rs = null;
 		Statement stmt = null;
 		ArrayList<TermBean> result = new ArrayList<TermBean>(); 		
 		StringBuffer query = new StringBuffer(); 		
        query.append("select no, korean, english, chinese, content, regdate ");
        query.append(" from TERM");
        query.append(" where visibility = 'Y' and start_date <= to_char(sysdate,'YYYYMMDD') and end_date >= to_char(sysdate,'YYYYMMDD')");
        query.append(" order by shownum, no asc");
		try {
			con = DBUtil.getConnection();
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query.toString());			
			while(rs.next()) {
				TermBean pb = new TermBean();
				pb.setNo(rs.getInt("no"));
				pb.setKorean(rs.getString("korean"));
				pb.setEnglish(rs.getString("english"));
				pb.setChinese(rs.getString("chinese"));
				pb.setContent(rs.getString("content"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				result.add(pb);
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
	
	public ArrayList<TermBean> getSearchList(String word, String search, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		
 		
 		
 		String Where = "";
 	
 		if(word.equals("1")){ 
 			Where = " where  trim(KOREAN) >= '가' and trim(KOREAN) < '나' "; 
 		}else if(word.equals("2")){ 
 			Where = " where  trim(KOREAN) >= '나' and trim(KOREAN) < '다' "; 
 		}else if(word.equals("3")){ 
 			Where = " where  trim(KOREAN) >= '다' and trim(KOREAN) < '라' "; 
 		}else if(word.equals("4")){ 
 			Where = " where  trim(KOREAN) >= '라' and trim(KOREAN) < '마' "; 
 		}else if(word.equals("5")){ 
 			Where = " where  trim(KOREAN) >= '마' and trim(KOREAN) < '바' "; 
 		}else if(word.equals("6")){ 
 			Where = " where  trim(KOREAN) >= '바' and trim(KOREAN) < '사' "; 
 		}else if(word.equals("7")){ 
 			Where = " where  trim(KOREAN) >= '사' and trim(KOREAN) < '아' "; 
 		}else if(word.equals("8")){ 
 			Where = " where  trim(KOREAN) >= '아' and trim(KOREAN) < '자' "; 
 		}else if(word.equals("9")){ 
 			Where = " where  trim(KOREAN) >= '자' and trim(KOREAN) < '차' "; 
 		}else if(word.equals("10")){ 
 			Where = " where  trim(KOREAN) >= '차' and trim(KOREAN) < '카' "; 
 		}else if(word.equals("11")){ 
 			Where = " where  trim(KOREAN) >= '카' and trim(KOREAN) < '타'"; 
 		}else if(word.equals("12")){ 
 			Where = " where  trim(KOREAN) >= '타' and trim(KOREAN) < '파' "; 
 		}else if(word.equals("13")){ 
 			Where = " where  trim(KOREAN) >= '파' and trim(KOREAN) <'하'"; 
 		}else if(word.equals("14")){ 
 			Where = "where  trim(KOREAN) >= '하' "; 
 		}else if(word.equals("A")){ 
 			Where = "where  ENGLISH LIKE 'a%'";  			
 		}else if(word.equals("B")){ 
 			Where = "where  ENGLISH LIKE 'b%'";
 		}else if(word.equals("C")){ 
 			Where = "where  ENGLISH LIKE 'c%'";
 		}else if(word.equals("D")){ 
 			Where = "where  ENGLISH LIKE 'd%'";
 		}else if(word.equals("E")){ 
 			Where = "where  ENGLISH LIKE 'e%'";
 		}else if(word.equals("F")){ 
 			Where = "where  ENGLISH LIKE 'f%'";
 		}else if(word.equals("G")){ 
 			Where = "where  ENGLISH LIKE 'g%'";
 		}else if(word.equals("H")){ 
 			Where = "where  ENGLISH LIKE 'h%'";
 		}else if(word.equals("I")){ 
 			Where = "where  ENGLISH LIKE 'i%'";
 		}else if(word.equals("J")){ 
 			Where = "where  ENGLISH LIKE 'j%'";
 		}else if(word.equals("K")){ 
 			Where = "where  ENGLISH LIKE 'k%'";
 		}else if(word.equals("L")){ 
 			Where = "where  ENGLISH LIKE 'l%'";
 		}else if(word.equals("M")){ 
 			Where = "where  ENGLISH LIKE 'm%'";
 		}else if(word.equals("N")){ 
 			Where = "where  ENGLISH LIKE 'n%'";
 		}else if(word.equals("O")){ 
 			Where = "where  ENGLISH LIKE 'o%'";
 		}else if(word.equals("P")){ 
 			Where = "where  ENGLISH LIKE 'p%'";
 		}else if(word.equals("Q")){ 
 			Where = "where  ENGLISH LIKE 'q%'";
 		}else if(word.equals("R")){ 
 			Where = "where  ENGLISH LIKE 'r%'";
 		}else if(word.equals("S")){ 
 			Where = "where  ENGLISH LIKE 's%'";
 		}else if(word.equals("T")){ 
 			Where = "where  ENGLISH LIKE 't%'";
 		}else if(word.equals("U")){ 
 			Where = "where  ENGLISH LIKE 'u%'";
 		}else if(word.equals("V")){ 
 			Where = "where  ENGLISH LIKE 'v%'";
 		}else if(word.equals("W")){ 
 			Where = "where  ENGLISH LIKE 'w%'";
 		}else if(word.equals("X")){ 
 			Where = "where  ENGLISH LIKE 'x%'";
 		}else if(word.equals("Y")){ 
 			Where = "where  ENGLISH LIKE 'y%'";
 		}else if(word.equals("Z")){ 
 			Where = "where  ENGLISH LIKE 'z%'"; 			
 		}
 		
 		if(!search.equals("")){ 
  			Where = "where  KOREAN LIKE '%"+search+"%' or ENGLISH LIKE '%"+search+"%' or CHINESE LIKE '%"+search+"%' or CONTENT LIKE '%"+search+"%' "; 			
  		}

 		
 		
 		
 		ArrayList<TermBean> result = new ArrayList<TermBean>(); 		
 		StringBuffer query = new StringBuffer(); 	
 		query.append("select * from ( ");
        query.append("select no, korean, english, chinese, content, regdate ,   ROW_NUMBER() OVER(  ORDER BY  no desc) AS PAGE_NO ");
        query.append(" from TERM ");
        query.append(Where);
        query.append(" order by no asc ");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
        
        //Logproc.LogWrite(query.toString());
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2, page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				TermBean pb = new TermBean();
				pb.setNo(rs.getInt("no"));
				pb.setKorean(rs.getString("korean"));
				pb.setEnglish(rs.getString("english"));
				pb.setChinese(rs.getString("chinese"));
				pb.setContent(rs.getString("content"));
				pb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
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
	

	public int getSearchCount(String word , String search) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null; 		
 		

 		
 		String Where = "";
 	
 		if(word.equals("1")){ 
 			Where = " where  trim(KOREAN) >= '가' and trim(KOREAN) < '나' "; 
 		}else if(word.equals("2")){ 
 			Where = " where  trim(KOREAN) >= '나' and trim(KOREAN) < '다' "; 
 		}else if(word.equals("3")){ 
 			Where = " where  trim(KOREAN) >= '다' and trim(KOREAN) < '라' "; 
 		}else if(word.equals("4")){ 
 			Where = " where  trim(KOREAN) >= '라' and trim(KOREAN) < '마' "; 
 		}else if(word.equals("5")){ 
 			Where = " where  trim(KOREAN) >= '마' and trim(KOREAN) < '바' "; 
 		}else if(word.equals("6")){ 
 			Where = " where  trim(KOREAN) >= '바' and trim(KOREAN) < '사' "; 
 		}else if(word.equals("7")){ 
 			Where = " where  trim(KOREAN) >= '사' and trim(KOREAN) < '아' "; 
 		}else if(word.equals("8")){ 
 			Where = " where  trim(KOREAN) >= '아' and trim(KOREAN) < '자' "; 
 		}else if(word.equals("9")){ 
 			Where = " where  trim(KOREAN) >= '자' and trim(KOREAN) < '차' "; 
 		}else if(word.equals("10")){ 
 			Where = " where  trim(KOREAN) >= '차' and trim(KOREAN) < '카' "; 
 		}else if(word.equals("11")){ 
 			Where = " where  trim(KOREAN) >= '카' and trim(KOREAN) < '타'"; 
 		}else if(word.equals("12")){ 
 			Where = " where  trim(KOREAN) >= '타' and trim(KOREAN) < '파' "; 
 		}else if(word.equals("13")){ 
 			Where = " where  trim(KOREAN) >= '파' and trim(KOREAN) <'하'"; 
 		}else if(word.equals("14")){ 
 			Where = "where  trim(KOREAN) >= '하' "; 
 		}else if(word.equals("A")){ 
 			Where = "where  ENGLISH LIKE 'a%'";  			
 		}else if(word.equals("B")){ 
 			Where = "where  ENGLISH LIKE 'b%'";
 		}else if(word.equals("C")){ 
 			Where = "where  ENGLISH LIKE 'c%'";
 		}else if(word.equals("D")){ 
 			Where = "where  ENGLISH LIKE 'd%'";
 		}else if(word.equals("E")){ 
 			Where = "where  ENGLISH LIKE 'e%'";
 		}else if(word.equals("F")){ 
 			Where = "where  ENGLISH LIKE 'f%'";
 		}else if(word.equals("G")){ 
 			Where = "where  ENGLISH LIKE 'g%'";
 		}else if(word.equals("H")){ 
 			Where = "where  ENGLISH LIKE 'h%'";
 		}else if(word.equals("I")){ 
 			Where = "where  ENGLISH LIKE 'i%'";
 		}else if(word.equals("J")){ 
 			Where = "where  ENGLISH LIKE 'j%'";
 		}else if(word.equals("K")){ 
 			Where = "where  ENGLISH LIKE 'k%'";
 		}else if(word.equals("L")){ 
 			Where = "where  ENGLISH LIKE 'l%'";
 		}else if(word.equals("M")){ 
 			Where = "where  ENGLISH LIKE 'm%'";
 		}else if(word.equals("N")){ 
 			Where = "where  ENGLISH LIKE 'n%'";
 		}else if(word.equals("O")){ 
 			Where = "where  ENGLISH LIKE 'o%'";
 		}else if(word.equals("P")){ 
 			Where = "where  ENGLISH LIKE 'p%'";
 		}else if(word.equals("Q")){ 
 			Where = "where  ENGLISH LIKE 'q%'";
 		}else if(word.equals("R")){ 
 			Where = "where  ENGLISH LIKE 'r%'";
 		}else if(word.equals("S")){ 
 			Where = "where  ENGLISH LIKE 's%'";
 		}else if(word.equals("T")){ 
 			Where = "where  ENGLISH LIKE 't%'";
 		}else if(word.equals("U")){ 
 			Where = "where  ENGLISH LIKE 'u%'";
 		}else if(word.equals("V")){ 
 			Where = "where  ENGLISH LIKE 'v%'";
 		}else if(word.equals("W")){ 
 			Where = "where  ENGLISH LIKE 'w%'";
 		}else if(word.equals("X")){ 
 			Where = "where  ENGLISH LIKE 'x%'";
 		}else if(word.equals("Y")){ 
 			Where = "where  ENGLISH LIKE 'y%'";
 		}else if(word.equals("Z")){ 
 			Where = "where  ENGLISH LIKE 'z%'"; 			
 		}
 		
 		if(!search.equals("")){ 
  			Where = "where  KOREAN LIKE '%"+search+"%' or ENGLISH LIKE '%"+search+"%' or CHINESE LIKE '%"+search+"%' or CONTENT LIKE '%"+search+"%' "; 			
  		}
 			 
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from TERM ");
        query.append(Where);
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
}
