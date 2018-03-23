<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.satisfy.*"%> 
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="SatisfyMa" scope="page" class="kr.co.knoc.satisfy.SatisfyManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   	
	String mcode = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mcode")),"8859_1");
	String user_id = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("user_id")),"8859_1");
	String satisfy_cmt = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("satisfy_cmt")),"8859_1");
	String return_url = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("return_url")),"8859_1");
	String ip = request.getRemoteAddr();
	int	score	= (request.getParameter("score")==null)?0:Integer.parseInt(request.getParameter("score"));
	int	score1	= 0;
	int	score2	= 0;
	int	score3	= 0;
	int	score4	= 0;
	int	score5	= 0;
	if (score == 1) {
		score1 = 1;
	} else if (score == 2) {
		score2 = 1;
	} else if (score == 3) {
		score3 = 1;
	} else if (score == 4) {
		score4 = 1;
	} else if (score == 5) {
		score5 = 1;
	}
	
	SatisfyBean sfb = new SatisfyBean();
	sfb.setScore1(score1);
	sfb.setScore2(score2);
	sfb.setScore3(score3);
	sfb.setScore4(score4);
	sfb.setScore5(score5);
	sfb.setMcode(mcode);
	sfb.setComment(satisfy_cmt);
	sfb.setId(user_id);
	sfb.setIp(ip);
	
	int resultCnt = SatisfyMa.updateSatisfy(sfb);
	boolean result = false;
	if (resultCnt <= 0) {
		result = SatisfyMa.insertSatisfy(sfb);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>만족도평가</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
	<script type="text/javascript" src="/include/js/java.js"></script>	
	<script type="text/javascript" src="/include/js/common.js"></script>	
</head>

<body style="background:#ffffff;">
<%
	if (resultCnt <= 0 && !result) {
%>
<script type="text/javascript">
	alert("만족도평가가 실패했습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("만족도평가가 완료되었습니다.");
	location.href = "<%=return_url%>";
</script>
<% 	
	}
%>	
</body>
</html>