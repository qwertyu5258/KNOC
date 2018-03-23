package com.neoboard.data;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Vector;
import java.sql.*;

import com.neoboard.tags.JUtil;
import com.neoboard.util.EtcUtil;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class Search implements Serializable {
    private Vector searchParam = null;
    private String order;
	private String dir;	    
	private String subject;
	private String group;
	private String password;
	private String name;
	private String bno;
	
	private static final String[] SCH_FIELD_LIST = new String[] {
			"name",
			"content",
			"subject"
	};
	
	public static boolean checkAllowedField(String field) {
		for(int i = 0 ; i < SCH_FIELD_LIST.length ; i++){
			if(SCH_FIELD_LIST[i].compareToIgnoreCase(field) == 0) {
				return true;
			}
		}
		return false;
	}
	public Search(String field, String text, String order, String dir) {
	    if(field == null) field = "";
	    if(text == null) text = "";
	    	    
	    searchParam = new Vector();
	    if(Search.checkAllowedField(field)) searchParam.add(new SearchParam(field,text));
	    if(order == null) order = "";
		if(dir == null) dir = "";
		this.order = order;
		this.dir = dir;
		this.group = "";
		this.password = "";
		this.name = "";
		this.bno = "";
	}
	
	public Search() {
	    searchParam = new Vector();
		this.order = "";
		this.dir = "";
		this.subject = "";
		this.group = "";
		this.password = "";
		this.name = "";
		this.bno = "";
	}
	
	public String getOrder(){
	    return this.order;
	}
	public void setOrder(String value) {
	    if(value == null) value =""; this.order = value;
	}
	public String getSubject(){
	    return this.subject;
	}
	public void setSubject(String value) {
	    if(value == null) value =""; this.subject = value;
	}	
	public String getDir() { 
	    return this.dir;
	}
	public void setDir(String value) {
	    if(value == null) value =""; this.dir = value;
	}
	public String makeQueryString(boolean bFirst) {
	    return makeQueryString("","",bFirst);
	}
	public String makeQueryString(String prefix,String suffix, boolean bFirst) {
	    StringBuffer uri = new StringBuffer();
	    if(bFirst) uri.append("?");
	    else uri.append("&amp;");
	    
	    if(!prefix.equals("")) uri.append(prefix);
	    for(int i = 0 ; i < this.searchParam.size() ; i++) {
	        SearchParam p = (SearchParam) searchParam.get(i);
		    if(i==0) uri.append("field=" + p.getField());
		    else uri.append("&amp;field=" + p.getField());
	    	//try{
		    //    uri.append("&amp;text=" +  java.net.URLEncoder.encode(p.getText(),"EUC-KR"));
		    //}catch(UnsupportedEncodingException e) {}
		    uri.append("&amp;text=" + JUtil.codeConvert(p.getText(), "KS_C_5601-1987"));
		    
	    }
	    if(this.searchParam.size() == 0) {
	        uri.append("field=");
		    uri.append("&amp;text=");
	    }
	    if(this.order != null && !this.order.equals("")) {
	    	uri.append("&amp;order=" + order);
	    	uri.append("&amp;dir=" + dir);
	    }
	    if(this.group != null && !this.group.equals("")) {
	    	uri.append("&amp;grp=" + group);
	    }
	    if(!suffix.equals("")) uri.append("&amp;" + suffix);
		return uri.toString();
	}
	
	public Vector getSearchParam() {
	    return this.searchParam;
	}
	public void setSearchParam(final Vector param) {
	    this.searchParam.addAll(param);
	}
	public void setSearchParam(String field, String text) {
	    if(field == null || text == null) return;
	    if(field.equals("") || text.equals("")) return;
	    if(!Search.checkAllowedField(field)) return;
	    this.searchParam.add(new SearchParam(field,EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(text))));
	}
	public String makeOrdering(String prefix, String suffix) {
	    StringBuffer query = new StringBuffer();
		boolean bPrev = false;		

		if(!order.equals("")) {
			query.append(order + " " + dir);
			bPrev = true;
			if(prefix != null && !prefix.equals("")) {
				if(bPrev) query.append(",");
				query.append(prefix);
				bPrev = true;
			}
		} else {
			query.append(prefix + " ");			
			if(!prefix.equals("")) bPrev = true;
			if(suffix != null && !suffix.equals("")) {
				if(bPrev) query.append(",");
				query.append(suffix);
				bPrev = true;
			}
		}		
		return query.toString();
	}
	
	public String makeCondition(String prefix, String suffix) {
		StringBuffer query = new StringBuffer();
		boolean bPrev = false;
		
		query.append(prefix + " ");
		
		if(!prefix.equals("")) bPrev = true;

		if(this.searchParam.size() > 0 ) {
		    if(bPrev) query.append(" and ");
		    query.append("(");
		    bPrev = false;
		}
		for(int i = 0 ; i < this.searchParam.size() ; i++) {
			String v_text = "";
			SearchParam p = (SearchParam)this.searchParam.get(i);
			if(!p.getText().equals("")) {
				
				//v_text = JUtil.codeConvert(p.getText(), "KS_C_5601-1987"); //한글이 깨져서 수정 20130212 gs
				v_text = p.getText();
						
				if(bPrev) query.append("and ");
				query.append(p.getField()+ " like '%" + v_text.toLowerCase().replaceAll("'","''") + "%' ");
				//if (p.getField().equals("content")) {				
				//	query.append("DBMS_LOB.INSTR(" + p.getField() + ", '" + v_text.toLowerCase().replaceAll("'","''") + "')>0");
				//} else {
				//	query.append(p.getField()+ " like '%" + v_text.toLowerCase().replaceAll("'","''") + "%' ");
				//}
				bPrev = true;
			}
		}
		if(this.searchParam.size() > 0 ) { 
		    query.append(") ");
		    bPrev = true;
		}
		if(suffix != null && !suffix.equals("")) {
			if(bPrev) query.append("and ");
			query.append(suffix);
			bPrev = true;
		}
		String s=query.toString();
		return query.toString();
	}
	public String getGroup(){
		return this.group;
	}
	public void setGroup(String value) {
		if(value == null) value = ""; this.group = value;
	}
	
	public String getPassword(){
		return this.password;
	}
	public void setPassword(String value) {
		if(value == null) value = ""; this.password = value;
	}
	
	public String getName(){
		return this.name;
	}
	public void setName(String value) {
	    value = JUtil.codeConvert(value, "KS_C_5601-1987");	        
		if(value == null) value = ""; this.name = value;
	}
	
	public void setName(String value, boolean nonConvert) {
	    if(!nonConvert){
	    	value = JUtil.codeConvert(value, "KS_C_5601-1987");	  
	    }
	    if(value == null) value = ""; this.name = value;
	}
	
	public String getBno(){
		return this.bno;
	}
	public void setBno(String value) {
		if(value == null) value = ""; this.bno = value;
	}
	
	
	public void setName2(String value , String bytes , String chrset) {
		String result   =  value;
		byte[] rawBytes =  null;

		try {
				rawBytes  =  value.getBytes(bytes);
				result  =  new String(rawBytes , chrset);
		} catch(java.io.UnsupportedEncodingException e ) {
			e.printStackTrace();
		}
			this.name = result;
	}	
	
	
	
}