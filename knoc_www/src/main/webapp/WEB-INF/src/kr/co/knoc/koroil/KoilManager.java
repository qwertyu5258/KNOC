package kr.co.knoc.koroil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import kr.co.knoc.domestic.xml.OilDateXmlParser;
import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.sague.SagueBean;
import kr.co.knoc.sague.SagueFileBean;


public class KoilManager {
	public KoroilBean getKoroil(){
		KoroilBean kb = new KoroilBean();
		
		try {
			/**
			 * 수정일 : 2015.03.25
			 * 수정자 : 마용민 (milgam12@inplusweb.com)
			 * 내  용 : 오피넷에서 제공하는 xml 파일의 format 이 변경됨
			 */
			System.out.println("############# getKoroil");
			OilDateXmlParser dateXmlParser=new OilDateXmlParser("http://www.opinet.co.kr/cp/avgPrice.do");
			List<HashMap<String, String>> resultList = dateXmlParser.getDomestic_oildataByInplus("item");
			
			String recentDt = "";
			
			String gas_name = "휘발유";			
			String gas_num = "";
			String gas_rate = "";
			
			String via_name	= "자동차용경유";
			String via_num = "";
			String via_rate	= "";
			
			String butane_name = "자동차용부탄";	
			String butain_num = "";	
			String butain_rate = "";
			
			for(int i = 0 ; i < resultList.size() ; i++) {
				
				HashMap itemMap = (HashMap)resultList.get(i);				
				recentDt	= (String)itemMap.get("DATE");				
				String name = (String)itemMap.get("PRODNM");
				
				if(name.equals(gas_name)) {					
					gas_num		= (String)itemMap.get("PRICE");
					gas_rate	= (String)itemMap.get("DIFF");
				} else if(name.equals(via_name)) {					
					via_num		= (String)itemMap.get("PRICE");
					via_rate	= (String)itemMap.get("DIFF");
				} else if(name.equals(butane_name)) {					
					butain_num		= (String)itemMap.get("PRICE");
					butain_rate	= (String)itemMap.get("DIFF");
				}
			}
			
			kb.setRecentdt(recentDt.trim());
			kb.setGas_name(gas_name);
			kb.setGas_num(gas_num.trim());
			kb.setGas_rate(gas_rate.trim());
			kb.setVia_name(via_name);
			kb.setVia_num(via_num.trim());
			kb.setVia_rate(via_rate.trim());
			kb.setButane_name(butane_name);
			kb.setButain_num(butain_num.trim());
			kb.setButain_rate(butain_rate.trim());
			
			boolean result = KorInsert.deleteKor();
			result = KorInsert.insertKor(kb);
			//boolean result = KorInsert.insertKor(kb);
			
			System.out.println("Update OK");
			
			/*
			System.out.println("############# getKoroil");
			OilDateXmlParser dateXmlParser=new OilDateXmlParser("http://www.opinet.co.kr/dashboard/knoc/domestic_oildata.jsp");
			List<HashMap<String, String>> dayList1=dateXmlParser.getDomestic_oildata("group1_1");
			List<HashMap<String, String>> dayList2=dateXmlParser.getDomestic_oildata("group1_2");
			List<HashMap<String, String>> dayList3=dateXmlParser.getDomestic_oildata("group1_3");
			
			String gas_name = "";
			String recentDt = "";
			String gas_num = "";
			String gas_rate = "";
			String via_name	= "";
			String via_num = "";
			String via_rate	= "";
			String butane_name = "";	
			String butain_num = "";	
			String butain_rate = "";
			
			for(int j=0; j<dayList1.size(); j++){
				HashMap hashMap=(HashMap) dayList1.get(j);
				
				gas_name = "휘발유";
				recentDt = (String)hashMap.get("value3");
				gas_num = (String)hashMap.get("value2");
				gas_rate = (String)hashMap.get("value1");
			}
			for(int j=0; j<dayList2.size(); j++){
				HashMap hashMap=(HashMap) dayList2.get(j);
				
				via_name = "자동차용경유";
				via_num = (String)hashMap.get("value2");
				via_rate = (String)hashMap.get("value1");
			}
			for(int j=0; j<dayList3.size(); j++){
				HashMap hashMap=(HashMap) dayList3.get(j);
				
				butane_name = "자동차용부탄";
				butain_num = (String)hashMap.get("value2");
				butain_rate = (String)hashMap.get("value1");
			}
			
			kb.setRecentdt(recentDt.trim());
			kb.setGas_name(gas_name);
			kb.setGas_num(gas_num.trim());
			kb.setGas_rate(gas_rate.trim());
			kb.setVia_name(via_name);
			kb.setVia_num(via_num.trim());
			kb.setVia_rate(via_rate.trim());
			kb.setButane_name(butane_name);
			kb.setButain_num(butain_num.trim());
			kb.setButain_rate(butain_rate.trim());
			
			boolean result = KorInsert.deleteKor();
			result = KorInsert.insertKor(kb);
			*/
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return kb;
	}
	
	/**
	 * 수정일 : 2015.03.27
	 * 수정자 : 마용민 (milgam12@inplusweb.com)
	 * 내  용 : 국내유가를 DB를 거치지 않고 바로 가지고 오기
	 */
	
	public KoroilBean getKoroil2(){
		KoroilBean kb = new KoroilBean();
		
		try {			
			System.out.println("############# getKoroil");
			OilDateXmlParser dateXmlParser=new OilDateXmlParser("http://www.opinet.co.kr/cp/avgPrice.do");
			List<HashMap<String, String>> resultList = dateXmlParser.getDomestic_oildataByInplus("item");
			
			String recentDt = "";
			
			String gas_name = "휘발유";			
			String gas_num = "";
			String gas_rate = "";
			
			String via_name	= "자동차용경유";
			String via_num = "";
			String via_rate	= "";
			
			String butane_name = "자동차용부탄";	
			String butain_num = "";	
			String butain_rate = "";
			
			for(int i = 0 ; i < resultList.size() ; i++) {
				
				HashMap itemMap = (HashMap)resultList.get(i);				
				recentDt	= (String)itemMap.get("DATE");				
				String name = (String)itemMap.get("PRODNM");
				
				if(name.equals(gas_name)) {					
					gas_num		= (String)itemMap.get("PRICE");
					gas_rate	= (String)itemMap.get("DIFF");
				} else if(name.equals(via_name)) {					
					via_num		= (String)itemMap.get("PRICE");
					via_rate	= (String)itemMap.get("DIFF");
				} else if(name.equals(butane_name)) {					
					butain_num		= (String)itemMap.get("PRICE");
					butain_rate	= (String)itemMap.get("DIFF");
				}
			}
			
			kb.setRecentdt(recentDt.trim());
			kb.setGas_name(gas_name);
			kb.setGas_num(gas_num.trim());
			kb.setGas_rate(gas_rate.trim());
			kb.setVia_name(via_name);
			kb.setVia_num(via_num.trim());
			kb.setVia_rate(via_rate.trim());
			kb.setButane_name(butane_name);
			kb.setButain_num(butain_num.trim());
			kb.setButain_rate(butain_rate.trim());			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return kb;
	}
	
	public HashMap<String, Object> getKoroilView(){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		
		KoroilBean korb = new KoroilBean();
		
		HashMap<String, Object> hash = new HashMap<String, Object>();
		
		try {
			con = DBUtil.getConnection();		
			
			String sql =  "SELECT RECENTDT, GAS_NAME, GAS_NUM, GAS_RATE, VIA_NAME, VIA_NUM, VIA_RATE, BUTANE_NAME, BUTAIN_NUM, BUTAIN_RATE, ACCESS_DATE "; 
				   sql += "  FROM KOR_OIL ";
				   				
			prestmt = con.prepareStatement(sql);
			rs = prestmt.executeQuery();
			
			if (rs.next()) {
				korb.setRecentdt(rs.getString("RECENTDT"));
				korb.setGas_name(rs.getString("GAS_NAME"));
				korb.setGas_num(rs.getString("GAS_NUM"));
				korb.setGas_rate(rs.getString("GAS_RATE"));
				korb.setVia_name(rs.getString("VIA_NAME"));
				korb.setVia_num(rs.getString("VIA_NUM"));
				korb.setVia_rate(rs.getString("VIA_RATE"));
				korb.setButane_name(rs.getString("BUTANE_NAME"));
				korb.setButain_num(rs.getString("BUTAIN_NUM"));
				korb.setButain_rate(rs.getString("BUTAIN_RATE"));
				korb.setAccess_date(rs.getString("ACCESS_DATE"));
			}
			
			hash.put("korBean", korb);
			
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
				e.printStackTrace();
			}
		}
		return hash;
	}
	
}
