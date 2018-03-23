package kr.co.knoc.content;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MenuBean {
	private int no;
	private String mcode;
	private String name;
	private String url;
	private String status;
	private Date RegDate;
	private int listnum1;
	private int listnum2;
	private int listnum3;
	private int accessCnt;
	
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getMCode() {
		return this.mcode;
	}
	public void setMCode(String mcode) {
		this.mcode = mcode;
	}
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getUrl() {
		return this.url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getStatus() {
		return this.status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void setRegDate(Date RegDate) {
		this.RegDate = RegDate;
	}
	public String getRegDateString() {
		return getRegDateString("yyyy-MM-dd HH:mm:ss");
	}
	public String getRegDateString(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		if(RegDate == null) return df.format(new Date());
		return df.format(this.RegDate);
	}
	public void setRegDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.RegDate = df.parse(value);
	    }catch(ParseException e) { ; }
	}
	
	public int getListnum1() {
		return this.listnum1;
	}
	public void setListnum1(int listnum1) {
		this.listnum1 = listnum1;
	}
	
	public int getListnum2() {
		return this.listnum2;
	}
	public void setListnum2(int listnum2) {
		this.listnum2 = listnum2;
	}
	
	public int getListnum3() {
		return this.listnum3;
	}
	public void setListnum3(int listnum3) {
		this.listnum3 = listnum3;
	}
	
	public int getAccessCnt() {
		return this.accessCnt;
	}
	public void setAccessCnt(int accessCnt) {
		this.accessCnt = accessCnt;
	}
}
