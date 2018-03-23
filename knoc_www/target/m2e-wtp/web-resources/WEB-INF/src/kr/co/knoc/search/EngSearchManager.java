package kr.co.knoc.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

/*
 * 2016. 1 .20 영문 통합검색 생성
 */
public class EngSearchManager {
	public ArrayList<SearchBean> getSearchList(String key_word, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<SearchBean> result = new ArrayList<SearchBean>(); 		
 		StringBuffer query = new StringBuffer(); 
 		query.append("SELECT c.* FROM ( SELECT b.*,  ROW_NUMBER() OVER(ORDER BY b.no desc) AS PAGE_NO FROM (");
        query.append("SELECT ROWNUM AS NO, a.* FROM (select boardid, bno, boardname, subject, url, regdate, grp ");
        query.append(" from VIEW_NEOBOARDSEARCH");
        query.append(" where is_delete='N' and categoryid='eng' ");
        if (key_word != null && !key_word.equals("")) {
        query.append(" and (subject like '%"+key_word+"%' or content like '%"+key_word+"%')");
        }
      //  query.append(" order by no desc limit ?, ?");
        query.append(") a ) b ) c ");
        query.append(" WHERE  c.PAGE_NO > ?  AND c.PAGE_NO <= ? ");
        System.out.println(query);
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setInt(1, (page-1) * pageSize);
			prestmt.setInt(2, page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				SearchBean sb = new SearchBean();
				sb.setNo(rs.getInt("no"));
				sb.setBoardid(rs.getString("boardid"));
				sb.setBno(rs.getInt("bno"));
				sb.setBoardname(rs.getString("boardname"));
				sb.setSubject(rs.getString("subject"));
				sb.setUrl(rs.getString("url"));
				sb.setRegDateString("yyyy-MM-dd hh:mm:ss", rs.getString("regdate"));
				sb.setGrp(rs.getString("grp"));
				result.add(sb);
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
	
	public int getSearchListCount(String key_word) {
    	Connection con = null;
 		ResultSet rs = null;
 		Statement stmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer(); 		
        query.append("select count(*) ");
        query.append(" from VIEW_NEOBOARDSEARCH");
        query.append(" where is_delete='N'  and categoryid='eng' ");
        if (key_word != null && !key_word.equals("")) {
        query.append(" and (subject like '%"+key_word+"%' or content like '%"+key_word+"%')");
        }
        System.out.println("\r\n"+query);
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
}
