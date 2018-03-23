<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.sitectrl.mgr.*"%>    
<%@ page import="java.util.List" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="DivisionMa" scope="page" class="kr.co.knoc.division.DivisionListManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
    String d_code[] = request.getParameterValues("d_code");
	boolean result = false;
	for (int i=0; i < d_code.length; i++) {
		result = DivisionMa.deleteDivisionList(d_code[i]);
	}  		
	
	if (!result) {
%>
<script language="javascript">
	alert("부서정보 삭제가 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("부서정보 삭제가 완료되었습니다.");
    location.href = "divisionList.jsp";
</script>
<% 	
  	}
%>