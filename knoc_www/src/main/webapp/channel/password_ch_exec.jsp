<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/channel/_channel_inc.jsp"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<%
HashMap dataMap = new HashMap();


request.setCharacterEncoding("euc-kr");	
String old_pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("old_user_pwd")));
String new_pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("new_user_pwd")));

dataMap.put("old_pwd", old_pwd);
dataMap.put("new_pwd", new_pwd);
dataMap.put("user_id", _CEO_USER);
 
/*DB실행 update*/
boolean result = false;
result = ChannelMa_Inc.updateSetAdminPwd(dataMap);

if(result == true){
%>
<script type="text/javascript">
	alert("비밀번호가 정상적으로 변경되었습니다.");
	opener.location.reload();
	window.close();
</script>
<%}else{%>
<script type="text/javascript">
	alert("비밀번호 변경중 에러가 발생하였습니다.");
	history.back();
</script>	
<%}%>