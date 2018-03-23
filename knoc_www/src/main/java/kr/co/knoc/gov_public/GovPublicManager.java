package kr.co.knoc.gov_public;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.knoc.jdbc.DBUtil;

public class GovPublicManager {

	/* Á¤º¸°ø°³ °Ô½ÃÆÇ Á¶È¸¼ö Áõ°¡ */
	public void updateHitCount(String govPublicId, HttpServletRequest request) throws SQLException{		

		HttpSession session = request.getSession();
		
			
		Connection con = DBUtil.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		boolean result = false;		
			
		try {
			con.setAutoCommit(false);
			
			StringBuffer sb = new StringBuffer();
			
			sb.append(" UPDATE GOV_PUBLIC SET ");
			sb.append(" 	HIT = HIT+1 ");
			sb.append(" WHERE ");
			sb.append(" 	GOV_PUBLIC_NID = ? ");
						
			pstmt = con.prepareStatement(sb.toString());			
			pstmt.setString(1, govPublicId);
			pstmt.executeUpdate();			
			session.setAttribute("govPublicId", govPublicId);
			con.commit();
			
		}catch(Exception e){
			con.rollback();
		    result = false;
		    e.printStackTrace();
		}finally{
			try{
				con.setAutoCommit(true); 
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}

	}
	
	/**
	 *
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList<HashMap<String, String>> getHotRank(){
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, String>> govPublicList = new ArrayList<HashMap<String, String>>(); 
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("SELECT * FROM ( ");
		sb.append("	SELECT TB.*, ROWNUM AS RNUM FROM (");
		sb.append("  SELECT A.TITLE, A.GOV_PUBLIC_KIND_NM, A.GOV_PUBLIC_KIND, B.GOV_PUBLIC_NID, B.CNT_DOWN, RANK() OVER(ORDER BY CNT_DOWN DESC) AS RANK ");
		sb.append("	 FROM GOV_PUBLIC A LEFT OUTER JOIN (");
		sb.append("   SELECT A.GOV_PUBLIC_NID, NVL(SUM(B.CNT_DOWN),0) AS CNT_DOWN FROM GOV_PUBLIC A ");
		sb.append("   LEFT OUTER JOIN GOV_PUBLIC_FILE B ON A.GOV_PUBLIC_NID = B.GOV_PUBLIC_NID ");
		sb.append("   GROUP BY A.GOV_PUBLIC_NID ORDER BY A.GOV_PUBLIC_NID DESC ");
		sb.append("  ) B ON A.GOV_PUBLIC_NID = B.GOV_PUBLIC_NID ");
		sb.append(" ) TB WHERE TB.RANK <= 3 ");
		sb.append(") B WHERE RNUM <= 3");

		
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());			

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> hashMap = new HashMap<String, String>();
				hashMap.put("GOV_PUBLIC_NID", rs.getString("GOV_PUBLIC_NID"));
				hashMap.put("GOV_PUBLIC_KIND", rs.getString("GOV_PUBLIC_KIND"));
				hashMap.put("GOV_PUBLIC_KIND_NM", rs.getString("GOV_PUBLIC_KIND_NM"));
				hashMap.put("TITLE", rs.getString("TITLE"));
				hashMap.put("CNT_DOWN", rs.getString("CNT_DOWN"));
				hashMap.put("RNUM", rs.getString("RNUM"));
				govPublicList.add(hashMap);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{ if(rs != null) rs.close(); }catch(Exception e){}
			try{ if(pstmt != null) pstmt.close(); }catch(Exception e){}
			try{ if(con != null) con.close();	}catch(Exception e){}
		}
		//System.out.println(sb);
       return govPublicList;
   }	
	
	/**
	 *
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList<HashMap<String, String>> getGovPublicList(String gpk, int page, int pageSize, String search_type, String search_keyword){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		ArrayList<HashMap<String, String>> govPublicList = new ArrayList<HashMap<String, String>>(); 
 		
 		StringBuffer sb = new StringBuffer();
 		
 		sb.append(" SELECT * FROM ( ");
 		sb.append("		SELECT ");
 		sb.append(" 		ROW_NUMBER() OVER(ORDER BY A.GOV_PUBLIC_NID  DESC) AS RNUM, ");
 		sb.append("			A.GOV_PUBLIC_NID, A.GOV_PUBLIC_KIND, A.GOV_PUBLIC_KIND_NM, A.TITLE, ");
 		sb.append(" 		A.DEPARTMENT, A.PUBLIC_TIME, A.PUBLIC_CYCLE, A.PUBLIC_LINK, ");
 		sb.append(" 		B.GOV_PUBLIC_FILE_SEQ, B.ORG_FILE_NM, B.SAVE_FILE_NM, B.FILE_PATH ");
 		sb.append(" 	FROM ");
 		sb.append(" 		GOV_PUBLIC A ");
 		sb.append(" 		LEFT OUTER JOIN GOV_PUBLIC_FILE B ON(A.GOV_PUBLIC_NID = B.GOV_PUBLIC_NID AND B.STATUS_NO = 1) ");
 		sb.append("		WHERE ");
 		sb.append("			A.STATUS_NO = 1 ");
 		if(gpk != null && gpk.length()>0){
 			sb.append("		AND A.GOV_PUBLIC_KIND = ? ");
 		}
 		if(search_type != null && search_type.length()>0 && search_keyword != null && search_keyword.length()>0){
 			if("TITLE".equals(search_type)){
 				sb.append("AND A.TITLE LIKE '%' || ? || '%'");
 			}else if("DEPARTMENT".equals(search_type)){
 				sb.append("AND A.DEPARTMENT LIKE '%' || ? || '%'");
 			}
 		}
 		sb.append(" ) T");
 		sb.append(" WHERE RNUM > ? AND RNUM <= ?");
 		
 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			
			int i = 1;
			if(gpk != null && gpk.length()>0){
				pstmt.setString(i++, gpk);
			}
			if(search_type != null && search_type.length()>0 && search_keyword != null && search_keyword.length()>0
					&& ("TITLE".equals(search_type) || "DEPARTMENT".equals(search_type))){
				pstmt.setString(i++, search_keyword);
			}
			pstmt.setInt(i++, (page-1)*pageSize);
			pstmt.setInt(i++, page*pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> hashMap = new HashMap<String, String>();
				hashMap.put("GOV_PUBLIC_NID", rs.getString("GOV_PUBLIC_NID"));
				hashMap.put("GOV_PUBLIC_KIND", rs.getString("GOV_PUBLIC_KIND"));
				hashMap.put("GOV_PUBLIC_KIND_NM", rs.getString("GOV_PUBLIC_KIND_NM"));
				hashMap.put("TITLE", rs.getString("TITLE"));
				hashMap.put("DEPARTMENT", rs.getString("DEPARTMENT"));
				hashMap.put("PUBLIC_TIME", rs.getString("PUBLIC_TIME"));
				hashMap.put("PUBLIC_CYCLE", rs.getString("PUBLIC_CYCLE"));
				hashMap.put("PUBLIC_LINK", rs.getString("PUBLIC_LINK"));
				hashMap.put("GOV_PUBLIC_FILE_SEQ", rs.getString("GOV_PUBLIC_FILE_SEQ"));
				hashMap.put("ORG_FILE_NM", rs.getString("ORG_FILE_NM"));
				hashMap.put("SAVE_FILE_NM", rs.getString("SAVE_FILE_NM"));
				hashMap.put("FILE_PATH", rs.getString("FILE_PATH"));

				govPublicList.add(hashMap);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{ if(rs != null) rs.close(); }catch(Exception e){}
			try{ if(pstmt != null) pstmt.close(); }catch(Exception e){}
			try{ if(con != null) con.close();	}catch(Exception e){}
		}
		//System.out.println(sb);
        return govPublicList;
    }
	/**
	 * 2015.04.28
	 * ¸®½ºÆ® Å×½ºÆ®
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList<HashMap<String, String>> getGovPublicListTest(String gpk, int page, int pageSize, String search_type, String search_keyword){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		ArrayList<HashMap<String, String>> govPublicList = new ArrayList<HashMap<String, String>>(); 
 		
 		StringBuffer sb = new StringBuffer();
 		
 		sb.append(" SELECT * FROM ( ");
 		sb.append(" 	SELECT ");
 		sb.append(" 	 	 ROW_NUMBER() OVER (ORDER BY GOV_PUBLIC_NID DESC) AS RNUM, "); 		
 		sb.append(" 	 	GOV_PUBLIC_NID, GOV_PUBLIC_KIND, GOV_PUBLIC_KIND_NM, TITLE, ");
 		sb.append(" 	 	DEPARTMENT, PUBLIC_TIME, PUBLIC_CYCLE, PUBLIC_LINK, STATUS_NO ");
 		sb.append(" 	FROM");
 		sb.append(" 		GOV_PUBLIC ");
 		sb.append("		WHERE");
 		sb.append("			STATUS_NO = 1 ");
 		
 		if(gpk != null && gpk.length()>0){
 			sb.append("		AND GOV_PUBLIC_KIND = ? ");
 		}
 		if(search_type != null && search_type.length()>0 && search_keyword != null && search_keyword.length()>0){
 			if("TITLE".equals(search_type)){
 				sb.append("AND TITLE LIKE '%' || ? || '%'");
 			}else if("DEPARTMENT".equals(search_type)){
 				sb.append("AND DEPARTMENT LIKE '%' || ? || '%'");
 			}
 		} 		
 		sb.append(") WHERE RNUM > ? AND RNUM <= ?"); 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			
			int i = 1;
			if(gpk != null && gpk.length()>0){
				pstmt.setString(i++, gpk);
			}
			if(search_type != null && search_type.length()>0 && search_keyword != null && search_keyword.length()>0
					&& ("TITLE".equals(search_type) || "DEPARTMENT".equals(search_type))){
				pstmt.setString(i++, search_keyword);
			}
			pstmt.setInt(i++, (page-1)*pageSize);
			pstmt.setInt(i++, page*pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> hashMap = new HashMap<String, String>();
				hashMap.put("GOV_PUBLIC_NID", rs.getString("GOV_PUBLIC_NID"));
				hashMap.put("GOV_PUBLIC_KIND", rs.getString("GOV_PUBLIC_KIND"));
				hashMap.put("GOV_PUBLIC_KIND_NM", rs.getString("GOV_PUBLIC_KIND_NM"));
				hashMap.put("TITLE", rs.getString("TITLE"));
				hashMap.put("DEPARTMENT", rs.getString("DEPARTMENT"));
				hashMap.put("PUBLIC_TIME", rs.getString("PUBLIC_TIME"));
				hashMap.put("PUBLIC_CYCLE", rs.getString("PUBLIC_CYCLE"));
				hashMap.put("PUBLIC_LINK", rs.getString("PUBLIC_LINK"));							

				govPublicList.add(hashMap);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{ if(rs != null) rs.close(); }catch(Exception e){}
			try{ if(pstmt != null) pstmt.close(); }catch(Exception e){}
			try{ if(con != null) con.close();	}catch(Exception e){}
		}
		//System.out.println(sb);
        return govPublicList;
    }
	
	/**
	 * 2015.04.28
	 * Ã·ºÎÆÄÀÏ ¸®½ºÆ®
	 * @param page
	 * @param pageSize
	 * @return
	 */	
	public ArrayList<HashMap<String, String>> getGovPublicFileList(String govPublicId, HttpServletRequest request){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		ArrayList<HashMap<String, String>> govPublicList = new ArrayList<HashMap<String, String>>(); 
 		HttpSession session = request.getSession();
 		String govId = (String)session.getAttribute("govPublicId");
 		if(govId==null){ govId = "";}
 		
 		StringBuffer sb = new StringBuffer();
 		
 		sb.append(" SELECT GOV_PUBLIC_FILE_SEQ, GOV_PUBLIC_NID, ORG_FILE_NM, SAVE_FILE_NM, FILE_PATH ");
 		sb.append(" ,TO_CHAR(REG_DATE, 'YYYY-MM-DD') AS REG_DATE, TO_CHAR(MOD_DATE, 'YYYY-MM-DD') AS MOD_DATE, FILE_TITLE ");
 		sb.append(" FROM GOV_PUBLIC_FILE "); 		
 		sb.append("		WHERE ");
 		sb.append("			STATUS_NO = 1 ");
 		sb.append("		AND GOV_PUBLIC_NID = ? ");
 		sb.append("		ORDER BY REG_DATE DESC ");
 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			
			int i = 1;			
			pstmt.setString(i, govPublicId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> hashMap = new HashMap<String, String>();
				hashMap.put("GOV_PUBLIC_FILE_SEQ", rs.getString("GOV_PUBLIC_FILE_SEQ"));
				hashMap.put("GOV_PUBLIC_NID", rs.getString("GOV_PUBLIC_NID"));
				hashMap.put("ORG_FILE_NM", rs.getString("ORG_FILE_NM"));
				hashMap.put("SAVE_FILE_NM", rs.getString("SAVE_FILE_NM"));
				hashMap.put("FILE_PATH", rs.getString("FILE_PATH"));
				hashMap.put("REG_DATE", rs.getString("REG_DATE"));
				hashMap.put("MOD_DATE", rs.getString("MOD_DATE"));
				hashMap.put("FILE_TITLE", rs.getString("FILE_TITLE"));				
				govPublicList.add(hashMap);
			}
			if(!govId.equals(govPublicId)){
				updateHitCount(govPublicId, request);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{ if(rs != null) rs.close(); }catch(Exception e){}
			try{ if(pstmt != null) pstmt.close(); }catch(Exception e){}
			try{ if(con != null) con.close();	}catch(Exception e){}
		}
		System.out.println(sb);
        return govPublicList;
    }
	
	/**
	 * ¸®½ºÆ® Ä«¿îÆ®
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public int getGovPublicListCount(String gpk, String search_type, String search_keyword){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		int result = 0; 
 		
 		StringBuffer sb = new StringBuffer();
 		
 		sb.append(" SELECT COUNT(*) FROM GOV_PUBLIC WHERE STATUS_NO = 1 ");
 		if(gpk != null && gpk.length()>0){
 			sb.append(" AND GOV_PUBLIC_KIND = ? ");
 		}
 		if(search_type != null && search_type.length()>0 && search_keyword != null && search_keyword.length()>0){
 			if("TITLE".equals(search_type)){
 				sb.append("AND TITLE LIKE '%' || ? || '%'");
 			}else if("DEPARTMENT".equals(search_type)){
 				sb.append("AND DEPARTMENT LIKE '%' || ? || '%'");
 			}
 		}
 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			
			int i=1;
			if(gpk != null && gpk.length()>0){
				pstmt.setString(i++, gpk);
			}
			if(search_type != null && search_type.length()>0 && search_keyword != null && search_keyword.length()>0
					&& ("TITLE".equals(search_type) || "DEPARTMENT".equals(search_type))){
				pstmt.setString(i++, search_keyword);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				result = rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
        return result;
    }

	/**
	 * »ó¼¼º¸±â
	 * @param gov_public_nid
	 * @return
	 */
	public HashMap<String, Object> getGovPublicView(int gov_public_nid){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		
 		HashMap<String, Object> hashMap = new HashMap<String, Object>();
 		GovPublicBean gb = new GovPublicBean();
 		GovPublicFileBean gfb = new GovPublicFileBean();
 		
 		StringBuffer sb = new StringBuffer();
 		
 		sb.append(" SELECT ");
 		sb.append(" 	A.GOV_PUBLIC_NID, A.GOV_PUBLIC_KIND, A.GOV_PUBLIC_KIND_NM, A.TITLE, ");
 		sb.append(" 	A.DEPARTMENT, A.PUBLIC_TIME, A.PUBLIC_CYCLE, A.PUBLIC_LINK, ");
 		sb.append(" 	B.GOV_PUBLIC_FILE_SEQ, B.ORG_FILE_NM, B.SAVE_FILE_NM, B.FILE_PATH, B.FILE_TITLE ");
 		sb.append(" FROM ");
 		sb.append("	 	GOV_PUBLIC A ");
 		sb.append("	 	LEFT OUTER JOIN GOV_PUBLIC_FILE B ON(A.GOV_PUBLIC_NID = B.GOV_PUBLIC_NID AND B.STATUS_NO = 1) ");
 		sb.append(" WHERE ");
 		sb.append("	 	A.GOV_PUBLIC_NID = ? ");
 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, gov_public_nid);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				gb.setGov_public_nid(rs.getInt("GOV_PUBLIC_NID"));
				gb.setGov_public_kind(rs.getInt("GOV_PUBLIC_KIND"));
				gb.setGov_public_kind_nm(rs.getString("GOV_PUBLIC_KIND_NM"));
				gb.setTitle(rs.getString("TITLE"));
				gb.setDepartment(rs.getString("DEPARTMENT"));
				gb.setPublic_time(rs.getString("PUBLIC_TIME"));
				gb.setPublic_cycle(rs.getString("PUBLIC_CYCLE"));
				gb.setPublic_link(rs.getString("PUBLIC_LINK"));
				
				gfb.setGov_public_file_seq(rs.getInt("GOV_PUBLIC_FILE_SEQ"));
				gfb.setOrg_file_nm(rs.getString("ORG_FILE_NM"));
				gfb.setSave_file_nm(rs.getString("SAVE_FILE_NM"));
				gfb.setFile_path(rs.getString("FILE_PATH"));
				gfb.setFile_title(rs.getString("FILE_TITLE"));
			}
			
