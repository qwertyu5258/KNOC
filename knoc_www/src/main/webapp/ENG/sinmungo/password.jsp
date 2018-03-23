<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>    
<%@ page import="kr.co.knoc.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/pop.css" />
<title>Korea National Oil Corporation</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
	SinmungoUserManager sinmungoUserManager = new SinmungoUserManager();
	HashMap hash = sinmungoUserManager.getUserInfo_pw(session.getAttribute("SINMUNGO_ID").toString().trim());
	
	
	ArrayList al = new ArrayList();
	int count = 0;
	int seq = 0;

	boolean isMaster = false;
	boolean isUser = false;

	if(session.getAttribute("SINMUNGO_STATUS_NO") != null){
		if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("1")){
			isMaster = true;
		}else if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("2")){
			isUser = true;
		} 
	}
	
%>        
<script type="text/javascript">
<!--
	resizeTo(450, 430);
	
	if(!<%=isMaster %>){
		alert("You do not have permission to access.");
		window.close();
	}

	function onSubmit(){
		var old_pwd_check = '<%=hash.get("USER_PWD") %>';
		if(document.getElementById("old_user_pwd").value == ""){
			alert("Please enter the existing password.");
			document.getElementById("old_user_pwd").focus();
			return;
		}
		if(document.getElementById("user_pwd").value == ""){
			alert("Please enter your new password.");
			document.getElementById("user_pwd").focus();
			return;
		}
		if(document.getElementById("old_user_pwd").value != old_pwd_check ){
			alert("Existing password does not match.");
			return;
		}
		if(document.getElementById("user_pwd_check").value != document.getElementById("user_pwd").value){
			alert("Re-enter the new password and the password does not match.");
			document.getElementById("user_pwd_check").focus();
			return;
		}
		if(confirm("You want to modify the password?")){
			document.getElementById("form01").action = "password_submit.jsp";
			document.getElementById("form01").submit();
		}
		
		
	}
	
//-->
</script>

<div class="new_pop_wrap">

	<h1>Change Password</h1>

	<form action="password_submit.jsp" method="post" name="form01" id="form01">

	<div class="enc_pw_ch_area">
	<fieldset>
		<legend>Change Password</legend>
		<ul>
			<li class="enc_pw01_txt"><label for="old_user_pwd">Existing password</label></li>
			<li class="enc_pw01_form"><input type="password" id="old_user_pwd" name="old_user_pwd" class="s_pw_ch" /></li>
			<li class="enc_pw02_txt"><label for="new_user_pwd">New password</label></li>
			<li class="enc_pw02_form"><input type="password" id="user_pwd" name="user_pwd" class="s_pw_ch" /></li>
			<li class="enc_pw03_txt"><label for="new_user_pwd_check">Confirm new password</label></li>
			<li class="enc_pw03_form"><input type="password" id="user_pwd_check" name="user_pwd_check" class="s_pw_ch" /></li>
		</ul>
	</fieldset>
	</div>
	</form>
	<div class="btns">
		<a href="#pass_exchange_exec" onclick="onSubmit(); return false;"><img src="/images/common/enc_btn_ok.gif" alt="확인" /></a>
		<a href="javascript:window.close();"><img src="/images/common/enc_btn_cancel.gif" alt="취소" /></a>
	</div>

</div>

</body>
</html>		