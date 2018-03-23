<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<%
	com.neoboard.PropertyManager pm = new com.neoboard.PropertyManager();
	String categoryID = com.neoboard.util.EtcUtil.strBlockSpecialTags(request.getParameter("categoryID"));
	if(categoryID == null) categoryID = "";
	
	String boardID = com.neoboard.util.EtcUtil.strBlockSpecialTags(request.getParameter("bid"));

	if(boardID == null || boardID.equals("")) {
%><neo:msgBack msg="게시판 아이디가 없습니다."/><%
	}
	boolean result = pm.deleteBoard(boardID);
	
	String url = "board_02.jsp?categoryID=" + categoryID;
	if(!result) {
	%><neo:msgBack msg="게시판 삭제가 실패하였습니다."/><%
	}
	else {
		%><neo:msgRedirect msg="게시판이 삭제되었습니다." url="<%=url%>"/><%
	}
%>