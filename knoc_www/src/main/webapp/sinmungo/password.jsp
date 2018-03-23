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
<title>한국석유공사</title>
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
		alert("접근 권한이 없습니다.");
		window.close();
	}

	function onSubmit(){
		var old_pwd_check = '<%=hash.get("USER_PWD") %>';
		if(document.getElementById("old_user_pwd").value == ""){
			alert("기존 비밀번호를 입력해 주세요.");
			document.getElementById("old_user_pwd").focus();
			return;
		}
		if(document.getElementById("user_pwd").value == ""){
			alert("새 비밀번호를 입력해 주세요.");
			document.getElementById("user_pwd").focus();
			return;
		}
		if(document.getElementById("old_user_pwd").value != old_pwd_check ){
			alert("기존 비밀번호가 일치하지 않습니다.");
			return;
		}
		if(document.getElementById("user_pwd_check").value != document.getElementById("user_pwd").value){
			alert("새 비밀번호와 다시입력한 비밀번호가 일치하지 않습니다.");
			document.getElementById("user_pwd_check").focus();
			return;
		}
		if(confirm("비밀번호를 수정 하시겠습니까?")){
			document.getElementById("form01").action = "password_submit.jsp";
			document.getElementById("form01").submit();
		}
		
		
	}
	
//-->
</script>

<div class="new_pop_wrap">

	<h1>비밀번호 변경</h1>

	<form action="password_submit.jsp" method="post" name="form01" id="form01">

	<div class="pw_ch_area">
	<fieldset>
		<legend>비밀번호 변경</legend>
		<ul>
			<li class="pw01_txt"><label for="old_user_pwd">기존 비밀번호</label></li>
			<li class="pw01_form"><input type="password" id="old_user_pwd" name="old_user_pwd" class="s_pw_ch" /></li>
			<li class="pw02_txt"><label for="new_user_pwd">새 비밀번호</label></li>
			<li class="pw02_form"><input type="password" id="user_pwd" name="user_pwd" class="s_pw_ch" /></li>
			<li class="pw03_txt"><label for="new_user_pwd_check">새 비밀번호 확인</label></li>
			<li class="pw03_form"><input type="password" id="user_pwd_check" name="user_pwd_check" class="s_pw_ch" /></li>
		</ul>
	</fieldset>
	</div>
	</form>
	<div class="btns">
		<a href="#pass_exchange_exec" onclick="onSubmit(); return false;"><img src="/images/common/confirm_btn.gif" alt="확인" /></a>
		<a href="javascript:window.close();"><img src="/images/common/cancel_btn.gif" alt="취소" /></a>
	</div>

</div>

</body>
</html>		