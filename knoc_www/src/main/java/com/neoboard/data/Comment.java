package com.neoboard.data;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.neoboard.tags.XSSProtect;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class Comment implements Serializable {
    private int no;
	private int bno;
	private String id;
	private String name;
	private String passwd;
	private String comment;
	private String ip;
	private Date regDate;
	
	public Comment() {
		this.no = 0;
		this.bno = 0;
		this.id = "";
		this.name = "";
		this.passwd = "";
		this.comment = "";
		this.ip = "";
		this.regDate = new Date();
	}
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getBno() {
		return this.bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getId() {
		return this.id;
	}
	public void setId(String id) {
	    if(id == null) id = "";
		this.id = id;
	}
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = XSSProtect.ReplaceTag(name);
	}
	
	public String getPasswd() {
		return this.passwd;
	}
	public void setPasswd(String passwd) {
	    if(passwd == null) passwd = "";
		this.passwd = passwd;
	}
	
	public String getComment() {
		return this.comment;
	}
	public void setComment(String comment) {
		this.comment = XSSProtect.ReplaceTag(comment);
	}
	
	public String getIp() {
		return this.ip;
	}
	public void setIp(String ip) {
		this.ip = XSSProtect.ReplaceTag(ip);
	}
	public Date getRegDate() { return this.regDate; }
	public void setRegDate(Date value) { this.regDate = value; }
	public String getRegDateString(String format) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    return df.format(this.regDate);
	}
	public void setRegDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.regDate = df.parse(value);
	    }catch(ParseException e) { ; }
	}
}
