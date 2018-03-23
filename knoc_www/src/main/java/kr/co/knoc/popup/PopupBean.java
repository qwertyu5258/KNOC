package kr.co.knoc.popup;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class PopupBean {
	private int no;
	private String visibility;
	private int shownum;
	private String title;
	private String linkurl;
	private String linktype;
	private String filename;
	private int filesize;
	private String newFilename;
	private String alttext;
	private Date RegDate;
	private String startDate;
	private String endDate;
	
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getVisibility() {
		return this.visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	
	public int getShownum() {
		return this.shownum;
	}
	public void setShownum(int shownum) {
		this.shownum = shownum;
	}
	
	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getLinkUrl() {
		return this.linkurl;
	}
	public void setLinkUrl(String linkurl) {
		this.linkurl = linkurl;
	}
	
	public String getLinkType() {
		return this.linktype;
	}
	public void setLinkType(String linktype) {
		this.linktype = linktype;
	}
	
	public String getFilename() {
		return this.filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public int getFilesize() {
		return this.filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;		 
	}
	
	public String getNewFilename() {
		return this.newFilename;
	}
	public void setNewFilename(String newFilename) {
		this.newFilename = newFilename;
	}
	
	public String getAlttext() {
		return this.alttext;
	}
	public void setAlttext(String alttext) {
		this.alttext = alttext;
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
	
	public String getStartDate() {
		return this.startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public String getEndDate() {
		return this.endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
