package kr.co.knoc.faq;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class FaqBean {
	private int no;
	private String menu;
	private String gubun;
	private String title;
	private String content;
	private Date RegDate;
	
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getMenu() {
		return this.menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	public String getGubun() {
		return this.gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	
	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return this.content;
	}
	public void setContent(String content) {
		this.content = content;
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
}
