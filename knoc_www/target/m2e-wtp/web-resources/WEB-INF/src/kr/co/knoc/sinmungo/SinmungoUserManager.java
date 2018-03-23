package kr.co.knoc.sinmungo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import kr.co.knoc.jdbc.DBUtil;

public class SinmungoUserManager {

	public int updateUserPwd(String user_id, String userPwd) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int resultCnt = -1;


		StringBuffer stringBuffer = new StringBuffer();


		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	stringBuffer.append(" UPDATE SINMUNGO_USER SET ");
	    	stringBuffer.append(" 	USER_PWD = ? ");
	    	stringBuffer.append(" WHERE  USER_ID = ?  ");
	    	stringBuffer.append(" AND  STATUS_NO = ?  ");

			int index = 1;

			pstmt = con.prepareStatement(stringBuffer.toString());
			pstmt.setString(index++, userPwd);
			pstmt.setString(index++, user_id);
			pstmt.setInt(index++, 1);

			resultCnt = pstmt.executeUpdate();
			con.commit();

		}
		catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				System.out.println("===========> COMMIT");
				con.setAutoCommit(true);
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();

			} catch (Exception e) {
			}
		}
		return resultCnt;
	}

	/**
	 * 기존 로직이 에러난상태(?)여서 추가 옴부즈맨 패스워드 변경 20130226
	 * @param user_id  아이디
	 * @param userPwd 변경할 패스워드
	 * @param status_no 상태값 3 (옴부즈맨 관리자)
	 * @return
	 * @throws Exception
	 */
	public int updateUserPwd(String user_id, String userPwd, int status_no, String email, String phone) throws Exception {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int resultCnt = -1;


		StringBuffer stringBuffer = new StringBuffer();


		try {
	    	con = DBUtil.getConnection();
	    	con.setAutoCommit(false);
	    	stringBuffer.append(" UPDATE SINMUNGO_USER SET ");
	    	stringBuffer.append(" 	USER_PWD = ?, ");
	    	stringBuffer.append(" 	EMAIL = ?, ");
	    	stringBuffer.append(" 	PHONE = ? ");
	    	stringBuffer.append(" WHERE  USER_ID = ?  ");
	    	stringBuffer.append(" AND  STATUS_NO = ?  ");

			int index = 1;

			pstmt = con.prepareStatement(stringBuffer.toString());
			pstmt.setString(index++, userPwd);
			pstmt.setString(index++, email);
			pstmt.setString(index++, phone);
			pstmt.setString(index++, user_id);
			pstmt.setInt(index++, status_no);

			resultCnt = pstmt.executeUpdate();
			con.commit();

		}
		catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		}
		finally {
			try {
				System.out.println("===========> COMMIT");
				con.setAutoCommit(true);
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null) rs.close();

			} catch (Exception e) {
			}
		}
		return resultCnt;
	}

	/**
	 * 관리자 패스워드 체크
	 * @param oldPassword
	 * @return
	 */
	public boolean getIsUserPassword(String user_id,String oldPassword){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		StringBuffer query = new StringBuffer();
 		boolean flag = false;

        query.append("SELECT ");
        query.append("	USER_NID, USER_ID, MOD_DATE, REG_DATE,");
        query.append("    STATUS_NO, EMAIL, PHONE, USER_PWD");
        query.append(" FROM SINMUNGO_USER ");
        query.append(" WHERE USER_ID = ? ");

        try {
			con = DBUtil.getConnection();

		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setString(1, user_id);

			rs = prestmt.executeQuery();

			if(rs.next()) {
				System.out.println("old pwd1 :: "+oldPassword.trim());
				System.out.println("old pwd2 :: "+rs.getString("USER_PWD"));
				if(oldPassword.trim().equals(rs.getString("USER_PWD"))){
					System.out.println("=== > TRUE");
					flag = true;
				}
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return flag;
	}

	/**
	 * 관리자 (옴부즈)패스워드 체크
	 * @param oldPassword
	 * @return
	 */
	public boolean getIsObmPassword(String user_id, String oldPassword){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		StringBuffer query = new StringBuffer();
 		boolean flag = false;

        query.append("SELECT ");
        query.append("	USER_NID, USER_ID, MOD_DATE, REG_DATE,");
        query.append("    STATUS_NO, EMAIL, PHONE, USER_PWD");
        query.append(" FROM SINMUNGO_USER ");
        query.append(" WHERE STATUS_NO = 3 ");
        query.append(" AND USER_ID = ? ");

        try {
			con = DBUtil.getConnection();

		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setString(1, user_id);

			rs = prestmt.executeQuery();

			if(rs.next()) {
				System.out.println("old pwd1 :: "+oldPassword.trim());
				System.out.println("old pwd2 :: "+rs.getString("USER_PWD"));
				if(oldPassword.trim().equals(rs.getString("USER_PWD"))){
					flag = true;
				}
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return flag;
	}

	public HashMap getUserInfo(String userId){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		StringBuffer query = new StringBuffer();
 		HashMap hash = new HashMap();

        query.append("SELECT ");
        query.append("	USER_NID, USER_ID, MOD_DATE, REG_DATE,");
        query.append("    STATUS_NO, EMAIL, PHONE, USER_PWD");
        query.append(" FROM SINMUNGO_USER ");
        query.append(" WHERE USER_ID = ? ");

        try {
			con = DBUtil.getConnection();

		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setString(1,userId);

			rs = prestmt.executeQuery();

			if(rs.next()) {
				hash.put("USER_NID", rs.getInt("USER_NID"));
				hash.put("USER_ID", rs.getString("USER_ID"));
				hash.put("USER_PWD", rs.getString("USER_PWD"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("EMAIL", rs.getString("EMAIL"));
				hash.put("PHONE", rs.getString("PHONE"));

			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return hash;
	}

	/**
	 * 옴부즈 맨 관리자 로그인 check
	 * @param userId
	 * @return
	 */
	public HashMap getAdminInfo(String userId){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		StringBuffer query = new StringBuffer();
 		HashMap hash = new HashMap();

        query.append("SELECT ");
        query.append("	USER_NID, USER_ID, MOD_DATE, REG_DATE,");
        query.append("    STATUS_NO, EMAIL, PHONE, USER_PWD");
        query.append(" FROM SINMUNGO_USER ");
        query.append(" WHERE USER_ID = ? ");
        query.append(" AND STATUS_NO = 3 ");

        try {
			con = DBUtil.getConnection();

		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setString(1,userId);

			rs = prestmt.executeQuery();

			if(rs.next()) {
				hash.put("USER_NID", rs.getInt("USER_NID"));
				hash.put("USER_ID", rs.getString("USER_ID"));
				hash.put("USER_PWD", rs.getString("USER_PWD"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("EMAIL", rs.getString("EMAIL"));
				hash.put("PHONE", rs.getString("PHONE"));

			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return hash;
	}

	/**
	 * 옴부즈맨 관리자 정보 가져오기
	 * @param userId
	 * @return
	 */
	public HashMap getUserInfo(int status, HashMap requestData){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		StringBuffer query = new StringBuffer();
 		HashMap hash = new HashMap();

        query.append("SELECT ");
        query.append("	USER_NID, USER_ID, MOD_DATE, REG_DATE,");
        query.append("    STATUS_NO, EMAIL, PHONE, USER_PWD");
        query.append(" FROM SINMUNGO_USER ");
        query.append(" WHERE STATUS_NO = ? ");
        query.append(" AND USER_ID = ? ");

        try {
			con = DBUtil.getConnection();

		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1, status);
		    prestmt.setString(2, requestData.get("obm_type").toString());
			rs = prestmt.executeQuery();

			if(rs.next()) {
				hash.put("USER_NID", rs.getInt("USER_NID"));
				hash.put("USER_ID", rs.getString("USER_ID"));
				hash.put("USER_PWD", rs.getString("USER_PWD"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("EMAIL", rs.getString("EMAIL"));
				hash.put("PHONE", rs.getString("PHONE"));
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return hash;
	}

	public HashMap getUserInfo(int status){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		StringBuffer query = new StringBuffer();
 		HashMap hash = new HashMap();

        query.append("SELECT ");
        query.append("	USER_NID, USER_ID, MOD_DATE, REG_DATE,");
        query.append("    STATUS_NO, EMAIL, PHONE, USER_PWD");
        query.append(" FROM SINMUNGO_USER ");
        query.append(" WHERE STATUS_NO = ? ");

        try {
			con = DBUtil.getConnection();

		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1, status);

			rs = prestmt.executeQuery();

			if(rs.next()) {
				hash.put("USER_NID", rs.getInt("USER_NID"));
				hash.put("USER_ID", rs.getString("USER_ID"));
				hash.put("USER_PWD", rs.getString("USER_PWD"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("EMAIL", rs.getString("EMAIL"));
				hash.put("PHONE", rs.getString("PHONE"));
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return hash;
	}

	public HashMap getUserInfo_pw(String user_id){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		StringBuffer query = new StringBuffer();
 		HashMap hash = new HashMap();

        query.append("SELECT ");
        query.append("	USER_NID, USER_ID, MOD_DATE, REG_DATE,");
        query.append("    STATUS_NO, EMAIL, PHONE, USER_PWD");
        query.append(" FROM SINMUNGO_USER ");
        query.append(" WHERE USER_ID = ? ");

        try {
			con = DBUtil.getConnection();

		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setString(1, user_id);

			rs = prestmt.executeQuery();

			if(rs.next()) {
				hash.put("USER_NID", rs.getInt("USER_NID"));
				hash.put("USER_ID", rs.getString("USER_ID"));
				hash.put("USER_PWD", rs.getString("USER_PWD"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("EMAIL", rs.getString("EMAIL"));
				hash.put("PHONE", rs.getString("PHONE"));
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return hash;
	}


	public HashMap getMasterUserInfo(){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		StringBuffer query = new StringBuffer();
 		HashMap hash = new HashMap();

        query.append("SELECT ");
        query.append("	USER_NID, USER_ID, MOD_DATE, REG_DATE,");
        query.append("    STATUS_NO, EMAIL, PHONE, USER_PWD");
        query.append(" FROM SINMUNGO_USER ");
        query.append(" WHERE STATUS_NO = 1 ");

        try {
			con = DBUtil.getConnection();

		    prestmt = con.prepareStatement(query.toString());


			rs = prestmt.executeQuery();

			if(rs.next()) {
				hash.put("USER_NID", rs.getInt("USER_NID"));
				hash.put("USER_ID", rs.getString("USER_ID"));
				hash.put("USER_PWD", rs.getString("USER_PWD"));
				hash.put("MOD_DATE", rs.getString("MOD_DATE"));
				hash.put("REG_DATE", rs.getString("REG_DATE"));
				hash.put("STATUS_NO", rs.getInt("STATUS_NO"));
				hash.put("EMAIL", rs.getString("EMAIL"));
				hash.put("PHONE", rs.getString("PHONE"));
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return hash;
	}



}
