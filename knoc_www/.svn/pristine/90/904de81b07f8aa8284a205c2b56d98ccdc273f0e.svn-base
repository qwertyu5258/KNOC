package kr.co.knoc.content;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.sitectrl.mgr.MgrDO;
import kr.co.knoc.util.StringUtil;

import kr.co.knoc.jdbc.DBUtil;

public class EngMenuManager {
	public boolean insertMenu(EngMenuBean mb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			String sql = "select max(no) from ENG_MENU";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			rs.close();						
			stmt.close();
			
			sql="insert into ENG_MENU "
				   + " (no, mcode, name, url, status, regdate, listnum1, listnum2, listnum3) "
				   + " values (?, ?, ?, ?, ?, SYSDATE, ?, ?, ?)"; 			
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,mb.getMCode());	
			prestmt.setString(index++,mb.getName());
			prestmt.setString(index++,mb.getUrl());
			prestmt.setString(index++,mb.getStatus());
			prestmt.setInt(index++,mb.getListnum1());
			prestmt.setInt(index++,mb.getListnum2());
			prestmt.setInt(index++,mb.getListnum3());
			
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
	public String getMCodeMax(String mcode, int depth){
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();
			
			int len = mcode.length() + 2;
			String sql = "SELECT * FROM (select RPAD(substr(mcode,1,"+len+"),8,'0') from ENG_MENU";
			if (mcode != null && !mcode.equals("")) {
				//sql += " where substr(mcode,1,"+mcode.length()+") = '" + mcode + "' order by substr(mcode,1,"+len+") desc limit 1";
				sql += " where substr(mcode,1,"+mcode.length()+") = '" + mcode + "'  order by substr(mcode,1,"+len+") desc )A WHERE   ROWNUM =1 ";
			}
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				mcode = rs.getString(1);
				
				// 보안약점 조치 2016.03.21 ECJ 
				if(StringUtil.toInt(mcode) < 0){
					mcode = "1";
				}
				
				mcode = Integer.toString(StringUtil.toInt(mcode)+ depth +100000000).substring(1);
			} else {
				mcode = mcode + "010000";
			}
			rs.close();				
			stmt.close();
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {
			    if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return mcode;
	}
	
	public int getListNumMax(String mcode, String depth){
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		int listnum = 0;
		
		try {
			con = DBUtil.getConnection();
			
			int len = mcode.length() + 2;
			String sql = "select max(listnum" + depth + ") from ENG_MENU";
			if (mcode != null && !mcode.equals("")) {
				sql += " where substr(mcode,1,"+mcode.length()+") = '" + mcode + "'";
			}
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				listnum = rs.getInt(1) + 1;
			} else {
				listnum = 1;
			}
			rs.close();				
			stmt.close();
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {
			    if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return listnum;
	}
	
	public int getListNum(String mcode, String depth){
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		int listnum = 0;
		
		try {
			con = DBUtil.getConnection();
			
			int len = mcode.length() + 2;
			String sql = "select distinct listnum" + depth + " from ENG_MENU";
			if (mcode != null && !mcode.equals("")) {
				sql += " where substr(mcode,1,"+mcode.length()+") = '" + mcode + "'";
			}
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				listnum = rs.getInt(1);
			}
			rs.close();				
			stmt.close();
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
			try {
			    if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return listnum;
	}
	
	public ArrayList<EngMenuBean> getMenuList(String mcode, String status) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<EngMenuBean> result = new ArrayList<EngMenuBean>();
 		StringBuffer query = new StringBuffer(); 		
        query.append("select no, mcode, name, url, status ");
        query.append(" from ENG_MENU");
        query.append(" where substr(mcode,1,2) = ?");
        if (status != null && !status.equals("")) {
        	query.append(" and status = '"+status+"'");	
        }
        query.append(" order by listnum1, listnum2, listnum3 asc");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, mcode);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				EngMenuBean mb = new EngMenuBean();
				mb.setNo(rs.getInt("no"));
				mb.setMCode(rs.getString("mcode"));
				mb.setName(rs.getString("name"));
				mb.setUrl(rs.getString("url"));
				mb.setStatus(rs.getString("status"));				
				result.add(mb);
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
	
	/**
	 * 메뉴통계관리
	 * @param mcode
	 * @param status
	 * @return
	 */
	public ArrayList<EngMenuBean> getMenuAccessList(String mcode) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<EngMenuBean> result = new ArrayList<EngMenuBean>();
 		StringBuffer query = new StringBuffer(); 		
 		
 		query.append(" SELECT T1.NO, T1.MCODE, T1.NAME, T1.URL, T1.STATUS, SUM(NVL(T2.ACC_COUNT, 0)) AS ACC_COUNT ");
 		query.append(" FROM ENG_MENU T1 LEFT OUTER JOIN MENU_ACCESS_COUNT T2 ON(T1.MCODE = T2.MCODE AND T2.PAGE_LANG = 'ENG') ");
 		query.append(" WHERE SUBSTR(T1.MCODE,1,2) = ? ");
 		query.append(" GROUP BY T1.NO, T1.MCODE, T1.NAME, T1.URL, T1.STATUS, T1.LISTNUM1, T1.LISTNUM2, T1.LISTNUM3 ");
 		query.append(" ORDER BY T1.LISTNUM1, T1.LISTNUM2, T1.LISTNUM3 ");
 		
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, mcode);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				EngMenuBean mb = new EngMenuBean();
				mb.setNo(rs.getInt("no"));
				mb.setMCode(rs.getString("mcode"));
				mb.setName(rs.getString("name"));
				mb.setUrl(rs.getString("url"));
				mb.setStatus(rs.getString("status"));
				mb.setAccessCnt(rs.getInt("ACC_COUNT"));
				result.add(mb);
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
	
