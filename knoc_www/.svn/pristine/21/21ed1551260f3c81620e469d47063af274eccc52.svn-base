<?xml version="1.0" encoding="euc-kr" ?>
<%@ page contentType="text/xml;charset=euc-kr"%>
<%@ page import="com.neoboard.rss.*"%>
<%@ page import="com.neoboard.data.*"%>
<%@ page import="com.neoboard.util.*" %>
<%@ page import="java.util.Vector"%>
<jsp:useBean id="bm" class="com.neoboard.NeoBoardManager" />
<jsp:useBean id="etcutil" class="com.neoboard.util.EtcUtil" />
<%
	String tableName = (request.getParameter("bid")==null)?"": etcutil.strBlockSpecialTags(request.getParameter("bid"));
	String mode = (request.getParameter("mode")==null)?"": etcutil.strBlockSpecialTags(request.getParameter("mode"));
	String url = (request.getParameter("url")==null)?"": etcutil.strBlockSpecialTags(request.getParameter("url"));

%>
<rss version="2.0">
<channel>
<title><![CDATA[<%=tableName%>]]></title>
<link><![CDATA[http://<%=request.getServerName() %>]]></link>
<description><![CDATA[<%=tableName%>]]></description>
<language>ko</language>
<lastBuildDate></lastBuildDate>
<%
	Vector vDataList = bm.getNeoBoard("NEOBOARD_"+tableName,8,"0");
	CommonUtil cu = new CommonUtil();
	for(int i = 0 ; i < vDataList.size(); i++ ) {
		Article article = (Article)vDataList.elementAt(i);
%>
<item>
<title><![CDATA[<%=cu.encodeXML(article.getSubject())%>]]></title>
<link><![CDATA[<%=url%>?mode=view&bid=<%=tableName%>&num=<%=article.getNo()%>]]></link>
<pubDate><%=cu.encodeXML(article.getRegDateString("yyyy-MM-dd"))%></pubDate>
</item><%}%>
</channel>
</rss>

