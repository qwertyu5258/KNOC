package kr.co.knoc.prroom;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PrRoomBean {
	
	private int nid;
	private String name;
	private String url;
	private Date modifyDate;
	private int status_no;
	
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getModifyDateString() {
		return getModifyDateString("yyyy-MM-dd HH:mm:ss");
	}
	public String getModifyDateString(String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		if(modifyDate == null) return sdf.format(new Date());
		return sdf.format(this.modifyDate); 
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public void setModifyDateString(String format, String value) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try{
			this.modifyDate = sdf.parse(value);
		}catch(ParseException e) { ; }
	}
	public int getStatus_no() {
		return status_no;
	}
	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}
	
	
}
