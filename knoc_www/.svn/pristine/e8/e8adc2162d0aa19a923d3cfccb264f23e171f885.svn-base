<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.recruit.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="RecruitMa" scope="page" class="kr.co.knoc.recruit.RecruitManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
%>		
	<stl:msgBack msg="존재하지 않는 게시물입니다."/>
<%	
		return;
	}
	
	
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
   	String zipcode = zipno1;
   	String addr1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("addr1")),"8859_1");
   	String addr2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("addr2")),"8859_1");
   	String visitDate =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("visitDate")).replace("-",""),"8859_1");
   	int	person	= (request.getParameter("person")==null)?0:Integer.parseInt(request.getParameter("person"));
   	String content =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("HTML_BODY")),"8859_1");
   	
   	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")),"8859_1");
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");	
   	
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
	rb.setNo(no);
	
	boolean result = RecruitMa.updateRecruit(rb);   		
	
	if (!result) {
%>
<script language="javascript">
	alert("채용설명회 신청관리 수정이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("채용설명회 신청관리 수정이 완료되었습니다.");
    location.href = "recruitList.jsp?key_gbn=<%=key_gbn%>&key_word=<%=key_word%>&page=<%=nowpage%>";
</script>
<% 	
  	}
%>