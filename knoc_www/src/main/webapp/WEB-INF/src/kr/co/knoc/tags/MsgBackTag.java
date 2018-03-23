package kr.co.knoc.tags;

import java.io.*;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import kr.co.knoc.util.StringUtil;

public class MsgBackTag extends TagSupport {
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
						"alert(\"" + StringUtil.replaceInString(StringUtil.replaceInString(StringUtil.replaceInString(msg, "\n", " "),"\r",""),"\"","&quot;") + "\");\n" +
						"location.href = \"/member/login_member.jsp\";\n" +
						//"history.back();\n" +
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
