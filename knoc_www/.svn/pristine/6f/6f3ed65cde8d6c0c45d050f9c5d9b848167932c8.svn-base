<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.util.*,com.neoboard.*,com.neoboard.data.*, com.neoboard.util.*" %>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String grp = EtcUtil.strBlockSpecialTags(request.getParameter("grp"));
	String grpName = EtcUtil.strBlockSpecialTags(request.getParameter("grpName"),"8859_1");
	String boardID = EtcUtil.strBlockSpecialTags(request.getParameter("bid"));
	PropertyManager pHelper = new PropertyManager();

	Group group = new Group();
	group.setBoardID(boardID);
	group.setGrp(grp);
	group.setGrpName(grpName);	
	group.setRegDateTime(DateUtil.getDateTime("yyyyMMddHHmmss"));
	
	String url = "groupList.jsp?bid=" + boardID;
	String msg = grp + "그룹이 등록되었습니다.";
	String msgback = "그룹등록이 실패하였습니다. 에러:" + pHelper.getLastError();	
	if(pHelper.insertGroup(group) == true) {
%><neo:msgRedirect url="<%=url %>" msg="<%=msg%>"/><%
	} else {
%><neo:msgBack msg="<%=msgback%>"/><%
	}%>
