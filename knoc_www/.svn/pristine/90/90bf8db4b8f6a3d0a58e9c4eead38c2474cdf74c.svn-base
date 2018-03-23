<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.participate.*"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="ParticipateBa" scope="page" class="kr.co.knoc.participate.ParticipateManager" />		
<% request.setCharacterEncoding("euc-kr"); %>

<%   	
	ParticipateBean pb =  new ParticipateBean();
	int result = 0;
	int	questionNo = 0;
	int participateBbsSeq = 0;
	
	String check_bbs_pass = "";
	String resultMsg = "";
	
	int pageNo = etcutil.checkNullInt(request.getParameter("page").toString(), 1);
	String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")), "8859_1");
	String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")), "8859_1");	
	
	if(!"".equals(request.getParameter("questionNo"))){
		if(!"".equals(request.getParameter("participate_bbs_seq"))){	
			questionNo = Integer.parseInt(request.getParameter("questionNo")); 
			participateBbsSeq = Integer.parseInt(request.getParameter("participate_bbs_seq")); 	 
		}else{
			questionNo	= 0;
			participateBbsSeq = 0;
		}
	}else{
		questionNo	= 0;
		participateBbsSeq = 0;
	} 
	
	check_bbs_pass = EtcUtil.strBlockSpecialTags(request.getParameter("bbs_pass"), "8859_1");
	ParticipateNewBean pnb = new ParticipateNewBean(); 
	
	if(participateBbsSeq > 0) {		
		
		pnb.setQuestionNo(questionNo);
		pnb.setParticipate_bbs_seq(participateBbsSeq);
		pnb.setBbs_pass(check_bbs_pass);
		
		result = ParticipateBa.bbs_pass_check(pnb);
		
	}
%>
<%	
	if(result > 0){ 
%>
	<script type="text/javascript"> 
	   	opener.location.href = "reader_participate_view.jsp?question_nid=1&participate_bbs_nid=<%=participateBbsSeq%>&page=<%=pageNo%>&schType=<%=schType%>&schText=<%=schText%>";
	    window.close();
	</script>
<%		
	}else{
%>
	<script type="text/javascript">
		alert("비밀번호를 잘못 입력하셨습니다.");
	    window.close();
	</script>
<%		
	} 
%>

