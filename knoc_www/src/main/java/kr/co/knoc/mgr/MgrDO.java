package kr.co.knoc.mgr;

import java.util.ArrayList;

public class MgrDO {
	/**
	 * 회원 ID
	 */
	String id;
	/**
	 * 비밀번호
	 */
	String passwd;	
	/**
	 * 관리자의 등급 레벨
	 */
	String level;
	/**
	 * 이름
	 */
	String name;
	/**
	 * 전화번호
	 */
	String phoneNumber;
	/**
	 * 핸드폰번호
	 */
	String mobileNumber;
	/**
	 * 이메일
	 */
	String email;
	/** 
	 * 가입일자 시간 ( yyyyMMddHHmmss )
	 */
	String joinDateTime;
	/**
	 * 마지막 로그인 시간 ( yyyyMMddHHmmss )
	 */
	String lastLoginDateTime;
	/**
	 * ip
	 */
	String ip;
	/**
	 * 우편번호
	 */
	String zipcode;
	/**
	 * 주소
	 */
	String addr1;
	/**
	 * 상세주소
	 */
	String addr2;
	/**
	 * 이메일수신
	 */
	String letter;
	/**
	 * 직업
	 */
	String job;
	/**
	 * G-PIN 가상 키코드
	 */
	String virtualno;
	/**
	 * 현황 날짜
	 */
	String date;
	/**
	 * 카운트
	 */
	int count;
	
	int CntError;
	
	public MgrDO(){
		this.id = "";
		this.level = "9";
		this.name = "";
		this.phoneNumber = "";
		this.mobileNumber = "";
		this.email = "";
		this.joinDateTime = "";
		this.lastLoginDateTime = "";
		this.ip = "";
		this.zipcode = "";
		this.addr1 = "";
		this.addr2 = "";
		this.letter = "";
		this.job = "";
		this.virtualno = "";
		this.date = "";
		this.count = 0;
		this.CntError = 0;
	}

	/**
	 * @return the joinDateTime
	 */
	public String getJoinDateTime() {
		return joinDateTime;
	}

	/**
	 * @param joinDateTime the joinDateTime to set
	 */
	public void setJoinDateTime(String joinDateTime) {
		this.joinDateTime = joinDateTime;
	}

	/**
	 * @return the ip
	 */
	public String getIp() {
		return ip;
	}

	/**
	 * @param ip the ip to set
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}

	/**
	 * @return the lastLoginDateTime
	 */
	public String getLastLoginDateTime() {
		return lastLoginDateTime;
	}

	/**
	 * @param lastLoginDateTime the lastLoginDateTime to set
	 */
	public void setLastLoginDateTime(String lastLoginDateTime) {
		this.lastLoginDateTime = lastLoginDateTime;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	
	/**
	 * @return the mobileNumber
	 */
	public String getMobileNumber() {
		return mobileNumber;
	}

	/**
	 * @param mobileNumber the mobileNumber to set
	 */
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the level
	 */
	public String getLevel() {
		return level;
	}

	/**
	 * @param level the level to set
	 */
	public void setLevel(String level) {
		this.level = level;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	

	/**
	 * @return the passwd
	 */
	public String getPasswd() {
		return passwd;
	}
	

	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	/**
	 * @return the zipcode
	 */
	public String getZipcode() {
		return zipcode;
	}
	

	/**
	 * @param zipcode the zipcode to set
	 */
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	/**
	 * @return the addr1
	 */
	public String getAddr1() {
		return addr1;
	}
	

	/**
	 * @param addr1 the addr1 to set
	 */
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	
	/**
	 * @return the addr2
	 */
	public String getAddr2() {
		return addr2;
	}
	

	/**
	 * @param addr2 the addr2 to set
	 */
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	/**
	 * @return the letter
	 */
	public String getLetter() {
		return letter;
	}
	

	/**
	 * @param letter the letter to set
	 */
	public void setLetter(String letter) {
		this.letter = letter;
	}
	
	/**
	 * @return the job
	 */
	public String getJob() {
		return job;
	}
	

	/**
	 * @param job the job to set
	 */
	public void setJob(String job) {
		this.job = job;
	}
	
	/**
	 * @return the virtualno
	 */
	public String getVirtualno() {
		return virtualno;
	}
	

	/**
	 * @param virtualno the virtualno to set
	 */
	public void setVirtualno(String virtualno) {
		this.virtualno = virtualno;
	}
	
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}	

	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	
	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}	

	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}

	/**
	 * @return the CntError
	 */
	public int getCntError() {
		return CntError;
	}	

	/**
	 * @param CntError the CntError to set
	 */
	public void setCntError(int CntError) {
		this.CntError = CntError;
	}	
}
