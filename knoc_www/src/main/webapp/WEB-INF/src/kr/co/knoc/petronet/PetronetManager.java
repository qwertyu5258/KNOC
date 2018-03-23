package kr.co.knoc.petronet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.co.knoc.jdbc.DBUtil;

public class PetronetManager {		
	public PetronetBean getPetronet(){
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		PetronetBean pb = new PetronetBean();
		
		try {
			con = DBUtil.getConnection();			
			
			String sql = "select * from PETRONET";
				   				
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pb.setNo(rs.getInt("no"));
				pb.setRecentDt(rs.getString("recentDt"));
				pb.setOil1Name(rs.getString("oil1_name"));
				pb.setOil1Num(rs.getString("oil1_num"));
				pb.setOil1Img(rs.getString("oil1_img"));
				pb.setOil2Name(rs.getString("oil2_name"));
				pb.setOil2Num(rs.getString("oil2_num"));
				pb.setOil2Img(rs.getString("oil2_img"));
				pb.setOil3Name(rs.getString("oil3_name"));
				pb.setOil3Num(rs.getString("oil3_num"));
				pb.setOil3Img(rs.getString("oil3_img"));
				pb.setOilp1Name(rs.getString("oilp1_name"));
				pb.setOilp1Num(rs.getString("oilp1_num"));
				pb.setOilp1Img(rs.getString("oilp1_img"));
				pb.setOilp2Name(rs.getString("oilp2_name"));
				pb.setOilp2Num(rs.getString("oilp2_num"));
				pb.setOilp2Img(rs.getString("oilp2_img"));
				pb.setOilp3Name(rs.getString("oilp3_name"));
				pb.setOilp3Num(rs.getString("oilp3_num"));
				pb.setOilp3Img(rs.getString("oilp3_img"));
				pb.setOils1Name(rs.getString("oils1_name"));
				pb.setOils1Num(rs.getString("oils1_num"));
				pb.setOils1Img(rs.getString("oils1_img"));
				pb.setOils2Name(rs.getString("oils2_name"));
				pb.setOils2Num(rs.getString("oils2_num"));
				pb.setOils2Img(rs.getString("oils2_img"));
				pb.setRecentDtP(rs.getString("recentDtP"));
				pb.setStation1Name(rs.getString("station1_name"));
				pb.setStation1Num(rs.getString("station1_num"));
				pb.setStation1Img(rs.getString("station1_img"));
				pb.setStation2Name(rs.getString("station2_name"));
				pb.setStation2Num(rs.getString("station2_num"));
				pb.setStation2Img(rs.getString("station2_img"));
				pb.setStation3Name(rs.getString("station3_name"));
				pb.setStation3Num(rs.getString("station3_num"));
				pb.setStation3Img(rs.getString("station3_img"));
				pb.setLpg1Name(rs.getString("lpg1_name"));
				pb.setLpg1Num(rs.getString("lpg1_num"));
				pb.setLpg1Img(rs.getString("lpg1_img"));
				pb.setLpg2Name(rs.getString("lpg2_name"));
				pb.setLpg2Num(rs.getString("lpg2_num"));
				pb.setLpg2Img(rs.getString("lpg2_img"));										
			}
			rs.close(); rs = null;
			stmt.close(); stmt = null;
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
		return pb;
	}	
}
