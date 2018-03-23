package kr.co.knoc.sitectrl.tags;

import java.io.*;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.http.HttpServletResponse;

public class AuthTag extends TagSupport {
	private static final long serialVersionUID = -6484679604356623149L;
	private String sessionName;
	private String loginPage;
	
	public void setLoginPage(String loginPage) {
		this.loginPage = loginPage;
	}

	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}

	public int doEndTag() throws JspException {
		try {
			if(sessionName == null || loginPage == null) {
				HttpServletResponse response = (HttpServletResponse)pageContext.getResponse();
				response.sendRedirect(response.encodeRedirectURL(loginPage));
				return SKIP_PAGE;
			}
			if(pageContext.getAttribute(sessionName,PageContext.SESSION_SCOPE) == null) {
				HttpServletResponse response = (HttpServletResponse)pageContext.getResponse();
				response.sendRedirect(response.encodeRedirectURL(loginPage));
				return SKIP_PAGE;
			}
		}catch(IOException e){
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}
	
	public void release() {
		sessionName = null;
		loginPage = null;
		super.release();
	}
}
