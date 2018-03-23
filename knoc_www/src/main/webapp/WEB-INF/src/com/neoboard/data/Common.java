package com.neoboard.data;

import java.io.Serializable;

public class Common implements Serializable {
	/**
	 * 고유번호
	 */
	int no;
	/**
	 * 구분
	 */
	String comGubun;
	/**
	 * 명칭
	 */
	String comName;	
	/**
	 * 아이디
	 */
	String comID;
	/** 
	 * 등록 시간 ( yyyyMMddHHmmss )
	 */
	String regDateTime;
	
	public Common(){
		this.no = 0;
		this.comGubun = "";
		this.comName = "";
		this.comID = "";
		this.regDateTime = "";	
	}

	/**
	 * @return the regDateTime
	 */
	public String getRegDateTime() {
		return regDateTime;
	}

	/**
	 * @param regDateTime the regDateTime to set
	 */
	public void setRegDateTime(String regDateTime) {
		this.regDateTime = regDateTime;
	}

	/**
	 * @return the comGubun
	 */
	public String getComGubun() {
		return comGubun;
	}

	/**
	 * @param comGubun the comGubun to set
	 */
	public void setComGubun(String comGubun) {
		this.comGubun = comGubun;
	}

	/**
	 * @return the comName
	 */
	public String getComName() {
		return comName;
	}

	/**
	 * @param comName the comName to set
	 */
	public void setComName(String comName) {
		this.comName = comName;
	}

	/**
	 * @return the comID
	 */
	public String getComID() {
		return comID;
	}

	/**
	 * @param comID the comID to set
	 */
	public void setComID(String comID) {
		this.comID = comID;
	}
	
	/**
	 * @return the no
	 */
	public int getNo() {
		return no;
	}

	/**
	 * @param no the no to set
	 */
	public void setNo(int no) {
		this.no = no;
	}
}
