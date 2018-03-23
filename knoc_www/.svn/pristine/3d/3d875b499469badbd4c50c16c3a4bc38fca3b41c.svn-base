package kr.co.knoc.term;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.util.EtcUtil;

public class SurveyManager {
	public boolean insertSurvey( String questionId, String userId, int Answer1, String answer2, int orderNo) throws Exception {
		Connection con = null;		
		PreparedStatement prestmt = null;
		boolean flag = false;		
		
		try {
			con = DBUtil.getConnection();			
			String sql = "";	
			
			sql = "		INSERT INTO SURVERY_2011											"; 
			sql = sql+"	(USER_ID, QUESTION_ID, ANSWER1, ANSWER2, STATUS_NO, INSERT_DATE, ORDER_NO)	";
			sql = sql+"	VALUES (?, ?, ?, ?, 1, now(), ?)									";
						
			int index = 1;					
			
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,userId);
			prestmt.setString(index++,questionId);
			prestmt.setInt(index++,Answer1);
			prestmt.setString(index++,answer2);
			prestmt.setInt(index++,orderNo);
			
			prestmt.executeUpdate();	
		
			
			
			flag = true;
			
			
			prestmt.close();
			con.close();
			return flag;
		} catch (Exception e) {			
		    e.printStackTrace();
		    flag = false;
		} finally {
			try {			      
			
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
				
			}
		}
		return flag;
	}
	
	/**
	 * @return
	 */
	public ArrayList getResultList(){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList list = new ArrayList();	
 		
 		StringBuffer query = new StringBuffer(); 		

        /*query.append(" select ");
        query.append(" QUESTION_ID, ");
        query.append(" CASE ANSWER1 WHEN 1 THEN SUM(1) ELSE SUM(0) END AS ANSWER1, ");
        query.append(" CASE ANSWER1 WHEN 2 THEN SUM(1) ELSE SUM(0) END AS ANSWER2, ");
        query.append(" CASE ANSWER1 WHEN 3 THEN SUM(1) ELSE SUM(0) END AS ANSWER3, ");
        query.append(" CASE ANSWER1 WHEN 4 THEN SUM(1) ELSE SUM(0) END AS ANSWER4, ");
        query.append(" CASE ANSWER1 WHEN 5 THEN SUM(1) ELSE SUM(0) END AS ANSWER5 ");
        query.append(" from SURVERY_2011 ");
      query.append(" GROUP BY QUESTION_ID ");
        query.append(" order by order_no asc ");*/
      query.append(" SELECT * ");
	  query.append(" FROM ");
	  query.append(" (SELECT DISTINCT( QUESTION_ID) , order_no FROM SURVERY_2011 ORDER BY order_no ) A, "); 
	  query.append(" (	SELECT QUESTION_ID, 	");
	  query.append("		SUM  ( CASE WHEN ANSWER1=1 THEN ANSWER1 ELSE 1 END ) AS ANSWER1,	"); 
	  query.append(" 		SUM  ( CASE WHEN ANSWER1=2 THEN ANSWER1 ELSE 1 END ) AS ANSWER2, 	");
	  query.append("		SUM  ( CASE WHEN ANSWER1=3 THEN ANSWER1 ELSE 1 END ) AS ANSWER3,	"); 
	  query.append("		SUM  ( CASE WHEN ANSWER1=4 THEN ANSWER1 ELSE 1 END ) AS ANSWER4, 	");
	  query.append("		SUM  ( CASE WHEN ANSWER1=5 THEN ANSWER1 ELSE 1 END ) AS ANSWER5 	");
	  query.append(" 	FROM SURVERY_2011 ");
	  query.append(" 	GROUP BY QUESTION_ID	");
	  query.append(" ) B ");
	  query.append(" WHERE A.QUESTION_ID=B.QUESTION_ID ");
	  query.append(" ORDER BY A.ORDER_NO ");
        
		try {
			con = DBUtil.getConnection();			
			prestmt = con.prepareStatement(query.toString());
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				HashMap hash = new HashMap();
				hash.put("QUESTION_ID", rs.getString("QUESTION_ID"));
				hash.put("ANSWER1", rs.getString("ANSWER1"));
				hash.put("ANSWER2", rs.getString("ANSWER2"));
				hash.put("ANSWER3", rs.getString("ANSWER3"));
				hash.put("ANSWER4", rs.getString("ANSWER4"));
				hash.put("ANSWER5", rs.getString("ANSWER5"));	
				list.add(hash);
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
        return list;
	}
	
	
	/**
	 * 占쏙옙占쏙옙占쏙옙占�占쏙옙占쏙옙트(占쌍곤옙占�
	 * @return
	 */
	public ArrayList getResultList2(){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList list = new ArrayList();	
 		
 		StringBuffer query = new StringBuffer(); 		
        query.append(" select ");
        query.append(" 	QUESTION_ID, ANSWER2 ");        
        query.append(" from SURVERY_2011 ");
        query.append(" WHERE ANSWER2 <> '' ");
        query.append(" order by order_no asc ");
        
		try {
			con = DBUtil.getConnection();			
			prestmt = con.prepareStatement(query.toString());
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
						

				HashMap hash = new HashMap();
				hash.put("QUESTION_ID", rs.getString("QUESTION_ID"));				
				hash.put("ANSWER", rs.getString("ANSWER2"));							
				
				list.add(hash);				
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
        return list;
	}
	
	
	
	public ArrayList getUserList(String searchValue){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList list = new ArrayList();	
 		
 		StringBuffer query = new StringBuffer(); 		
 		
 		
 		System.out.println("searchValue :: "+searchValue);
        query.append(" SELECT ");
        query.append(" USER_ID, INSERT_DATE ");
        query.append(" FROM SURVERY_2011 ");
        if(!"".equals(searchValue)){
            query.append(" WHERE USER_ID LIKE ? ");
        }
        
        query.append(" GROUP BY USER_ID ");
       
		try {
			con = DBUtil.getConnection();			
			prestmt = con.prepareStatement(query.toString());
			if(!"".equals(searchValue)){
				prestmt.setString(1, "%"+searchValue+"%");
			}
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				HashMap hash = new HashMap();
				hash.put("USER_ID", rs.getString("USER_ID"));
				hash.put("INSERT_DATE", rs.getString("INSERT_DATE"));
					
				list.add(hash);
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
        return list;
	}
	
	/**
	 * 占쏙옙占쏙옙占쏙옙占쏙옙占�占쏙옙회
	 * @param userId
	 * @return
	 */
	public ArrayList getUserResultList(String userId){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList list = new ArrayList();	
 		
 		StringBuffer query = new StringBuffer(); 		

        query.append(" select ");
        query.append(" 	USER_ID, QUESTION_ID, ANSWER1, ANSWER2, STATUS_NO,  ");
        query.append(" 	INSERT_DATE, ORDER_NO ");
        query.append(" FROM ");
        query.append(" 	SURVERY_2011 ");
        //query.append(" WHERE USER_ID = ?   ");
        query.append(" ORDER BY USER_ID ASC, ORDER_NO ASC");
      
		try {
			con = DBUtil.getConnection();			
			prestmt = con.prepareStatement(query.toString());
			//prestmt.setString(1, userId);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				HashMap hash = new HashMap();
				hash.put("USER_ID", rs.getString("USER_ID"));
				hash.put("QUESTION_ID", rs.getString("QUESTION_ID"));
				hash.put("ANSWER1", rs.getString("ANSWER1"));
				hash.put("ANSWER2", rs.getString("ANSWER2"));
				hash.put("STATUS_NO", rs.getString("STATUS_NO"));
				hash.put("INSERT_DATE", rs.getString("INSERT_DATE"));
				hash.put("ORDER_NO", rs.getString("ORDER_NO"));	
				list.add(hash);
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
        return list;
	}
	
	
	
}
