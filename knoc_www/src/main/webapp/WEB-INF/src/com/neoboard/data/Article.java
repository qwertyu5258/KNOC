package com.neoboard.data;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Date;

import com.neoboard.tags.XSSProtect;



/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class Article implements Serializable{
    /** 글 번호 */
    private int no;
    /** 대표 글번호 */
	private int ref;	
	/** 답변 글 순서 */
	private int refStep;
	/** 답변 글 깊이 */
	private int refLevel;
	/** 사용자 아이디 */
	private String id;
	/** 사용자 이름(게시판 용) */
	private String name;
	/** 사용자 비밀번호(게시판 용) */
	private String passwd;
	/** 글 제목 */
	private String subject;
	/** 작성자 이메일 */
	private String email; 
	/** 글 내용 */
	private String content;
	/** 작성자 IP */
	private String ip;
	/** 작성 일 */
	private Date regDate;
	/** 조회 수 */
	private int hitcnt;
	/** 덧글 수 */
	private int cmtcnt;
	/** 첨부 화일 수 */
	private int filecnt;
	/** 다운로드 수 */
	private int downcnt;
	/** HTML 구분 1:HTML , 0:TEXT */
	private String html;
	/** 공짓글 구분 */
	private String notice;
	/** 비밀글 구분 */
	private String secret;
	/** 첨부화일 목록*/
	private AttachFiles files;
	/** 답변첨부화일 목록*/
	private AttachFiles ans_files;
	/** 덧글 목록 */
	private Comments comments;
	/** 다음글 */
	private Article nextArticle;
	/** 이전 글 */
	private Article prevArticle;
	/** 관련글 */
	private Articles relativeArticles;
	/** 관련글 첨부파일*/
	private AttachFiles relativeFiles;
	/** 전화번호 */
	private String phone;
	/** 우편번호 */
	private String zipcode;
	/** 주소1 */
	private String addr1;
	/** 주소2 */
	private String addr2;
	/** 삭제여부 */
	private String is_delete;
	
	/** 화면 출력용 글 번호 */
	private int seq;
	/** 그룹정보 */
	private String grp;
	/** 동영상 URL */
	private String url;
	
	private String sender;
	
	/** 수정 일 */
	private Date editDate;
	/** 답변 일 **/
	private Date ansDate;
	
	/** 로그 */
	private int logno = 0;
	/** 로그 구분 */
	private String logQuery = "";		
	
	private String rss_yn;
	private String move_bid;
	
	/** 내용구분 **/
	private String contGubun;
	/** 처리상황 **/
	private String status;
	/** 담당부서 **/
	private String buse;
	/** 답변 이메일 **/
	private String ans_email;
	/** 답변 전화번호 **/
	private String ans_phone;
	/** 답변 **/
	private String answer;
	/** 공개형태 **/
	private String view_status;
	/** 수령방법 **/
	private String kind;
	/** 사용목적 **/
	private String object;
	/** 수수료감면 **/
	private String cut;
	/** 수수료감면사유 **/
	private String cut_content;	
	/** 현재페이지 **/
	private String callback;
	/** 직업 **/
	private String job;
	/** G-PIN 가상코드 **/
	private String virtualno;
	
	
	public Article() {
	    this.no = 0;
	    this.ref = 0;
	    this.refStep = 0;
	    this.refLevel = 0;
	    this.id = "";
	    this.name = "";
	    this.passwd = "";
	    this.subject = "";
	    this.content = "";
	    this.email = "";
	    this.ip = "";
	    this.regDate = new Date();
	    this.hitcnt = 0;
	    this.cmtcnt = 0;
	    this.filecnt = 0;
	    this.downcnt = 0;
	    this.html = "1"; // 1:HTML, 0:TEXT
	    this.seq = 1;
	    this.secret = "0"; // 1: 비밀글 , 0: 일반글
	    this.notice = "0"; // 1: 공지글, 0:일반글
	    this.grp = "";
	    this.sender = "";
	    this.phone = "";
	    this.zipcode = "";
	    this.addr1 = "";
	    this.addr2 = "";
	    this.is_delete = "";
	    this.editDate = new Date();
	    this.ansDate = new Date();
	    this.logno = 0;
	    this.logQuery = "";
	    this.rss_yn = "";
	    this.move_bid = "";
	    this.url = "";	    
	    this.contGubun = "";
	    this.status = "";
	    this.buse = "";
	    this.ans_email = "";
	    this.ans_phone = "";
	    this.answer = "";
	    this.view_status = "";
	    this.kind = "";
	    this.object = "";
	    this.cut = "";
	    this.cut_content = "";
	    this.callback = "";
	    this.job = "";
	    this.virtualno = "";
	}
	public String getNotice() {
	    return this.notice;
	}
	public void setNotice(String value) {
	    if(value == null) value = "0";
	    this.notice = value;
	}	
	
	public String getSecret() {
	    return this.secret;
	}
	public void setSecret(String value){
	    if(value == null) value = "0";
	    this.secret = value;
	}
	public int getSeq() { return this.seq; }
	public void setSeq(int value) { this.seq = value; }
	
	public AttachFiles getRelativeFiles() {
	    if(this.relativeFiles == null) this.relativeFiles = new AttachFiles(3);	    
	    return this.relativeFiles;
	}
	public void addRelativeFile(AttachFile rf) {		 
	    if(this.relativeFiles == null) this.relativeFiles = new AttachFiles(3);
	    this.relativeFiles.addAttachFile(rf);
	}
	public AttachFiles getFiles() {
	    if(this.files == null) this.files = new AttachFiles(3);
	    return this.files;
	}
	public void addFile(AttachFile file) {
	    if(this.files == null) this.files = new AttachFiles(3);
	    this.files.addAttachFile(file);
	}
	
	public AttachFiles getAnsFiles() {
	    if(this.ans_files == null) this.ans_files = new AttachFiles(3);
	    return this.ans_files;
	}
	public void addAnsFile(AttachFile file) {
	    if(this.ans_files == null) this.ans_files = new AttachFiles(3);
	    this.ans_files.addAttachFile(file);
	}
	
	public Comments getComments() {
	    if(this.comments == null) this.comments = new Comments(1);
	    return this.comments;
	}
	public void addComment(Comment cmt) {
	    if(this.comments == null) this.comments = new Comments();
	    this.comments.addComment(cmt);
	}
	public Articles getRelativeArticles() {
	    if(this.relativeArticles == null) this.relativeArticles = new Articles(1);
	    return this.relativeArticles;
	}
	public void addRelativeArticle(Article a) {
	    if(this.relativeArticles == null) this.relativeArticles = new Articles();
	    this.relativeArticles.addArticle(a);
	}
	public int getNo() { return this.no; }
	public void setNo(int value) { this.no = value; }
	
	public int getRef() { return this.ref; }
	public void setRef(int value) {this.ref = value; }
	
	public int getRefStep() { return this.refStep; }
	public void setRefStep(int value) { this.refStep = value; }
	
	public int getRefLevel() { return this.refLevel; } 
	public void setRefLevel(int value) { this.refLevel = value; }
	
	public String getId() { return this.id; }
	public void setId(String value) {
		this.id = XSSProtect.ReplaceTag(value).trim(); 
	}
	
	public String getName() {return (this.name==null|| "".equals(this.name))?" ":this.name;}
	public void setName(String value) {
		this.name = XSSProtect.ReplaceTag(value).trim(); 
	}
	
	public String getPasswd() { return this.passwd; }
	public void setPasswd(String value) {
		this.passwd = XSSProtect.ReplaceTag(value); 
	}
	
	public String getSubject() {
		return this.subject; 
	}
	public void setSubject(String value) { 
		this.subject = XSSProtect.ReplaceTag(value).trim();
	}
	public String getSubject(int length) {
		this.subject = XSSProtect.ReplaceTag(this.subject);
		if(this.subject.length()< length)  return this.subject;
		else
			return this.subject.substring(0,length) + "..";
	}
	public String getContent() {
		return this.content; 
	} 
	public void setContent(String value) { 
		value = XSSProtect.ReplaceValue(value);
		value = value.replaceAll("javascriptxxxx","javascript");
		this.content = value;
	}		
	
	public String getEmail() {return this.email;}
	public void setEmail(String value) { 
		this.email = XSSProtect.ReplaceTag(value).trim(); }
	
	public String getIp() { return this.ip; }
	public void setIp(String value) { if(value == null) value = ""; this.ip = value; }
	
	public Date getRegDate() { return this.regDate; }
	public void setRegDate(Date value) { this.regDate = value; }
	public String getRegDateString(String format) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    if(this.regDate != null){
	    	return df.format(this.regDate);
	    }else{
	    	return "";
	    }
	    
	}
	public void setRegDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	    	if(value != null){
	    		this.regDate = df.parse(value);
	    	}
	    }catch(ParseException e) { ; }
	}
	
	public int getHitcnt() { return this.hitcnt; } 
	public void setHitcnt(int value) {this.hitcnt = value; }
	
	public int getCmtcnt() { return this.cmtcnt; }
	public void setCmtcnt(int value) { this.cmtcnt = value; }
	
	public int getFilecnt() { return this.filecnt; } 
	public void setFilecnt(int value) { this.filecnt = value; }
	
	public int getDowncnt() { return this.downcnt; }
	public void setDowncnt(int value) { this.downcnt = value; }
	
	public String getHtml() { return this.html; }
	public void setHtml(String value) { if(value == null || value.trim().equals("")) value = "0"; this.html = value.trim(); }	
	
	public String getPhone() {return this.phone;}
	public void setPhone(String value) {
		this.phone = XSSProtect.ReplaceTag(value).trim(); 
	}
	
	public String getZipcode() {return this.zipcode;}
	public void setZipcode(String value) {
		this.zipcode = XSSProtect.ReplaceTag(value).trim(); 
	}
	
	public String getAddr1() {return this.addr1;}
	public void setAddr1(String value) {
		this.addr1 = XSSProtect.ReplaceTag(value).trim();
	}
	
	public String getAddr2() {return this.addr2;}
	public void setAddr2(String value) {
		this.addr2 = XSSProtect.ReplaceTag(value).trim();
	}
	
	public String getIsDelete() {return this.is_delete;}
	public void setIsDelete(String value) { this.is_delete = value; }
		
	public String getGrp() {return this.grp;}
	public void setGrp(String value) {
		this.grp = value; 
	}
	
	public String getUrl() {return this.url;}
	public void setUrl(String value) {
		this.url = value; 
	}
		
	public String getLogQuery() {return this.logQuery;}
	public void setLogQuery(String value) {
		this.logQuery = XSSProtect.ReplaceTag(value).trim();
	}	
	
	public Date getEditDate() { return this.editDate; }
	public void setEditDate(Date value) { this.editDate = value; }
	public String getEditDateString(String format) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    return df.format(this.editDate);
	}
	public void setEditDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.editDate = df.parse(value);
	    }catch(ParseException e) { ; }
	}
	
	public Date getAnsDate() { return this.ansDate; }
	public void setAnsDate(Date value) { this.ansDate = value; }
	public String getAnsDateString(String format) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    return df.format(this.ansDate);
	}
	public void setAnsDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.ansDate = df.parse(value);
	    }catch(ParseException e) { ; }
	}
	
	public int getLogNo() { return this.logno; }
	public void setLogNo(int value) { this.logno = value; }
	
	public Article getNextArticle() {
	    return this.nextArticle;
	}
	public void setNextArticle(final Article nextArticle) {
	    this.nextArticle = nextArticle;
	}
	public Article getPrevArticle() {
	    return this.prevArticle;
	}
	public void setPrevArticle(final Article prevArticle) {
	    this.prevArticle = prevArticle;
	}	
	public String makeNew(String icon, int hour) {
		long today = (new Date()).getTime();
		long postedday = this.regDate.getTime();
		if( (today - postedday) <= 1000 * 60 * 60 * hour) {
			return icon;
		}
		return "";
	}
	public String makeReply(String icon, String spacer) {
		if(this.refLevel == 0) return "";
		else {
			String rep = "";
			for(int i = 0 ; i < this.refLevel; i++) {	
				rep += spacer;
			}
			rep +=icon;
			return rep;
		}
	}
	public String makeCmtCnt(String prefix , String suffix) {
		if(this.cmtcnt > 0) {
			return prefix + (new Integer(this.cmtcnt)).toString() + suffix;
		}
		else {
			return "";
		}
	}
	public String makeNum(int seq, int no, String icon) {
		if(this.no == no) {
			return icon;	
		}
		else {
			return (new Integer(seq)).toString();
		}
	}
	public String makeToggle(String even, String ord) {
		if(this.seq % 2 == 0) return even;
		else return ord;
	}
	public String makeToggle(int sequence, String even, String ord) {
		if(sequence % 2 == 0) return even;
		else return ord;
	}
	
	public String getSender() {return this.sender;}
	public void setSender(String value) {
		this.sender = value; 
	}
	
	public String getRssYn() { return this.rss_yn; }
	public void setRssYn(String value) {
		this.rss_yn = value;
	}
	
	public String getMoveBid() { return this.move_bid; }
	public void setMoveBid(String value) {
		this.move_bid = value;
	}
	
	public String getContGubun() { return this.contGubun; }
	public void setContGubun(String value) {
		this.contGubun = value;
	}
	
	public String getStatus() { return this.status; }
	public void setStatus(String value) {
		this.status = value;
	}
	
	public String getBuse() { return this.buse; }
	public void setBuse(String value) {
		this.buse = value;
	}
	
	public String getAnsEmail() { return this.ans_email; }
	public void setAnsEmail(String value) {
		this.ans_email = value;
	}
	
	public String getAnsPhone() { return this.ans_phone; }
	public void setAnsPhone(String value) {
		this.ans_phone = value;
	}
	
	public String getAnswer() { return this.answer; }
	public void setAnswer(String value) {
		this.answer = value;
	}
	
	public String getViewStatus() { return this.view_status; }
	public void setViewStatus(String value) {
		this.view_status = value;
	}
	
	public String getKind() { return this.kind; }
	public void setKind(String value) {
		this.kind = value;
	}
	
	public String getObject() { return this.object; }
	public void setObject(String value) {
		this.object = value;
	}
	
	public String getCut() { return this.cut; }
	public void setCut(String value) {
		this.cut = value;
	}
	
	public String getCutContent() { return this.cut_content; }
	public void setCutContent(String value) {
		this.cut_content = value;
	}
	
	public String getCallback() { return this.callback; }
	public void setCallback(String value) {
		this.callback = value;
	}
	
	public String getJob() { return this.job; }
	public void setJob(String value) {
		this.job = value;
	}
	
	public String getVirtualno() { return this.virtualno; }
	public void setVirtualno(String value) {
		this.virtualno = value;
	}
}
