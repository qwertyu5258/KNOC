package kr.co.knoc.petronet;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.jdbc.PetronetDBUtil;

public class PetronetInsert {
	public static boolean insertPetronet(PetronetBean pb){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		boolean result = false;
		int no = 0;
		
		try {
			con = DBUtil.getConnection();		
			stmt = con.createStatement();
			
			String sql = "select max(no) from PETRONET";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				no = rs.getInt(1) + 1;
			} else {
				no = 1;
			}
			stmt.close();
			
			sql="insert into PETRONET "
				   + " (no, recentDt, oil1_name, oil1_num, oil1_img, oil2_name, oil2_num, oil2_img, oil3_name, oil3_num, oil3_img"
				   + ", oilp1_name, oilp1_num, oilp1_img, oilp2_name, oilp2_num, oilp2_img, oilp3_name, oilp3_num, oilp3_img"
				   + ", oils1_name, oils1_num, oils1_img, oils2_name, oils2_num, oils2_img, recentDtP"
				   + ", station1_name, station1_num, station1_img, station2_name, station2_num, station2_img, station3_name, station3_num, station3_img"
				   + ", lpg1_name, lpg1_num, lpg1_img, lpg2_name, lpg2_num, lpg2_img ,REGI_DAT, ACCESS_DATE) "
				   + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
				   + ", ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, TO_CHAR(SYSDATE, 'YYYYMMDD'))"; 			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++,no);
			prestmt.setString(index++,pb.getRecentDt());
			prestmt.setString(index++,pb.getOil1Name());
			prestmt.setString(index++,pb.getOil1Num());
			prestmt.setString(index++,pb.getOil1Img());
			prestmt.setString(index++,pb.getOil2Name());
			prestmt.setString(index++,pb.getOil2Num());
			prestmt.setString(index++,pb.getOil2Img());
			prestmt.setString(index++,pb.getOil3Name());
			prestmt.setString(index++,pb.getOil3Num());
			prestmt.setString(index++,pb.getOil3Img());
			prestmt.setString(index++,pb.getOilp1Name());
			prestmt.setString(index++,pb.getOilp1Num());
			prestmt.setString(index++,pb.getOilp1Img());
			prestmt.setString(index++,pb.getOilp2Name());
			prestmt.setString(index++,pb.getOilp2Num());
			prestmt.setString(index++,pb.getOilp2Img());
			prestmt.setString(index++,pb.getOilp3Name());
			prestmt.setString(index++,pb.getOilp3Num());
			prestmt.setString(index++,pb.getOilp3Img());
			prestmt.setString(index++,pb.getOils1Name());
			prestmt.setString(index++,pb.getOils1Num());
			prestmt.setString(index++,pb.getOils1Img());
			prestmt.setString(index++,pb.getOils2Name());
			prestmt.setString(index++,pb.getOils2Num());
			prestmt.setString(index++,pb.getOils2Img());
			prestmt.setString(index++,pb.getRecentDtP());
			prestmt.setString(index++,pb.getStation1Name());
			prestmt.setString(index++,pb.getStation1Num());
			prestmt.setString(index++,pb.getStation1Img());
			prestmt.setString(index++,pb.getStation2Name());
			prestmt.setString(index++,pb.getStation2Num());
			prestmt.setString(index++,pb.getStation2Img());
			prestmt.setString(index++,pb.getStation3Name());
			prestmt.setString(index++,pb.getStation3Num());
			prestmt.setString(index++,pb.getStation3Img());
			prestmt.setString(index++,pb.getLpg1Name());
			prestmt.setString(index++,pb.getLpg1Num());
			prestmt.setString(index++,pb.getLpg1Img());
			prestmt.setString(index++,pb.getLpg2Name());
			prestmt.setString(index++,pb.getLpg2Num());
			prestmt.setString(index++,pb.getLpg2Img());
			
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
	
	public static boolean deletePetronet(){
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "delete from PETRONET";
				   					
			stmt = con.createStatement();			
			
			stmt.executeUpdate(sql);
			stmt.close();
			result = true;
		} catch (Exception e) {
		    e.printStackTrace();
		    result = false;
		} finally {
			try {
			    if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public static boolean updatePetronet(){
		Connection con = null;
		Statement stmt = null;
		boolean result = false;
		
		try {
			con = DBUtil.getConnection();			
			stmt = con.createStatement();			
			stmt.executeUpdate(" UPDATE PETRONET SET ACCESS_DATE = TO_CHAR(SYSDATE, 'YYYYMMDD') WHERE NO = 1 ");
			stmt.close();
			result = true;
		} catch (Exception e) {
		    e.printStackTrace();
		    result = false;
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
}
