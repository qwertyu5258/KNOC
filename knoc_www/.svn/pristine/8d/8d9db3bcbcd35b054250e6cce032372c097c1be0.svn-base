package kr.co.knoc.etc;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.neoboard.tags.XSSProtect;

public class BoardBean {
	private String subject = "";
	private Date regdate;
	private int no = 0;
	private String buse = "";
	private String tablename = "";
	private int bno = 0;
	private String score = "";
	private String passwd = "";
	private String coment = "";
	private String id = "";
	private String name = "";
	private String ip = "";
	private String bid = "";
	private int hitcnt = 0;
	private String code01 = "";
	private String code02 = "";
	private String code03 = "";
	private String code04 = "";
	private String dam_name = "";
	private String rdate = "";
	private String filename = "";
	private long filesize = 0;
	private String affr_no = "";
	private int fno = 0;
	private String NewFilename = "";
	private int filecnt = 0;
	private String grp = "";
	
	public int getFilecnt() {
		return filecnt;
	}
	public void setFilecnt(int filecnt) {
		this.filecnt = filecnt;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getNewFilename() {
		return NewFilename;
	}
	public void setNewFilename(String newFilename) {
		if(NewFilename==null)NewFilename="";
		NewFilename = newFilename;
	}
	public int getNo() { return this.no; }
	public void setNo(int value) { this.no = value; }
	
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
	
	public Date getRegDate() {
		if(regdate == null) return new Date();
		else return regdate;
	}
	public void setRegDate(Date regdate) {
		this.regdate = regdate;
	}
	public String getRegDateString() {
		return getRegDateString("yyyy-MM-dd HH:mm:ss");
	}
	public String getRegDateString(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		if(regdate == null) return df.format(new Date());
		return df.format(this.regdate);
	}
	public void setRegDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.regdate = df.parse(value);
	    }catch(ParseException e) { ; }
	}
	
	public String getBuse() {
		return this.buse;
	}
	public void setBuse(String buse) {
		this.buse = buse;
	}
	
	public String getTablename() {
		return this.tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getBid() {
		return this.bid;
	}
	public void setBid(String value) {
		this.bid = value;
	}
	
	public int getHitcnt() {
		return this.hitcnt;
	}
	public void setHitcnt(int value) {
		this.hitcnt = value;
	}
	
	public String getCode01() {
		return this.code01;
	}
	public void setCode01(String value) {
		this.code01 = value;
	}
	
	public String getCode02() {
		return this.code02;
	}
	public void setCode02(String value) {
		this.code02 = value;
	}
	
	public String getCode03() {
		return this.code03;
	}
	public void setCode03(String value) {
		this.code03 = value;
	}
	
	public String getCode04() {
		return this.code04;
	}
	public void setCode04(String value) {
		this.code04 = value;
	}
	
	public String getRdate() {
		return this.rdate;
	}
	public void setRdate(String value) {
		this.rdate = value;
	}
	
	public String getDamName() {
		return this.dam_name;
	}
	public void setDamName(String value) {
		this.dam_name = value;
	}
	
	public String getFilename() {
		return filename;
	}
	public String getFileNameType() {
		int dotIndex = 0;
		String tmpStr = "";
		String fileExe = "";

		if (this.filename != null && !this.filename.equals("")) {
			dotIndex = this.filename.lastIndexOf(".");
			if(dotIndex != -1){
				fileExe = this.filename.substring(dotIndex);					// '.'ÀÌ Æ÷ÇÔµÊ
			}					
			tmpStr = fileExe.toLowerCase();
		}		
		return tmpStr;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public long getFilesize() {
		return this.filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public String getFilesize(String type) {
	    java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance();
		
		if(type.toUpperCase().equals("MB")) {
			double ds = (double)this.filesize/1024.0/1024.0;
			return nf.format(ds) + "MB";
		}
		else if(type.toUpperCase().equals("KB")) {
			double ds = (double)this.filesize/1024.0;
			return nf.format(ds) + "KB";
		}
		else  {
			double ds = (double)this.filesize/1024.0;
			return nf.format(ds) + "KB";
		}
	}
	
	public String makeNew(String icon, int hour) {
		long today = (new Date()).getTime();
		long postedday = this.regdate.getTime();
		if( (today - postedday) <= 1000 * 60 * 60 * hour) {
			return icon;
		}
		return "";
	}
	
	public String getAffrNo() { return this.affr_no; }
	public void setAffrNo(String value) { this.affr_no = value; }
	
	public String getGrp() { return this.grp; }
	public void setGrp(String value) { this.grp = value; }
}
