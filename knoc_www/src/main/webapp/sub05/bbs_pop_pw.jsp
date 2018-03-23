<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.participate.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="ParticipateBa" scope="page" class="kr.co.knoc.participate.ParticipateManager" />
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
<%
	int	participate_bbs_seq	= (request.getParameter("participate_bbs_seq")==null)?0:Integer.parseInt(request.getParameter("participate_bbs_seq"));
	int pageNo = etcutil.checkNullInt(etcutil.checkNull(request.getParameter("page")).toString(), 1);  // 보안약점 조치 2016.03.21 ECJ
	
	String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")), "8859_1");
	String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")), "8859_1");
%>
<script type="text/javascript" language="javascript">
<!--
	function passSubmit(){
		if(document.getElementById("bbs_pass").value == ""){
			alert("비밀번호를 입력해 주세요.");
			document.passForm.bbs_pass.focus();
			return;
		}else{
			document.passForm.submit();
		}
	}
//-->
</script>

	<form id="passForm" name="passForm" action="passCheck.jsp" method="post">
		<input type="hidden" id="questionNo" name="questionNo" value="1" />
		<input type="hidden" id="participate_bbs_seq" name="participate_bbs_seq" value="<%=participate_bbs_seq %>" />
		<input type="hidden" id="page" name="page" value="<%=pageNo %>" />
		<input type="hidden" id="schType" name="schType" value="<%=schType %>" />
		<input type="hidden" id="schText" name="schText" value="<%=schText %>" />
		
		<div id="pop_wrap_3">
	    	<h1><img src="/images/board/pop_pw_01.gif" alt="" border="0" /></h1>
		    <div id="pw_body">
		        <dl>
		            <dt style="line-height:25px; padding-left:50px;"><label for="passwd">비밀번호를 입력하세요.</label></dt>
		            <dd style="text-align:center" class="pt10">
		            	<input type="password" id="bbs_pass" name="bbs_pass" class="login" align="absmiddle" value="" title="비밀번호 입력" /> 
		            	<a href="#passCheck" onclick="passSubmit(); return false;">
		            		<img src="../images/member/btn_sumbit_01.gif" align="absmiddle" alt="확인" />
		            	</a>	
		            </dd>
		        </dl>
		    </div>
		</div> 	
	</form>
</body>
</html>
