<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<% request.setCharacterEncoding("MS949"); %>
<%
	EtcUtil etc = new EtcUtil();
	String callback = etc.strBlockSpecialTags2(etc.checkNull(request.getParameter("callback")));
	String bid = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bid")));
	String mode = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("mode")));
	String category = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("category")),"8859_1");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>로그인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<script type="text/javascript">
	function Passwd() {
		if (document.pform.name.value == "") {
			alert("이름을 입력하여 주십시오.");
			document.pform.name.focus();
			return;
		} else if (document.pform.pass.value == "") {
			alert("비밀번호를 입력하여 주십시오.");
			document.pform.pass.focus();
			return;
		} else if (document.pform.bno.value == "") {
			alert("접수번호를 입력하여 주십시오.");
			document.pform.bno.focus();
			return;
		} else {
			document.pform.submit();
		}
	}
</script>
</head>
<body>
<form name=pform method="post" action="pop_login_ok.jsp">
<input type=hidden name=callback value="<%=callback%>">
<input type=hidden name=bid value="<%=bid%>">
<input type=hidden name=mode value="<%=mode%>">
<input type=hidden name=category value="<%=category%>">
<div id="pop_wrap_1">    
    <div class="popLogin">
		<p><img src="../images/customer/pop_login_01.gif" border="0" alt="로그인" /></p>
        <p>아래 정보를 정확히 입력하셔야 정보를<br/>열람하실 수 있습니다.</p>
		<ul>
		<li><label for="name"><img src="../images/customer/img_pop_name.gif" alt="성명:" align="absmiddle" /></label> <input type="text" id="name" name="name" maxlength="32" class="login" alt="성명"  /></li>
		<li><label for="pass"><img src="../images/customer/img_pop_pw.gif" alt="비밀번호:" align="absmiddle" /></label> <input type="password" id="pass" name="pass" maxlength="64" class="login" alt="비밀번호"  /></li>
		<li><label for="bno"><img src="../images/customer/img_pop_nu.gif" alt="접수번호:" align="absmiddle" /></label> <input type="text" id="bno" name="bno" maxlength="7" class="login" alt="접수번호"  /></li>
		</ul>
		<div class="btnCen"><input type="image" src="../images/customer/btn_login.gif" onclick="Passwd();return false;"  alt="로그인" border="0" /> <a href="#" onclick="self.close();" ><img src="../images/customer/btn_cancel.gif" alt="취소" border="0"/></a></div>
    </div>
</div>         
</form>    
</body>
</html>
