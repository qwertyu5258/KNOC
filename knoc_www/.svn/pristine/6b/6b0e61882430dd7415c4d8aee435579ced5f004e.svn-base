<%@page import="com.neoboard.session.UserSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.channel.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="ChannelMa" scope="page" class="kr.co.knoc.channel.ChannelManager" />
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>   
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String mode = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("m")));

UserSession userSession = (UserSession)session.getAttribute("USERSESSION");
%>

<%		

	
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("1")));
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("1234")));
	String obm_type = etcutil.strBlockSpecialTags("obm1");
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	
	ArrayList al = new ArrayList();
	int count = 0;
	int seq = 0;

	boolean isMaster = true;
	boolean isUser = false;
/*
	if(session.getAttribute("SINMUNGO_STATUS_NO") != null){ 
		if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("3")){
			isMaster = true;
		}else if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("2")){
			isUser = true;
		} 
	}*/
	//out.print("<script>if(!"+isUser+"){alert(\"접근 권한이 없습니다.\");location.href = \"/sub04/sub04_8.jsp\";}</script>");
%>        

     
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contentsLayer">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->

<script type="text/javascript">

	if(false){
		alert("접근 권한이 없습니다.");
		location.href = "/ombudsman/main.jsp";
	}
	
	function onSubmit(){
	
		if(document.getElementById("subject").value == ""){
			alert("제목을 입력해 주세요.");
			document.getElementById("subject").focus();
			return;
		}
		if(document.getElementById("article_pwd").value == ""){
			alert("패스워드를 입력해 주세요.");
			document.getElementById("article_pwd").focus();
			return;
		}
		

		if(document.getElementById("content").value == ""){
			alert("내용을 입력해 주세요.");
			document.getElementById("content").focus();
			return;
		}
		
		if(confirm("등록 하시겠습니까?")){
			document.getElementById("form01").submit();
		}
	}
	
	

//-->
</script>
	<div id="rightarea">
		<div id="subcnts">			
		
			<!-- 디자인팀 수정요청[start] -->
			<%@include file="/include/subtop_04.jsp"%>
			<!-- 디자인팀 수정요청[end] -->
			
			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
				&gt; <span>고객참여</span>&gt; <span class="locanow">청렴 옴부즈만 신고센터</span>
			</div>
			<!--// location: end //-->

			<div class="pagetle">
				<h3><img src="/images/omb/ttl_sub04_8_10.gif" alt="청렴 옴부즈만 신고센터" /></h3> 
			</div>
			<div id="boardsec">

<form action="submit.jsp" method="post" name="form01" id="form01" enctype="multipart/form-data">
	<input type="hidden" name="order_no" value="0">
	<input type="hidden" name="status_no" value="1">
	<input type="hidden" name="level_no" value="0">
	<input type="hidden" name="type" value="0">		
	<input type="hidden" name="obm_type" value="<%=obm_type %>" />
	<input type="hidden" id="article_pwd" name="article_pwd" value="<%=userSession.getUserVirtualno() %>"/>			
				<table cellspacing="0" cellpadding="0" class="viewtype" summary="GREAT WAY 게시판의 상세정보를 입력합니다.">
					<caption>GREAT WAY 글쓰기</caption>
					<colgroup>
						<col width="100px" />
						<col width="620px" />
					</colgroup>			
					<tr>
						<th scope="row" class="th1" colspan="2"><label for="subject">수신인 :  <%=obm_type %></label></th>
					</tr>	
					<tr>
						<th scope="row" class="th1" colspan="2"><label for="subject">1. 신고사유(자유로이 기술)</label></th>						
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="subject">제&nbsp;&nbsp;목</label></th>
						<td class="td1"><input type="text" value="" id="subject" name="subject" maxlength="200" class="input" style="width:570px;" /></td>
					</tr>
					
						
					
					<tr>
						<th scope="row" class="th1"><label for="content">내&nbsp;&nbsp;용</label></th>
						<td class="cnts1"><textarea name="content" id="content" cols="120" style="width:100%;height:300px" class="inputST"></textarea></td>
					</tr>
					<tr>
						<th scope="row" class="th1" colspan="2"><label for="subject">3. 관련파일 첨부</label></th>						
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="pwd">첨부파일</label></th>
						<td class="cnts1">
							<input type="file" name="filex1"/> 파일 크기는 10MB까지 가능합니다.								
							<div style="margin-top: 5px"></div>
							<input type="file" name="filex2"/> 파일 크기는 10MB까지 가능합니다.								
						</td>
					</tr>				
				</table>
</form>					
					<div class="boardbtm mtm10">
						<div class="btnsec">
							<a href="#content" onclick="onSubmit();return false;"><input type="image" src="/images/board/btn_ok.gif" alt="확인" /></a>
							<a href="/ombudsman/obmChoice.jsp"><img src="/images/board/btn_cancel.gif" alt="취소" /></a>
						</div>
					</div>								
							
			</div>	
		</div>
	</div>
</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>