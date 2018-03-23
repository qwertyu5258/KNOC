package com.neoboard.data;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class AttachFile implements Serializable{
    private int no;
	private int bno;
	private String fileName;
	private long fileSize;
	private int downcnt;
	private Date regDate;
	private String state;
	private String folder;
	private String newfileName;
	private String bun;
	
	public AttachFile() {
		this.no = 0;
		this.bno = 0;
		this.fileName = "";
		this.fileSize = 0;
		this.downcnt = 0;
		this.regDate = new Date();
		this.state = "1";
		this.folder = "";
		this.newfileName = "";
		this.bun = "";
	}
	public int getNo() {
		return this.no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getBno() {
		return this.bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public String getBun() {
		return this.bun;
	}
	public void setBun(String bun) {
		this.bun = bun;
	}
	
	public String getFileName() {
		return this.fileName;
	}
	public String getFileNameType() {
		int dotIndex = 0;
		String tmpStr = "";
		String fileExe = "";

		if (this.fileName != null && !this.fileName.equals("")) {
			dotIndex = this.fileName.lastIndexOf(".");
			if(dotIndex != -1){
				fileExe = this.fileName.substring(dotIndex);					// '.'ÀÌ Æ÷ÇÔµÊ
			}					
			tmpStr = fileExe.toLowerCase();
		}		
		return tmpStr;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}	
	
	public String getNewFileName() {
		return this.newfileName;
	}
	public String getNewFileNameType() {
		int dotIndex = 0;
		String tmpStr = "";
		String fileExe = "";

		if (this.newfileName != null && !this.newfileName.equals("")) {
			dotIndex = this.newfileName.lastIndexOf(".");
			if(dotIndex != -1){
				fileExe = this.newfileName.substring(dotIndex);					// '.'ÀÌ Æ÷ÇÔµÊ
			}					
			tmpStr = fileExe.toLowerCase();
		}		
		return tmpStr;
	}
	public void setNewFileName(String newfileName) {
		this.newfileName = newfileName;
	}
	
	public String getState() {
		return this.state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public String getFolder() {
		return this.folder;
	}
	public void setFolder(String folder) {
		this.folder = folder;
	}
	
	public long getFileSize() {
		return this.fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileSize(String type) {
	    java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance();
		
		if(type.toUpperCase().equals("MB")) {
			double ds = (double)this.fileSize/1024.0/1024.0;
			return nf.format(ds) + "MB";
		}
		else if(type.toUpperCase().equals("KB")) {
			double ds = (double)this.fileSize/1024.0;
			return nf.format(ds) + "KB";
		}
		else  {
			double ds = (double)this.fileSize/1024.0;
			return nf.format(ds) + "KB";
		}
	}
	public int getDowncnt() {
		return this.downcnt;
	}
	public void setDowncnt(int downcnt) {
		this.downcnt = downcnt;
	}
	
	public Date getRegDate() { return this.regDate; }
	public void setRegDate(Date value) { this.regDate = value; }
	public String getRegDateString(String format) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    return df.format(this.regDate);
	}
	public void setRegDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.regDate = df.parse(value);
	    }catch(ParseException e) { ; }
	}
	public static Hashtable mimes = null;
	
	public static Hashtable getMimes() {
	    if(mimes == null){
	        mimes = new Hashtable();
	        mimes.put("gif","image/gif");
	        mimes.put("jpg","image/jpeg");
	        mimes.put("jpeg","image/jpeg");
	        mimes.put("pdf","application/pdf");
	        mimes.put("doc","application/msword");
	        mimes.put("xls","application/msexel");
	        mimes.put("ppt","application/powerpoint");
	        mimes.put("gul","application/gul");
	        mimes.put("hwp","application/hwp");
	        mimes.put("txt","text/plain");
	        mimes.put("htm","text/html");
	        mimes.put("html","text/html");
	        mimes.put("avi","video/x-msvideo");
	        mimes.put("mpg","video/mpeg");
	        mimes.put("mpeg","video/mpeg");
	        mimes.put("wmv","video/x-ms-wmv");
	        mimes.put("asf","video/x-ms-asf");
	        mimes.put("wma","audio/x-ms-wma");
	        mimes.put("zip","application/zip");
	        mimes.put("bmp","image/bmp");
	        mimes.put("tif","image/tiff");
	        mimes.put("mht","message/rfc822");
	    }
	    return mimes;
	}
	public static String getMime(String mime) {
	    String m = (String)getMimes().get(mime);
	    if(m != null) {
	        return m;
	    }
	    else {
	        return "application/unknown";
	    }
	}
	public static boolean containsMime(String mime){
	    if(getMimes().get(mime) != null) return true;
	    return false;
	}
	public String makeMimeIcon(String mimeImageRoot) {
	    String mime = getMimeType();
	    if(AttachFile.containsMime(mime)) {
	        return mimeImageRoot + "/mime_" + mime + ".gif";
	    }
	    else {
	        return mimeImageRoot + "/mime_unknown.gif";
	    }
	}
	public String getMimeType() {
	    String lFile = this.newfileName.toLowerCase();
	    if(lFile.lastIndexOf(".")  < 0 ) return "unknown";
	    return lFile.substring(lFile.lastIndexOf(".")+1);
	}
}