	public ArrayList<EngMenuBean> getMenuAccessRankList(String rank_year, String rank_month, String sdate, String edate, String period) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<EngMenuBean> result = new ArrayList<EngMenuBean>();
 		StringBuffer query = new StringBuffer(); 		
        query.append("SELECT A.MCODE, A.ACC_COUNT, B.NAME ");
        query.append("FROM (");
        query.append("   SELECT * FROM(");
        query.append("      SELECT MCODE, SUM(ACC_COUNT) AS ACC_COUNT");
        query.append("      FROM MENU_ACCESS_COUNT");        
        query.append("      WHERE PAGE_LANG = 'ENG'");
        
        if(period == null || "".equals(period)){
        	query.append("         AND YEAR = ? AND MONTH = ? ");
        }else if(period != null && "true".equals(period)){
        	query.append("         AND ACC_DATE BETWEEN TO_DATE(?, 'yyyy-MM-dd') AND TO_DATE(?, 'yyyy-MM-dd hh24:mi:ss') ");
        }
        
        query.append("      GROUP BY MCODE");
        query.append("      ORDER BY ACC_COUNT DESC");
        query.append("   )");
        query.append("   WHERE ROWNUM <= 3");
        query.append(")A ");
        query.append("INNER JOIN ENG_MENU B ON(B.MCODE = A.MCODE)");
        query.append("ORDER BY ACC_COUNT DESC");
        
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			
			if(period == null || "".equals(period)){
				prestmt.setString(1, rank_year);
				prestmt.setString(2, rank_month);
	        }else if(period != null && "true".equals(period)){
	        	prestmt.setString(1, sdate);
	        	prestmt.setString(2, edate + " 23:59:59");
	        }
			
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				EngMenuBean mb = new EngMenuBean();
				mb.setMCode(rs.getString("mcode"));
				mb.setName(rs.getString("name"));
				mb.setAccessCnt(rs.getInt("ACC_COUNT"));
				result.add(mb);
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
	
