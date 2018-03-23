package kr.co.knoc.search;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class SearchBean {
	private int no;
	private String boardid;
	private int bno;
	private String boardname;
	private String subject;
	private String content;
	private String url;
	private Date RegDate;
	private String is_delete;
	private String grp;
	
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getBoardid() {
		return this.boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	
	public int getBno() {
		return this.bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getBoardname() {
		return this.boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	
	public String getSubject() {
		return this.subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getContent() {
		return this.content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getUrl() {
		return this.url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getIsDelete() {
		return this.is_delete;
	}
	public void setIsDelete(String is_delete) {
		this.is_delete = is_delete;
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
	
	public String getGrp() {
		return this.grp;
	}
	public void setGrp(String grp) {
		this.grp = grp;
	}
}
