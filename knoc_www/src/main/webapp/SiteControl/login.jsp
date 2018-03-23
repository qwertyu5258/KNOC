<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>::: 관리자 화면입니다 :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="share/css/admin.css" rel="stylesheet" type="text/css">
</head>
<script language=javascript>
<!--
	function do_login()
	{
		var f = document.loginform;
		if (f.id.value == "") {
			alert("아이디를 입력하여 주십시오.");
			f.id.focus();
		} else if (f.passwd.value == "") {
			alert("패스워드를 입력하여 주십시오.");
			f.passwd.focus();
		} else {
			//f.action = "https://www.knoc.co.kr/SiteControl/login_ok.jsp";  //운영
			//f.action = "https://localhost:8443/SiteControl/login_ok.jsp";  //로컬
			f.submit();
		}		
	}
-->
</script>

<body marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" onload="document.loginform.id.focus();">
<table width="100%" height=100% border="0" cellspacing="0" cellpadding="0">
<tr>
<td align=center>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr height=90px>
	<td>&nbsp;</td>
	<td width="460"></td>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td bgcolor="F2F2F2">&nbsp;</td>
	<td height="120" background="images/login_center.gif">
		<table width="300" border="0" cellspacing="0" cellpadding="0">
<form name="loginform" method="post" action="./login_ok.jsp" onsubmit="do_login(); return false;">
		<tr>
		<td width="140" rowspan="3">&nbsp;</td>
		<td width="97">
			<table width=100% cellpadding=0 cellspacing=0>
			<tr>
			<td><input name="id" type="text" class="input" size="13" style="ime-mode:disabled" value="" ></td>
			</tr>
			<tr>
			<td height="8" colspan="2"></td>
			</tr>
			<tr>
			<td><input name="passwd" type="password" class="input" size="13" value="" maxlength="12"></td>
			</tr>
			</table>
		</td>
		<td rowspan="3"><input type=image src="images/btn_login.gif" width="47" height="48" border="0" ></td>
		</tr>		
</form>	
		</table>
	</td>
	<td bgcolor="F2F2F2">&nbsp;</td>
	</tr>
	<tr height="101">
	<td>&nbsp;</td>
	<td><img src="images/login_bottom.gif" width="460" height="101" usemap="#Map" border="0"></td>
	<td>&nbsp;</td>
	</tr>
	<tr height="30">
	<td>&nbsp;</td>
	<td></td>
	<td>&nbsp;</td>
	</tr>
	</table>
</td>
</tr>
</table>	
</body>
</html>

