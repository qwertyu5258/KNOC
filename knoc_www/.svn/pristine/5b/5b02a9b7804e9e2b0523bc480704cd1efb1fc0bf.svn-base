package com.neoboard.util;

import java.math.BigDecimal;

/**
 * 
 * @author <a href="mailto:ccal@tovices.co.kr">허윤찬</a>
 */
public class NumberConvert {
	/**
	 * 지정된 위치에서 반올림 해주는 메서드
	 * @param dValue
	 * @param sca
	 * @return
	 */
	public static double round(double dValue, int sca){
		try{
			return new BigDecimal(dValue).setScale(sca, BigDecimal.ROUND_HALF_EVEN).doubleValue();
		}catch(Exception e){ return dValue; }
	}

	/**
	 * 지정된 위치에서 올림 해주는 메서드
	 * @param dValue
	 * @param sca
	 * @return
	 */
	public static double roundUp(double dValue, int sca){
		try{
			return new BigDecimal(dValue).setScale(sca, BigDecimal.ROUND_UP).doubleValue();
		}catch(Exception e){ return dValue; }
	}

	/**
	 * 지정된 위치에서 버림 해주는 메서드
	 * @param dValue
	 * @param sca
	 * @return
	 */
	public static double roundDown(double dValue, int sca){
		try{
			return new BigDecimal(dValue).setScale(sca, BigDecimal.ROUND_DOWN).doubleValue();
		}catch(Exception e){ return dValue; }
	}
	/**
	 * 문자열을 화페포멧으로 변환
	 * @param source
	 * @return
	 */
	public static String MakeMoneyFormat(String source){
	  if(source == null||source.equals("")) return "";
	  boolean flag = true;
	  String lsSign="";
	  if(source.charAt(0)=='-'){
		lsSign ="-";
	  }
	  if(source.length() <= 3){
		return Removedeli(source,",-/$.");
	  }else{
		  source = ReversString(Removedeli(source,",-/$."));

		  int i,len = source.length();
		  StringBuffer sb = new StringBuffer(source);
		  for (i=3;len>i;i+=4){
				  sb.insert(i,",");
				  len++;
		  }
		  return lsSign+ReversString(sb.toString());
		}
	}
	public static String Removedeli(String source,String deli){
		  if(source  == null) return "";
		  int i,j,len = source.length(),delilen = deli.length();
		  StringBuffer dest = new StringBuffer(len);
		  boolean lbFlag = true;

		  for(i=0;i<len;i++){
			   lbFlag = true;
				   for(j=0;j<delilen;j++){
						  if(source.charAt(i)==deli.charAt(j)){
							   lbFlag = false;
							   break;
						  }
				   }
			  if(lbFlag)  dest.append(source.charAt(i));

		  }
		  return dest.toString();
	}
	public static  final String ReversString(String source){
		  int i,len = source.length();
		  StringBuffer dest = new StringBuffer(len);
		  for(i=(len-1);i>=0;i--){
				  dest.append(source.charAt(i));
		  }
		  return dest.toString();
	}
}

