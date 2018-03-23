<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.mgr.*"%>    
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrMa" scope="page" class="kr.co.knoc.mgr.MgrHelper" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String userid =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("userid")));
	boolean result = MgrMa.checkID(userid);
%>	
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
<script type="text/javascript">
	function checkId() {
		if (document.idForm.userid.value == "") {
			alert("아이디를 입력하여 주세요.");
			document.idForm.userid.focus();			
			return false;
		} else if (document.idForm.userid.value.length < 4 || document.idForm.userid.value.length > 10) {
			alert("아이디는 영문소문자와 숫자와의 조합으로 4~10자입니다.");
			document.idForm.userid.focus();	
			return false;
		} else {
			document.idForm.submit();
		}
	}
	
	function useid() {
		opener.document.joinform.userid.value = "<%=userid%>";
		opener.document.loginchkform.idck.value = "OK";
		self.close();
	}
</script>
<body>
<form name="idForm" method="post" action="pop_id.jsp" onsubmit="checkId();return false;">    
<div id="pop_wrap_1">
    <img src="../images/member/pop_id_01.gif" alt="" />
    <div id="id_body">
        <dl>
            <dt style="line-height:25px; padding-left:50px;">아이디를 입력하세요.</dt>
            <dd style="text-align:center"><input type="text" class="login" id="userid" name="userid" value="" style="vertical-align:middle" /> <input type="image" src="../images/member/btn_sumbit_01.gif" style="vertical-align:middle" alt="확인" /></dd>
        </dl>
        <div id="ok">
        <% if (!result) { %>
        <%=userid%>는 사용가능한 아이디입니다.<br />
        <input type="image" src="../images/member/btn_ok.gif" onclick="useid();" style="width:71px; height:20px;"  alt="사용하기" />
        <% } else { %>
        <%=userid%>는 사용 불가능한 아이디입니다.<br />
        <% } %>
        </div>
    </div>
</div>
</form>            
</body>
</html>
