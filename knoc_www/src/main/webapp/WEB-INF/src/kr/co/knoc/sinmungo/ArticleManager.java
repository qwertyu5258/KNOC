package kr.co.knoc.sinmungo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.util.DateUtil;
import kr.co.knoc.util.EtcUtil;

import com.neoboard.mailing.MailBean;

public class ArticleManager {
	
	public ArrayList getArticleFileList(int articleNid) throws Exception{
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
			
		try {
			con = DBUtil.getConnection();			
			 
			String sql = " SELECT ";
			sql = sql+ "   	T1.ARTICLE_NID, T1.FILE_NID, T2.ORG_FILENM, T2.SAVE_FILENM, T2.FILE_PATH ";
			sql = sql+ "   	FROM ARTICLE_FILE T1 INNER JOIN FILE_MST T2 ";
			sql = sql+ "   	ON(T1.FILE_NID = T2.FILE_NID AND T1.STATUS_NO > -1 AND T1.ARTICLE_NID = ?) ";
			
			
			prestmt = con.prepareStatement(sql);
			int index=1;
			
			prestmt.setInt(index++, articleNid);
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("FILE_NID", rs.getInt("FILE_NID"));
				hash.put("ORG_FILENM", rs.getString("ORG_FILENM"));
				hash.put("SAVE_FILENM", rs.getString("SAVE_FILENM"));
				hash.put("FILE_PATH", rs.getString("FILE_PATH"));	
				list.add(hash);
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
		return list;
	}
	
	
	public HashMap getArticleInfo(int articleNid) throws Exception{
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		HashMap hash = new HashMap();	
			
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	ARTICLE_NID, P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ROOT_ARTICLE_NO, ";
			sql = sql+ "   	CONTENTS, SUBJECT, STATUS_NO,  TO_CHAR(REG_DATE, 'YYYY-MM-DD')    AS REG_DATE, MOD_DATE, ";
			sql = sql+ "   	TYPE, ARTICLE_PWD, OBM_TYPE, USER_NM";
			sql = sql+ "   FROM ARTICLE_MST  WHERE ARTICLE_NID = ? ";
			
			prestmt = con.prepareStatement(sql);
			int index=1;
			
			prestmt.setInt(index++, articleNid);
			
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("P_ARTICLE_NID", rs.getInt("P_ARTICLE_NID"));
				hash.put("ORDER_NO", rs.getInt("ORDER_NO"));
				hash.put("LEVEL_NO", rs.getInt("LEVEL_NO"));
				hash.put("ROOT_ARTICLE_NO", rs.getInt("ROOT_ARTICLE_NO"));				
				
				hash.put("CONTENTS", rs.getString("CONTENTS"));
				hash.put("SUBJECT", rs.getString("SUBJECT"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				
				hash.put("ARTICLE_PWD", rs.getString("ARTICLE_PWD"));
				hash.put("OBM_TYPE", rs.getString("OBM_TYPE"));
				hash.put("USER_NM", rs.getString("USER_NM"));
				
				
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
		return hash;
	}
	
	
	
	
	/**
	 * 게시글 총 갯수
	 * @return
	 */
	public int getArticleCount(HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int resultCount = 0;
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	COUNT(*) CNT";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND WRITE_TYPE=1 ";
			
			
			if(searchMap.get("field") != null){
				
				if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && !searchMap.get("field").equals("all")){
					sql = sql+ "   AND "+searchMap.get("field")+" LIKE '%"+searchMap.get("searchValue")+"%'  ";
				}else if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && searchMap.get("field").equals("all")){
					sql = sql+ "   AND (SUBJECT LIKE '%"+searchMap.get("searchValue")+"%'  OR CONTENTS LIKE '%"+searchMap.get("searchValue")+"%' ) ";
				}
			}
					
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0){
					sql = sql+ "   AND type = ? ";
				}
			}
			
						
			prestmt = con.prepareStatement(sql);
			int index=1;
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0 ){
					prestmt.setInt(index++, etcutil.checkNullInt(searchMap.get("type").toString(), 0) );
				}
			}						
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("CNT");
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
		return resultCount;
	}
	
	/**
	 * 영문 게시글 총 갯수
	 * @return
	 */
	public int getArticleCountEn(HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int resultCount = 0;
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	COUNT(*) CNT";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND WRITE_TYPE=3 ";
			
			
			if(searchMap.get("field") != null){
				
				if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && !searchMap.get("field").equals("all")){
					sql = sql+ "   AND "+searchMap.get("field")+" LIKE '%"+searchMap.get("searchValue")+"%'  ";
				}else if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && searchMap.get("field").equals("all")){
					sql = sql+ "   AND (SUBJECT LIKE '%"+searchMap.get("searchValue")+"%'  OR CONTENTS LIKE '%"+searchMap.get("searchValue")+"%' ) ";
				}
			}
					
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0){
					sql = sql+ "   AND type = ? ";
				}
			}
			
						
			prestmt = con.prepareStatement(sql);
			int index=1;
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0 ){
					prestmt.setInt(index++, etcutil.checkNullInt(searchMap.get("type").toString(), 0) );
				}
			}						
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("CNT");
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
		return resultCount;
	}
	
	/**
	 * 글등록 리스트(페이지)
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList getArticlePageList(int page, int pageSize, HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT * FROM ( ";
			sql = sql+ " SELECT ";
			sql = sql+ "   	ARTICLE_NID, P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ROOT_ARTICLE_NO,ROW_NUMBER() OVER(ORDER BY ARTICLE_NID desc) AS PAGE_NO , ";
			sql = sql+ "   	CONTENTS, SUBJECT, STATUS_NO,  TO_CHAR(MOD_DATE,'YYYY-MM-DD')   AS MOD_DATE, ";
			sql = sql+ "   	(SELECT COUNT(*) FROM ARTICLE_FILE WHERE ARTICLE_MST.ARTICLE_NID = ARTICLE_FILE.ARTICLE_NID AND ARTICLE_FILE.STATUS_NO > -1) FILE_COUNT, ";
			//sql = sql+ "   	CASE DATE_FORMAT(REG_DATE, '%Y-%m-%d') ";
			//sql = sql+ "   		WHEN DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN DATE_FORMAT(REG_DATE, '%Y-%m-%d %H:%i')  ";
			//sql = sql+ "   		ELSE DATE_FORMAT(REG_DATE, '%Y-%m-%d')  ";
			//sql = sql+ "   	CASE TO_CHAR(REG_DATE,'YYYY-MM-DD')   ";
			//sql = sql+ "   		WHEN  TO_CHAR(SYSDATE,'YYYY-MM-DD')   THEN TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI')  ";
			//sql = sql+ "   		ELSE TO_CHAR(REG_DATE,'YYYY-MM-DD') ";
			//sql = sql+ "   		END AS REG_DATE,  ";
			sql = sql+ "    TO_CHAR(REG_DATE,'YYYY-MM-DD')   AS REG_DATE,";
			sql = sql+ "   	OBM_TYPE, USER_NM ";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 ";
			sql = sql+ "   AND WRITE_TYPE = 1 ";
			
			if(searchMap.get("field") != null){				
				if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && !searchMap.get("field").equals("all")){
					sql = sql+ "   AND "+searchMap.get("field")+" LIKE '%"+searchMap.get("searchValue")+"%'  ";
				}else if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && searchMap.get("field").equals("all")){
					sql = sql+ "   AND (SUBJECT LIKE '%"+searchMap.get("searchValue")+"%'  OR CONTENTS LIKE '%"+searchMap.get("searchValue")+"%' ) ";
				}
			}
			
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0){
					sql = sql+ "   AND type = ? ";
				}
			}
			sql = sql+ "   ORDER BY REG_DATE DESC   ";
			sql = sql+ " )A ";
			sql = sql+ "   WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ";
			 			
			prestmt = con.prepareStatement(sql);
			int index=1;
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0 ){					
					prestmt.setInt(index++, etcutil.checkNullInt(searchMap.get("type").toString(), 0) );
				}
			}
			prestmt.setInt(index++,(page-1) * pageSize);
			prestmt.setInt(index++,page*pageSize );
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("P_ARTICLE_NID", rs.getInt("P_ARTICLE_NID"));
				hash.put("ORDER_NO", rs.getInt("ORDER_NO"));
				hash.put("LEVEL_NO", rs.getInt("LEVEL_NO"));
				hash.put("ROOT_ARTICLE_NO", rs.getInt("ROOT_ARTICLE_NO"));				
				
				hash.put("CONTENTS", rs.getString("CONTENTS"));
				hash.put("SUBJECT", rs.getString("SUBJECT"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				
				hash.put("OBM_TYPE", rs.getString("OBM_TYPE"));
				hash.put("FILE_COUNT", rs.getInt("FILE_COUNT"));
				hash.put("USER_NM", rs.getString("USER_NM"));
				
				list.add(hash);
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
		return list;
	}
	
	/**
	 * 영문 글등록 리스트(페이지)
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList getArticlePageListEn(int page, int pageSize, HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT * FROM ( ";
			sql = sql+ " SELECT ";
			sql = sql+ "   	ARTICLE_NID, P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ROOT_ARTICLE_NO,ROW_NUMBER() OVER(ORDER BY ARTICLE_NID desc) AS PAGE_NO , ";
			sql = sql+ "   	CONTENTS, SUBJECT, STATUS_NO,  TO_CHAR(MOD_DATE,'YYYY-MM-DD')   AS MOD_DATE, ";
			sql = sql+ "   	(SELECT COUNT(*) FROM ARTICLE_FILE WHERE ARTICLE_MST.ARTICLE_NID = ARTICLE_FILE.ARTICLE_NID AND ARTICLE_FILE.STATUS_NO > -1) FILE_COUNT, ";
			//sql = sql+ "   	CASE DATE_FORMAT(REG_DATE, '%Y-%m-%d') ";
			//sql = sql+ "   		WHEN DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN DATE_FORMAT(REG_DATE, '%Y-%m-%d %H:%i')  ";
			//sql = sql+ "   		ELSE DATE_FORMAT(REG_DATE, '%Y-%m-%d')  ";
			//sql = sql+ "   	CASE TO_CHAR(REG_DATE,'YYYY-MM-DD')   ";
			//sql = sql+ "   		WHEN  TO_CHAR(SYSDATE,'YYYY-MM-DD')   THEN TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI')  ";
			//sql = sql+ "   		ELSE TO_CHAR(REG_DATE,'YYYY-MM-DD') ";
			//sql = sql+ "   		END AS REG_DATE,  ";
			sql = sql+ "    TO_CHAR(REG_DATE,'YYYY-MM-DD')   AS REG_DATE,";
			sql = sql+ "   	OBM_TYPE ";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 ";
			sql = sql+ "   AND WRITE_TYPE = 3 ";
			
			if(searchMap.get("field") != null){				
				if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && !searchMap.get("field").equals("all")){
					sql = sql+ "   AND "+searchMap.get("field")+" LIKE '%"+searchMap.get("searchValue")+"%'  ";
				}else if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && searchMap.get("field").equals("all")){
					sql = sql+ "   AND (SUBJECT LIKE '%"+searchMap.get("searchValue")+"%'  OR CONTENTS LIKE '%"+searchMap.get("searchValue")+"%' ) ";
				}
			}
			
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0){
					sql = sql+ "   AND type = ? ";
				}
			}
			sql = sql+ "   ORDER BY REG_DATE DESC   ";
			sql = sql+ " )A ";
			sql = sql+ "   WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ";
			 			
			prestmt = con.prepareStatement(sql);
			int index=1;
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0 ){					
					prestmt.setInt(index++, etcutil.checkNullInt(searchMap.get("type").toString(), 0) );
				}
			}
			prestmt.setInt(index++,(page-1) * pageSize);
			prestmt.setInt(index++,page*pageSize );
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("P_ARTICLE_NID", rs.getInt("P_ARTICLE_NID"));
				hash.put("ORDER_NO", rs.getInt("ORDER_NO"));
				hash.put("LEVEL_NO", rs.getInt("LEVEL_NO"));
				hash.put("ROOT_ARTICLE_NO", rs.getInt("ROOT_ARTICLE_NO"));				
				
				hash.put("CONTENTS", rs.getString("CONTENTS"));
				hash.put("SUBJECT", rs.getString("SUBJECT"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				
				hash.put("OBM_TYPE", rs.getString("OBM_TYPE"));
				hash.put("FILE_COUNT", rs.getInt("FILE_COUNT"));
				
				list.add(hash);
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
		return list;
	}
	
	/**
	 * 게시글 총 갯수
	 * @return
	 */
	public int getArticleUserCount(HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int resultCount = 0;
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	COUNT(*) CNT";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 AND  ARTICLE_PWD = ? ";
			sql = sql+ "   AND WRITE_TYPE =1 ";
			
				
						
			prestmt = con.prepareStatement(sql);
			int index=1;
			prestmt.setString(index++, searchMap.get("article_pwd").toString());					
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("CNT");
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
		return resultCount;
	}
	
	/**
	 * 영문 게시글 총 갯수
	 * @return
	 */
	public int getArticleUserCountEn(HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int resultCount = 0;
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	COUNT(*) CNT";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 AND  ARTICLE_PWD = ? ";
			sql = sql+ "   AND WRITE_TYPE =3 ";
			
				
						
			prestmt = con.prepareStatement(sql);
			int index=1;
			prestmt.setString(index++, searchMap.get("article_pwd").toString());					
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("CNT");
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
		return resultCount;
	}
	
	
	/**
	 * 글등록 리스트(페이지)
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList getArticleUserPageList(int page, int pageSize, HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT * FROM ( ";
			sql = sql+ " SELECT  ";
			sql = sql+ "   	ARTICLE_NID, P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ROOT_ARTICLE_NO, ROW_NUMBER() OVER(ORDER BY ARTICLE_NID desc) AS PAGE_NO, ";
			sql = sql+ "   	CONTENTS, SUBJECT, STATUS_NO, TO_CHAR(MOD_DATE,'YYYY-MM-DD')   AS MOD_DATE, "; //MOD_DATE
			sql = sql+ "   	(SELECT COUNT(*) FROM ARTICLE_FILE WHERE ARTICLE_MST.ARTICLE_NID = ARTICLE_FILE.ARTICLE_NID AND ARTICLE_FILE.STATUS_NO > -1) FILE_COUNT, ";
			//sql = sql+ "   	CASE DATE_FORMAT(REG_DATE, '%Y-%m-%d') ";
			//sql = sql+ "   		WHEN DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN DATE_FORMAT(REG_DATE, '%Y-%m-%d %H:%i')  ";
			//sql = sql+ "   		ELSE DATE_FORMAT(REG_DATE, '%Y-%m-%d')  ";
			//sql = sql+ "   	CASE TO_CHAR(REG_DATE,'YYYY-MM-DD')   ";
			//sql = sql+ "   		WHEN  TO_CHAR(SYSDATE,'YYYY-MM-DD')   THEN TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI')  ";
			//sql = sql+ "   		ELSE TO_CHAR(REG_DATE,'YYYY-MM-DD') ";
			//sql = sql+ "   		END AS REG_DATE,  ";
			sql = sql+ "    TO_CHAR(REG_DATE,'YYYY-MM-DD')   AS REG_DATE,";
			sql = sql+ "   	OBM_TYPE, ARTICLE_PWD , USER_NM";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 AND  ARTICLE_PWD = ? ";
			sql = sql+ "   AND WRITE_TYPE = 1  ";
			sql = sql+ "   ORDER BY REG_DATE DESC   ";		
			sql = sql+ " )A ";
			sql = sql+ "   WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ";
			
						
			prestmt = con.prepareStatement(sql);
			int index=1;
			prestmt.setString(index++, searchMap.get("article_pwd").toString());
			prestmt.setInt(index++,(page-1) * pageSize);
			prestmt.setInt(index++,page*pageSize );
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("P_ARTICLE_NID", rs.getInt("P_ARTICLE_NID"));
				hash.put("ORDER_NO", rs.getInt("ORDER_NO"));
				hash.put("LEVEL_NO", rs.getInt("LEVEL_NO"));
				hash.put("ROOT_ARTICLE_NO", rs.getInt("ROOT_ARTICLE_NO"));				
				
				hash.put("CONTENTS", rs.getString("CONTENTS"));
				hash.put("SUBJECT", rs.getString("SUBJECT"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				
				hash.put("OBM_TYPE", rs.getString("OBM_TYPE"));
				hash.put("FILE_COUNT", rs.getInt("FILE_COUNT"));
				hash.put("USER_NM", rs.getString("USER_NM"));
				
				list.add(hash);
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
		return list;
	}
	
	/**
	 * 영문 글등록 리스트(페이지)
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList getArticleUserPageListEn(int page, int pageSize, HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT * FROM ( ";
			sql = sql+ " SELECT  ";
			sql = sql+ "   	ARTICLE_NID, P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ROOT_ARTICLE_NO, ROW_NUMBER() OVER(ORDER BY ARTICLE_NID desc) AS PAGE_NO, ";
			sql = sql+ "   	CONTENTS, SUBJECT, STATUS_NO, TO_CHAR(MOD_DATE,'YYYY-MM-DD')   AS MOD_DATE, "; //MOD_DATE
			sql = sql+ "   	(SELECT COUNT(*) FROM ARTICLE_FILE WHERE ARTICLE_MST.ARTICLE_NID = ARTICLE_FILE.ARTICLE_NID AND ARTICLE_FILE.STATUS_NO > -1) FILE_COUNT, ";
			//sql = sql+ "   	CASE DATE_FORMAT(REG_DATE, '%Y-%m-%d') ";
			//sql = sql+ "   		WHEN DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN DATE_FORMAT(REG_DATE, '%Y-%m-%d %H:%i')  ";
			//sql = sql+ "   		ELSE DATE_FORMAT(REG_DATE, '%Y-%m-%d')  ";
			//sql = sql+ "   	CASE TO_CHAR(REG_DATE,'YYYY-MM-DD')   ";
			//sql = sql+ "   		WHEN  TO_CHAR(SYSDATE,'YYYY-MM-DD')   THEN TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI')  ";
			//sql = sql+ "   		ELSE TO_CHAR(REG_DATE,'YYYY-MM-DD') ";
			//sql = sql+ "   		END AS REG_DATE,  ";
			sql = sql+ "    TO_CHAR(REG_DATE,'YYYY-MM-DD')   AS REG_DATE,";
			sql = sql+ "   	OBM_TYPE, ARTICLE_PWD ";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 AND  ARTICLE_PWD = ? ";
			sql = sql+ "   AND WRITE_TYPE = 3  ";
			sql = sql+ "   ORDER BY REG_DATE DESC   ";		
			sql = sql+ " )A ";
			sql = sql+ "   WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ";
			
						
			prestmt = con.prepareStatement(sql);
			int index=1;
			prestmt.setString(index++, searchMap.get("article_pwd").toString());
			prestmt.setInt(index++,(page-1) * pageSize);
			prestmt.setInt(index++,page*pageSize );
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("P_ARTICLE_NID", rs.getInt("P_ARTICLE_NID"));
				hash.put("ORDER_NO", rs.getInt("ORDER_NO"));
				hash.put("LEVEL_NO", rs.getInt("LEVEL_NO"));
				hash.put("ROOT_ARTICLE_NO", rs.getInt("ROOT_ARTICLE_NO"));				
				
				hash.put("CONTENTS", rs.getString("CONTENTS"));
				hash.put("SUBJECT", rs.getString("SUBJECT"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				
				hash.put("OBM_TYPE", rs.getString("OBM_TYPE"));
				hash.put("FILE_COUNT", rs.getInt("FILE_COUNT"));
				
				list.add(hash);
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
		return list;
	}
	
	
	
	/**
	 * 글등록
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public int insertArticle(HashMap dataMap, ArrayList fileList, HashMap userMap) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int resultCnt = -1;
		
		int article_nid = 0;
		int file_nid = 0;
		
		StringBuffer stringBuffer = new StringBuffer();		
		StringBuffer articleMstBuff = new StringBuffer();
		StringBuffer fileMstBuff = new StringBuffer();
		StringBuffer articleFileBuff = new StringBuffer();
		
		System.out.println("dataMap::::::::"+dataMap.toString());
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	
	    	stringBuffer.append("SELECT NVL(MAX(ARTICLE_NID), 1)+1 as ARTICLE_NID FROM ARTICLE_MST");
			
			pstmt = con.prepareStatement(stringBuffer.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				article_nid = rs.getInt("ARTICLE_NID");
			}
	    	
	    	articleMstBuff.append(" INSERT INTO ARTICLE_MST ");
	    	articleMstBuff.append(" ( ");
	    	articleMstBuff.append(" 	P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ");
	    	articleMstBuff.append(" 	ROOT_ARTICLE_NO, CONTENTS, SUBJECT, STATUS_NO, REG_DATE, ");
	    	articleMstBuff.append(" 	MOD_DATE, TYPE, ARTICLE_PWD , WRITE_TYPE , OBM_TYPE , ARTICLE_NID, USER_NM");
	    	articleMstBuff.append(" ) ");
	    	articleMstBuff.append(" VALUES ");
	    	articleMstBuff.append(" ( ");
	    	articleMstBuff.append(" 	0, 0, 0, ");
	    	articleMstBuff.append(" 	0, ?, ?, ?, sysdate, ");
	    	articleMstBuff.append(" 	sysdate, -1 , ?, 1 , ? , ? , ?");
	    	articleMstBuff.append(" ) ");
	    	
			int index = 1;
			
			pstmt = con.prepareStatement(articleMstBuff.toString());	
			pstmt.setString(1, dataMap.get("contents").toString());
			pstmt.setString(2, dataMap.get("subject").toString());
			pstmt.setString(3, dataMap.get("status_no").toString());
			pstmt.setString(4, dataMap.get("article_pwd").toString());
			pstmt.setString(5, dataMap.get("obm_type").toString());	
			pstmt.setInt(6, article_nid);
			pstmt.setString(7, dataMap.get("user_nm").toString());	
			
			resultCnt = pstmt.executeUpdate();
			
			if(pstmt != null){
				pstmt = null;
			}
			if(rs != null){
				rs = null;
			}
			
			
			fileMstBuff.append(" INSERT INTO FILE_MST ");
			fileMstBuff.append(" ( ");
			fileMstBuff.append(" 	ORG_FILENM,SAVE_FILENM,REG_DATE,MOD_DATE,FILE_PATH,STATUS_NO,FILE_NID ");	    	
			fileMstBuff.append(" ) ");
			fileMstBuff.append(" VALUES ");
			fileMstBuff.append(" ( ");
			fileMstBuff.append(" 	?, ?, sysdate, sysdate, ?, 1, ? ");	    	
			fileMstBuff.append(" ) ");
			
			for(int i=0; i<fileList.size(); i++){
				
				stringBuffer.setLength(0);
				HashMap fileMap = (HashMap)fileList.get(i);
			
				stringBuffer.append(" SELECT NVL(MAX(FILE_NID), 1)+1 AS FILE_NID FROM FILE_MST ");			
				
				pstmt2 = con.prepareStatement(stringBuffer.toString());
				rs = pstmt2.executeQuery();
				
				if(rs.next()){
					file_nid = rs.getInt("FILE_NID");
				}
				
				index = 1;					
				pstmt = con.prepareStatement(fileMstBuff.toString());						
				pstmt.setString(index++,  fileMap.get("orgFileNm").toString() );
				pstmt.setString(index++,  fileMap.get("saveFileNm").toString() );
				pstmt.setString(index++,  fileMap.get("filePath").toString());
				pstmt.setInt(index++, file_nid);
				
				pstmt.executeUpdate();	
				
				if(pstmt2 != null){
					pstmt2 = null;
				}
				
				articleFileBuff.setLength(0);
				articleFileBuff.append(" INSERT INTO ARTICLE_FILE ");
				articleFileBuff.append(" ( ");
				articleFileBuff.append(" 	ARTICLE_NID, FILE_NID, REG_DATE, MOD_DATE, STATUS_NO ");	    	
				articleFileBuff.append(" ) ");
				articleFileBuff.append(" VALUES ");
				articleFileBuff.append(" ( ");
				articleFileBuff.append(" 	?, ?, sysdate, sysdate, 1 ");	    	
				articleFileBuff.append(" ) ");
				
				pstmt2 = con.prepareStatement(articleFileBuff.toString());
				pstmt2.setInt(1, article_nid);
				pstmt2.setInt(2, file_nid);
				pstmt2.executeUpdate();			
			}			
			
		 	//*********************************************** 이메일[start] **********************************//*
			System.out.println("Email :: "+userMap.get("EMAIL").toString());
			System.out.println("subject :: ");
			System.out.println("contents :: ");
			
			
			String mailTo = userMap.get("EMAIL").toString();			
			String mailFrom = "root@www.knoc.co.kr";
			String title = "인사청탁알선신문고에 의견이 등록되었습니다. ["+DateUtil.getFormattedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"]";
			String body = "제목 : " + dataMap.get("subject").toString() + " <br /><br /> " + dataMap.get("contents").toString().replaceAll("\r\n", "</br>");
			String mailServer = "localhost";
			String toName = "관리자";
			String fromName = "root";
			
			MailBean Mailb = new MailBean(mailTo, mailFrom, title, body, "", toName, fromName, mailServer);
			Mailb.start();//start()에서 run()으로 수정 2011-08-02
 			/*********************************************** 이메일[end] **********************************/
			
			con.commit();
			
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true);
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close();				
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	/**
	 * 영문 글등록
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public int insertArticleEn(HashMap dataMap, ArrayList fileList, HashMap userMap) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int resultCnt = -1;
		
		int article_nid = 0;
		int file_nid = 0;
		
		StringBuffer stringBuffer = new StringBuffer();		
		StringBuffer articleMstBuff = new StringBuffer();
		StringBuffer fileMstBuff = new StringBuffer();
		StringBuffer articleFileBuff = new StringBuffer();
		
		System.out.println("dataMap::::::::"+dataMap.toString());
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	
	    	stringBuffer.append("SELECT NVL(MAX(ARTICLE_NID), 1)+1 as ARTICLE_NID FROM ARTICLE_MST");
			
			pstmt = con.prepareStatement(stringBuffer.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				article_nid = rs.getInt("ARTICLE_NID");
			}
	    	
	    	articleMstBuff.append(" INSERT INTO ARTICLE_MST ");
	    	articleMstBuff.append(" ( ");
	    	articleMstBuff.append(" 	P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ");
	    	articleMstBuff.append(" 	ROOT_ARTICLE_NO, CONTENTS, SUBJECT, STATUS_NO, REG_DATE, ");
	    	articleMstBuff.append(" 	MOD_DATE, TYPE, ARTICLE_PWD , WRITE_TYPE , OBM_TYPE , ARTICLE_NID");
	    	articleMstBuff.append(" ) ");
	    	articleMstBuff.append(" VALUES ");
	    	articleMstBuff.append(" ( ");
	    	articleMstBuff.append(" 	0, 0, 0, ");
	    	articleMstBuff.append(" 	0, ?, ?, ?, sysdate, ");
	    	articleMstBuff.append(" 	sysdate, -1 , ?, 3 , ? , ? ");
	    	articleMstBuff.append(" ) ");
	    	
			int index = 1;
			
			pstmt = con.prepareStatement(articleMstBuff.toString());	
			pstmt.setString(1, dataMap.get("contents").toString());
			pstmt.setString(2, dataMap.get("subject").toString());
			pstmt.setString(3, dataMap.get("status_no").toString());
			pstmt.setString(4, dataMap.get("article_pwd").toString());
			pstmt.setString(5, dataMap.get("obm_type").toString());	
			pstmt.setInt(6, article_nid);
			
			resultCnt = pstmt.executeUpdate();
			
			if(pstmt != null){
				pstmt = null;
			}
			if(rs != null){
				rs = null;
			}
			
			
			fileMstBuff.append(" INSERT INTO FILE_MST ");
			fileMstBuff.append(" ( ");
			fileMstBuff.append(" 	ORG_FILENM,SAVE_FILENM,REG_DATE,MOD_DATE,FILE_PATH,STATUS_NO,FILE_NID ");	    	
			fileMstBuff.append(" ) ");
			fileMstBuff.append(" VALUES ");
			fileMstBuff.append(" ( ");
			fileMstBuff.append(" 	?, ?, sysdate, sysdate, ?, 1, ? ");	    	
			fileMstBuff.append(" ) ");
			
			for(int i=0; i<fileList.size(); i++){
				
				stringBuffer.setLength(0);
				HashMap fileMap = (HashMap)fileList.get(i);
			
				stringBuffer.append(" SELECT NVL(MAX(FILE_NID), 1)+1 AS FILE_NID FROM FILE_MST ");			
				
				pstmt2 = con.prepareStatement(stringBuffer.toString());
				rs = pstmt2.executeQuery();
				
				if(rs.next()){
					file_nid = rs.getInt("FILE_NID");
				}
				
				index = 1;					
				pstmt = con.prepareStatement(fileMstBuff.toString());						
				pstmt.setString(index++,  fileMap.get("orgFileNm").toString() );
				pstmt.setString(index++,  fileMap.get("saveFileNm").toString() );
				pstmt.setString(index++,  fileMap.get("filePath").toString());
				pstmt.setInt(index++, file_nid);
				
				pstmt.executeUpdate();	
				
				if(pstmt2 != null){
					pstmt2 = null;
				}
				
				articleFileBuff.setLength(0);
				articleFileBuff.append(" INSERT INTO ARTICLE_FILE ");
				articleFileBuff.append(" ( ");
				articleFileBuff.append(" 	ARTICLE_NID, FILE_NID, REG_DATE, MOD_DATE, STATUS_NO ");	    	
				articleFileBuff.append(" ) ");
				articleFileBuff.append(" VALUES ");
				articleFileBuff.append(" ( ");
				articleFileBuff.append(" 	?, ?, sysdate, sysdate, 1 ");	    	
				articleFileBuff.append(" ) ");
				
				pstmt2 = con.prepareStatement(articleFileBuff.toString());
				pstmt2.setInt(1, article_nid);
				pstmt2.setInt(2, file_nid);
				pstmt2.executeUpdate();			
			}			
			
		 	//*********************************************** 이메일[start] **********************************//*
			System.out.println("Email :: "+userMap.get("EMAIL").toString());
			System.out.println("subject :: ");
			System.out.println("contents :: ");
			
			
			String mailTo = userMap.get("EMAIL").toString();			
			String mailFrom = "root@www.knoc.co.kr";
			String title = "인사청탁알선신문고에 의견이 등록되었습니다. ["+DateUtil.getFormattedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"]";
			String body = "제목 : " + dataMap.get("subject").toString() + " <br /><br /> " + dataMap.get("contents").toString().replaceAll("\r\n", "</br>");
			String mailServer = "localhost";
			String toName = "관리자";
			String fromName = "root";
			
			MailBean Mailb = new MailBean(mailTo, mailFrom, title, body, "", toName, fromName, mailServer);
			Mailb.start();//start()에서 run()으로 수정 2011-08-02
 			/*********************************************** 이메일[end] **********************************/
			
			con.commit();
			
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true);
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close();				
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	/**
	 * 글삭제
	 * @param article_nid
	 * @return
	 */
	public int deleteArticle(int article_nid) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int resultCnt = -1;
		
		StringBuffer articleMstBuff = new StringBuffer();
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	articleMstBuff.append(" UPDATE ARTICLE_MST ");
	    	articleMstBuff.append(" SET ");
	    	articleMstBuff.append(" 	STATUS_NO = '-1' ");
	    	articleMstBuff.append(" WHERE ARTICLE_NID= ?");
	    	

			int index = 1;
			
			
			pstmt = con.prepareStatement(articleMstBuff.toString());					
			pstmt.setInt(1, article_nid);
					
			
			resultCnt = pstmt.executeUpdate();	
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true);
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close();				
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	
	/**
	 * 파일삭제
	 * @param article_nid
	 * @param file_nid
	 * @return
	 */
	public int deleteFileArticle(int file_nid, int article_nid) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int resultCnt = -1;
		
		StringBuffer fileMstBuff = new StringBuffer();
		StringBuffer articleFileBuff = new StringBuffer();
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	/*
	    	fileMstBuff.append(" UPDATE ARTICLE_FILE ");
	    	fileMstBuff.append(" SET ");
	    	fileMstBuff.append(" 	STATUS_NO = '-1' ");
	    	fileMstBuff.append(" WHERE ARTICLE_NID= ?");
	    	fileMstBuff.append(" AND FILE_NID= ?");*/
	    	
	    	fileMstBuff.append(" UPDATE FILE_MST ");
	    	fileMstBuff.append(" SET ");
	    	fileMstBuff.append(" 	ORG_FILENM = '', SAVE_FILENM = '', MOD_DATE=sysdate , STATUS_NO = '-1' ,");
	    	fileMstBuff.append(" 	FILE_PATH = ''  ");	    	
	    	fileMstBuff.append(" WHERE FILE_NID = ? ");
			
			pstmt = con.prepareStatement(fileMstBuff.toString());					
			pstmt.setInt(1, file_nid);
			resultCnt = pstmt.executeUpdate();	
			
			articleFileBuff.append(" UPDATE ARTICLE_FILE ");
			articleFileBuff.append(" SET ");
			articleFileBuff.append(" 	STATUS_NO = '-1' ");
			articleFileBuff.append(" WHERE FILE_NID = ? ");
			
			pstmt2 = con.prepareStatement(articleFileBuff.toString());					
			pstmt2.setInt(1, file_nid);
			resultCnt = pstmt2.executeUpdate();	
			
			
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true); 
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close();				
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	
	/**
	 * 글수정
	 * @param datamap
	 * @param fileList
	 * @return
	 */
	public int updateArticle(HashMap dataMap, ArrayList fileList, ArrayList fileList2,  HashMap userMap) throws Exception {
		
		Connection con = null; 
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		 
		int resultCnt = -1;
		
		int article_nid =0 ;
		int file_nid = 0;
		 
		int file_count = 0;
		int file_update_result=0;
		
		StringBuffer stringBuffer = new StringBuffer();		
		StringBuffer articleMstBuff = new StringBuffer();
		StringBuffer fileMstBuff = new StringBuffer();
		StringBuffer articleFileBuff = new StringBuffer();
		 
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	if(dataMap.get("article_nid")!=null){
	    		article_nid=Integer.parseInt(dataMap.get("article_nid").toString());
	    	}
	    	articleMstBuff.append(" UPDATE ARTICLE_MST ");
	    	articleMstBuff.append(" SET ");
	    	articleMstBuff.append(" 	CONTENTS = ?, ");
	    	articleMstBuff.append(" 	SUBJECT = ?, ");
	    	articleMstBuff.append(" 	STATUS_NO = ?, ");
	    	articleMstBuff.append(" 	MOD_DATE = sysdate, ");
	    	articleMstBuff.append(" 	OBM_TYPE = ?, ");
	    	articleMstBuff.append(" 	ARTICLE_PWD = ? ");
	    	articleMstBuff.append(" WHERE ARTICLE_NID= ?");
			int index = 1;
			
			
			pstmt = con.prepareStatement(articleMstBuff.toString());					
			pstmt.setString(1, dataMap.get("contents").toString());
			pstmt.setString(2, dataMap.get("subject").toString());
			pstmt.setString(3, dataMap.get("status_no").toString());
			pstmt.setString(4, dataMap.get("obm_type").toString());
			pstmt.setString(5, dataMap.get("article_pwd").toString());		
			pstmt.setString(6, dataMap.get("article_nid").toString());
			resultCnt = pstmt.executeUpdate();	
			
			
		
			if(pstmt != null){
				pstmt = null;
			}
			
			/**
			 * 신규파일 일경우
			 */
			if(dataMap.get("old_nid_filex1")==null || "".equals(dataMap.get("old_nid_filex1").toString())){
				stringBuffer.setLength(0);
				stringBuffer.append(" SELECT NVL(MAX(FILE_NID), 1)+1 AS FILE_NID FROM FILE_MST ");			
				
				pstmt2 = con.prepareStatement(stringBuffer.toString());
				rs = pstmt2.executeQuery();
				
				if(rs.next()){
					file_nid = rs.getInt("FILE_NID");
				}
				
				fileMstBuff.append(" INSERT INTO FILE_MST ");
				fileMstBuff.append(" ( ");
				fileMstBuff.append(" 	ORG_FILENM,SAVE_FILENM,REG_DATE,MOD_DATE,FILE_PATH,STATUS_NO,FILE_NID ");	    	
				fileMstBuff.append(" ) ");
				fileMstBuff.append(" VALUES ");
				fileMstBuff.append(" ( ");
				fileMstBuff.append(" 	?, ?, sysdate, sysdate, ?, 1 ,? ");	    	
				fileMstBuff.append(" ) ");
				
				for(int i=0; i < fileList.size(); i++){
					
					
					HashMap fileMap = (HashMap)fileList.get(i);
				
					index = 1;					
					pstmt = con.prepareStatement(fileMstBuff.toString());						
					pstmt.setString(index++,  fileMap.get("orgFileNm").toString() );
					pstmt.setString(index++,  fileMap.get("saveFileNm").toString() );
					pstmt.setString(index++,  fileMap.get("filePath").toString() );
					pstmt.setInt(index++,file_nid);
					
					pstmt.executeUpdate();	
					
					
					
					if(pstmt2 != null){
						pstmt2 = null;
					}
					
					articleFileBuff.setLength(0);
					articleFileBuff.append(" INSERT INTO ARTICLE_FILE ");
					articleFileBuff.append(" ( ");
					articleFileBuff.append(" 	ARTICLE_NID, FILE_NID, REG_DATE, MOD_DATE, STATUS_NO ");	    	
					articleFileBuff.append(" ) ");
					articleFileBuff.append(" VALUES ");
					articleFileBuff.append(" ( ");
					articleFileBuff.append(" 	?, ?, sysdate, sysdate, 1 ");	    	
					articleFileBuff.append(" ) ");
					
					pstmt2 = con.prepareStatement(articleFileBuff.toString());
					pstmt2.setInt(1, article_nid);
					pstmt2.setInt(2, file_nid);
					pstmt2.executeUpdate();			
				}	
			}else if(dataMap.get("old_nid_filex1")!=null && !"".equals(dataMap.get("old_nid_filex1").toString())){
				/**
				 * 수정할 때
				 */
				fileMstBuff.append(" UPDATE FILE_MST ");
				fileMstBuff.append(" SET ");
				fileMstBuff.append(" 	ORG_FILENM = ?, SAVE_FILENM = ?, MOD_DATE=sysdate ,");
				fileMstBuff.append(" 	FILE_PATH = ? ,STATUS_NO = 1 ");	    	
				fileMstBuff.append(" WHERE FILE_NID = ? ");
				 
				if (fileList.size() > 0) {
					for(int i=0; i<fileList.size(); i++){ 
						HashMap hashMap=(HashMap)fileList.get(i);
						
						System.out.println("hashMap file==>"+hashMap.toString());
						
						pstmt2 = con.prepareStatement(fileMstBuff.toString());
						pstmt2.setString(1, hashMap.get("orgFileNm").toString());
						pstmt2.setString(2, hashMap.get("saveFileNm").toString());
						pstmt2.setString(3, hashMap.get("filePath").toString());
						pstmt2.setString(4, hashMap.get("file_nid").toString());
						
						file_update_result  = pstmt2.executeUpdate();
						
						System.out.println("file_update_result==>"+file_update_result);
						
					}
				}
			}
			
			if(dataMap.get("old_nid_filex2")==null || "".equals(dataMap.get("old_nid_filex2").toString())){
				
				stringBuffer.setLength(0);
				stringBuffer.append(" SELECT NVL(MAX(FILE_NID), 1) AS FILE_NID FROM FILE_MST ");			
				
				pstmt2 = con.prepareStatement(stringBuffer.toString());
				rs = pstmt2.executeQuery();
				
				if(rs.next()){
					file_nid = rs.getInt("FILE_NID");
				}
				fileMstBuff.setLength(0);
				fileMstBuff.append(" INSERT INTO FILE_MST ");
				fileMstBuff.append(" ( ");
				fileMstBuff.append(" 	ORG_FILENM,SAVE_FILENM,REG_DATE,MOD_DATE,FILE_PATH,STATUS_NO ,FILE_NID");	    	
				fileMstBuff.append(" ) ");
				fileMstBuff.append(" VALUES ");
				fileMstBuff.append(" ( ");
				fileMstBuff.append(" 	?, ?, sysdate, sysdate, ?, 1 ,?");	    	
				fileMstBuff.append(" ) ");
				
				for(int i=0; i < fileList2.size(); i++){
					
				
					
					HashMap fileMap = (HashMap)fileList2.get(i);
				System.out.println("===================================================> 3333"+fileMap.toString());
					index = 1;					
					pstmt = con.prepareStatement(fileMstBuff.toString());						
					pstmt.setString(index++, EtcUtil.strBlockSpecialTags(fileMap.get("orgFileNm").toString(), "8859_1"));
					pstmt.setString(index++, EtcUtil.strBlockSpecialTags(fileMap.get("saveFileNm").toString(), "8859_1"));
					pstmt.setString(index++, EtcUtil.strBlockSpecialTags(fileMap.get("filePath").toString(), "8859_1"));					
					pstmt.setInt(index++,file_nid);
					
					pstmt.executeUpdate();	
					
					
					
					if(pstmt2 != null){
						pstmt2 = null;
					}
					
					articleFileBuff.setLength(0);
					articleFileBuff.append(" INSERT INTO ARTICLE_FILE ");
					articleFileBuff.append(" ( ");
					articleFileBuff.append(" 	ARTICLE_NID, FILE_NID, REG_DATE, MOD_DATE, STATUS_NO ");	    	
					articleFileBuff.append(" ) ");
					articleFileBuff.append(" VALUES ");
					articleFileBuff.append(" ( ");
					articleFileBuff.append(" 	?, ?, sysdate, sysdate, 1 ");	    	
					articleFileBuff.append(" ) ");
					
					pstmt2 = con.prepareStatement(articleFileBuff.toString());
					pstmt2.setInt(1, article_nid);
					pstmt2.setInt(2, file_nid);
					pstmt2.executeUpdate();			
				}	
			}else if(dataMap.get("old_nid_filex2")!=null && !"".equals(dataMap.get("old_nid_filex2").toString())){
				/**
				 * 수정할 때
				 */	
				fileMstBuff.setLength(0);
				fileMstBuff.append(" UPDATE FILE_MST ");
				fileMstBuff.append(" SET ");
				fileMstBuff.append(" 	ORG_FILENM = ?, SAVE_FILENM = ?, MOD_DATE=sysdate ,");
				fileMstBuff.append(" 	FILE_PATH = ? ,STATUS_NO = 1 ");	    	
				fileMstBuff.append(" WHERE FILE_NID = ? ");
				 
				if (fileList2.size() > 0) {
					
					for(int i=0; i<fileList2.size(); i++){ 
						
						HashMap hashMap=(HashMap)fileList2.get(i);
						
						System.out.println("hashMap file==>"+hashMap.toString());
						
						pstmt2 = con.prepareStatement(fileMstBuff.toString());
						pstmt2.setString(1, hashMap.get("orgFileNm").toString());
						pstmt2.setString(2, hashMap.get("saveFileNm").toString());
						pstmt2.setString(3, hashMap.get("filePath").toString());
						pstmt2.setString(4, hashMap.get("file_nid").toString());
						
						file_update_result  = pstmt2.executeUpdate();
						
						System.out.println("file_update_result==>"+file_update_result);
						
					}
				}
			}
			
			
			
			
		 
			/*********************************************** 이메일[start] **********************************/
			System.out.println("Email :: "+userMap.get("EMAIL").toString());
			System.out.println("subject :: ");
			System.out.println("contents :: ");
			
			
			String mailTo = userMap.get("EMAIL").toString();			
			String mailFrom = "root@www.knoc.co.kr";
			String title = "인사청탁알선신문고에 의견이 등록되었습니다. ["+DateUtil.getFormattedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"]";
			String body = "제목 : " + dataMap.get("subject").toString() + " <br /><br /> " + dataMap.get("contents").toString().replaceAll("\r\n", "</br>"); 
			String mailServer = "localhost";
			String toName = "관리자";
			String fromName = "root";
			
			MailBean Mailb = new MailBean(mailTo, mailFrom, title, body, "", toName, fromName, mailServer);
			Mailb.start();//start()에서 run()으로 수정 2011-08-02
			/*********************************************** 이메일[end] **********************************/
			
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true);
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close(); 
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	public void fileUpdate(){
		
	}

	/**
	 * 글수정2
	 * @param datamap
	 * @param fileList
	 * @return
	 */
	public int updateArticle2(HashMap dataMap, ArrayList fileList, HashMap userMap) throws Exception {
		
		Connection con = null; 
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		 
		int resultCnt = -1;
		
		int article_nid =0 ;
		int file_nid = 0;
		 
		int file_count = 0;
		int file_update_result=0;
		
		StringBuffer stringBuffer = new StringBuffer();		
		StringBuffer articleMstBuff = new StringBuffer();
		StringBuffer fileMstBuff = new StringBuffer();
		StringBuffer articleFileBuff = new StringBuffer();
		 
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	if(dataMap.get("article_nid")!=null){
	    		article_nid=Integer.parseInt(dataMap.get("article_nid").toString());
	    	}
	    	articleMstBuff.append(" UPDATE ARTICLE_MST ");
	    	articleMstBuff.append(" SET ");
	    	articleMstBuff.append(" 	CONTENTS = ?, ");
	    	articleMstBuff.append(" 	SUBJECT = ?, ");
	    	articleMstBuff.append(" 	STATUS_NO = ?, ");
	    	articleMstBuff.append(" 	MOD_DATE = sysdate, ");
	    	articleMstBuff.append(" 	OBM_TYPE = ?, ");
	    	articleMstBuff.append(" 	ARTICLE_PWD = ?, ");
	    	articleMstBuff.append(" 	USER_NM = ? ");
	    	articleMstBuff.append(" WHERE ARTICLE_NID= ?");
			
			pstmt = con.prepareStatement(articleMstBuff.toString());					
			pstmt.setString(1, dataMap.get("contents").toString());
			pstmt.setString(2, dataMap.get("subject").toString());
			pstmt.setString(3, dataMap.get("status_no").toString());
			pstmt.setString(4, dataMap.get("obm_type").toString());
			pstmt.setString(5, dataMap.get("article_pwd").toString());
			pstmt.setString(6, dataMap.get("user_nm").toString());
			pstmt.setString(7, dataMap.get("article_nid").toString());
			resultCnt = pstmt.executeUpdate();	
			
			
		
			if(pstmt != null){
				pstmt = null;
			}
			if(pstmt2 != null){
				pstmt2 = null;
			}
			
			fileMstBuff.append(" INSERT INTO FILE_MST ");
			fileMstBuff.append(" ( ");
			fileMstBuff.append(" 	ORG_FILENM,SAVE_FILENM,REG_DATE,MOD_DATE,FILE_PATH,STATUS_NO,FILE_NID ");	    	
			fileMstBuff.append(" ) ");
			fileMstBuff.append(" VALUES ");
			fileMstBuff.append(" ( ");
			fileMstBuff.append(" 	?, ?, sysdate, sysdate, ?, 1, ? ");	    	
			fileMstBuff.append(" ) ");
			
			for(int i=0; i<fileList.size(); i++){
				
				stringBuffer.setLength(0);
				HashMap fileMap = (HashMap)fileList.get(i);
			
				stringBuffer.append(" SELECT NVL(MAX(FILE_NID), 1)+1 AS FILE_NID FROM FILE_MST ");			
				
				pstmt2 = con.prepareStatement(stringBuffer.toString());
				rs = pstmt2.executeQuery();
				
				if(rs.next()){
					file_nid = rs.getInt("FILE_NID");
				}
				
				int index = 1;					
				pstmt = con.prepareStatement(fileMstBuff.toString());						
				pstmt.setString(index++,  fileMap.get("orgFileNm").toString() );
				pstmt.setString(index++,  fileMap.get("saveFileNm").toString() );
				pstmt.setString(index++,  fileMap.get("filePath").toString());
				pstmt.setInt(index++, file_nid);
				
				pstmt.executeUpdate();	
				
				if(pstmt2 != null){
					pstmt2 = null;
				}
				
				articleFileBuff.setLength(0);
				articleFileBuff.append(" INSERT INTO ARTICLE_FILE ");
				articleFileBuff.append(" ( ");
				articleFileBuff.append(" 	ARTICLE_NID, FILE_NID, REG_DATE, MOD_DATE, STATUS_NO ");	    	
				articleFileBuff.append(" ) ");
				articleFileBuff.append(" VALUES ");
				articleFileBuff.append(" ( ");
				articleFileBuff.append(" 	?, ?, sysdate, sysdate, 1 ");	    	
				articleFileBuff.append(" ) ");
				
				pstmt2 = con.prepareStatement(articleFileBuff.toString());
				pstmt2.setInt(1, article_nid);
				pstmt2.setInt(2, file_nid);
				pstmt2.executeUpdate();			
			}	
		 
			/*********************************************** 이메일[start] **********************************/
			System.out.println("Email :: "+userMap.get("EMAIL").toString());
			System.out.println("subject :: ");
			System.out.println("contents :: ");
			
			
			String mailTo = userMap.get("EMAIL").toString();			
			String mailFrom = "root@www.knoc.co.kr";
			String title = "인사청탁알선신문고에 의견이 등록되었습니다. ["+DateUtil.getFormattedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"]";
			String body = "제목 : " + dataMap.get("subject").toString() + " <br /><br /> " + dataMap.get("contents").toString().replaceAll("\r\n", "</br>"); 
			String mailServer = "localhost";
			String toName = "관리자";
			String fromName = "root";
			
			MailBean Mailb = new MailBean(mailTo, mailFrom, title, body, "", toName, fromName, mailServer);
			Mailb.start();//start()에서 run()으로 수정 2011-08-02
			/*********************************************** 이메일[end] **********************************/
			
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true);
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close(); 
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	
	/**
	 * 코멘트 글 정보 select
	 * @param articleNid
	 * @return
	 * @throws Exception
	 */
	public ArrayList getArticleCommentInfo(int articleNid) throws Exception{
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		ArrayList list = new ArrayList();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	ARTICLE_COMMENT_SEQ, ARTICLE_NID, COMMENT_COMTENTS, LAST_MODIFIER, LAST_UPDATE_DATE ";
			sql = sql+ "   FROM ARTICLE_COMMENT  WHERE ARTICLE_NID = ? ";
			sql = sql+ "   AND STATUS_NO = 1 ";
			sql = sql+ "   ORDER BY ARTICLE_COMMENT_SEQ ASC ";
			
			
			prestmt = con.prepareStatement(sql);
			int index=1;
			
			prestmt.setInt(index++, articleNid);
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();
				hash.put("ARTICLE_COMMENT_SEQ", rs.getInt("ARTICLE_COMMENT_SEQ"));
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("COMMENT_COMTENTS", rs.getString("COMMENT_COMTENTS"));
				hash.put("LAST_MODIFIER", rs.getString("LAST_MODIFIER"));
				hash.put("LAST_UPDATE_DATE", rs.getString("LAST_UPDATE_DATE"));
				list.add(hash);
				
				
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
		return list;
	}
	
	
	/**
	 * 코멘트 등록
	 * @param article_nid
	 * @param article_comment_seq
	 * @return
	 */
	public int insertCommentArticle(HashMap requestData) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int resultCnt = -1;
		
		StringBuffer articleMstBuff = new StringBuffer();
		StringBuffer stringBuffer = new StringBuffer();
		int article_comment_seq=0;
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	stringBuffer.append(" SELECT NVL(MAX(ARTICLE_COMMENT_SEQ), 1)+1 AS ARTICLE_COMMENT_SEQ FROM ARTICLE_COMMENT ");
			
			pstmt = con.prepareStatement(stringBuffer.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				article_comment_seq = rs.getInt("ARTICLE_COMMENT_SEQ");
			}
	    	
	    	articleMstBuff.append(" INSERT INTO ARTICLE_COMMENT ");
	    	articleMstBuff.append(" ( ");
	    	articleMstBuff.append(" 	ARTICLE_NID , ");
	    	articleMstBuff.append(" 	COMMENT_COMTENTS,  LAST_MODIFIER , ");
	    	articleMstBuff.append(" 	STATUS_NO ,  LAST_UPDATE_DATE ,ARTICLE_COMMENT_SEQ ");
	    	articleMstBuff.append(" ) ");		
	    	articleMstBuff.append(" VALUES ");
	    	articleMstBuff.append(" ( ");
	    	articleMstBuff.append(" 	? , ?, ? , 1, sysdate ,? ");
	    	articleMstBuff.append(" ) ");
	    	
			
			pstmt = con.prepareStatement(articleMstBuff.toString());					
			pstmt.setString(1, requestData.get("article_nid").toString());
			pstmt.setString(2, requestData.get("comment_comtents").toString());		
			pstmt.setString(3, requestData.get("last_modifier").toString());
			pstmt.setInt(4, article_comment_seq);
			resultCnt = pstmt.executeUpdate();	
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true); 
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close();				
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	/**
	 * 코멘트 글 수정
	 * @param requestData
	 * @return
	 * @throws Exception
	 */
	public int modifyCommentArticle(HashMap requestData) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int resultCnt = -1;
		
		StringBuffer articleMstBuff = new StringBuffer();
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	
	    	
	    	articleMstBuff.append(" UPDATE ARTICLE_COMMENT ");
	    	articleMstBuff.append(" SET ");
	    	articleMstBuff.append(" 	COMMENT_COMTENTS=?,  LAST_MODIFIER=? , ");
	    	articleMstBuff.append(" 	LAST_UPDATE_DATE=sysdate ");
	    	articleMstBuff.append(" WHERE ARTICLE_COMMENT_SEQ=? ");
	    	articleMstBuff.append(" AND ARTICLE_NID=? ");
	    	
			
			pstmt = con.prepareStatement(articleMstBuff.toString());					
			pstmt.setString(1, requestData.get("comment_comtents").toString());
			pstmt.setString(2, requestData.get("last_modifier").toString());		
			pstmt.setString(3, requestData.get("article_comment_seq").toString());
			pstmt.setString(4, requestData.get("article_nid").toString());
			resultCnt = pstmt.executeUpdate();	
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true); 
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close();				
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	
	/**
	 * 코멘트 글 삭제
	 * @param requestData
	 * @return
	 * @throws Exception
	 */
	public int deleteCommentArticle(HashMap requestData) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int resultCnt = -1;
		
		StringBuffer articleMstBuff = new StringBuffer();
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	
	    	
	    	articleMstBuff.append(" UPDATE ARTICLE_COMMENT ");
	    	articleMstBuff.append(" SET ");
	    	articleMstBuff.append(" 	STATUS_NO = '-1' ");
	    	articleMstBuff.append(" WHERE ARTICLE_COMMENT_SEQ=? ");
	    	articleMstBuff.append(" AND ARTICLE_NID=? ");
	    	
			
			pstmt = con.prepareStatement(articleMstBuff.toString());							
			pstmt.setString(1, requestData.get("article_comment_seq").toString());
			pstmt.setString(2, requestData.get("article_nid").toString());
			resultCnt = pstmt.executeUpdate();	
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true); 
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close();				
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	
	
	/**
	 * 
	 * 옴부즈 맨 글 등록 !!!
	 */
	
	/**
	 * 글등록
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public int insertObmArticle(HashMap dataMap, ArrayList fileList, HashMap userMap) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int resultCnt = -1;
		
		int article_nid = 0;
		int file_nid = 0;
		
		StringBuffer stringBuffer = new StringBuffer();		
		StringBuffer articleMstBuff = new StringBuffer();
		StringBuffer fileMstBuff = new StringBuffer();
		StringBuffer articleFileBuff = new StringBuffer();
		
		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	

			stringBuffer.append("SELECT NVL(MAX(ARTICLE_NID), 0)+1 as ARTICLE_NID FROM ARTICLE_MST");
			
			pstmt = con.prepareStatement(stringBuffer.toString());
			rs = pstmt.executeQuery();
			if(rs.next()){
				article_nid = rs.getInt("ARTICLE_NID");
			}
			
	    	
	    	articleMstBuff.append(" INSERT INTO ARTICLE_MST ");
	    	articleMstBuff.append(" ( ");
	    	articleMstBuff.append(" 	P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ");
	    	articleMstBuff.append(" 	ROOT_ARTICLE_NO, CONTENTS, SUBJECT, STATUS_NO, REG_DATE, ");
	    	articleMstBuff.append(" 	MOD_DATE, TYPE, ARTICLE_PWD, OBM_TYPE, WRITE_TYPE ,ARTICLE_NID ");
	    	articleMstBuff.append(" ) ");
	    	articleMstBuff.append(" VALUES ");
	    	articleMstBuff.append(" ( ");
	    	articleMstBuff.append(" 	0, 0, 0, ");
	    	articleMstBuff.append(" 	0, ?, ?, ?, sysdate, ");
	    	articleMstBuff.append(" 	sysdate, ?, ? , ?, 2 , ? ");
	    	articleMstBuff.append(" ) ");
	    	
			int index = 1;
			
			
			pstmt = con.prepareStatement(articleMstBuff.toString());					
			pstmt.setString(1, dataMap.get("contents").toString());
			pstmt.setString(2, dataMap.get("subject").toString());
			pstmt.setString(3, dataMap.get("status_no").toString());
			pstmt.setString(4, dataMap.get("type").toString());
			pstmt.setString(5, dataMap.get("article_pwd").toString());		
			pstmt.setString(6, dataMap.get("obm_type").toString());
			pstmt.setInt(7,article_nid);
			resultCnt = pstmt.executeUpdate();	
			
			if(pstmt != null){
				pstmt = null;
			}
			
			if(pstmt != null){
				pstmt = null;
			}
			if(rs != null){
				rs = null;
			}
			
			
			fileMstBuff.append(" INSERT INTO FILE_MST ");
			fileMstBuff.append(" ( ");
			fileMstBuff.append(" 	ORG_FILENM,SAVE_FILENM,REG_DATE,MOD_DATE,FILE_PATH,STATUS_NO ");	    	
			fileMstBuff.append(" ) ");
			fileMstBuff.append(" VALUES ");
			fileMstBuff.append(" ( ");
			fileMstBuff.append(" 	?, ?, sysdate, sysdate, ?, 1 ");	    	
			fileMstBuff.append(" ) ");
			
			for(int i=0; i<fileList.size(); i++){
				
				stringBuffer.setLength(0);
				HashMap fileMap = (HashMap)fileList.get(i);
			
				index = 1;					
				pstmt = con.prepareStatement(fileMstBuff.toString());						
				pstmt.setString(index++,  fileMap.get("orgFileNm").toString() );
				pstmt.setString(index++,  fileMap.get("saveFileNm").toString() );
				pstmt.setString(index++,  fileMap.get("filePath").toString());					
				
				pstmt.executeUpdate();	
				stringBuffer.append(" SELECT NVL(MAX(FILE_NID), 0)+1 AS FILE_NID FROM FILE_MST ");			
				
				pstmt2 = con.prepareStatement(stringBuffer.toString());
				rs = pstmt2.executeQuery();
				if(rs.next()){
					file_nid = rs.getInt("FILE_NID");
				}
				
				if(pstmt2 != null){
					pstmt2 = null;
				}
				
				articleFileBuff.setLength(0);
				articleFileBuff.append(" INSERT INTO ARTICLE_FILE ");
				articleFileBuff.append(" ( ");
				articleFileBuff.append(" 	ARTICLE_NID, FILE_NID, REG_DATE, MOD_DATE, STATUS_NO ");	    	
				articleFileBuff.append(" ) ");
				articleFileBuff.append(" VALUES ");
				articleFileBuff.append(" ( ");
				articleFileBuff.append(" 	?, ?, sysdate, sysdate, 1 ");	    	
				articleFileBuff.append(" ) ");
				
				pstmt2 = con.prepareStatement(articleFileBuff.toString());
				pstmt2.setInt(1, article_nid);
				pstmt2.setInt(2, file_nid);
				pstmt2.executeUpdate();
			}			
			
			/*********************************************** 이메일[start] **********************************/
			System.out.println("Email :: "+userMap.get("EMAIL").toString());
			System.out.println("subject :: ");
			System.out.println("contents :: ");
			
			
			String mailTo = userMap.get("EMAIL").toString();			
			String mailFrom = "root@www.knoc.co.kr";
			String title = "청렴 옴부즈맨 신고센터에 글이 등록되었습니다. ["+DateUtil.getFormattedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"]";
			String body = "제목 : " + dataMap.get("subject").toString() + " <br /><br /> " + dataMap.get("contents").toString().replaceAll("\r\n", "</br>");
			String mailServer = "localhost";
			String toName = "관리자";
			String fromName = "root";
			
			MailBean Mailb = new MailBean(mailTo, mailFrom, title, body, "", toName, fromName, mailServer);
			Mailb.start();//start()에서 run()으로 수정 2011-08-02
			/*********************************************** 이메일[end] **********************************/
			con.commit();
		}catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true);
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (pstmt2 != null) pstmt2.close();				
				if (rs != null) rs.close();
				
			} catch (Exception e) {
			}
		}
		return resultCnt;
	}
	
	/**
	 * 옴부즈맨 글등록 리스트(페이지)
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList getArticleObmUserPageList(int page, int pageSize, HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = "  SELECT * FROM ( ";
			sql = sql+ " SELECT ";
			sql = sql+ "   	ARTICLE_NID, P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ROOT_ARTICLE_NO, ROW_NUMBER() OVER(ORDER BY ARTICLE_NID desc) AS PAGE_NO , ";
			sql = sql+ "   	CONTENTS, SUBJECT, STATUS_NO,TO_CHAR(MOD_DATE,'YYYY-MM-DD')   AS MOD_DATE, ";
			sql = sql+ "   	(SELECT COUNT(*) FROM ARTICLE_FILE WHERE ARTICLE_MST.ARTICLE_NID = ARTICLE_FILE.ARTICLE_NID AND ARTICLE_FILE.STATUS_NO > -1) FILE_COUNT, ";
			sql = sql+ "   	(SELECT COUNT(*) FROM ARTICLE_COMMENT WHERE ARTICLE_MST.ARTICLE_NID = ARTICLE_COMMENT.ARTICLE_NID AND ARTICLE_COMMENT.STATUS_NO > -1) COMMENT_COUNT, ";
			//sql = sql+ "   	CASE DATE_FORMAT(REG_DATE, '%Y-%m-%d') ";
			//sql = sql+ "   		WHEN DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN DATE_FORMAT(REG_DATE, '%Y-%m-%d %H:%i')  ";
			//sql = sql+ "   		ELSE DATE_FORMAT(REG_DATE, '%Y-%m-%d')  ";
			sql = sql+ "   	CASE TO_CHAR(REG_DATE,'YYYY-MM-DD')   ";
			sql = sql+ "   		WHEN  TO_CHAR(SYSDATE,'YYYY-MM-DD')   THEN TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI')  ";
			sql = sql+ "   		ELSE TO_CHAR(REG_DATE,'YYYY-MM-DD') ";
			sql = sql+ "   		END AS REG_DATE,  ";
			sql = sql+ "   	TYPE, ARTICLE_PWD ";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 AND  ARTICLE_PWD = ? ";
			sql = sql+ "   AND WRITE_TYPE = '2' ";
			sql = sql+ "   ORDER BY REG_DATE DESC  ";		
			sql = sql+ " )A ";
			sql = sql+ "   WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ";
			
						
			prestmt = con.prepareStatement(sql);
			int index=1;
			prestmt.setString(index++, searchMap.get("article_pwd").toString());
			prestmt.setInt(index++,(page-1) * pageSize);
			prestmt.setInt(index++,page*pageSize );
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("P_ARTICLE_NID", rs.getInt("P_ARTICLE_NID"));
				hash.put("ORDER_NO", rs.getInt("ORDER_NO"));
				hash.put("LEVEL_NO", rs.getInt("LEVEL_NO"));
				hash.put("ROOT_ARTICLE_NO", rs.getInt("ROOT_ARTICLE_NO"));				
				
				hash.put("CONTENTS", rs.getString("CONTENTS"));
				hash.put("SUBJECT", rs.getString("SUBJECT"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				hash.put("COMMENT_COUNT", rs.getInt("COMMENT_COUNT"));
				hash.put("TYPE", rs.getInt("TYPE"));
				hash.put("FILE_COUNT", rs.getInt("FILE_COUNT"));
				
				list.add(hash);
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
		return list;
	}
	
	/**
	 * 옴부즈맨 해당 글정보 읽어오기
	 * @param articleNid
	 * @return
	 * @throws Exception
	 */
	public HashMap getObmArticleInfo(int articleNid) throws Exception{
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		HashMap hash = new HashMap();	
			
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	ARTICLE_NID, P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ROOT_ARTICLE_NO, ";
			sql = sql+ "   	CONTENTS, SUBJECT, STATUS_NO,  TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI')  AS REG_DATE, MOD_DATE, ";
			sql = sql+ "   	TYPE, ARTICLE_PWD, OBM_TYPE";
			sql = sql+ "   FROM ARTICLE_MST  WHERE ARTICLE_NID = ? ";
			
			prestmt = con.prepareStatement(sql);
			int index=1;
			
			prestmt.setInt(index++, articleNid);
			
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("P_ARTICLE_NID", rs.getInt("P_ARTICLE_NID"));
				hash.put("ORDER_NO", rs.getInt("ORDER_NO"));
				hash.put("LEVEL_NO", rs.getInt("LEVEL_NO"));
				hash.put("ROOT_ARTICLE_NO", rs.getInt("ROOT_ARTICLE_NO"));				
				
				hash.put("CONTENTS", rs.getString("CONTENTS"));
				hash.put("SUBJECT", rs.getString("SUBJECT"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				
				hash.put("TYPE", rs.getInt("TYPE"));
				hash.put("ARTICLE_PWD", rs.getString("ARTICLE_PWD"));
				hash.put("OBM_TYPE", rs.getString("OBM_TYPE"));
				
				
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
		return hash;
	}
	
	
	/**
	 * 옴부즈 맨 (user)게시글 총 갯수
	 * @return
	 */
	public int getArticleObmUserCount(HashMap searchMap){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int resultCount = 0;
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	COUNT(*) CNT";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 AND  ARTICLE_PWD = ? ";
			sql = sql+ "   AND WRITE_TYPE= 2 ";
				
						
			prestmt = con.prepareStatement(sql);
			int index=1;
			prestmt.setString(index++, searchMap.get("article_pwd").toString());					
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("CNT");
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
		return resultCount;
	}
	
	/**
	 * 옴부즈 글등록 리스트(master 페이지)
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList getArticleObmPageList(int page, int pageSize, HashMap searchMap, String obm_type){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		ArrayList list = new ArrayList();
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT * FROM (  ";
			sql = sql+ " SELECT ";
			sql = sql+ "   	ARTICLE_NID, P_ARTICLE_NID, ORDER_NO, LEVEL_NO, ROOT_ARTICLE_NO, ";
			sql = sql+ "   	CONTENTS, SUBJECT, STATUS_NO, TO_CHAR(MOD_DATE,'YYYY-MM-DD')    AS MOD_DATE,ROW_NUMBER() OVER(ORDER BY ARTICLE_NID desc) AS PAGE_NO , ";
			sql = sql+ "   	(SELECT COUNT(*) FROM ARTICLE_FILE WHERE ARTICLE_MST.ARTICLE_NID = ARTICLE_FILE.ARTICLE_NID AND ARTICLE_FILE.STATUS_NO > -1) FILE_COUNT, ";
			sql = sql+ "   	(SELECT COUNT(*) FROM ARTICLE_COMMENT WHERE ARTICLE_MST.ARTICLE_NID = ARTICLE_COMMENT.ARTICLE_NID AND ARTICLE_COMMENT.STATUS_NO > -1) COMMENT_COUNT, ";
			//sql = sql+ "   	CASE DATE_FORMAT(REG_DATE, '%Y-%m-%d') ";
			//sql = sql+ "   		WHEN DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN DATE_FORMAT(REG_DATE, '%Y-%m-%d %H:%i')  ";
			//sql = sql+ "   		ELSE DATE_FORMAT(REG_DATE, '%Y-%m-%d')  ";
			sql = sql+ "   	CASE TO_CHAR(REG_DATE,'YYYY-MM-DD')   ";
			sql = sql+ "   		WHEN  TO_CHAR(SYSDATE,'YYYY-MM-DD')   THEN TO_CHAR(REG_DATE, 'YYYY.MM.DD HH24:MI')  ";
			sql = sql+ "   		ELSE TO_CHAR(REG_DATE,'YYYY-MM-DD') ";
			sql = sql+ "   		END AS REG_DATE,  ";
			sql = sql+ "   	TYPE ";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 ";
			sql = sql+ "   AND WRITE_TYPE = 2 ";
			sql = sql+ "   AND OBM_TYPE = ? ";
			
			
			if(searchMap.get("field") != null){				
				if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && !searchMap.get("field").equals("all")){
					sql = sql+ "   AND "+searchMap.get("field")+" LIKE '%"+searchMap.get("searchValue")+"%'  ";
				}else if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && searchMap.get("field").equals("all")){
					sql = sql+ "   AND (SUBJECT LIKE '%"+searchMap.get("searchValue")+"%'  OR CONTENTS LIKE '%"+searchMap.get("searchValue")+"%' ) ";
				}
			}
			
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0){
					sql = sql+ "   AND type = ? ";
				}
			}
			sql = sql+ "   ORDER BY REG_DATE DESC   ";		
			sql = sql+ " )A ";
			sql = sql+ "   WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ";
			
						
			prestmt = con.prepareStatement(sql);
			int index=1;
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0 ){					
					prestmt.setInt(index++, etcutil.checkNullInt(searchMap.get("type").toString(), 0) );
				}
			}
			prestmt.setString(1 , obm_type);
			prestmt.setInt(2,(page-1) * pageSize);
			prestmt.setInt(3,page*pageSize );
			
			rs = prestmt.executeQuery();
			
			while(rs.next()){
				HashMap hash = new HashMap();	
				hash.put("ARTICLE_NID", rs.getInt("ARTICLE_NID"));
				hash.put("P_ARTICLE_NID", rs.getInt("P_ARTICLE_NID"));
				hash.put("ORDER_NO", rs.getInt("ORDER_NO"));
				hash.put("LEVEL_NO", rs.getInt("LEVEL_NO"));
				hash.put("ROOT_ARTICLE_NO", rs.getInt("ROOT_ARTICLE_NO"));				
				
				hash.put("CONTENTS", rs.getString("CONTENTS"));
				hash.put("SUBJECT", rs.getString("SUBJECT"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				hash.put("COMMENT_COUNT", rs.getInt("COMMENT_COUNT"));
				hash.put("TYPE", rs.getInt("TYPE"));
				hash.put("FILE_COUNT", rs.getInt("FILE_COUNT"));
				
				list.add(hash);
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
		return list;
	}
	
	
	/**
	 * 옴부즈맨 master 게시글 총 갯수
	 * @return
	 */
	public int getArticleObmCount(HashMap searchMap, String obm_type){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		int resultCount = 0;
		kr.co.knoc.util.EtcUtil etcutil = new EtcUtil();
		try {
			con = DBUtil.getConnection();			
			
			String sql = " SELECT ";
			sql = sql+ "   	COUNT(*) CNT";
			sql = sql+ "   FROM ARTICLE_MST  WHERE 1=1 ";
			sql = sql+ "   AND STATUS_NO = 1 ";
			sql = sql+ "   AND WRITE_TYPE = 2 ";
			sql = sql+ "   AND OBM_TYPE = ? ";
			
			
			if(searchMap.get("field") != null){
				
				if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && !searchMap.get("field").equals("all")){
					sql = sql+ "   AND "+searchMap.get("field")+" LIKE '%"+searchMap.get("searchValue")+"%'  ";
				}else if(!searchMap.get("searchValue").equals("") && !searchMap.get("field").equals("") && searchMap.get("field").equals("all")){
					sql = sql+ "   AND (SUBJECT LIKE '%"+searchMap.get("searchValue")+"%'  OR CONTENTS LIKE '%"+searchMap.get("searchValue")+"%' ) ";
				}
			}
					
			if(searchMap.get("type") != null){				
				if(etcutil.checkNullInt(searchMap.get("type").toString(), 0) > 0){
					sql = sql+ "   AND type = ? ";
				}
			}
			
						
			prestmt = con.prepareStatement(sql);
			
			
			prestmt.setString(1, obm_type);
			rs = prestmt.executeQuery();
			
			if(rs.next()){
				resultCount = rs.getInt("CNT");
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
		return resultCount;
	}
}
