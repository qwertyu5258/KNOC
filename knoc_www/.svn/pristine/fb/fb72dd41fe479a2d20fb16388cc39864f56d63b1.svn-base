package com.neoboard.data;

import java.io.Serializable;

import com.neoboard.tags.JUtil;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class SearchParam implements Serializable {		
    private String field;
    private String text; 
    
    public SearchParam() {
        this.field = "";
        this.text = "";
    }
    public SearchParam(String f, String t) {
        if(f==null)f="";
        if(t==null)t="";        
        this.field = f;
        this.text = t;        
    }
    public String getField() {
        return this.field;
    }
    public void setField(String value) {
        if(value == null) value = ""; this.field = value;
    }    
    public String getText() {
        return this.text;
    }
    public void setText(String value) { 
    	value = JUtil.codeConvert(value, "KS_C_5601-1987");
        if(value == null) value = ""; this.text = value;
    }

}
