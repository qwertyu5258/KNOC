<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="kr.co.knoc.survey.*"%>    
<%@ page import="java.util.List"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>

<%	request.setCharacterEncoding("euc-kr");	%>
<jsp:useBean id="sf" class="kr.co.knoc.survey.SurveyForm">
	<jsp:setProperty name="sf" property="*"/>
</jsp:useBean>
<%
	
	SurveyManager sm = new SurveyManager();	
	boolean result = sm.insertSurvey(sf);
	
	if(!result) {
	%><stl:msgBack msg="설문등록이 실패하였습니다."/><%
	}
	else {
	%><stl:msgRedirect msg="설문등록이 생성되었습니다." url="surveyList.jsp"/><%
	}
%> 