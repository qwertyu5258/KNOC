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
public class NeoBoardMsgRedirect {
    private static NeoBoardLogger logger = new NeoBoardLogger();
    private String Msg;
    private String Url;
    
    public String getMsg() {
        return this.Msg;
    }
    public String getUrl() {
        return this.Url;
    }
    public NeoBoardMsgRedirect(String url , String msg) {
        this.Msg = msg;
        this.Url = url;        
    }
}
