<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.recruit.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="RecruitPMa" scope="page" class="kr.co.knoc.recruit.RecruitPersonManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String name =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("name")),"8859_1");
   	String email =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("email")),"8859_1");
   	String mobile1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile1")),"8859_1");
   	String mobile2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile2")),"8859_1");
   	String mobile3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mobile3")),"8859_1");
   	String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
   	String academic =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("academic")),"8859_1");
   	String school =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("school")),"8859_1");
   	String bunya =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("bunya")),"8859_1");
   	String ip = request.getRemoteAddr();
   	
	RecruitPersonBean rpb = new RecruitPersonBean();

	rpb.setName(name);
	rpb.setEmail(email);
	rpb.setMobile(mobile);
	rpb.setAcademic(academic);
	rpb.setSchool(school);
	rpb.setBunya(bunya);
	rpb.setIp(ip);
	
	boolean result = RecruitPMa.insertRecruitPerson(rpb);   		
	
	if (!result) {
%>
<script type="text/javascript">
	alert("상시인재등록이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("상시인재등록이 완료되었습니다.");
    location.href = "sub01_7_7.jsp";
</script>
<% 	
  	}
%>