package kr.co.knoc.division;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class DivisionListManager {
	/**
	 * 부서등록
	 * @param dlb
	 * @return
	 */
	public boolean insertDivisionList(DivisionListBean dlb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		String d_code = "";
				
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();
			
			//String sql = "select d_code from division_list order by d_code desc limit 1";
			String sql = "select d_code from division_list where rownum =1 order by d_code desc ";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				d_code = rs.getString("d_code");
			}
			rs.close();
			stmt.close();
			
			if (d_code == null || d_code.equals("")) {
				d_code = "1a";
			} else {
				String left_code = d_code.substring(0,1);
				char[] right_code = d_code.substring(1,2).toCharArray();

				if(right_code[0] >= 122) {
					if(Integer.parseInt(left_code) > 8) {
						d_code = "";
					} else {
						d_code = Integer.toString(Integer.parseInt(left_code) + 1);
						d_code = d_code + "a";
					}
				} else {
					right_code[0] += 1;
					d_code = left_code + right_code[0];
				}
			}
			
			if (!d_code.equals("")) {
				sql="insert into division_list "
					   + " (d_code, d_name, d_tell) "
					   + " values (?, ?, ?)"; 			
				
				int index = 1;					
				prestmt = con.prepareStatement(sql);
				prestmt.setString(index++,d_code);	
				prestmt.setString(index++,dlb.getDName());
				prestmt.setString(index++,dlb.getDTell());			
				
				prestmt.executeUpdate();	
				prestmt.close();
				result = true;
			}
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
		
	/**
	 * 부서리스트
	 * @return
	 */
	public ArrayList<DivisionListBean> getDivisionList() {
    	Connection con = null;
 		ResultSet rs = null;
 		Statement stmt = null;
 		ArrayList<DivisionListBean> result = new ArrayList<DivisionListBean>();
 		StringBuffer query = new StringBuffer(); 		
        query.append("select d_code, d_name, d_tell from division_list order by d_code asc");
        try {
			con = DBUtil.getConnection();

			stmt = con.createStatement();			
			rs = stmt.executeQuery(query.toString());
			
			while(rs.next()) {
				DivisionListBean dlb = new DivisionListBean();
				dlb.setDCode(rs.getString("d_code"));
				dlb.setDName(rs.getString("d_name"));
				dlb.setDTell(rs.getString("d_tell"));
				result.add(dlb);
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
	
    /**
     * 부서정보 삭제
     * @param d_code
     * @return
     */
    public boolean deleteDivisionList(String d_code){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from division_list where d_code=?";
				   					
			prestmt = con.prepareStatement(sql);
			prestmt.setString(1,d_code);				
			
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
    
    /**
     * 부서목록 selectbox
     * @param d_code
     * @return
     */
    public static String getDivisionSelect(String d_code) {
    	StringBuffer strSel = new StringBuffer();
        
        Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
        try{
        	con = DBUtil.getConnection();
        	stmt = con.createStatement();
        	
        	String sql = "select d_code, d_name from division_list order by d_code asc";        	
			rs = stmt.executeQuery(sql);
         
            while (rs.next()){            
            	strSel.append("<option value='"+rs.getString("d_code") +"'"+((rs.getString("d_code").equals(d_code))? "selected":"")+">"+rs.getString("d_name") +"</option>\n");
            }          
            
            if(rs != null) rs.close(); rs = null;
			stmt.close(); stmt = null;
        }catch(Exception e){
        	e.printStackTrace();
        } finally {
        	try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
        }
        return strSel.toString();    	
    }
    
    /**
     * 부서명 가져오기
     * @param d_code
     * @return
     */
    public static String getDName(String d_code) {
    	StringBuffer strSel = new StringBuffer();
        
        Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String d_name = "";
        try{
        	con = DBUtil.getConnection();
        	
        	String sql = "select d_name from division_list where d_code = ?";
        	prestmt = con.prepareStatement(sql);
        	prestmt.setString(1, d_code);
			rs = prestmt.executeQuery();
         
            if (rs.next()){            
            	d_name = rs.getString("d_name");
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
        return d_name;    	
    }
    
    public static String getDCode(String d_name) {
    	StringBuffer strSel = new StringBuffer();
        
        Connection con = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		String d_code = "";
        try{
        	con = DBUtil.getConnection();
        	
        	String sql = "select d_code from division_list where d_name = ?";
        	prestmt = con.prepareStatement(sql);
        	prestmt.setString(1, d_name);
			rs = prestmt.executeQuery();
         
            if (rs.next()){            
            	d_code = rs.getString("d_code");
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
        return d_code;    	
    }
}
