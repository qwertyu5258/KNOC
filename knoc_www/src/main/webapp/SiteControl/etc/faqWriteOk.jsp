<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.faq.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="FaqMa" scope="page" class="kr.co.knoc.faq.FaqManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String menu =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("menu")));
    String gubun =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("gubun")));
   	String title =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("title")));
   	String content =  etcutil.checkNull(request.getParameter("HTML_BODY"));
   	
   	FaqBean fb = new FaqBean();

   	fb.setMenu(menu);
   	fb.setGubun(gubun);
   	fb.setTitle(title);
   	fb.setContent(content);
	
	boolean result = FaqMa.insertFaq(fb);   		
	
	if (!result) {
%>
<script language="javascript">
	alert("FAQ등록이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("FAQ등록이 완료되었습니다.");
    location.href = "faqList.jsp";
</script>
<% 	
  	}
%>