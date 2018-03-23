package com.neoboard.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MsgCloseTag extends TagSupport {
	private String msg;
	
	public void setMsg(String inputMsg) {
		this.msg = inputMsg;
	}
	
	public int doEndTag() throws JspException {
		if(msg == null) msg = "";
		if(msg.equals("")) return EVAL_PAGE;
		
		JspWriter writer = (JspWriter)pageContext.getOut();
		try {
			writer.println("<script type=\"text/javascript\">\n" +
						"alert(\"" + msg + "\");\n" + 
						"self.close();\n" +
						"</script>");
		}catch(IOException ie) {
			throw new JspException("Response writing error: " + ie.getMessage());
		}
		return SKIP_PAGE;
	}
	
	public void release() {
		msg = null;
		super.release();
	}
}