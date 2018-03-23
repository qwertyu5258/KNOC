<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.recruit.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="RecruitPMa" scope="page" class="kr.co.knoc.recruit.RecruitPersonManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String key_gbn =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")));
	String key_word =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")));
    String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
	%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
	<%	
		return;
	}
	
	boolean result = RecruitPMa.deleteRecruitPerson(no);
	
	if (!result) {
%>
<script language="javascript">
	alert("상시인재등록관리 삭제가 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("상시인재등록관리 삭제가 완료되었습니다.");
    location.href = "recruitPersonList.jsp?key_gbn=<%=key_gbn%>&key_word=<%=key_word%>&page=<%=nowpage%>";
</script>
<% 	
  	}
%>