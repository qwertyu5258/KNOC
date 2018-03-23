<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.util.*,com.neoboard.*,com.neoboard.data.*, com.neoboard.util.*" %>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<%
	String grp = EtcUtil.strBlockSpecialTags(request.getParameter("grp"));
	String boardID = EtcUtil.strBlockSpecialTags(request.getParameter("bid"));
	PropertyManager pHelper = new PropertyManager();

	String url = "groupList.jsp?bid=" + boardID;
	String msg = grp + "그룹이 삭제되었습니다.";
	String msgback = "그룹삭제가 실패하였습니다. 에러:" + pHelper.getLastError();


	if(pHelper.deleteGroup(boardID,grp) == true) {
%><neo:msgRedirect url="<%=url %>" msg="<%=msg%>"/><%
	} else {
%><neo:msgBack msg="<%=msgback%>"/><%
	}%>
