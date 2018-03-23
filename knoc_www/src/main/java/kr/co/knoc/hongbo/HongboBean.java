package kr.co.knoc.hongbo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class HongboBean {
	private int no;
	private String title;
	private String filename;
	private int filesize;
	private String newFilename;
	private String ip;
	private Date RegDate;
	
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getFilename() {
		return this.filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public int getFilesize() {
		return this.filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;		 
	}
	
	public String getNewFilename() {
		return this.newFilename;
	}
	public void setNewFilename(String newFilename) {
		this.newFilename = newFilename;
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
	
	public String getIp() {
		return this.ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
