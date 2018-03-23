package kr.co.knoc.ebook;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class EbookBean {
	private int no;
	private String menu;
	private String title;
	private String link;
	private String filename;
	private int filesize;
	private String newFilename;
	private String image;
	private int imageSize;
	private String newImagename;
	private String ip;
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
	
	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getLink() {
		return this.link;
	}
	public void setLink(String link) {
		this.link = link;
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
	
	public String getImage() {
		return this.image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getImageSize() {
		return this.imageSize;
	}
	public void setImageSize(int imageSize) {
		this.imageSize = imageSize;		 
	}
	
	public String getNewImagename() {
		return this.newImagename;
	}
	public void setNewImagename(String newImagename) {
		this.newImagename = newImagename;
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
