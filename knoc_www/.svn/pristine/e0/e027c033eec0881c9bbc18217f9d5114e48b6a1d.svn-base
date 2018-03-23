<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page import = "kr.co.knoc.participate.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="ParticipateBa" scope="page" class="kr.co.knoc.participate.ParticipateManager" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","11");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%   
 	request.setCharacterEncoding("euc-kr"); 
%>
<%	
	int	questionNo = 0;
	int participate_bbs_seq = 0;

	boolean result = false;
	String returnMsg = "";	
	
	if(!"".equals(request.getParameter("questionSeq"))){
		if(!"".equals(request.getParameter("participateSeq"))){	
			questionNo = Integer.parseInt(request.getParameter("questionSeq"));
			participate_bbs_seq = Integer.parseInt(request.getParameter("participateSeq"));
		}else{
			questionNo	= 0;
			participate_bbs_seq = 0;
		}
	}else{
		questionNo	= 0;
		participate_bbs_seq = 0;
	} 
	
	ParticipateNewBean pnb = new ParticipateNewBean(); 
	
	
	//삭제
	if(participate_bbs_seq > 0) {		
		pnb.setQuestionNo(questionNo);
		pnb.setParticipate_bbs_seq(participate_bbs_seq);
		
		result = ParticipateBa.deleteParticipateBbs(pnb);
		
	}
	 
	if(!result){ 
		returnMsg = "삭제중 에러가 발생하였습니다.";
	}else{
		returnMsg = "삭제 되었습니다.";
		
	}
%>

<script type="text/javascript">
<!--

	alert("<%=returnMsg %>");	
	location.href = "reader_participate_bbs.jsp?question_nid=1";  
		
//-->
</script>

