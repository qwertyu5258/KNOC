package com.neoboard.log;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;

public class NeoboardLogBean {
	private String boardid = "";
	private int bno = 0;
	private int logno = 0;
	private String log_query = "";
	private String user_id = "";
	private String user_name = "";
	private Date log_regdt;
	private String conn_ip = "";
	
	public String getBoardID() {
		return this.boardid;
	}
	public void setBoardID(String value) {
		this.boardid = value;
	}
	
	public int getBno() {
		return this.bno;
	}
	public void setBno(int value) {
		this.bno = value;
	}
	
	public int getLogno() {
		return this.logno;
	}
	public void setLogno(int value) {
		this.logno = value;
	}
	
	public String getLogQuery() {
		return this.log_query;
	}
	public void setLogQuery(String value) {
		this.log_query = value;
	}
	
	public String getUserID() {
		return this.user_id;
	}
	public void setUserID(String value) {
		this.user_id = value;
	} 
	
	public String getUserName() {
		return this.user_name;
	}
	public void setUserName(String value) {
		this.user_name = value;
	}
	
	public Date getLogRegdt() {
		if(this.log_regdt == null) return new Date();
		else return this.log_regdt;
	}
	public void setLogRegdt(Date value) {
		this.log_regdt = value;
	}
	public String getLogRegdtString() {
		return getLogRegdtString("yyyy-MM-dd HH:mm:ss");
	}
	public String getLogRegdtString(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		if(this.log_regdt == null) return df.format(new Date());
		return df.format(this.log_regdt);
	}
	public void setLogRegdtString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.log_regdt = df.parse(value);
	    }catch(ParseException e) { ; }
	}	
	
	public String getConnIp() {
		return this.conn_ip;
	}
	public void setConnIp(String value) {
		this.conn_ip = value;
	}
}