			hashMap.put("gb", gb);
			hashMap.put("gfb", gfb);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
        return hashMap;
    }
	
	/**
	 * ±Û »ðÀÔ
	 * @param gb
	 * @return
	 * @throws Exception
	 */
	public boolean insertGovPublic(GovPublicBean gb, GovPublicFileBean gfb) throws Exception{
		
		Connection con = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			con.setAutoCommit(false);
			
			stmt = con.createStatement();
			
			String sql = "SELECT NVL(MAX(GOV_PUBLIC_NID), 0)+1 FROM GOV_PUBLIC";
			rs = stmt.executeQuery(sql);
			rs.next();
			int gov_public_nid = rs.getInt(1);
			
			StringBuffer sb = new StringBuffer();
			
			sb.append(" INSERT INTO GOV_PUBLIC ");
			sb.append(" (GOV_PUBLIC_NID, GOV_PUBLIC_KIND, GOV_PUBLIC_KIND_NM, TITLE, DEPARTMENT, PUBLIC_TIME, PUBLIC_CYCLE, PUBLIC_LINK, REG_ID, REG_DT, STATUS_NO) ");
			sb.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, 1) ");
			
			int i = 1;					
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(i++, gov_public_nid);
			pstmt.setInt(i++, gb.getGov_public_kind());
			pstmt.setString(i++, gb.getGov_public_kind_nm());
			pstmt.setString(i++, gb.getTitle());
			pstmt.setString(i++, gb.getDepartment());
			pstmt.setString(i++, gb.getPublic_time());
			pstmt.setString(i++, gb.getPublic_cycle());
			pstmt.setString(i++, gb.getPublic_link());
			pstmt.setString(i++, gb.getReg_id());

			pstmt.executeUpdate();
			/*
			 * ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Îµï¿½ ï¿½Îºï¿½ ï¿½Ð¸ï¿½
			if(gfb.getSave_file_nm() != null && gfb.getSave_file_nm().length() > 0){
				sql = " SELECT NVL(MAX(GOV_PUBLIC_FILE_SEQ),0)+1 FROM GOV_PUBLIC_FILE ";
				rs = stmt.executeQuery(sql);
				rs.next();
				int gov_public_file_seq = rs.getInt(1);
				
				sb = new StringBuffer();
				sb.append(" INSERT INTO GOV_PUBLIC_FILE ");
				sb.append(" (GOV_PUBLIC_FILE_SEQ, GOV_PUBLIC_NID, ORG_FILE_NM, SAVE_FILE_NM, FILE_PATH, REG_DATE, STATUS_NO ) ");
				sb.append(" VALUES(?, ?, ?, ?, ?, SYSDATE, 1) ");
				
				i = 1;
				pstmt = con.prepareStatement(sb.toString());
				
				pstmt.setInt(i++, gov_public_file_seq);
				pstmt.setInt(i++, gov_public_nid);
				pstmt.setString(i++, gfb.getOrg_file_nm());
				pstmt.setString(i++, gfb.getSave_file_nm());
				pstmt.setString(i++, gfb.getFile_path());
				
				pstmt.executeUpdate();
			}*/

			con.commit();
			result = true;
			
		}catch(Exception e){
			con.rollback();
		    result = false;
		    e.printStackTrace();
		}finally{
			try{
				con.setAutoCommit(true); 
			    if(rs != null) rs.close();
			    if(stmt != null) stmt.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
		return result;
	}
	
	/**
	 * ±Û ¼öÁ¤
	 * @param gb
	 * @return
	 * @throws Exception
	 */
	public boolean updateGovPublic(GovPublicBean gb, GovPublicFileBean gfb) throws Exception{
		
		Connection con = DBUtil.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		boolean result = false;
		
		try {
			con.setAutoCommit(false);
			
			StringBuffer sb = new StringBuffer();
			
			sb.append(" UPDATE GOV_PUBLIC SET ");
			sb.append(" 	GOV_PUBLIC_KIND = ?, ");
			sb.append(" 	GOV_PUBLIC_KIND_NM = ?, ");
			sb.append(" 	TITLE = ?, ");
			sb.append(" 	DEPARTMENT = ?, ");
			sb.append(" 	PUBLIC_TIME = ?, ");
			sb.append(" 	PUBLIC_CYCLE = ?, ");
			sb.append(" 	PUBLIC_LINK = ?, ");
			sb.append(" 	MOD_ID = ?, ");
			sb.append(" 	MOD_DT = SYSDATE ");
			sb.append(" WHERE ");
			sb.append(" 	GOV_PUBLIC_NID = ? ");
			
			int i = 1;					
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(i++, gb.getGov_public_kind());
			pstmt.setString(i++, gb.getGov_public_kind_nm());
			pstmt.setString(i++, gb.getTitle());
			pstmt.setString(i++, gb.getDepartment());
			pstmt.setString(i++, gb.getPublic_time());
			pstmt.setString(i++, gb.getPublic_cycle());
			pstmt.setString(i++, gb.getPublic_link());
			pstmt.setString(i++, gb.getReg_id());
			pstmt.setInt(i++, gb.getGov_public_nid());

			pstmt.executeUpdate();
			/*
			 * ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ® ï¿½Îºï¿½ ï¿½Ð¸ï¿½
			if(gfb.getGov_public_file_seq() > 0){
				
				sb = new StringBuffer();
				i = 1;					
				
				if(gfb.getSave_file_nm() != null && gfb.getSave_file_nm().length() > 0){
					sb.append(" UPDATE GOV_PUBLIC_FILE SET ");
					sb.append(" 	ORG_FILE_NM = ?, ");
					sb.append(" 	SAVE_FILE_NM = ?, ");
					sb.append(" 	FILE_PATH = ?, ");
					sb.append(" 	MOD_DATE = SYSDATE ");
					sb.append(" WHERE ");
					sb.append(" 	GOV_PUBLIC_NID = ? ");
					sb.append(" 	AND GOV_PUBLIC_FILE_SEQ = ? ");
					
					pstmt = con.prepareStatement(sb.toString());
					
					pstmt.setString(i++, gfb.getOrg_file_nm());
					pstmt.setString(i++, gfb.getSave_file_nm());
					pstmt.setString(i++, gfb.getFile_path());
					pstmt.setInt(i++, gfb.getGov_public_nid());
					pstmt.setInt(i++, gfb.getGov_public_file_seq());

				}else{
					sb.append(" UPDATE GOV_PUBLIC_FILE SET ");
					sb.append(" 	STATUS_NO = -1 ");
					sb.append(" WHERE ");
					sb.append(" 	GOV_PUBLIC_NID = ? ");
					sb.append(" 	AND GOV_PUBLIC_FILE_SEQ = ? ");
					
					pstmt = con.prepareStatement(sb.toString());
					
					pstmt.setInt(i++, gfb.getGov_public_nid());
					pstmt.setInt(i++, gfb.getGov_public_file_seq());
				}
				pstmt.executeUpdate();
			
			}else{
				if(gfb.getSave_file_nm() != null && gfb.getSave_file_nm().length() > 0){
					stmt = con.createStatement();
					
					String sql = " SELECT NVL(MAX(GOV_PUBLIC_FILE_SEQ),0)+1 FROM GOV_PUBLIC_FILE ";
					rs = stmt.executeQuery(sql);
					rs.next();
					int gov_public_file_seq = rs.getInt(1);
					
					sb = new StringBuffer();
					sb.append(" INSERT INTO GOV_PUBLIC_FILE ");
					sb.append(" (GOV_PUBLIC_FILE_SEQ, GOV_PUBLIC_NID, ORG_FILE_NM, SAVE_FILE_NM, FILE_PATH, REG_DATE, STATUS_NO ) ");
					sb.append(" VALUES(?, ?, ?, ?, ?, SYSDATE, 1) ");
					
					i = 1;
					pstmt = con.prepareStatement(sb.toString());
					
					pstmt.setInt(i++, gov_public_file_seq);
					pstmt.setInt(i++, gfb.getGov_public_nid());
					pstmt.setString(i++, gfb.getOrg_file_nm());
					pstmt.setString(i++, gfb.getSave_file_nm());
					pstmt.setString(i++, gfb.getFile_path());
					
					pstmt.executeUpdate();
				}
			}*/
			
			con.commit();
			result = true;
			
		}catch(Exception e){
			con.rollback();
		    result = false;
		    e.printStackTrace();
		}finally{
			try{
				con.setAutoCommit(true); 
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
		return result;
	}
	
	/**
	 * 2015.04.29
	 * ±Û µî·Ï
	 * @param gb
	 * @return
	 * @throws Exception
	 */
	public boolean insertGovPublicFile(GovPublicBean gb, GovPublicFileBean gfb) throws Exception{
		
		Connection con = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		
		try {
			con.setAutoCommit(false);
			
			stmt = con.createStatement();
			
			String sql = "";
			
			int gov_public_nid = gfb.getGov_public_nid();
			
			StringBuffer sb = new StringBuffer();
			
			int i = 1;				
				
			if(gfb.getSave_file_nm() != null && gfb.getSave_file_nm().length() > 0){
				sql = " SELECT NVL(MAX(GOV_PUBLIC_FILE_SEQ),0)+1 FROM GOV_PUBLIC_FILE ";
				rs = stmt.executeQuery(sql);
				rs.next();
				int gov_public_file_seq = rs.getInt(1);
				
				sb = new StringBuffer();
				sb.append(" INSERT INTO GOV_PUBLIC_FILE ");
				sb.append(" (GOV_PUBLIC_FILE_SEQ, GOV_PUBLIC_NID, ORG_FILE_NM, SAVE_FILE_NM, FILE_PATH, REG_DATE, STATUS_NO, FILE_TITLE ) ");
				sb.append(" VALUES(?, ?, ?, ?, ?, SYSDATE, 1, ?) ");
				
				i = 1;
				pstmt = con.prepareStatement(sb.toString());
				
				pstmt.setInt(i++, gov_public_file_seq);
				pstmt.setInt(i++, gov_public_nid);
				pstmt.setString(i++, gfb.getOrg_file_nm());
				pstmt.setString(i++, gfb.getSave_file_nm());
				pstmt.setString(i++, gfb.getFile_path());
				pstmt.setString(i++, gfb.getFile_title());
				
				pstmt.executeUpdate();
			}


			con.commit();
			result = true;			
			
		}catch(Exception e){
			con.rollback();
		    result = false;
		    e.printStackTrace();
		}finally{
			try{
				con.setAutoCommit(true); 
			    if(rs != null) rs.close();
			    if(stmt != null) stmt.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
		
		return result;
	}
	
	/**
	 * 2015.04.30 
	 * °Ô½Ã±Û ¼öÁ¤
	 * @param gb
	 * @return
	 * @throws Exception
	 */
	public boolean updateGovPublicFile(GovPublicBean gb, GovPublicFileBean gfb) throws Exception{
		
		Connection con = DBUtil.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		boolean result = false;
		
		try {
			con.setAutoCommit(false);
			
			StringBuffer sb = new StringBuffer();
			
			int i = 1;	
			
			if(gfb.getGov_public_file_seq() > 0){
				
				sb = new StringBuffer();
				i = 1;					
				
				if(gfb.getSave_file_nm() != null && gfb.getSave_file_nm().length() > 0){
					sb.append(" UPDATE GOV_PUBLIC_FILE SET ");
					sb.append(" 	ORG_FILE_NM = ?, ");
					sb.append(" 	SAVE_FILE_NM = ?, ");
					sb.append(" 	FILE_PATH = ?, ");
					sb.append(" 	MOD_DATE = SYSDATE, ");
					sb.append(" 	FILE_TITLE = ? ");
					sb.append(" WHERE ");
					sb.append(" 	GOV_PUBLIC_NID = ? ");
					sb.append(" 	AND GOV_PUBLIC_FILE_SEQ = ? ");
					
					pstmt = con.prepareStatement(sb.toString());
					
					pstmt.setString(i++, gfb.getOrg_file_nm());
					pstmt.setString(i++, gfb.getSave_file_nm());
					pstmt.setString(i++, gfb.getFile_path());
					pstmt.setString(i++, gfb.getFile_title());
					pstmt.setInt(i++, gfb.getGov_public_nid());
					pstmt.setInt(i++, gfb.getGov_public_file_seq());

				}else if(gfb.getFile_title() != null && gfb.getFile_title().length() > 0){
					sb.append(" UPDATE GOV_PUBLIC_FILE SET ");
					sb.append(" 	STATUS_NO = 1, FILE_TITLE = ? ");
					sb.append(" WHERE ");
					sb.append(" 	GOV_PUBLIC_NID = ? ");
					sb.append(" 	AND GOV_PUBLIC_FILE_SEQ = ? ");
					
					pstmt = con.prepareStatement(sb.toString());
					
					pstmt.setString(i++, gfb.getFile_title());
					pstmt.setInt(i++, gfb.getGov_public_nid());
					pstmt.setInt(i++, gfb.getGov_public_file_seq());
				} else {
					sb.append(" UPDATE GOV_PUBLIC_FILE SET ");
					sb.append(" 	STATUS_NO = -1 ");
					sb.append(" WHERE ");
					sb.append(" 	GOV_PUBLIC_NID = ? ");
					sb.append(" 	AND GOV_PUBLIC_FILE_SEQ = ? ");
					
					pstmt = con.prepareStatement(sb.toString());					
					
					pstmt.setInt(i++, gfb.getGov_public_nid());
					pstmt.setInt(i++, gfb.getGov_public_file_seq());					
				}
				pstmt.executeUpdate();
			
			}else{
				if(gfb.getSave_file_nm() != null && gfb.getSave_file_nm().length() > 0){
					stmt = con.createStatement();
					
					String sql = " SELECT NVL(MAX(GOV_PUBLIC_FILE_SEQ),0)+1 FROM GOV_PUBLIC_FILE ";
					rs = stmt.executeQuery(sql);
					rs.next();
					int gov_public_file_seq = rs.getInt(1);
					
					sb = new StringBuffer();
					sb.append(" INSERT INTO GOV_PUBLIC_FILE ");
					sb.append(" (GOV_PUBLIC_FILE_SEQ, GOV_PUBLIC_NID, ORG_FILE_NM, SAVE_FILE_NM, FILE_PATH, REG_DATE, STATUS_NO, FILE_TITLE ) ");
					sb.append(" VALUES(?, ?, ?, ?, ?, SYSDATE, 1, ?) ");
					
					i = 1;
					pstmt = con.prepareStatement(sb.toString());
					
					pstmt.setInt(i++, gov_public_file_seq);
					pstmt.setInt(i++, gfb.getGov_public_nid());
					pstmt.setString(i++, gfb.getOrg_file_nm());
					pstmt.setString(i++, gfb.getSave_file_nm());
					pstmt.setString(i++, gfb.getFile_path());
					pstmt.setString(i++, gfb.getFile_title());
					
					pstmt.executeUpdate();
				}
			}
			
			con.commit();
			result = true;			
			
		}catch(Exception e){
			con.rollback();
		    result = false;
		    e.printStackTrace();
		}finally{
			try{
				con.setAutoCommit(true); 
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
		return result;
	}
	
	/**
	 * °Ô½Ã±Û »èÁ¦
	 * @param gb
	 * @return
	 * @throws Exception
	 */
	public int deleteGovPublic(int gov_public_nid) throws Exception{
		
		Connection con = DBUtil.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		int result = -1;
		
		try {
			
			stmt = con.createStatement();
			String sql = "SELECT COUNT(*) FROM GOV_PUBLIC_FILE WHERE GOV_PUBLIC_NID = " + gov_public_nid;			
			rs = stmt.executeQuery(sql);
			rs.next();
			
			int fileCount = rs.getInt(1);
			
			//System.out.println(fileCount);
			
			StringBuffer sb = new StringBuffer();			
			if(fileCount > 0){
				sb.append(" UPDATE GOV_PUBLIC_FILE SET ");
				sb.append(" 	STATUS_NO = -1 ");
				sb.append(" WHERE ");
				sb.append(" 	GOV_PUBLIC_NID = ? ");
				
				pstmt = con.prepareStatement(sb.toString());				
				pstmt.setInt(1, gov_public_nid);				
				pstmt.executeUpdate();
				pstmt.close();
				
				sb = new StringBuffer();
			}
			sb.append(" UPDATE GOV_PUBLIC SET ");
			sb.append(" 	STATUS_NO = -1 ");
			sb.append(" WHERE ");
			sb.append(" 	GOV_PUBLIC_NID = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, gov_public_nid);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		    
		}finally{
			try{
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
		return result;
	}
	
	/**
	 * 2014.05.04 
	 * Ã·ºÎÆÄÀÏ »èÁ¦
	 * @param gb
	 * @return
	 * @throws Exception
	 */
	public int deleteGovPublicFile(int gov_public_file_seq) throws Exception{
		
		Connection con = DBUtil.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		try {
			StringBuffer sb = new StringBuffer();
			
			sb.append(" UPDATE GOV_PUBLIC_FILE SET ");
			sb.append(" 	STATUS_NO = -1 ");
			sb.append(" WHERE ");
			sb.append(" 	GOV_PUBLIC_FILE_SEQ = ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setInt(1, gov_public_file_seq);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		    
		}finally{
			try{
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
		return result;
	}
	
	/**
	 * »çÀü Á¤º¸°ø°³ ¸®½ºÆ®
	 * @param gov_public_kind
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList<HashMap<String, String>> getGovPublicKindList(int gov_public_kind, int page, int pageSize){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		ArrayList<HashMap<String, String>> govPublicList = new ArrayList<HashMap<String, String>>(); 
 		
 		StringBuffer sb = new StringBuffer();
 		
 		sb.append(" SELECT * FROM ( ");
 		sb.append(" 	SELECT ");
 		sb.append(" 	 	 ROW_NUMBER() OVER (ORDER BY GOV_PUBLIC_NID DESC) AS RNUM, "); 		
 		sb.append(" 	 	GOV_PUBLIC_NID, GOV_PUBLIC_KIND, GOV_PUBLIC_KIND_NM, TITLE, ");
 		sb.append(" 	 	DEPARTMENT, PUBLIC_TIME, PUBLIC_CYCLE, PUBLIC_LINK, STATUS_NO ");
 		sb.append(" 	FROM ");
 		sb.append(" 		GOV_PUBLIC ");
 		sb.append("		WHERE ");
 		sb.append("			STATUS_NO = 1 ");
 		sb.append("			AND GOV_PUBLIC_KIND = ? "); 		
 		sb.append(") WHERE RNUM > ? AND RNUM <= ?");
 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, gov_public_kind);
			pstmt.setInt(2, (page-1)*pageSize);
			pstmt.setInt(3, page*pageSize);
			//System.out.println(sb.toString()+"----"+gov_public_kind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> hashMap = new HashMap<String, String>();
				hashMap.put("GOV_PUBLIC_NID", rs.getString("GOV_PUBLIC_NID"));
				hashMap.put("GOV_PUBLIC_KIND", rs.getString("GOV_PUBLIC_KIND"));
				hashMap.put("GOV_PUBLIC_KIND_NM", rs.getString("GOV_PUBLIC_KIND_NM"));
				hashMap.put("TITLE", rs.getString("TITLE"));
				hashMap.put("DEPARTMENT", rs.getString("DEPARTMENT"));
				hashMap.put("PUBLIC_TIME", rs.getString("PUBLIC_TIME"));
				hashMap.put("PUBLIC_CYCLE", rs.getString("PUBLIC_CYCLE"));
				hashMap.put("PUBLIC_LINK", rs.getString("PUBLIC_LINK"));				

				govPublicList.add(hashMap);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{ if(rs != null) rs.close(); }catch(Exception e){}
			try{ if(pstmt != null) pstmt.close(); }catch(Exception e){}
			try{ if(con != null) con.close();	}catch(Exception e){}
		}
        return govPublicList;
    }
	
	/** 2015.10.06 °Ë»ö±â´É Ãß°¡
	 * »çÀü Á¤º¸°ø°³ ¸®½ºÆ®2
	 * @param gov_public_kind
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList<HashMap<String, String>> getGovPublicKindList2(int gov_public_kind, int page, int pageSize, String sType, String sWord){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		ArrayList<HashMap<String, String>> govPublicList = new ArrayList<HashMap<String, String>>(); 
 		
 		StringBuffer sb = new StringBuffer();
 		
 		
 		sb.append(" SELECT * FROM ( ");
 		sb.append(" 	SELECT ");
 		sb.append(" 	 	 ROW_NUMBER() OVER (ORDER BY GOV_PUBLIC_NID DESC) AS RNUM, "); 		
 		sb.append(" 	 	GOV_PUBLIC_NID, GOV_PUBLIC_KIND, GOV_PUBLIC_KIND_NM, TITLE, ");
 		sb.append(" 	 	DEPARTMENT, PUBLIC_TIME, PUBLIC_CYCLE, PUBLIC_LINK, STATUS_NO, HIT ");
 		sb.append(" 	FROM ");
 		sb.append(" 		GOV_PUBLIC ");
 		sb.append("		WHERE ");
 		sb.append("			STATUS_NO = 1 ");
 		if((sType != null && !sType.equals("")) && (sWord != null && !sWord.equals(""))){
 			sb.append(" AND " + sType +" LIKE '%"+sWord+"%'");
 		}
 		if(gov_public_kind!=0){
 			sb.append("			AND GOV_PUBLIC_KIND = ? ");
 		}
 		sb.append(") WHERE RNUM > ? AND RNUM <= ?");
 		//System.out.println(sb.toString());
 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			if(gov_public_kind!=0){
				pstmt.setInt(1, gov_public_kind);
				pstmt.setInt(2, (page-1)*pageSize);
				pstmt.setInt(3, page*pageSize);
			}
			else{
				pstmt.setInt(1, (page-1)*pageSize);
				pstmt.setInt(2, page*pageSize);				
			}
			//System.out.println(sb.toString()+"----"+gov_public_kind);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> hashMap = new HashMap<String, String>();
				hashMap.put("GOV_PUBLIC_NID", rs.getString("GOV_PUBLIC_NID"));
				hashMap.put("GOV_PUBLIC_KIND", rs.getString("GOV_PUBLIC_KIND"));
				hashMap.put("GOV_PUBLIC_KIND_NM", rs.getString("GOV_PUBLIC_KIND_NM"));
				hashMap.put("TITLE", rs.getString("TITLE"));
				hashMap.put("DEPARTMENT", rs.getString("DEPARTMENT"));
				hashMap.put("PUBLIC_TIME", rs.getString("PUBLIC_TIME"));
				hashMap.put("PUBLIC_CYCLE", rs.getString("PUBLIC_CYCLE"));
				hashMap.put("PUBLIC_LINK", rs.getString("PUBLIC_LINK"));	
				hashMap.put("HIT", rs.getString("HIT"));

				govPublicList.add(hashMap);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{ if(rs != null) rs.close(); }catch(Exception e){}
			try{ if(pstmt != null) pstmt.close(); }catch(Exception e){}
			try{ if(con != null) con.close();	}catch(Exception e){}
		}
        return govPublicList;
    }
	
	/**
	 * »çÀü Á¤º¸°ø°³ ÅëÇÕ°Ë»ö ¸®½ºÆ® Ä«¿îÆ®
	 * @param gov_public_kind
	 * @return
	 */
	public int getGovPublicKindListCount(int gov_public_kind){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		int result = 0; 
 		
 		StringBuffer sb = new StringBuffer();
 		
 		sb.append(" SELECT COUNT(*) FROM GOV_PUBLIC WHERE 1=1 ");
 		if(gov_public_kind!=0){
 			sb.append("			AND GOV_PUBLIC_KIND = ? ");
 		}
 		sb.append("  AND STATUS_NO = 1 ");
 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
	 		if(gov_public_kind!=0){			
	 			pstmt.setInt(1, gov_public_kind);
	 		}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				result = rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
        return result;
    }
	
	/** 2015.10.06 °Ë»ö±â´É Ãß°¡
	 * »çÀü Á¤º¸°ø°³ ÅëÇÕ°Ë»ö ¸®½ºÆ® Ä«¿îÆ®2
	 * @param gov_public_kind
	 * @return
	 */
	public int getGovPublicKindListCount2(int gov_public_kind, String sType, String sWord){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		int result = 0; 
 		
 		StringBuffer sb = new StringBuffer();
 		
 		sb.append(" SELECT COUNT(*) FROM GOV_PUBLIC WHERE 1=1 AND STATUS_NO = 1 ");
 		if((sType != null && !sType.equals("")) && (sWord != null && !sWord.equals(""))){
 			sb.append(" AND " + sType +" LIKE '%"+sWord+"%'");
 		} 		
 		if(gov_public_kind!=0){
 			sb.append(" AND GOV_PUBLIC_KIND = ?");
 		
 		}	
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			if(gov_public_kind!=0){
				pstmt.setInt(1, gov_public_kind);
			}		
			//System.out.println(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				result = rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
        return result;
    }	
	
	
	/**
	 * Ã·ºÎÆÄÀÏ ´Ù¿î·Îµå È½¼ö ¾÷µ¥ÀÌÆ®
	 * @param gov_public_nid
	 * @return
	 */
	public void updateFileCount(int gov_public_file_seq){
		Connection con2 = null;
 		ResultSet rs2 = null;
 		PreparedStatement pstmt2 = null;
 		
 		
 		StringBuffer sb2 = new StringBuffer();
 		
 		sb2.append(" UPDATE GOV_PUBLIC_FILE");
 		sb2.append("	 	 SET CNT_DOWN = CNT_DOWN + 1, HIT=HIT+1");
 		sb2.append(" WHERE ");
 		sb2.append("	 	GOV_PUBLIC_FILE_SEQ = ? ");
 		sb2.append("	 	AND STATUS_NO = 1 ");
 		
		try {
			con2 = DBUtil.getConnection();			
			pstmt2 = con2.prepareStatement(sb2.toString());
			pstmt2.setInt(1, gov_public_file_seq);
			rs2 = pstmt2.executeQuery();
			//System.out.println(sb2.toString());
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			    if(rs2 != null) rs2.close();
				if(pstmt2 != null) pstmt2.close();
				if(con2 != null) con2.close();
			}catch(Exception e){}
		}
	}
	
	/**
	 * Ã·ºÎÆÄÀÏ Á¶È¸
	 * @param gov_public_nid
	 * @return
	 */
	public GovPublicFileBean getGovPublicFileView(int gov_public_file_seq){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		
 		GovPublicFileBean gfb = new GovPublicFileBean();
 		
 		StringBuffer sb = new StringBuffer();
 		
 		updateFileCount(gov_public_file_seq);
 		
 		sb.append(" SELECT ");
 		sb.append(" 	ORG_FILE_NM, SAVE_FILE_NM, FILE_PATH");
 		sb.append(" FROM ");
 		sb.append("	 	GOV_PUBLIC_FILE ");
 		sb.append(" WHERE ");
 		sb.append("	 	GOV_PUBLIC_FILE_SEQ = ? ");
 		sb.append("	 	AND STATUS_NO = 1 ");
 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, gov_public_file_seq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				gfb.setOrg_file_nm(rs.getString("ORG_FILE_NM"));
				gfb.setSave_file_nm(rs.getString("SAVE_FILE_NM"));
				gfb.setFile_path(rs.getString("FILE_PATH"));				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
        return gfb;
    }
	
	/**
	 * 2015.04.30 
	 * Ã·ºÎÆÄÀÏ Á¶È¸
	 * @param gov_public_nid
	 * @return
	 */
	public GovPublicFileBean getGovPublicFileViewExt(int gov_public_file_seq){
		
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement pstmt = null;
 		
 		GovPublicFileBean gfb = new GovPublicFileBean();
 		
 		StringBuffer sb = new StringBuffer();
 		
 		sb.append(" SELECT ");
 		sb.append(" 	ORG_FILE_NM, SAVE_FILE_NM, FILE_PATH, FILE_TITLE");
 		sb.append(" FROM ");
 		sb.append("	 	GOV_PUBLIC_FILE ");
 		sb.append(" WHERE ");
 		sb.append("	 	GOV_PUBLIC_FILE_SEQ = ? ");
 		sb.append("	 	AND STATUS_NO = 1 ");
 		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, gov_public_file_seq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				gfb.setOrg_file_nm(rs.getString("ORG_FILE_NM"));
				gfb.setSave_file_nm(rs.getString("SAVE_FILE_NM"));
				gfb.setFile_path(rs.getString("FILE_PATH"));
				gfb.setFile_title(rs.getString("FILE_TITLE"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			    if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){}
		}
        return gfb;
    }
}
