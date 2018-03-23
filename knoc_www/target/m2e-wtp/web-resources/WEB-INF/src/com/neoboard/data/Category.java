package com.neoboard.data;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Vector;

import com.neoboard.jdbc.*;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class Category implements Serializable {
    private static Vector categorys = null;
    private static Object lock = new Object();
    
    public static Vector getCategorys() {
        synchronized(lock) {
	        if(categorys != null) { return categorys; } 
	        categorys = new Vector();
	        /* Read from property file */
	        BufferedInputStream bfi = null;
	        try {
		        Properties p 		= new Properties();
				bfi=new BufferedInputStream(new FileInputStream(Property.PROPERTY_FILE_ROOT +"/category.property"));
				p.load(bfi);
				for(Enumeration e = p.propertyNames();e.hasMoreElements(); ) {
				    String key = (String)e.nextElement();
				    String[] values = p.getProperty(key," : ").split(":");
				    categorys.add(new Category(new String(values[0].getBytes("8859_1"),"EUC-KR"),new String(values[1].getBytes("8859_1"),"EUC-KR")));
				}
			}catch(FileNotFoundException e ) {
	            e.printStackTrace();
	            System.out.println("NeoBoard Category property 화일이 없습니다.");
	        }catch(java.io.IOException e) {
	            e.printStackTrace();
	            System.out.println("NeoBoard Category property 화일을 읽을 수가 없습니다.");
	        }finally {
	            if(bfi != null) { try {bfi.close(); }catch(java.io.IOException e){;} }
	        }
	        return categorys;
        }
    }      
    
    /**
     * Release 
     */
    public static void releaseCategorys() {
        synchronized(lock) {
	        if(categorys == null) return;
	        categorys.clear();
	        categorys= null;
        }
    }
    private String categoryName;
    private String categorySuffix;
    
    public Category() {
        this.categoryName = "";
        this.categorySuffix = "";
    }
    public Category(String name, String suffix) {
        this.categoryName = name;
        this.categorySuffix = suffix;
    }
    
    public String getCategoryName() { return this.categoryName; }
    public void setCategoryName(String value) { if(value == null) value = ""; this.categoryName = value.trim(); }
    
    public String getCategorySuffix() { return this.categorySuffix; }
    public void setCategorySuffix(String value) { if(value == null) value = ""; this.categorySuffix = value.trim(); }
    
}
