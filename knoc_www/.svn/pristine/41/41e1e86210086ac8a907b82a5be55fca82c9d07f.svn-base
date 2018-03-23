package com.neoboard.data;

import java.io.Serializable;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class ExtAuthority extends Authority implements Serializable{
    private String boardName;
    
    public ExtAuthority() {
        super();
        this.boardName = "";
    }
    public String getBoardName() {
        return this.boardName;
    }
    public void setBoardName(String value) {
        if(value == null) value = "";
        this.boardName = value.trim();
    }
}
