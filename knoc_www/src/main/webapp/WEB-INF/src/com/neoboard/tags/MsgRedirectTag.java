package com.neoboard.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MsgRedirectTag extends TagSupport {
	private String msg;
	private String url;
	
	public void setMsg(String inputMsg) {
		this.msg = inputMsg;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int doEndTag() throws JspException {
		if(msg == null) msg = ""; 
		if(msg.equals("")) return EVAL_PAGE;
		
		JspWriter writer = (JspWriter)pageContext.getOut();
		javax.servlet.http.HttpServletResponse response = (javax.servlet.http.HttpServletResponse)pageContext.getResponse();
		try {
			
			writer.println("<script type=\"text/javascript\">\n" +
						"alert(\"" + msg + "\");\n" + 
						"location.href='" + response.encodeRedirectURL(url) + "';\n" +
						"</script>");
		}catch(IOException ie) {
			throw new JspException("Response writing error: " + ie.getMessage());
		}
		return SKIP_PAGE;
	}
	
	public void release() {
		msg = null;
		url = null;
		super.release();
	}
}