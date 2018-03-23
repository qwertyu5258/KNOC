<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.mgr.*"%>    
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrMa" scope="page" class="kr.co.knoc.mgr.MgrHelper" />		
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>회원정보 수정 처리 페이지 입니다.</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
</head>
<body>
<%   
	MgrSession mem_ses = (MgrSession)session.getAttribute("USERSESSION");
	String userid = "";
	if (mem_ses == null) {
%>
	<script type="text/javascript">
	alert("로그인 하신 후 이용 가능하십니다.");
	history.back();
	</script><noscript>로그인 하신 후 이용 가능하십니다. <a href="login.jsp" title="로그인 페이지로 이동합니다.">[GO]</a>를 선택하시면 로그인 페이지로 이동합니다.</noscript>
<%		
		return;		
	} else {
		userid = mem_ses.getUserID();
	}
   	String passwd =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("passwd")),"8859_1");
   	String email =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("email_pre")),"8859_1") + "@" + etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("email_post")),"8859_1");
   	String phone1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone1")),"8859_1");
   	String phone2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone2")),"8859_1");
   	String phone3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone3")),"8859_1");
   	String phone = phone1 + "-" + phone2 + "-" + phone3;
   	String mobile1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile1")),"8859_1");
   	String mobile2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile2")),"8859_1");
   	String mobile3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile3")),"8859_1");
   	String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
   	String zipno1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("zipno1")),"8859_1");
   	String zipno2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("zipno2")),"8859_1");
   	String zipcode = zipno1 + "-" + zipno2;
   	String addr1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("addr1")),"8859_1");
   	String addr2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("addr2")),"8859_1");
   	String job =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("job")),"8859_1");
   	String letter =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("letter")),"8859_1");

   	
   	if (userid == null || userid.equals("")) {
%>
<script type="text/javascript">
		alert("잘못된 호출입니다.");
		history.back();
</script><noscript>잘못 된 호출입니다. <a href="login.jsp" title="로그인 페이지로 이동합니다.">[GO]</a>를 선택하시면 로그인 페이지로 이동합니다.</noscript>	
<%   	
		return;
   	}
   	
	MgrDO data = new MgrDO();

	data.setId(userid);			
	data.setPasswd(passwd);
	data.setEmail(email);
	data.setPhoneNumber(phone);
	data.setMobileNumber(mobile);
	data.setZipcode(zipcode);
	data.setAddr1(addr1);
	data.setAddr2(addr2);
	data.setJob(job);
	data.setLetter(letter);
	
	boolean result = MgrMa.updateMgrUser(data);   		
	
	if (!result) {
%>
<script type="text/javascript">
	alert("회원정보수정이 실패하였습니다.");
	history.back();
</script><noscript>회원정보수정이 실패하였습니다. <a href="joinEdit.jsp" title="이전 페이지로 이동 합니다.">[GO]</a>를 선택하시면 회원정보 수정 페이지로 이동합니다.</noscript>	
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("회원정보수정이 완료되었습니다.");
    location.href = "<%=etcutil.DOMAIN_URL %>/member/joinEdit.jsp";
</script><noscript>회원정보수정이 완료되었습니다.<a href="/index.jsp" title="이전 페이지로 이동 합니다.">[GO]</a>를 선택하시면 메인 페이지로 이동합니다.</noscript>	
<% 	
  	}
%>
</body>
</html>