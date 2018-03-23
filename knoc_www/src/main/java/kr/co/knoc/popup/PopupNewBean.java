package kr.co.knoc.popup;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class PopupNewBean {
	private int no;
	private String start_date;
	private String end_date;
	private String visibility;
	private String title;
	private String content;
	private int width;
	private int height;
	private String scroll;
	private String cookie;
	private Date RegDate;
	
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getStartDate() {
		return this.start_date;
	}
	public void setStartDate(String start_date) {
		this.start_date = start_date;
	}
	
	public String getEndDate() {
		return this.end_date;
	}
	public void setEndDate(String end_date) {
		this.end_date = end_date;
	}
	
	public String getVisibility() {
		return this.visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
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
	
	public int getWidth() {
		return this.width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	
	public int getHeight() {
		return this.height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	
	public String getScroll() {
		return this.scroll;
	}
	public void setScroll(String scroll) {
		this.scroll = scroll;
	}
	
	public String getCookie() {
		return this.cookie;
	}
	public void setCookie(String cookie) {
		this.cookie = cookie;
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
