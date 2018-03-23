<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.faq.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="FaqMa" scope="page" class="kr.co.knoc.faq.FaqManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String menu =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("menu")));
    String gubun =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("gubun")));
   	String title =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("title")));
   	String content =  etcutil.checkNull(request.getParameter("HTML_BODY"));
   	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
<%	
		return;
	}
   	
   	FaqBean fb = new FaqBean();

   	fb.setMenu(menu);
   	fb.setGubun(gubun);
   	fb.setTitle(title);
   	fb.setContent(content);
   	fb.setNo(no);
	
	boolean result = FaqMa.updateFaq(fb);   		
	
	if (!result) {
%>
<script language="javascript">
	alert("FAQ수정이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("FAQ수정이 완료되었습니다.");
    location.href = "faqList.jsp?menu=<%=menu%>&gubun=<%=gubun%>&page=<%=nowpage%>";
</script>
<% 	
  	}
%>