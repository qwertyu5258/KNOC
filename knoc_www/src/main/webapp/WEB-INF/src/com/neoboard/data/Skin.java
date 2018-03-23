package com.neoboard.data;

import java.io.Serializable;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class Skin implements Serializable {
    private String name;
    private String id;
    
    public Skin(String name, String id) {
        this.name = name;
        this.id = id;
    }
    public String getName() { return this.name; }
    public void setName(String value) { this.name = value; }
    
    public String getId() { return this.id; }
    public void setId(String value) { this.id = value; }
}
