package com.neoboard.jsp.tags;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class NoCacheTag extends TagSupport {
	/**
     * Sets "no cache" response headers
     */
    public int doEndTag() throws JspException {
        HttpServletResponse response = 
            (HttpServletResponse) pageContext.getResponse();
        response.addHeader("Pragma", "No-cache");
        response.addHeader("Cache-Control", "no-cache");
        response.addDateHeader("Expires", 1);
        return EVAL_PAGE;
    }
}
