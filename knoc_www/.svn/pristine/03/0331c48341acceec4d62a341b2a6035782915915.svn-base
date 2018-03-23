<%@page contentType="text/html;charset=euc-kr" errorPage="" %>
<%@ page import = "com.neoboard.*" %>
<%@ page import = "com.neoboard.session.*" %>
<%@ page import="com.neoboard.util.*" %>
<% request.setCharacterEncoding("MS949"); %>
<jsp:useBean id="board" scope="page" class="com.neoboard.NeoBoardManager" />
<%

	String sessionName = (String)pageContext.getAttribute("NB_SESNAME",PageContext.REQUEST_SCOPE);

	EtcUtil etc = new EtcUtil();
	String callback = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("callback")));
	String bid = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bid")));
	String bno = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bno")));
	String passwd = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("passwd")));
	String mode = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("mode")));
	String category = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("category")));
	String psize = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("psize")));
	int cnt = 0;            // 증가 변수
	int chkCnt = 0;         // 쿠키체크용 변수
	String chkId  = "";     // 쿠키체크용 변수
	String chkBno = "";     // 쿠키체크용 변수
	String chkCo  = "";     // 세션체크용 변수
	String chksessDel = "Y";// 세션체크용 변수
	String sessId = "";
	
	
	// 틀린횟수체크 세션 세팅
	if(session.getAttribute("sessId") == null || session.getAttribute("sessId").equals("")){
		session.setAttribute("sessId", "");
	}else{
		sessId = (String)session.getAttribute("sessId");
	}
	
    // 비밀번호 틀린횟수 쿠키확인
	Cookie[] co = request.getCookies();
	for (int i=0; i<co.length; i++) {
		if (co[i].getName().equals("cntCheck" + "_" + bno)) {
			String[] temp1  =   co[i].getValue().split("_");
			chkCnt = Integer.parseInt(temp1[0]);
			chkBno = temp1[1];
			chkId  = temp1[2];						
		}
	}
		
	// 횟수체크 쿠키가 만료시 관련 세션을 삭제
	for (int i=0; i<co.length; i++) {			
		String[] temp2  =   co[i].getName().split("_");
		chkCo    = temp2[0];
		if(chkCo.equals("cntCheck")) chksessDel = "N";		
	}		
	if(chksessDel == "Y")  session.removeValue("sessId");

	
	
	if (bid.equals("") || bno.equals("")) {
				
%>
<script language=javascript>
	alert("잘못된 호출입니다.");
	self.close();
</script>
<%	
		return;
	}
		
	// 비밀번호 다수 틀릴시 로그인 제한
	if (chkCnt >= 5 && chkId.equals(sessId) && chkBno.equals(bno)) {			
		session.setAttribute("loginSession", "Y");
		
		for(int i=0; i<co.length; i++){
			co[i].setPath("/");
			co[i].setMaxAge(0);
			response.addCookie(co[i]);
		}		
				
%>
<script language=javascript>
	alert("비밀번호를 5회이상 잘못 입력하셨습니다. 10분 후에 입력 가능 합니다. ");
	alert("로그인을 하셔야만 접근할 수 있습니다.");	
	opener.location.href = "/member/logout.jsp";
	self.close();	

</script>
<%	
		return;
	}
	
		
	String virtualNo2 = "";
	boolean result = false; 
	if(bid.equals("SANGDAM")){		
		UserSession userSession = null;
		if(sessionName == null || sessionName.equals(""))
			userSession = (UserSession)session.getAttribute("USERSESSION");
		else
			userSession = (UserSession)session.getAttribute(sessionName);		
			virtualNo2 = userSession==null ? "":userSession.getUserVirtualno();		

		if(virtualNo2.equals("")){
%>
		<script type="text/javascript">
			alert("먼저 아이핀 인증(로그인)을 하셔야 됩니다.");
			opener.location.href = "/member/login.jsp";
			self.close();
		</script>		
<%
		if(true) return;
		}
		else{
			result = board.checkPasswd2(bid, passwd, virtualNo2, Integer.parseInt(bno));
		}
	}
	else{
		result = board.checkPasswd(bid, passwd, Integer.parseInt(bno));
	}
	if (result) {
		if (mode != null && !mode.equals("")) {
%>	
<form name="wform" method="post" action="<%=callback%>">
<input type="hidden" name="mode"  value="view" />
<input type="hidden" name="num" value="<%=bno%>" />
<input type="hidden" name="bid" value="<%=bid%>" />
<input type="hidden" name="passwd" value="<%=passwd%>" />
<input type="hidden" name="category" value="<%=category%>" />
<input type="hidden" name="psize" value="<%=psize%>" />
</form>
<script type="text/javascript">
	opener.parent.frames.name = "mmx";
	document.wform.target = opener.parent.frames.name;
	document.wform.submit();
	self.close();
</script>
<%  

		} else {
%>	
<script type="text/javascript">
	opener.location.href = "<%=callback%>";
	self.close();
</script>
<%  			
		}
		
		cnt = 0;		
		return;
		
	} else { 

		// 비밀번호 다수 틀릴시 로그인 제한 로직 시작
		if(session.getAttribute("sessId") == null || session.getAttribute("sessId").equals("")){						
			session.setAttribute("sessId", "cntSession");
			sessId = (String)session.getAttribute("sessId");
		}
		// 비밀번호 틀린횟수 쿠키 만듬
		if(chkBno.equals(bno)){
			cnt = chkCnt;
			cnt += 1;
		}else{
			cnt = 1;			
		}

		String str = cnt + "_" + bno + "_" + sessId;
		Cookie cookie = new Cookie ("cntCheck" + "_" + bno, str);
		cookie.setPath("/");
		cookie.setMaxAge(600);	
		response.addCookie(cookie);
		// 비밀번호 다수 틀릴시 로그인 제한 로직 시작 종료
%>
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다. 누적횟수 : " + <%=cnt%>  +"/5\n 5회 이상 틀리실 경우 10분 동안 해당 글을 조회할 수 없습니다.");
	history.back();
	
</script>
<%  
		return;
	} 
%>