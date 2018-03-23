package kr.co.knoc.etc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class BoardLimit {
	public ArrayList<BoardBean> getNeoBoard(String tablename, int limit, String secret) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<BoardBean> result = new ArrayList<BoardBean>();
		String strSQL = "";
		
		strSQL+= "SELECT * FROM (";
		
		strSQL += "SELECT no, subject, regdate, name, filecnt, grp  , ROW_NUMBER() OVER(ORDER BY no desc) AS PAGE_NO FROM "+tablename+" ";
		//strSQL += "SELECT no, subject, regdate, name, filecnt, grp    FROM "+tablename+" ";
		strSQL += " where is_delete='N' ";
		if (secret != null && !secret.equals("")) {
			if (secret.equals("0")) {
				strSQL += " and (secret='"+secret+"' or secret is null) ";
			} else {
				strSQL += " and secret='"+secret+"' ";
			}
		}
		strSQL+=" ) A ";
		strSQL+= " WHERE  PAGE_NO > 0     AND A.PAGE_NO <= "+limit;
		//strSQL += "order by no desc limit 0, "+limit;
		
		try {
        	con = DBUtil.getConnection();
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(strSQL);
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				
				bean.setNo(rs.getInt(1));
				bean.setSubject(rs.getString(2));
				bean.setRegDateString("yyyyy-MM-dd HH:mm:ss", rs.getString(3));
				bean.setName(rs.getString(4));
				bean.setFilecnt(rs.getInt(5));
				bean.setGrp(rs.getString(6));
				
				result.add(bean);
			}
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
