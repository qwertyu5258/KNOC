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
	String captchaInput = (String)request.getParameter("captchaInput");
	String captchaAnswer = (String)request.getSession().getAttribute("CAPTCHA_ANSWER");
	
	if(request.getParameter("participate_bbs_seq") != null && "0".equals(request.getParameter("participate_bbs_seq"))){
		if(captchaInput == null || captchaAnswer == null || captchaInput.length() == 0 || captchaAnswer.length() == 0
				|| !captchaInput.equals(captchaAnswer)){
			out.print("<script type='text/javascript'>alert('자동입력방지 단어가 일치하지 않습니다.');history.back();</script>");
			return;
		}
	}


	int	questionNo = 0;
	int participate_bbs_seq = 0;
	
	String writer = "";
	String bbs_pass = "";
	String bbs_cellphone = "";
	String bbs_email = "";
	String begin_title = "";
	String bbs_title = "";
	String bbs_contents = "";	

	boolean result = false;
	String returnMsg = "";
	String writestr = "";
	String returnUrl = "";
	
	if(!"".equals(request.getParameter("questionNo"))){
		if(!"".equals(request.getParameter("participate_bbs_seq"))){	
			questionNo = Integer.parseInt(request.getParameter("questionNo"));
			participate_bbs_seq = Integer.parseInt(request.getParameter("participate_bbs_seq"));
		}else{
			questionNo	= 0;
			participate_bbs_seq = 0;
		}
	}else{
		questionNo	= 0;
		participate_bbs_seq = 0;
	} 
	
	writer = EtcUtil.strBlockSpecialTags(request.getParameter("writer"), "8859_1");
	bbs_pass = EtcUtil.strBlockSpecialTags(request.getParameter("bbs_pass"), "8859_1");
	bbs_cellphone = EtcUtil.strBlockSpecialTags(request.getParameter("bbs_cellphone"), "8859_1");
	bbs_email = EtcUtil.strBlockSpecialTags(request.getParameter("bbs_email"), "8859_1");
	begin_title = EtcUtil.strBlockSpecialTags(request.getParameter("begin_title"), "8859_1");
	bbs_title = EtcUtil.strBlockSpecialTags(request.getParameter("bbs_title"), "8859_1");
	bbs_contents = EtcUtil.strBlockSpecialTags(request.getParameter("bbs_contents"), "8859_1");
	
	ParticipateNewBean pnb = new ParticipateNewBean(); 
	
	
	//수정
	if(participate_bbs_seq > 0) {		
		writestr = "수정";
		
		int pageNo = etcutil.checkNullInt(request.getParameter("page").toString(), 1);

		String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")), "8859_1");
		String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")), "8859_1");
		
		returnUrl = "reader_participate_view.jsp?question_nid="+questionNo+"&participate_bbs_nid="+participate_bbs_seq+"&page="+pageNo+"&schType="+schType+"&schText="+schText;
		pnb.setQuestionNo(questionNo);
		pnb.setParticipate_bbs_seq(participate_bbs_seq);
		pnb.setWriter(writer);
		pnb.setBbs_pass(bbs_pass);
		pnb.setBbs_cellphone(bbs_cellphone);
		pnb.setBbs_email(bbs_email);
		pnb.setBegin_title(begin_title);
		pnb.setBbs_title(bbs_title);
		pnb.setBbs_contents(bbs_contents);
		
		result = ParticipateBa.updateParticipateBbs(pnb); 
		
	}else{
		writestr = "등록";
		returnUrl = "reader_participate_bbs.jsp?question_nid=1";
		
		pnb.setQuestionNo(questionNo);
		pnb.setWriter(writer);
		pnb.setBbs_pass(bbs_pass);
		pnb.setBbs_cellphone(bbs_cellphone);
		pnb.setBbs_email(bbs_email);
		pnb.setBegin_title(begin_title);
		pnb.setBbs_title(bbs_title);
		pnb.setBbs_contents(bbs_contents);
		
		result = ParticipateBa.insertParticipateBbs(pnb);
		
	}
	 
	if(!result){ 
		returnMsg = writestr+"중 에러가 발생하였습니다.";
	}else{
		returnMsg = writestr+" 되었습니다.";
		
	}
%>

<script type="text/javascript">
<!--

	alert("<%=returnMsg %>");	
	location.href = "<%=etcutil.strBlockSpecialTags(returnUrl) %>";
	
		
//-->
</script>

