<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.mgr.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrMa" scope="page" class="kr.co.knoc.mgr.MgrHelper" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String userid =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("userid")),"8859_1");
   	String email =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("email")),"8859_1");
   	String phone1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone1")),"8859_1");
   	String phone2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone2")),"8859_1");
   	String phone3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("phone3")),"8859_1");
   	String phone = phone1 + "-" + phone2 + "-" + phone3;
   	String mobile1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile1")),"8859_1");
   	String mobile2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile2")),"8859_1");
   	String mobile3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile3")),"8859_1");
   	String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
   	String zipcode1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("zipcode1")),"8859_1");
   	String zipcode2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("zipcode2")),"8859_1");
   	String zipcode = zipcode1 + "-" + zipcode2;
   	String addr1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("addr1")),"8859_1");
   	String addr2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("addr2")),"8859_1");
   	String job =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("job")),"8859_1");
   	String letter =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("letter")),"8859_1");
   	String u_level =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("u_level")),"8859_1");
   	
   	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")),"8859_1");
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");	
   	
	MgrDO data = new MgrDO();

	data.setId(userid);			
	data.setEmail(email);
	data.setLevel(u_level);
	data.setPhoneNumber(phone);
	data.setMobileNumber(mobile);
	data.setZipcode(zipcode);
	data.setAddr1(addr1);
	data.setAddr2(addr2);
	data.setJob(job);
	data.setLetter(letter);
	
	boolean result = MgrMa.updateMgr(data);   		
	
	if (!result) {
%>
<script language="javascript">
	alert("회원정보수정이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("회원정보수정이 완료되었습니다.");
    location.href = "memberList.jsp?key_gbn=<%=key_gbn%>&key_word=<%=key_word%>&page=<%=nowpage%>";
</script>
<% 	
  	}
%>