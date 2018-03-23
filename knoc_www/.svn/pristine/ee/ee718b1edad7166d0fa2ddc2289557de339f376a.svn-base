package kr.co.knoc.prroom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.co.knoc.jdbc.DBUtil;

public class PrRoomManager {

	public ArrayList<PrRoomBean> getPrRoomList(){
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<PrRoomBean> result = new ArrayList<PrRoomBean>();
 		StringBuffer query = new StringBuffer();
 		query.append(" SELECT NID, NAME, URL, MODIFY_DATE ");
 		query.append(" FROM PR_ROOM_LINK ");
 		query.append(" WHERE STATUS_NO = 1 ");
 		query.append(" ORDER BY NID ASC ");
 		
 		try{
 			con = DBUtil.getConnection();
 			
 			prestmt = con.prepareStatement(query.toString());
 			rs = prestmt.executeQuery();
 			
 			while(rs.next()){
 				PrRoomBean prb = new PrRoomBean();
 				prb.setNid(rs.getInt("NID"));
 				prb.setName(rs.getString("NAME"));
 				prb.setUrl(rs.getString("URL"));
 				if(rs.getString("MODIFY_DATE") != null && !"".equals(rs.getString("MODIFY_DATE"))){
 					prb.setModifyDateString("yyyy-MM-dd hh:mm:ss", rs.getString("MODIFY_DATE"));
 				}
 				result.add(prb);
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
	
	public boolean updatePrRoom(PrRoomBean prb){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		
		try{
			con = DBUtil.getConnection();
			
			String sql = "UPDATE PR_ROOM_LINK SET URL=?, MODIFY_DATE=SYSDATE WHERE NID=?";
			
			int index = 1;
			prestmt = con.prepareStatement(sql);
			prestmt.setString(index++,prb.getUrl());
			prestmt.setInt(index++,prb.getNid());
			
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
