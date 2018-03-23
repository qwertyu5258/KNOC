<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.knoc.sitectrl.mgr.MgrSession"%>
<%@page import="kr.co.knoc.util.EtcUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>

<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="govPublicManager" scope="page" class="kr.co.knoc.gov_public.GovPublicManager" />

<% request.setCharacterEncoding("euc-kr"); %>

<%
	MgrSession ms = (MgrSession)request.getSession().getAttribute("ADMINSESSION");
	if(ms == null || (ms != null && (Integer.parseInt(ms.getUserLevel()) > 5))){
		out.print("<script>alert('접근권한이 없습니다.');history.back();</script>");
	}
%>

<% 
	String file_path = EtcUtil.ETC_UPLOAD_ROOT + File.separator + "BOARD_05" + File.separator;
	MultipartRequest mReq = new MultipartRequest(request, file_path);

	String gpk = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mReq.getParameter("gpk")));

	int resultCnt = 0;
	int gov_public_nid = Integer.parseInt(mReq.getParameter("gov_public_nid"));

	resultCnt = govPublicManager.deleteGovPublic(gov_public_nid);	 
%>

<script type="text/javascript">
<%if(resultCnt > -1){ %>
	alert("삭제 되었습니다.");
	location.href = "board_05.jsp?gpk=<%=gpk %>";
	
<%}else{ %>
	alert("삭제 중 에러가 발생하였습니다.");
	history.back();
<%} %>
</script>


