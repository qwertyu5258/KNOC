<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.recruit.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="RecruitMa" scope="page" class="kr.co.knoc.recruit.RecruitManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String name =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("name")),"8859_1");
	String company =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("company")),"8859_1");
   	String email =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("email")),"8859_1");
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
   	int	visitDate_y	= (request.getParameter("visitDate_y")==null)?0:Integer.parseInt(request.getParameter("visitDate_y"));
   	int	visitDate_m	= (request.getParameter("visitDate_m")==null)?0:Integer.parseInt(request.getParameter("visitDate_m"));
   	int	visitDate_d	= (request.getParameter("visitDate_d")==null)?0:Integer.parseInt(request.getParameter("visitDate_d"));
   	String visitDate_m2 = "";
   	String visitDate_d2 = "";
   	if (visitDate_m < 10) {
   		visitDate_m2 = "0" + Integer.toString(visitDate_m);
   	} else {
   		visitDate_m2 = Integer.toString(visitDate_m);
   	}
   	if (visitDate_d < 10) {
   		visitDate_d2 = "0" + Integer.toString(visitDate_d);
   	} else {
   		visitDate_d2 = Integer.toString(visitDate_d);
   	}
   	String visitDate = Integer.toString(visitDate_y) + "" + visitDate_m2 + "" + visitDate_d2;
   	int	person	= (request.getParameter("person")==null)?0:Integer.parseInt(request.getParameter("person"));
   	String content =  etcutil.checkNull(request.getParameter("HTML_BODY"));
	try{		content = new String(content.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }	
   	String ip = request.getRemoteAddr();
   	
	RecruitBean rb = new RecruitBean();

	rb.setName(name);
	rb.setCompany(company);	
	rb.setEmail(email);
	rb.setPhone(phone);
	rb.setMobile(mobile);
	rb.setZipcode(zipcode);
	rb.setAddr1(addr1);
	rb.setAddr2(addr2);
	rb.setVisitDate(visitDate);
	rb.setPerson(person);
	rb.setContent(content);
	rb.setIp(ip);
	
	boolean result = RecruitMa.insertRecruit(rb);   		
	
	if (!result) {
%>
<script type="text/javascript">
	alert("채용설명회 신청이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("채용설명회 신청이 완료되었습니다.");
    location.href = "sub01_7_9.jsp";
</script>
<% 	
  	}
%>