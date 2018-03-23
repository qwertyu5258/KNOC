package com.neoboard;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.neoboard.data.PageAttribute;
import com.neoboard.data.Property;
import com.neoboard.session.UserSession;


;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class NeoBoardError {
    private static NeoBoardLogger logger = new NeoBoardLogger();
    private String errorMsg;
    private String errorLog;
    private Date errorDate;
    
    public String getErrorMsg() {
        return this.errorMsg;
    }
    public NeoBoardError(String msg) {
        this(msg,true);
    }
    public NeoBoardError(String msg , boolean logging) {
        this.errorLog = msg;
        this.errorMsg = msg;
        this.errorDate = new Date();
        if(logging) errorLog();
    }
    
    public NeoBoardError(Property property, PageAttribute page , String action ,String msg) {
        this(null,property,page,action,msg);
              
    }
    public NeoBoardError(UserSession ses, Property property, PageAttribute page , String action , String msg) {
        StringBuffer msgBuf = new StringBuffer();
        msgBuf.append("BoardID: " + property.getBoardID());
        msgBuf.append(", BoardName: " + property.getBoardName());
        msgBuf.append(", Callback: " + page.getPageUrl());
        msgBuf.append(", Action: " + action);
        if(ses!=null)msgBuf.append(", User: " + ses.getUserID() + "(" + ses.getUserName() + ")");
        msgBuf.append(", " + msg);
        this.errorMsg = msg;
        this.errorLog = msgBuf.toString();
        this.errorDate = new Date();
        errorLog();
    }
    
    private void errorLog() {
        StringBuffer errs = new StringBuffer();
        SimpleDateFormat df = new SimpleDateFormat("[yyyy-MM-dd HH:mm:ss] ");
        errs.append(df.format(this.errorDate));
        errs.append(this.errorLog);
        synchronized(NeoBoardError.logger) {
            NeoBoardError.logger.errorWrite(errs.toString());
        }
    }
}
