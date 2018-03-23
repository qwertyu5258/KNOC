<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.participate.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="ParticipateBa" scope="page" class="kr.co.knoc.participate.ParticipateManager" />

<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "사보독자참여";  		// 서브 Depth 제목
    String gNavSubName = "neoboard";				// 서브 Depth 이름
    String gNavDepthTitle1 = "04"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

    application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "게시판생성";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
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
	location.href = "/SiteControl/neoboard/board_03.jsp?question_nid=1";  
		
//-->
</script>