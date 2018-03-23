package kr.co.knoc.etc;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;

public class AttachFile implements Serializable{
    private int no;
	private int bno;
	private String fileName;
	private long fileSize;
	private int downcnt;
	private String fileName2;
	private long fileSize2;
	private int downcnt2;
	private String fileName3;
	private long fileSize3;
	private int downcnt3;
	private Date regDate;
	private String state;
	private String image = "";
	private long image_size = 0;
	private String folder;
	private String newfileName = "";

	
	public AttachFile() {
		this.no = 0;
		this.bno = 0;
		this.fileName = "";
		this.fileSize = 0;
		this.downcnt = 0;
		this.fileName2 = "";
		this.fileSize2 = 0;
		this.downcnt2 = 0;
		this.fileName3 = "";
		this.fileSize3 = 0;
		this.downcnt3 = 0;
		this.regDate = new Date();
		this.state = "1";
		this.image = "";
		this.image_size = 0;
		this.folder = "";
		this.newfileName = "";

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
	
	public String getFolder() {
		return this.folder;
	}
	public void setFolder(String folder) {
		this.folder = folder;
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
	
	public String getFileName2() {
		return this.fileName2;
	}
	public String getFileNameType2() {
		int dotIndex = 0;
		String tmpStr = "";
		String fileExe = "";

		if (this.fileName2 != null && !this.fileName2.equals("")) {
			dotIndex = this.fileName2.lastIndexOf(".");
			if(dotIndex != -1){
				fileExe = this.fileName2.substring(dotIndex);					// '.'ÀÌ Æ÷ÇÔµÊ
			}					
			tmpStr = fileExe.toLowerCase();
		}		
		return tmpStr;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	
	public long getFileSize2() {
		return this.fileSize2;
	}
	public void setFileSize2(long fileSize2) {
		this.fileSize2 = fileSize2;
	}
	public String getFileSize2(String type) {
	    java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance();
		
		if(type.toUpperCase().equals("MB")) {
			double ds = (double)this.fileSize2/1024.0/1024.0;
			return nf.format(ds) + "MB";
		}
		else if(type.toUpperCase().equals("KB")) {
			double ds = (double)this.fileSize2/1024.0;
			return nf.format(ds) + "KB";
		}
		else  {
			double ds = (double)this.fileSize2/1024.0;
			return nf.format(ds) + "KB";
		}
	}
	public int getDowncnt2() {
		return this.downcnt2;
	}
	public void setDowncnt2(int downcnt2) {
		this.downcnt2 = downcnt2;
	}
	
	public String getFileName3() {
		return this.fileName3;
	}
	public String getFileNameType3() {
		int dotIndex = 0;
		String tmpStr = "";
		String fileExe = "";

		if (this.fileName3 != null && !this.fileName3.equals("")) {
			dotIndex = this.fileName3.lastIndexOf(".");
			if(dotIndex != -1){
				fileExe = this.fileName3.substring(dotIndex);					// '.'ÀÌ Æ÷ÇÔµÊ
			}					
			tmpStr = fileExe.toLowerCase();
		}		
		return tmpStr;
	}
	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}
	
	public long getFileSize3() {
		return this.fileSize3;
	}
	public void setFileSize3(long fileSize3) {
		this.fileSize3 = fileSize3;
	}
	public String getFileSize3(String type) {
	    java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance();
		
		if(type.toUpperCase().equals("MB")) {
			double ds = (double)this.fileSize3/1024.0/1024.0;
			return nf.format(ds) + "MB";
		}
		else if(type.toUpperCase().equals("KB")) {
			double ds = (double)this.fileSize3/1024.0;
			return nf.format(ds) + "KB";
		}
		else  {
			double ds = (double)this.fileSize3/1024.0;
			return nf.format(ds) + "KB";
		}
	}
	public int getDowncnt3() {
		return this.downcnt3;
	}
	public void setDowncnt3(int downcnt3) {
		this.downcnt3 = downcnt3;
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
	    String lFile = this.fileName.toLowerCase();
	    if(lFile.lastIndexOf(".")  < 0 ) return "unknown";
	    return lFile.substring(lFile.lastIndexOf(".")+1);
	}
	
	public String getImage() {
		return this.image;
	}
	public String getImageType() {
		int dotIndex = 0;
		String tmpStr = "";
		String fileExe = "";

		if (this.image != null && !this.image.equals("")) {
			dotIndex = this.image.lastIndexOf(".");
			if(dotIndex != -1){
				fileExe = this.image.substring(dotIndex);					// '.'ÀÌ Æ÷ÇÔµÊ
			}					
			tmpStr = fileExe.toLowerCase();
		}		
		return tmpStr;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public long getImageSize() {
		return this.image_size;
	}
	public void setImageSize(long image_size) {
		this.image_size = image_size;
	}
	public String getImageSize(String type) {
	    java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance();
		
		if(type.toUpperCase().equals("MB")) {
			double ds = (double)this.image_size/1024.0/1024.0;
			return nf.format(ds) + "MB";
		}
		else if(type.toUpperCase().equals("KB")) {
			double ds = (double)this.image_size/1024.0;
			return nf.format(ds) + "KB";
		}
		else  {
			double ds = (double)this.image_size/1024.0;
			return nf.format(ds) + "KB";
		}
	}	
	
	public String getNewFilename() { return this.newfileName; }
	public void setNewFilename(String value) { this.newfileName = value; }
}


