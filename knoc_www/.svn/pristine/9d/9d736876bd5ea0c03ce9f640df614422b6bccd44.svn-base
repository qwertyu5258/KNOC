package kr.co.knoc.satisfy;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class SatisfyBean {
	private int no;
	private String mcode;
	private int score1;
	private int score2;
	private int score3;
	private int score4;
	private int score5;
	private String comment;
	private String id;
	private String ip;
	private Date RegDate;
	private int total;
	
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getMcode() {
		return this.mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	
	public int getScore1() {
		return this.score1;
	}
	public void setScore1(int score1) {
		this.score1 = score1;
	}
	
	public int getScore2() {
		return this.score2;
	}
	public void setScore2(int score2) {
		this.score2 = score2;
	}
	
	public int getScore3() {
		return this.score3;
	}
	public void setScore3(int score3) {
		this.score3 = score3;
	}
	
	public int getScore4() {
		return this.score4;
	}
	public void setScore4(int score4) {
		this.score4 = score4;
	}
	
	public int getScore5() {
		return this.score5;
	}
	public void setScore5(int score5) {
		this.score5 = score5;
	}
	
	public String getComment() {
		return this.comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getId() {
		return this.id;	
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getIp() {
		return this.ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
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
	
	public int getTotal() {
		return this.total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
