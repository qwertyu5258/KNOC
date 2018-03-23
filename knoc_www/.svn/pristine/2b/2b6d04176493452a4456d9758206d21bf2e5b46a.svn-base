<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*"%>    
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.term.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="TermMa" scope="page" class="kr.co.knoc.term.WebzineManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   	
	String encoding = "EUC-KR";
	String nowpage = "";

	WebzineBean pb = new WebzineBean();
	URLEncoder.encode("3");
	try{
		int	webjin_nid	= (request.getParameter("webjin_nid")==null)?0:Integer.parseInt(request.getParameter("webjin_nid"));
		if(webjin_nid <= 0) {
	%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
	<%	
			return;
		}		
		String img_path = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("img_path")),"8859_1");
		String link_url = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("link_url")),"8859_1");
		//String alt_name = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("alt_name")),"8859_1");
		String alt_name = etcutil.strBlockSpecialTags(new String(etcutil.checkNull(request.getParameter("alt_name")).getBytes("EUC-KR"),"8859_1"),"8859_1");
		String link_type = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("linkType")),"8859_1");
		nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));		
	
		pb.setImg_path(img_path);
		pb.setLink_url(link_url);
		pb.setAlt_name(alt_name);
		pb.setWebjin_nid(webjin_nid);
		pb.setLinkType(link_type);
	}catch(Exception e){
		out.println(e.toString());
	}
 
	boolean result = TermMa.updateTerm2(pb);


	if (!result) {
%>
<script type="text/javascript">
	alert("웹진 수정이 실패하였습니다.");
	history.back();
</script>
<%
	} else {		
%>
<script type="text/javascript">
	alert("웹진 수정이 완료되었습니다.");
    location.href = "web_manager.jsp?page=<%=nowpage%>";
</script>
<% 	
  	}
%>
