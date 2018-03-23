<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.content.*"%>    
<%@ page import="java.util.List" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.EngMenuManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String mcode =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mcode")));
	String depth1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth1")));
	if (mcode == null || mcode.equals("")) {
%>
<script language="javascript">
	alert("잘못된 호출입니다.");
	history.back();
</script>
<%	
		return;
	}
	boolean result = MenuMa.deleteMenu(mcode);
	
	if (!result) {
%>
<script language="javascript">
	alert("메뉴정보 삭제가 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("메뉴정보 삭제가 완료되었습니다.");
    location.href = "engMenuList.jsp?depth1=<%=depth1%>";
</script>
<% 	
  	}
%>