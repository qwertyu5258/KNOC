<%@page contentType="text/html;charset=euc-kr" errorPage="" language="java" %>
<%@ page import="com.neoboard.util.*"%>
<% request.setCharacterEncoding("MS949"); %>
<%
	EtcUtil etc = new EtcUtil();
	String callback = etc.strBlockSpecialTags2(etc.checkNull(request.getParameter("callback")));
	String bid = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bid")));
	String bno = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bno")));
	String mode = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("mode")));
	String category = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("category")));
	String psize = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("psize")));
	String act_type = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("act_type")));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>비밀번호 확인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
</head>
<body>
<script type="text/javascript" language="javascript">
	function Passwd() {
		if (document.pform.passwd.value == "") {
			alert("비밀번호를 입력하여 주십시오.");
			document.pform.passwd.focus();
			return false;
		}else if(document.pform.bno.value != window.opener.document.formPop.bno.value){
			alert("게시물 번호가 일치하지 않습니다.");
			history.back();
			document.pform.passwd.value = "";
			return false;
		}else {
			if(document.getElementById("act_type").value == "remove"){
				opener.deleteform.passwd.value = document.pform.passwd.value;
				opener.deleteform.submit();
				window.close();

			}else{
				document.pform.submit();
				return true;
			}
		}
	}
</script>
<form name="pform" method="post" action="popup_passwd_ok.jsp" onsubmit="Passwd(); return false;">
<input type="hidden" name="callback" value="<%=callback%>" />
<input type="hidden" name="bid" value="<%=bid%>" />
<input type="hidden" name="bno" value="<%=bno%>" />
<input type="hidden" name="mode" value="<%=mode%>" />
<input type="hidden" name="category" value="<%=category%>" />
<input type="hidden" name="psize" value="<%=psize%>" />
<input type="hidden" id="act_type" value="<%=act_type%>" />
<div id="pop_wrap_3">
    <h1><img src="/images/board/pop_pw_01.gif" alt="" border="0" /></h1>
    <div id="pw_body">
        <dl>
            <dt style="line-height:25px; padding-left:50px;"><label for="passwd">비밀번호를 입력하세요.</label></dt>
            <dd style="text-align:center" class="pt10"><input type="password" id="passwd" name="passwd" class="login" align="absmiddle" value="" title="비밀번호 입력" /> <input type="image" src="/images/member/btn_sumbit_01.gif" align="absmiddle" alt="확인" /></dd>
        </dl>
    </div>
</div>
</form>
</body>
</html>



