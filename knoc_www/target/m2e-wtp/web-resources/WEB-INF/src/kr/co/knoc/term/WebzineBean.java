package kr.co.knoc.term;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class WebzineBean {
	private int webjin_nid;
	private String img_path;
	private String link_url;
	private String alt_name;
	private Date update_date;
	private String linkType;
		


	public String getLinkType() {
		return linkType;
	}

	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}

	public int getWebjin_nid() {
		return webjin_nid;
	}

	public void setWebjin_nid(int webjin_nid) {
		this.webjin_nid = webjin_nid;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getLink_url() {
		return link_url;
	}

	public void setLink_url(String link_url) {
		this.link_url = link_url;
	}

	public String getAlt_name() {
		return alt_name;
	}

	public void setAlt_name(String alt_name) {
		this.alt_name = alt_name;
	}

	public String getUpdate_date() {
		return getRegDateString("yyyy-MM-dd HH:mm:ss");
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}


	public String getRegDateString() {
		return getRegDateString("yyyy-MM-dd HH:mm:ss");
	}
	
	
	public String getRegDateString(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		if(update_date == null) return df.format(new Date());
		return df.format(this.update_date);
	}
	public void setRegDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.update_date = df.parse(value);
	    }catch(ParseException e) { ; }
	}
	

}
