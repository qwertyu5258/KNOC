<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.mgr.*"%>    
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrMa" scope="page" class="kr.co.knoc.mgr.MgrHelper" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%!
    String getSession(HttpSession session, String attrName)
    {
        return session.getAttribute(attrName) != null ? (String)session.getAttribute(attrName) : "";
    }
%>
<%
	String gpin_aq_service_site_user_confirm = getSession(session, "GPIN_AQ_SERVICE_SITE_USER_CONFIRM");
%>
<%   
	String name =  getSession(session, "realName");
    String userid =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("userid")),"8859_1");
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
   	String virtualno = getSession(session, "virtualNo");
   	
   	String ip = request.getRemoteAddr();   	
   	
   	boolean checkid = MgrMa.checkID(userid);
   	if (checkid) {
%>
<script type="text/javascript">
		alert("이미 등록된 아이디 입니다.");
		history.back();
</script>	
<%   	
		return;
   	}
   	
   	boolean checkVirtualno = MgrMa.checkVirtualNo(virtualno);
   	if (checkVirtualno) {
%>
<script type="text/javascript">
		alert("이미 등록된 회원 입니다.");
		history.back();
</script>	
<%   	
		return;
   	}
   	
	MgrDO data = new MgrDO();

	data.setId(userid);			
	data.setPasswd(passwd);
	data.setName(name);
	data.setEmail(email);
	data.setPhoneNumber(phone);
	data.setMobileNumber(mobile);
	data.setZipcode(zipcode);
	data.setAddr1(addr1);
	data.setAddr2(addr2);
	data.setJob(job);
	data.setVirtualno(virtualno);
	data.setLetter(letter);
	data.setIp(ip);	
	
	boolean result = MgrMa.insertMgr(data);   		
	
	if (!result) {
%>
<script type="text/javascript">
	alert("회원가입이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {
// G-PIN 세션 제거	
	session.setAttribute("dupInfo", null);
	session.setAttribute("virtualNo", null);
	session.setAttribute("realName", null);
	session.setAttribute("sex", null);
	session.setAttribute("age", null);
	session.setAttribute("birthDate", null);
	session.setAttribute("nationalInfo", null);
	session.setAttribute("authInfo", null);     
	session.setAttribute("GPIN_AQ_SERVICE_SITE_USER_CONFIRM", null);
%>
<script type="text/javascript">
//<![CDATA[
//<!--
	function testSiteUserConfirm(){
			wWidth = 350;
			wHight = 120;
			wX = (window.screen.width - wWidth) / 2;
			wY = (window.screen.height - wHight) / 2;
			
			attr = "GPIN_AQ_SERVICE_SITE_USER_CONFIRM";
			
			// vidn 값에 vidn + siteuserid 값을 붙여 보낸다.
			requrl = "/GPIN/Sample-SiteUserConfirmRequest.jsp?Attr="+attr+"&vidn=" + "<%=virtualno%>" + "|" +"<%=userid%>"; 
								
			var w = window.open(requrl, "_blank", "directories=no,toolbar=no,left="+wX+",top="+wY+",width="+wWidth+",height="+wHight);
	}
	
	testSiteUserConfirm();
	alert("회원가입이 완료되었습니다.");
    location.href = "<%=etcutil.DOMAIN_URL %>/member/join_fine.jsp";
//-->
//]]>	
</script>
<% 	
  	}
%>
