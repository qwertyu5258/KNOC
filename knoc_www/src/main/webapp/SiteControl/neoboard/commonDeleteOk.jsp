<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,com.neoboard.*,com.neoboard.data.*, com.neoboard.util.*" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<%
	String comGubun = EtcUtil.strBlockSpecialTags(request.getParameter("comGubun"));
	String comID = EtcUtil.strBlockSpecialTags(request.getParameter("comID"));
	String no = EtcUtil.strBlockSpecialTags(request.getParameter("no"));
	PropertyManager pHelper = new PropertyManager();

	String url = "commonList.jsp?comGubun=" + comGubun;
	String msg = comID + "게시판 설정이 삭제되었습니다.";
	String msgback = "게시판 설정삭제가 실패하였습니다. 에러:" + pHelper.getLastError();
	if(pHelper.deleteCommon(Integer.parseInt(no)) == true) {
%><stl:msgRedirect url="<%=url%>" msg="<%=msg%>"/><%
	} else {
%><stl:msgBack msg="<%=msgback%>"/><%
	}%>