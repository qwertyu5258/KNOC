<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.neoboard.*" %>
<%@ page import="com.neoboard.util.*"%>
<% //request.setCharacterEncoding("MS949"); %>
<jsp:useBean id="board" scope="page" class="com.neoboard.NeoBoardManager" />
<%
	EtcUtil etc = new EtcUtil();
	String callback = etc.strBlockSpecialTags2(etc.checkNull(request.getParameter("callback")));
	String bid = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bid")));
	String passwd = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("pass")));
	//String name = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("name")),"8859_1");
	String name = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("name")));
	String bno = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bno")));
	String mode = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("mode")));
	String category = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("category")),"8859_1");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<title>한국석유공사</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />	
</head>
<body>
<%	if (bid.equals("")) { %>
<script language=javascript>
	alert("잘못된 호출입니다.");
	self.close();
</script>
</body>
</html>
<%	
		return;
	}
		
	if (mode != null && !mode.equals("")) {
%>	
<form name="wform" method="post" action="<%=callback%>">
<input type="hidden" name="mode"  value="list" />
<input type="hidden" name="bid" value="<%=bid%>" />
<input type="hidden" name="pass" value="<%=passwd%>" />
<input type="hidden" name="name" value="<%=name%>" />
<input type="hidden" name="bno" value="<%=bno%>" />
</form>
<script type="text/javascript">
	opener.parent.frames.name = "mmx";
	document.wform.target = opener.parent.frames.name;
	document.wform.submit();
	self.close();
</script>
</body>
</html>
<%  
	} else {
%>	
<script type="text/javascript">
	opener.location.href = "<%=callback%>";
	self.close();
</script>
</body>
</html>
<%  			
	}	
%>