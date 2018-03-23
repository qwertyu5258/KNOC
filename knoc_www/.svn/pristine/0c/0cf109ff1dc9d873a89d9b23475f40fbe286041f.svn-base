<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.survey.*"%>    
<%@ page import="java.util.List"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>

<%	request.setCharacterEncoding("euc-kr");	%>
<jsp:useBean id="sf" class="kr.co.knoc.survey.SurveyForm">
	<jsp:setProperty name="sf" property="*"/>
</jsp:useBean>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")));
	String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")));	

	SurveyManager sm = new SurveyManager();
	SurveyView view = new SurveyView();
	view = sm.getSurveyView(sf.getSurveyNum());
	if(view == null) {
%>		
	<stl:msgBack msg="존재하지 않는 설문입니다."/>
<%		
	}
		
	int result = sm.deleteNeoSurvey(sf.getSurveyNum());
	
	if(result < 1) {
	%><stl:msgBack msg="설문삭제가 실패하였습니다."/><%
	}
	else {
	%><stl:msgRedirect msg="설문삭제가 완료되었습니다." url="surveyList.jsp?page=<%=nowpage %>&schType=<%=schType %>&schText=<%=schText %>"/><%
	}
%> 