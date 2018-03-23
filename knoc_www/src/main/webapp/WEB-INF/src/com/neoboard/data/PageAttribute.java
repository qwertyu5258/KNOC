package com.neoboard.data;

import java.io.Serializable;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class PageAttribute implements Serializable{
    private String num;
	private String page;
	private String pageSize;
	
	private int nNum;
	private int nPage;
	private int nPageSize;
	
	private String pageUrl;
	private String pageMode;
	
	public PageAttribute() {
        super();
    	num = "01";
		nNum = 0;
		page = "1";
		nPage = 1;
		pageSize = "15";
		nPageSize = 15;
		pageMode = "list";
	}
	
	public String getPageMode() {
	    return this.pageMode;
	}
	public void setPageMode(String value) {
	    if(value == null) value = "list";
	    this.pageMode = value;
	}
	public String getPageUrl() {
	    return this.pageUrl;
	}
	public void setPageUrl(String value) {
	    if(value == null) value = "";
	    this.pageUrl = value;
	}
	public String makeQueryString(int num, String mode, boolean bFirst) {
	    StringBuffer buf = new StringBuffer();
	    if(bFirst) buf.append("?");
	    else buf.append("&amp;");
	    buf.append("page=");
	    buf.append(page);
	    buf.append("&amp;num=");
	    buf.append(num);
	    if(mode != null && !mode.equals("")) {
	        buf.append("&amp;mode=");
	        buf.append(mode);
	    }
		return buf.toString();
	}
	public String makeQueryString(String mode, boolean bFirst) {
	    StringBuffer buf = new StringBuffer();
	    if(bFirst) buf.append("?");
	    else buf.append("&amp;");
	    buf.append("page=");
	    buf.append(page);
	    buf.append("&amp;num=");
	    buf.append(num);
	    if(mode != null && !mode.equals("")) {
	        buf.append("&amp;mode=");
	        buf.append(mode);
	    }
		return buf.toString();
	}
	public String getNum(){
		return this.num;
	}
	public void setNum(String num) {
		if(num == null) {
			this.nNum= 0;
			this.num = "0";
			return;
		}
		try {
			this.nNum = Integer.parseInt(num);
			this.num = num;
		}catch(NumberFormatException ne) {
			this.nNum= 0;
			this.num = "0";
		}
	}
	
	public String getPage(){
		return this.page;
	}
	public void setPage(String page) {
		if(page == null) {
			this.nPage = 1;
			this.page = "1";
		}
		try {
			this.nPage = Integer.parseInt(page);
			this.page = page;
		}catch(NumberFormatException ne) {
			this.nPage = 1;
			this.page = "1";
		}
	}
	
	public String getPageSize() {
		return this.pageSize;
	}
	public void setPageSize(String pageSize) {
		if(pageSize == null) {
			this.nPageSize = 15;
			this.pageSize = "15";
		}
		try {
			this.nPageSize = Integer.parseInt(pageSize);
			this.pageSize = pageSize;
		}catch(NumberFormatException ne) {
			this.nPageSize = 15;
			this.pageSize = "15";
		}
		this.pageSize = pageSize;
	}
	
	public int getNPage(){
		return this.nPage;
	}
	public int getNPageSize() {
		return this.nPageSize;
	}
	public int getNNum() {
		return this.nNum;
	}
}