	public ArrayList<EngMenuBean> getMenu1List(String mcode) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<EngMenuBean> result = new ArrayList<EngMenuBean>();
 		StringBuffer query = new StringBuffer(); 		
        query.append("select no, mcode, name, url, status ");
        query.append(" from ENG_MENU");
        query.append(" where substr(mcode,1,2) = ? and substr(mcode,5,4) = '0000'");
        query.append(" order by listnum1, listnum2, listnum3 asc");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, mcode);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				EngMenuBean mb = new EngMenuBean();
				mb.setNo(rs.getInt("no"));
				mb.setMCode(rs.getString("mcode"));
				mb.setName(rs.getString("name"));
				mb.setUrl(rs.getString("url"));
				mb.setStatus(rs.getString("status"));				
				result.add(mb);
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
	
	public ArrayList<EngMenuBean> getMenu2List(String mcode) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<EngMenuBean> result = new ArrayList<EngMenuBean>();
 		StringBuffer query = new StringBuffer(); 		
        query.append("select no, mcode, name, url, status ");
        query.append(" from ENG_MENU");
        query.append(" where substr(mcode,1,4) = ? and substr(mcode,5,2) != '00' and substr(mcode,7,2) = '00'");        
        query.append(" order by listnum1, listnum2, listnum3 asc");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, mcode);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				EngMenuBean mb = new EngMenuBean();
				mb.setNo(rs.getInt("no"));
				mb.setMCode(rs.getString("mcode"));
				mb.setName(rs.getString("name"));
				mb.setUrl(rs.getString("url"));
				mb.setStatus(rs.getString("status"));				
				result.add(mb);
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
	
	public ArrayList<EngMenuBean> getMenu3List(String mcode) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<EngMenuBean> result = new ArrayList<EngMenuBean>();
 		StringBuffer query = new StringBuffer(); 		
        query.append("select no, mcode, name, url, status ");
        query.append(" from ENG_MENU");
        query.append(" where substr(mcode,1,6) = ? and substr(mcode,7,2) != '00'");        
        query.append(" order by listnum1, listnum2, listnum3 asc");
		try {
			con = DBUtil.getConnection();
			
			prestmt = con.prepareStatement(query.toString());
			prestmt.setString(1, mcode);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				EngMenuBean mb = new EngMenuBean();
				mb.setNo(rs.getInt("no"));
				mb.setMCode(rs.getString("mcode"));
				mb.setName(rs.getString("name"));
				mb.setUrl(rs.getString("url"));
				mb.setStatus(rs.getString("status"));				
				result.add(mb);
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
	
	public static String getMCodeSelect2(String mcode) {
    	StringBuffer strSel = new StringBuffer();
        
        Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String column = "";
		String where = "";
		column = "substr(mcode,3,2) as mcode, name ";
		where = "where substr(mcode,1,2) = ? and substr(mcode,5,4) = '0000'";
		StringBuffer query = new StringBuffer();
		
		query.append("select " + column);		
		query.append("from ENG_MENU ");
		query.append(where);
		query.append("order by listnum1, listnum2, listnum3 asc");
        try{
        	con = DBUtil.getConnection();        	

        	prestmt = con.prepareStatement(query.toString());
        	prestmt.setString(1, mcode.substring(0,2));
        	rs = prestmt.executeQuery();
         
            while (rs.next()){            
            	strSel.append("<option value='"+rs.getString("mcode") +"'"+((rs.getString("mcode").equals(mcode.substring(2,4)))? "selected":"")+">"+rs.getString("name") +"</option>\n");
            }          
            
            if(rs != null) rs.close(); rs = null;
			prestmt.close(); prestmt = null;
        }catch(Exception e){
        	e.printStackTrace();
        } finally {
        	try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
        }
        return strSel.toString();    	
    }	
	
	public static String getMCodeSelect3(String mcode) {
    	StringBuffer strSel = new StringBuffer();
        
        Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String column = "";
		String where = "";
		column = "substr(mcode,5,2) as mcode, name ";
		where = "where substr(mcode,1,4) = ? and substr(mcode,5,2) != '00' and substr(mcode,7,2) = '00' ";		
		StringBuffer query = new StringBuffer();
		
		query.append("select " + column);		
		query.append("from ENG_MENU ");
		query.append(where);
		query.append("order by listnum1, listnum2, listnum3 asc");
        try{
        	con = DBUtil.getConnection();        	

        	prestmt = con.prepareStatement(query.toString());
        	prestmt.setString(1, mcode.substring(0,4));        	
        	rs = prestmt.executeQuery();
         
            while (rs.next()){            
            	strSel.append("<option value='"+rs.getString("mcode") +"'"+((rs.getString("mcode").equals(mcode.substring(4,6)))? "selected":"")+">"+rs.getString("name") +"</option>\n");
            }          
            
            if(rs != null) rs.close(); rs = null;
			prestmt.close(); prestmt = null;
        }catch(Exception e){
        	e.printStackTrace();
        } finally {
        	try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
        }
        return strSel.toString();    	
    }	
	
	public static String getMCodeSelect4(String mcode) {
    	StringBuffer strSel = new StringBuffer();
        
        Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String column = "";
		String where = "";
		column = "substr(mcode,7,2) as mcode, name ";
		where = "where substr(mcode,1,6) = ? and substr(mcode,7,2) != '00' ";		
		StringBuffer query = new StringBuffer();
		
		query.append("select " + column);		
		query.append("from ENG_MENU ");
		query.append(where);
		query.append("order by listnum1, listnum2, listnum3 asc");
        try{
        	con = DBUtil.getConnection();        	

        	prestmt = con.prepareStatement(query.toString());
        	prestmt.setString(1, mcode.substring(0,6));        	
        	rs = prestmt.executeQuery();
         
            while (rs.next()){            
            	strSel.append("<option value='"+rs.getString("mcode") +"'"+((rs.getString("mcode").equals(mcode.substring(6,8)))? "selected":"")+">"+rs.getString("name") +"</option>\n");
            }          
            
            if(rs != null) rs.close(); rs = null;
			prestmt.close(); prestmt = null;
        }catch(Exception e){
        	e.printStackTrace();
        } finally {
        	try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
        }
        return strSel.toString();    	
    }	
	
	public EngMenuBean getMenu(int no){
		Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		EngMenuBean result = null;
		try {
			con = DBUtil.getConnection();
			String sqlstr = "select mcode, name, url, status, listnum1, listnum2, listnum3 from ENG_MENU where no = ?";
			prestmt = con.prepareStatement(sqlstr);
			prestmt.setInt(1, no);
			rs = prestmt.executeQuery();
			if(rs.next()) {
				result = new EngMenuBean();
				result.setMCode(rs.getString("mcode"));
				result.setName(rs.getString("name"));
				result.setUrl(rs.getString("url"));
				result.setStatus(rs.getString("status"));
				result.setListnum1(rs.getInt("listnum1"));
				result.setListnum2(rs.getInt("listnum2"));
				result.setListnum3(rs.getInt("listnum3"));
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
			if(rs != null) rs.close(); rs = null;
		}
		catch (Exception e) {
			e.printStackTrace();		
		}
		finally {
			try {
			    if (rs != null) rs.close();
			    if (prestmt !=null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public boolean updateMenu(EngMenuBean mb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "update ENG_MENU set name=?, url=?, status=? where no=?";
				   
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,mb.getName());
			prestmt.setString(index++,mb.getUrl());
			prestmt.setString(index++,mb.getStatus());
			prestmt.setInt(index++,mb.getNo());
			
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
	
	public boolean deleteMenu(String mcode){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from ENG_MENU where substr(mcode,1,"+mcode.length()+") = ?";
				   					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,mcode);				
			
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
	
	public static String getMenuName(String mcode) {
    	StringBuffer strSel = new StringBuffer();
        
        Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String menuName = "";
        try{
        	con = DBUtil.getConnection();
        	
        	String sql = "select name from ENG_MENU where mcode = ?";
        	prestmt = con.prepareStatement(sql);
        	prestmt.setString(1, mcode.substring(0,4)+"0000");
			rs = prestmt.executeQuery();         
            if (rs.next()){            
            	menuName += "> " + rs.getString("name");
            }                      
            if(rs != null) rs.close(); rs = null;
			prestmt.close(); prestmt = null;

			if (!mcode.substring(4,6).equals("00")) {
				sql = "select name from ENG_MENU where mcode = ?";
	        	prestmt = con.prepareStatement(sql);
	        	prestmt.setString(1, mcode.substring(0,6)+"00");
				rs = prestmt.executeQuery();         
	            if (rs.next()){            
	            	menuName += "> " + rs.getString("name");
	            }                      
	            if(rs != null) rs.close(); rs = null;
				prestmt.close(); prestmt = null;
			} 
			if (!mcode.substring(6,8).equals("00")) {
				sql = "select name from ENG_MENU where mcode = ?";
	        	prestmt = con.prepareStatement(sql);
	        	prestmt.setString(1, mcode);
				rs = prestmt.executeQuery();         
	            if (rs.next()){            
	            	menuName += "> " + rs.getString("name");
	            }                      
	            if(rs != null) rs.close(); rs = null;
				prestmt.close(); prestmt = null;			
			} 
        }catch(Exception e){
        	e.printStackTrace();
        } finally {
        	try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
        }
        return menuName;    	
    }
	
	public boolean updateListnum(int no, int listnum, int listnum2, String mcode, String gubun){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		String sql = "";
		
		try {
			con = DBUtil.getConnection();			
			
			if (gubun.equals("UP")) {
				sql = "update ENG_MENU set listnum1 = listnum1 + 1 where substr(mcode,1,2) = ? and ( listnum1 >= ? and listnum1 < ? )";				
			} else {
				sql = "update ENG_MENU set listnum1 = listnum1 - 1 where substr(mcode,1,2) = ? and ( listnum1 <= ? and listnum1 > ? )";
			}
				   
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,mcode.substring(0,2));
			prestmt.setInt(2,listnum);
			prestmt.setInt(3,listnum2);
			
			prestmt.executeUpdate();	
			prestmt.close();
			
			sql = "update ENG_MENU set listnum1 = ? where substr(mcode,1,4) = ?";
			   
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,listnum);
			prestmt.setString(2,mcode.substring(0,4));
			
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
	
	public boolean updateListnum2(int no, int listnum, int listnum2, String mcode, String gubun){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		String sql = "";
		
		try {
			con = DBUtil.getConnection();			
			
			if (gubun.equals("UP")) {
				sql = "update ENG_MENU set listnum2 = listnum2 + 1 where substr(mcode,1,4) = ? and ( listnum2 >= ? and listnum2 < ? )";				
			} else {
				sql = "update ENG_MENU set listnum2 = listnum2 - 1 where substr(mcode,1,4) = ? and ( listnum2 <= ? and listnum2 > ? )";				   
			}
			   
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,mcode.substring(0,4));
			prestmt.setInt(2,listnum);
			prestmt.setInt(3,listnum2);
			
			prestmt.executeUpdate();	
			prestmt.close();
			
			sql = "update ENG_MENU set listnum2 = ? where substr(mcode,1,6) = ?";
			   
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,listnum);
			prestmt.setString(2,mcode.substring(0,6));
			
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
	
	public boolean updateListnum3(int no, int listnum, int listnum2, String mcode, String gubun){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		String sql = "";
		
		try {
			con = DBUtil.getConnection();			
			
			if (gubun.equals("UP")) {
				sql = "update ENG_MENU set listnum3 = listnum3 + 1 where substr(mcode,1,6) = ? and ( listnum3 >= ? and listnum3 < ? )";					   			
			} else {
				sql = "update ENG_MENU set listnum3 = listnum3 - 1 where substr(mcode,1,6) = ? and ( listnum3 <= ? and listnum3 > ? )";
			}
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,mcode.substring(0,6));
			prestmt.setInt(2,listnum);
			prestmt.setInt(3,listnum2);
			
			prestmt.executeUpdate();	
			prestmt.close();
			
			sql = "update ENG_MENU set listnum3 = ? where mcode = ?";
			   
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1,listnum);
			prestmt.setString(2,mcode);
			
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
