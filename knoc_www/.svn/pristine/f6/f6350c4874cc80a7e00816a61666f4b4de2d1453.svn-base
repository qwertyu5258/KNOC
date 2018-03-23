<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,com.neoboard.*,com.neoboard.data.*, com.neoboard.util.*" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String comID = EtcUtil.strBlockSpecialTags(request.getParameter("comID"));
	String comName = EtcUtil.strBlockSpecialTags(request.getParameter("comName"));
	String comGubun = EtcUtil.strBlockSpecialTags(request.getParameter("comGubun"));
	PropertyManager pHelper = new PropertyManager();

	Common comm = new Common();
	comm.setComGubun(comGubun);
	comm.setComID(comID);
	comm.setComName(comName);
	comm.setRegDateTime(DateUtil.getDateTime("yyyyMMddHHmmss"));	
	
	String url = "commonList.jsp?comGubun=" + comGubun;
	String msg = comID + "게시판 설정이 등록되었습니다.";
	String msgback = "게시판 설정등록이 실패하였습니다. 에러:" + pHelper.getLastError();
	if(pHelper.insertCommon(comm) == true) {
%><stl:msgRedirect url="<%=url %>" msg="<%=msg%>"/><%
	} else {		
%><stl:msgBack msg="<%=msgback %>"/><%
	}%>
