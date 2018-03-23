package kr.co.knoc.petronet;

import java.net.*;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.io.*;
import java.sql.Driver;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.koroil.KoroilBean;

public class PetronetManager2 {
	public PetronetBean getPetronet(){	
        PetronetBean pb = new PetronetBean();
        
		try {
			System.out.println("############# getPetronet()");
			//String path = "http://www.petronet.co.kr/KNOC/KNOC_home_new.jsp";
			String path = "http://www.petronet.co.kr/KNOC/do_not_use.jsp";
			
			URL testUrl = new URL ( path ) ; 
			URLConnection uc = testUrl.openConnection (  ) ; 
			if  ( uc == null )   {  
				throw new Exception ( "Got a null URLConnection object!" ) ; 
			}  
			InputStream is = uc.getInputStream (  ) ; 
			if  ( is == null )   {  
				throw new Exception ( "Got a null content object!" ) ; 
			}  
			StringBuffer putBackTogether = new StringBuffer (  ) ; 
			Reader r = new InputStreamReader ( is, "euc-kr" ) ; 
			char [  ]  cb = new char [ 2048 ] ; 
			
			
			int amtRead = r.read ( cb ) ; 
			while  ( amtRead  >  0 )   {  
				putBackTogether.append ( cb, 0, amtRead ) ; 
				amtRead = r.read ( cb ) ; 
			}  
			String pageSource = putBackTogether.toString (  ) ; 
			
			
			if (pageSource != null && !"".equals(pageSource)) {
				
				pageSource=pageSource.substring(pageSource.indexOf("recentDt"), pageSource.length());
				
				//System.out.println("=============>"+pageSource);
				
				String[] content = pageSource.split("<br>");
				String pageS1 = content[0];
				String[] recentDtArray = pageS1.split(":");
				String recentDt = recentDtArray[1];//날짜
				
				//원유현물
				String[] oilArray = content[1].split("/");
				String oil1_name = oilArray[0];
				String oil1_num = oilArray[1];
				String oil1_img = oilArray[2];
				oil1_img = content[1].substring(content[1].indexOf(oil1_img),content[1].length());
				
				oilArray = content[2].split("/");
				String oil2_name = oilArray[0];
				String oil2_num = oilArray[1];
				String oil2_img = oilArray[2];
				oil2_img = content[2].substring(content[2].indexOf(oil2_img),content[2].length());
				
				oilArray = content[3].split("/");
				String oil3_name = oilArray[0];
				String oil3_num = oilArray[1];
				String oil3_img = oilArray[2];
				oil3_img = content[3].substring(content[3].indexOf(oil3_img),content[3].length());
			
				//석유제품
				oilArray = content[4].split("/");
				String oilp1_name = oilArray[0];
				String oilp1_num = oilArray[1];
				String oilp1_img = oilArray[2];
				oilp1_img = content[4].substring(content[4].indexOf(oilp1_img),content[4].length());
				
				oilArray = content[5].split("/");
				String oilp2_name = oilArray[0];
				String oilp2_num = oilArray[1];
				String oilp2_img = oilArray[2];
				oilp2_img = content[5].substring(content[5].indexOf(oilp2_img),content[5].length());
				
				oilArray = content[6].split("/");
				String oilp3_name = oilArray[0];
				String oilp3_num = oilArray[1];
				String oilp3_img = oilArray[2];
				oilp3_img = content[6].substring(content[6].indexOf(oilp3_img),content[6].length());
				
				//원유선물
				oilArray = content[7].split("/");
				String oils1_name = oilArray[0];
				String oils1_num = oilArray[1];
				String oils1_img = oilArray[2];
				oils1_img = content[7].substring(content[7].indexOf(oils1_img),content[7].length());
				
				oilArray = content[8].split("/");
				String oils2_name = oilArray[0];
				String oils2_num = oilArray[1];
				String oils2_img = oilArray[2];
				oils2_img = content[8].substring(content[8].indexOf(oils2_img),content[8].length());
				
				//국내기간
				String recentDtP = content[9].substring(content[9].indexOf("recentDt-")+9,content[9].length());
				
				//주유소판매
				oilArray = content[10].split("/");
				String station1_name = oilArray[0];
				String station1_num = oilArray[1];
				String station1_img = oilArray[2];
				station1_img = content[10].substring(content[10].indexOf(station1_img),content[10].length());
				
				oilArray = content[11].split("/");
				String station2_name = oilArray[0];
				String station2_num = oilArray[1];
				String station2_img = oilArray[2];
				station2_img = content[11].substring(content[11].indexOf(station2_img),content[11].length());
				
				oilArray = content[12].split("/");
				String station3_name = oilArray[0];
				String station3_num = oilArray[1];
				String station3_img = oilArray[2];
				station3_img = content[12].substring(content[12].indexOf(station3_img),content[12].length());
				
				//LPG판매
				oilArray = content[13].split("/");
				String lpg1_name = oilArray[0];
				String lpg1_num = oilArray[1];
				String lpg1_img = oilArray[2];
				lpg1_img = content[13].substring(content[13].indexOf(lpg1_img),content[13].length());
				
				oilArray = content[14].split("/");
				String lpg2_name = oilArray[0];
				String lpg2_num = oilArray[1];
				String lpg2_img = oilArray[2];
				lpg2_img = content[14].substring(content[14].indexOf(lpg2_img),content[14].length());
				
				pb.setRecentDt(recentDt.trim());
				pb.setOil1Name(oil1_name.trim());
				pb.setOil1Num(oil1_num.trim());
				pb.setOil1Img(oil1_img.trim());
				pb.setOil2Name(oil2_name.trim());
				pb.setOil2Num(oil2_num.trim());
				pb.setOil2Img(oil2_img.trim());
				pb.setOil3Name(oil3_name.trim());
				pb.setOil3Num(oil3_num.trim());
				pb.setOil3Img(oil3_img.trim());
				pb.setOilp1Name(oilp1_name.trim());
				pb.setOilp1Num(oilp1_num.trim());
				pb.setOilp1Img(oilp1_img.trim());
				pb.setOilp2Name(oilp2_name.trim());
				pb.setOilp2Num(oilp2_num.trim());
				pb.setOilp2Img(oilp2_img.trim());
				pb.setOilp3Name(oilp3_name.trim());
				pb.setOilp3Num(oilp3_num.trim());
				pb.setOilp3Img(oilp3_img.trim());
				pb.setOils1Name(oils1_name.trim());
				pb.setOils1Num(oils1_num.trim());
				pb.setOils1Img(oils1_img.trim());
				pb.setOils2Name(oils2_name.trim());
				pb.setOils2Num(oils2_num.trim());
				pb.setOils2Img(oils2_img.trim());
				pb.setRecentDtP(recentDtP.trim());
				pb.setStation1Name(station1_name.trim());
				pb.setStation1Num(station1_num.trim());
				pb.setStation1Img(station1_img.trim());
				pb.setStation2Name(station2_name.trim());
				pb.setStation2Num(station2_num.trim());
				pb.setStation2Img(station2_img.trim());
				pb.setStation3Name(station3_name.trim());
				pb.setStation3Num(station3_num.trim());
				pb.setStation3Img(station3_img.trim());
				pb.setLpg1Name(lpg1_name.trim());
				pb.setLpg1Num(lpg1_num.trim());
				pb.setLpg1Img(lpg1_img.trim());
				pb.setLpg2Name(lpg2_name.trim());
				pb.setLpg2Num(lpg2_num.trim());
				pb.setLpg2Img(lpg2_img.trim());
				
				//System.out.println(pb.toString());
				boolean result = PetronetInsert.deletePetronet();
				result = PetronetInsert.insertPetronet(pb);
				
			}	
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return pb;
	}
	
	public HashMap<String, Object> getPetroView(){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		PetronetBean petrob = new PetronetBean();
		
		HashMap<String, Object> hash2 = new HashMap<String, Object>();
		
		try {
			con = DBUtil.getConnection();		
			
			String sql =  "SELECT RECENTDT, OIL1_NAME, OIL1_NUM, OIL1_IMG, OIL2_NAME, OIL2_NUM, OIL2_IMG, OIL3_NAME, OIL3_NUM, OIL3_IMG, "; 
			 	   sql +=  "OILP1_NAME, OILP1_NUM, OILP1_IMG, OILP2_NAME, OILP2_NUM, OILP2_IMG, OILP3_NAME, OILP3_NUM, OILP3_IMG, "; 
			 	   sql +=  "OILS1_NAME, OILS1_NUM, OILS1_IMG, OILS2_NAME, OILS2_NUM, OILS2_IMG , REGI_DAT,  TO_CHAR(REGI_DAT,'YYYYMMDD') AS  REGI_DAT_STR, ACCESS_DATE "; 
				   sql += "  FROM PETRONET ";
				   				
			prestmt = con.prepareStatement(sql);
			rs = prestmt.executeQuery();
			
			if (rs.next()) {
				petrob.setRecentDt(rs.getString("RECENTDT"));
				petrob.setOil1Name(rs.getString("OIL1_NAME"));
				petrob.setOil1Num(rs.getString("OIL1_NUM"));
				petrob.setOil1Img(rs.getString("OIL1_IMG"));
				petrob.setOil2Name(rs.getString("OIL2_NAME"));
				petrob.setOil2Num(rs.getString("OIL2_NUM"));
				petrob.setOil2Img(rs.getString("OIL2_IMG"));
				petrob.setOil3Name(rs.getString("OIL3_NAME"));
				petrob.setOil3Num(rs.getString("OIL3_NUM"));
				petrob.setOil3Img(rs.getString("OIL3_IMG"));
				petrob.setOilp1Name(rs.getString("OILP1_NAME"));
				petrob.setOilp1Num(rs.getString("OILP1_NUM"));
				petrob.setOilp1Img(rs.getString("OILP1_IMG"));
				petrob.setOilp2Name(rs.getString("OILP2_NAME"));
				petrob.setOilp2Num(rs.getString("OILP2_NUM"));
				petrob.setOilp2Img(rs.getString("OILP2_IMG"));
				petrob.setOilp3Name(rs.getString("OILP3_NAME"));
				petrob.setOilp3Num(rs.getString("OILP3_NUM"));
				petrob.setOilp3Img(rs.getString("OILP3_IMG"));
				petrob.setOils1Name(rs.getString("OILS1_NAME"));
				petrob.setOils1Num(rs.getString("OILS1_NUM"));
				petrob.setOils1Img(rs.getString("OILS1_IMG"));
				petrob.setOils2Name(rs.getString("OILS2_NAME"));
				petrob.setOils2Num(rs.getString("OILS2_NUM"));
				petrob.setOils2Img(rs.getString("OILS2_IMG"));
				petrob.setRegi_date(rs.getString("REGI_DAT_STR"));
				petrob.setAccess_date(rs.getString("ACCESS_DATE"));
			}
			
			hash2.put("petroBean", petrob);
			
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
			
		} catch (Exception e) {
		    //e.printStackTrace();
		} finally {
			try {
			    if (rs != null) rs.close();
				if (prestmt != null) prestmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
				//e.printStackTrace();
			}
		}
		return hash2;
	}
	
}
