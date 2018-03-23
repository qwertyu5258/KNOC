package kr.co.knoc.postbox;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class PostBoxBean {
	private int no;
	private String id;
	private String pwd;
	private String title;
	private String content;
	private Date RegDate;
	private String answer;
	private Date AnswerDate;
	private int hitcount;
	private String mobile;
	private String email;
	private String name;
	private String answerdate;
	
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return this.id;
	}
	public void setId(String value) {
		this.id = value;
	}
	
	public String getPwd() {
		return this.pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	
	public String getAnswer() {
		return this.answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public int getHitcount() {
		return this.hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
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
	
	public void setAnswerDate(Date AnswerDate) {
		this.AnswerDate = AnswerDate;
	}
	public String getAnswerDateString() {
		return getAnswerDateString("yyyy-MM-dd HH:mm:ss");
	}
	public String getAnswerDateString(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		if(AnswerDate == null) return df.format(new Date());
		return df.format(this.AnswerDate);
	}
	public void setAnswerDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.AnswerDate = df.parse(value);
	    }catch(ParseException e) { ; }
	}
	
	public String getAnswerDate() {
		return this.answerdate;
	}
	public void setAnswerDate(String answerdate) {
		this.answerdate = answerdate;
	}
	
	public String getMobile() {
		return this.mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return this.email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
