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
String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")),"8859_1");
String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")),"8859_1");	

	SurveyManager sm = new SurveyManager();	
	int result = sm.updateSurvey(sf);
	
	if(result < 1) {
	%><stl:msgBack msg="설문수정이 실패하였습니다."/><%
	}
	else {
	%><stl:msgRedirect msg="설문수정이 완료되었습니다." url="surveyList.jsp?page=<%=nowpage %>&schType=<%=schType %>&schText=<%=schText %>"/><%
	}
%> 