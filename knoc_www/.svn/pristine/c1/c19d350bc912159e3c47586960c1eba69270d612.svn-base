<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
int chkXSS = currentPage.indexOf("<script");
if(chkXSS > -1) { currentPage = "/"; }
%>
<form name="mform" method="post" action="/include/satisfyOk.jsp" onsubmit="document.mform.submit();return false">

<input type="hidden" name="mcode" value="<%=gNavMenuDepth1 %><%=gNavMenuDepth2 %><%=gNavMenuDepth3 %><%=gNavMenuDepth4 %>" />
<input type="hidden" name="user_id" value="<%=uid %>" />
<input type="hidden" name="return_url" value="<%=currentPage %>" />

<!-- div style="clear:both ; height:10px ;"></div>
<div class="new_satisfy">
	<a href="/survey/survey_0103.jsp" target="_blank" title="새창" ><img src="/images/common/img_survey.gif" alt="경영공시 이용객 만족도 설문조사 바로가기(새창)"  /></a>
</div-->

</form>						 