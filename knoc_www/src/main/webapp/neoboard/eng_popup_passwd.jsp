<%@page contentType="text/html;charset=euc-kr" errorPage="" language="java" %>
<%@ page import="com.neoboard.util.*"%>
<% request.setCharacterEncoding("MS949"); %>
<%	
	boolean flagXSS = false;
	EtcUtil etc = new EtcUtil();	
	String callback = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("callback")));
	if(callback != null && callback.indexOf("<script") > -1){
		flagXSS = true;
	}
	String bid = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bid")));
	if(bid != null && bid.indexOf("<script") > -1){
		flagXSS = true;
	}
	String bno = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bno")));
	if(bno != null && bno.indexOf("<script") > -1){
		flagXSS = true;
	}
	String mode = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("mode")));
	if(mode != null && mode.indexOf("<script") > -1){
		flagXSS = true;
	}
	String category = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("category")));
	if(category != null && category.indexOf("<script") > -1){
		flagXSS = true;
	}
	String psize = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("psize")));
	if(psize != null && psize.indexOf("<script") > -1){
		flagXSS = true;
	}
%>

<%
	if(!flagXSS){
%>
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
<script language=javascript>
	function Passwd() {
		if (document.pform.passwd.value == "") {
			alert("Input password to password input orchid.");
			document.pform.passwd.focus();
		} else {
			document.pform.submit();
		}
	}
</script>
<form name=pform method="post" action="popup_passwd_ok.jsp">
<input type=hidden name=callback value="<%=callback%>">
<input type=hidden name=bid value="<%=bid%>">
<input type=hidden name=bno value="<%=bno%>">
<input type=hidden name=mode value="<%=mode%>">
<input type=hidden name=category value="<%=category%>">
<input type=hidden name=psize value="<%=psize%>">
<div id="pop_wrap_3">
    <h1><img src="/images/board/pop_pw_01.gif" alt="" border="0" /></h1>
    <div id="pw_body">
        <dl>
            <dt style="line-height:25px; padding-left:50px;">Input password.</dt>
            <dd style="text-align:center" class="pt10"><input type="password" id="passwd" name="passwd" class="login" align="absmiddle" value="" /> <img src="/images/member/btn_sumbit_01.gif" align="absmiddle" alt="확인" onclick="Passwd();" style="cursor:pointer" /></dd>
        </dl>
    </div>
</div>
</form>	
</body>
</html>
<%} else { %>
<script>
alert('유효하지 않은 요청입니다');
location.href='/index.jsp';
</script>
<%} %>

 

