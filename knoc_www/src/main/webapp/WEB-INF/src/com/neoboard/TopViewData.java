package com.neoboard;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class TopViewData implements Serializable{
    
    private String boardID;
    
    private int no;
    private String subject;
    private Date regDate;
    
    
    
    public String getBoardID() {
        return boardID;
    }
    public void setBoardID(String boardID) {
        if(boardID == null) boardID = "";
        this.boardID = boardID;
    }
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public Date getRegDate() {
        return regDate;
    }
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
    public void setRegDateString(String format, String regDate) {
        SimpleDateFormat df = new SimpleDateFormat(format);
        try {
            this.regDate = df.parse(regDate);
        }catch(ParseException e) {
            ;
        }
    }
    public String getRegDateString(String format) {
        SimpleDateFormat df = new SimpleDateFormat(format);
        return df.format(this.regDate);
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        if(subject == null) subject = "";
        this.subject = subject;
    }
    public String makeNew(String icon, int hour) {
		long today = (new Date()).getTime();
		long postedday = this.regDate.getTime();
		if( (today - postedday) <= 1000 * 60 * 60 * hour) {
			return icon;
		}
		return "";
	}
    public String getSubject(int length) {
		if(this.subject.length()< length)  return this.subject;
		else
			return this.subject.substring(0,length) + "..";
	}
}