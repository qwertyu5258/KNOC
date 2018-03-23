<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.content.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.MenuManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	int no = request.getParameter("no") == null ? 0 : Integer.parseInt(request.getParameter("no"));
	if (no <=0) {
%>
<script language="javascript">
	alert("잘못된 호출입니다.");
	history.back();
</script>
<%	
		return;
	}
   	String name =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("name")),"8859_1");
   	String url =  etcutil.strBlockSpecialTags2(etcutil.checkNull(request.getParameter("url")));
	try{		url = new String(url.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
  	String status =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("status")),"8859_1");
   	String depth1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth1")),"8859_1");

	MenuBean mb = new MenuBean();
	mb.setName(name);
	mb.setUrl(url);
	mb.setStatus(status);
	mb.setNo(no);

	boolean result = MenuMa.updateMenu(mb);
	
	if (!result) {
%>
<script language="javascript">
	alert("메뉴수정이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("메뉴수정이 완료되었습니다.");
    location.href = "menuList.jsp?depth1=<%=depth1%>";
</script>
<% 	
  	}
%>