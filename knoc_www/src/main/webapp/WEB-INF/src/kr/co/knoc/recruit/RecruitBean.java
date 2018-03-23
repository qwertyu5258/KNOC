package kr.co.knoc.recruit;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class RecruitBean {
	private int no;
	private String id;
	private String name;
	private String company;
	private String email;
	private String phone;
	private String mobile;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String visitDate;
	private int person;
	private String content;
	private String ip;
	private Date RegDate;
	
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return this.id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCompany() {
		return this.company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getEmail() {
		return this.email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return this.phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getMobile() {
		return this.mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getZipcode() {
		return this.zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	public String getAddr1() {
		return this.addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	
	public String getAddr2() {
		return this.addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	public String getVisitDate() {
		return this.visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	
	public int getPerson() {
		return this.person;
	}
	public void setPerson(int person) {
		this.person = person;
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
	
	public String getIp() {
		return this.ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
