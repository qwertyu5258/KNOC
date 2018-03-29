<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.EtcUtil" %>
<%@ page import="kr.co.knoc.sitectrl.mgr.*" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<jsp:useBean id="mgrHelper" class="kr.co.knoc.sitectrl.mgr.MgrHelper" scope="page" />
<%
	request.setCharacterEncoding("euc-kr");
	
	String id = EtcUtil.strBlockSpecialTags(request.getParameter("id"));
	if(id == null){ id = "";}
	String passwd = mgrHelper.getMd5Passwd(EtcUtil.strBlockSpecialTags(request.getParameter("passwd")));	

	MgrDO mgr = mgrHelper.queryMgr(id);

	if(mgr==null || /* ! */mgr.getPasswd().equals(passwd)) {
		
		mgrHelper.updateMgrError(id);
%>
		<%-- 관리자 로그인으로 redirect 수정 20130212 kgs <stl:msgBack msg="아이디 또는 비밀번호가 일치하지 않습니다."/> --%>
	<script type="text/javascript">
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
<%
		return;
	} else if(mgr.getCntError() != null && mgr.getCntError() > 29) {
		%>
	<script type="text/javascript">
	alert("해당 아이디는 로그인에 5회 이상 실패하여 접속이 불가합니다.\n\n관리자에게 문의해주세요.");
	history.back();
	</script>
		<%		
		return;
	}
	
	MgrSession ses = new MgrSession(mgr);
	
	// 세션 중복 방지	
	String userSession = session.getId();
	
	MgrDO mgrDO = new MgrDO();
	mgrDO.setId(id);
	mgrDO.setIp(request.getRemoteAddr());
	mgrDO.setUserSession(userSession);	
	mgrHelper.updateMgrLogin(mgrDO);
	
		
	// 세션 설정
	ses.setUserSession(userSession);
	session.setAttribute("ADMINSESSION",ses);
	
	
		
	response.sendRedirect(response.encodeURL("index.jsp"));	
%>
