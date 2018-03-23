<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.sitectrl.mgr.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrMa" scope="page" class="kr.co.knoc.sitectrl.mgr.MgrHelper" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String name =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("name")),"8859_1");
    String userid =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("userid")),"8859_1");
   	String passwd =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("userpwd")),"8859_1");
   	String email =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("email")),"8859_1");
   	String u_level =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("u_level")),"8859_1");
   	String d_code =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("d_code")),"8859_1");
   	String phone1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone1")),"8859_1");
   	String phone2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone2")),"8859_1");
   	String phone3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone3")),"8859_1");
   	String phone = phone1 + "-" + phone2 + "-" + phone3;
   	String mobile1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile1")),"8859_1");
   	String mobile2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile2")),"8859_1");
   	String mobile3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile3")),"8859_1");
   	String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
   	String fax1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("fax1")),"8859_1");
   	String fax2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("fax2")),"8859_1");
   	String fax3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("fax3")),"8859_1");
   	String fax = fax1 + "-" + fax2 + "-" + fax3;
   	String etc =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("etc")),"8859_1");
   	String strCntError =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("cntError")),"8859_1");
   	Integer cntError = 0;
   	if(strCntError != null && !strCntError.equals("")) { cntError = Integer.parseInt(strCntError); } 
   	
   	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")),"8859_1");
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");	

   	String ip = request.getRemoteAddr();   	   	   	
   	
	MgrDO data = new MgrDO();

	// 보안약점 조치 2016.03.21 ECJ
	data.setId(etcutil.InjectionDefender(userid));			
	data.setPasswd(etcutil.InjectionDefender(passwd));
	data.setName(etcutil.InjectionDefender(name));
	data.setEmail(etcutil.InjectionDefender(email));
	data.setLevel(etcutil.InjectionDefender(u_level));
	data.setDCode(etcutil.InjectionDefender(d_code));
	data.setPhone(etcutil.InjectionDefender(phone));
	data.setMobile(etcutil.InjectionDefender(mobile));
	data.setFax(etcutil.InjectionDefender(fax));
	data.setEtc(etcutil.InjectionDefender(etc));
	data.setCntError(cntError);
	
	boolean result = MgrMa.updateMgr(data); 		
	
	if (!result) {
%>
<script language="javascript">
	alert("관리자수정이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("관리자수정이 완료되었습니다.");
    location.href = "adminList.jsp?key_gbn=<%=key_gbn%>&key_word=<%=key_word%>&page=<%=nowpage%>";
</script>
<% 	
  	}
%>