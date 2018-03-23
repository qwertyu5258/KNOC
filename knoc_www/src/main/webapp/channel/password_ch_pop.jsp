<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/channel/_channel_inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<script type="text/javascript">
resizeTo(450, 430);

function pass_exchange_exec(){
	
	var old_pwd_check = '<%=_CEO_PWD %>';
	var old_pwd = document.getElementById("old_user_pwd").value;
	var new_pwd = document.getElementById("new_user_pwd").value;
	var new_pwd_check = document.getElementById("new_user_pwd_check").value;
	if(old_pwd == ""){
		alert("기존 비밀번호를 입력하십시오.");
		return false;
	}
	
	if(new_pwd == ""){
		alert("새 비밀번호를 입력하십시오.");
		return false;
	}	
	
	if(new_pwd_check == ""){
		alert("새 비밀번호 확인을 입력하십시오.");
		return false;
	}	
	
	if(old_pwd != old_pwd_check){
		alert("기존 비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	if(new_pwd != new_pwd_check){
		alert("새 비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	if(confirm("입력하신 비밀번호는 "+new_pwd+"입니다. \n 해당 비밀번호로 비밀번호를 변경하시겠습니까?")){
		document.form01.submit();
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/pop.css" />
<title>한국석유공사</title>
</head>
<body>

<div class="new_pop_wrap">

	<h1>비밀번호 변경</h1>
	<form id="form01" name="form01" action="password_ch_exec.jsp" method="post">
	<div class="pw_ch_area">
	<fieldset>
		<legend>비밀번호 변경</legend>
		<ul>
			<li class="pw01_txt"><label for="old_user_pwd">기존 비밀번호</label></li>
			<li class="pw01_form"><input type="password" id="old_user_pwd" name="old_user_pwd" class="s_pw_ch" /></li>
			<li class="pw02_txt"><label for="new_user_pwd">새 비밀번호</label></li>
			<li class="pw02_form"><input type="password" id="new_user_pwd" name="new_user_pwd" class="s_pw_ch" /></li>
			<li class="pw03_txt"><label for="new_user_pwd_check">새 비밀번호 확인</label></li>
			<li class="pw03_form"><input type="password" id="new_user_pwd_check" name="new_user_pwd_check" class="s_pw_ch" /></li>
		</ul>
	</fieldset>
	</div>
	</form>
	<div class="btns">
		<a href="#pass_exchange_exec" onclick="pass_exchange_exec();return false;"><img src="/images/common/confirm_btn.gif" alt="확인" /></a>
		<a href="javascript:window.close();"><img src="/images/common/cancel_btn.gif" alt="취소" /></a>
	</div>

</div>

</body>
</html>