<%@page import="kr.co.knoc.sinmungo.ArticleManager"%>
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
   
request.setCharacterEncoding("euc-kr");

	

	ArticleManager articleManager = new ArticleManager(); 
	HashMap dataMap = articleManager.getObmArticleInfo(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));  
	ArrayList article_comment = null; 
	article_comment = articleManager.getArticleCommentInfo(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));
	
	ArrayList fileList = articleManager.getArticleFileList(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));
	
	
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("qpwd")));
	String obm_type = etcutil.checkNull(dataMap.get("OBM_TYPE").toString());
	
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	
	ArrayList al = new ArrayList();
	int count = 0;
	int seq = 0;

	boolean isMaster = false;
	boolean isUser = false;

	if(session.getAttribute("SINMUNGO_STATUS_NO") != null){
		if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("3")){
			isMaster = true;
		}else if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("2")){
			isUser = true;
		} 
	}
%>        

     
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contentsLayer">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->

<script type="text/javascript">
<!--
	if(!<%=isMaster %> && !<%=isUser %>){
		alert("접근 권한이 없습니다.");
		location.href = "/ombudsman/main.jsp";
	}
	
	function onSubmit(){
	
		
		
		if(document.getElementById("subject").value == ""){
			alert("제목을 입력해 주세요.");
			document.getElementById("subject").focus();
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
	
	function fileDownFn(p_file_nid){		
		location.href = "/common/fileDown.jsp?file_nid="+p_file_nid;
	}
	
	function goListPage(){
		document.getElementById("form01").submit();
	}
	
	function goDeletePage(article_nid){
		if(confirm("삭제 하시겠습니까?")){
		location.href = "/ombudsman/delete_submit.jsp?article_nid="+article_nid;
		}
	}
	
	function goModifyPage(article_nid){
		location.href = "/ombudsman/modify.jsp?article_nid="+article_nid+"&obm_type=<%=obm_type%>";
	}
	
	function goUpdateCommentViewCheck(p_no){
		$("comment_div_"+p_no).toggle();
	}
	
	function goSubmitFn(){
		if(document.getElementById("comment_comtents").value == ""){
			alert("내용을 입력해 주세요.");
			document.getElementById("comment_comtents").focus();
			return;
		}
		
		if(confirm("등록 하시겠습니까?")){
			document.getElementById("com_form").submit();
		}
	}
	
	function goUpdateComment(p_no){
		if(document.getElementById("comment_comtents").value == ""){
			alert("내용을 입력해 주세요.");
			
			return;
		}
		if(confirm("수정 하시겠습니까?")){
			document.getElementById("comment_form_"+p_no).submit();
		}
	}
	
	function goDeleteFn(p_no){
		if(confirm("삭제 하시겠습니까?")){
			document.getElementById("comment_del_form_"+p_no).submit();
		}
	}

//-->
</script>
	<div id="rightarea">
		<div id="subcnts">			
		
			<!-- 디자인팀 수정요청[start] -->
			<div class="subTop04">
				<h2><img src="/images/customer/tit_customer.gif" alt="고객참여(Customer Participation)" /></h2>
				<p><img src="/images/customer/txt_customer.gif" alt="수많은 가능성을 확인한 오랜 시간들, 새로운 환경과 어려움에 도전하며 에너지 영토를 넓혀가고 있습니다." /></p>
			</div>
			<!-- 디자인팀 수정요청[end] -->
			
			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
				&gt; <span>고객참여</span>&gt; <span>청렴 옴부즈맨 신고센터</span><!-- &gt; <span class="locanow"></span>  -->
			</div>
			<!--// location: end //-->
			<div class="pagetle">
				<h3>청렴 옴부즈맨 신고센터</h3>
			</div>
			<div id="boardsec">

<form action="list.jsp" method="post" name="form01" id="form01">
	<input type="hidden" name="article_pwd" value="<%=dataMap.get("ARTICLE_PWD") %>">
	<input type="hidden" name="page" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page"))) %>">
	<input type="hidden" name="field" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))) %>">
	<input type="hidden" name="searchValue" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("searchValue"))) %>">
			
				<table cellspacing="0" cellpadding="0" class="viewtype" summary="GREAT WAY 게시판의 상세정보를 입력합니다.">
					<caption>GREAT WAY 글쓰기</caption>
					<colgroup>
						<col width="100px" />
						<col width="620px" />
					</colgroup>			
					
					
					<tr>
						<th scope="row" class="th1"><label for="subject">제&nbsp;&nbsp;목</label></th>
						<td class="td1">
							<%=etcutil.checkNull(dataMap.get("SUBJECT").toString())  %>
						</td>
					</tr>
					
					<tr>
						<th scope="row" class="th1"><label for="subject">등&nbsp;&nbsp;록&nbsp;&nbsp;일</label></th>
						<td class="td1">
							<%=etcutil.checkNull(dataMap.get("REG_DATE").toString())  %>
						</td>
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="content">내&nbsp;&nbsp;용</label></th>
						<td class="cnts1" style="height:250px;vertical-align:top;padding:20px 10px;"><%=etcutil.checkNull(dataMap.get("CONTENTS").toString().replaceAll("\r\n","</br>"))  %></td>
					</tr>
			
					<tr>
						<th scope="row" class="th1"><label for="pwd">첨부파일</label></th>
						<td class="cnts1">
					<%
						for(int i=0; i<fileList.size(); i++){
							HashMap fileMap = (HashMap)fileList.get(i);
					%>
						<%if(!"".equals(etcutil.checkNull(fileMap.get("ORG_FILENM").toString()))){ %>
							<a href="#" onclick="fileDownFn(<%=etcutil.checkNullInt(fileMap.get("FILE_NID").toString(), 0) %>); return false;"><%=etcutil.checkNull(fileMap.get("ORG_FILENM").toString()) %></a>
							<BR />
						<%} %>	
					<%		
							
						}
						
					%>									
						</td>
					</tr>
									
				</table>
				</form>	
				
	<!-- 댓글목록 start -->
	<div class="board_re_list">
	<p>처리상황 조회</p>
		<ul>
 		<%for(int i=0; i< article_comment.size(); i++ ){ 
 			HashMap commentMap = (HashMap)article_comment.get(i);
 		%>
 		
		<li>
			<div class="board_re_name"><%=etcutil.checkNull(commentMap.get("LAST_MODIFIER").toString()) %></div>
			<ul>
			<%
			if(isMaster){
			%>
			<li class="board_re_modify"><a href="#comment_form_<%=i %>" onclick="goUpdateCommentViewCheck('<%=i %>');return false">수정</a></li>
			<li class="board_re_del">
			<form id="comment_del_form_<%=i %>" method="post" action="delete_comment_submit.jsp">
				<input name="article_comment_seq" id="article_comment_seq" type="hidden" value="<%=etcutil.checkNull(commentMap.get("ARTICLE_COMMENT_SEQ").toString()) %>"/> 	
				<input name="article_nid" id="article_nid" type="hidden" value="<%=etcutil.checkNull(dataMap.get("ARTICLE_NID").toString())  %>"/>
			<a href="#comment_form_<%=i %>" onclick="goDeleteFn('<%=i%>');return false">삭제</a>
			</form>
			</li>
			<%}else{ %>
				<li class="board_re_modify_none"> </li>
				<li class="board_re_del"> </li>
			<%} %>
			<li class="board_re_cont"><%=etcutil.checkNull(commentMap.get("COMMENT_COMTENTS").toString().replaceAll("\r\n","</br>")) %></li>
			<li class="board_re_date"><%=etcutil.checkNull(commentMap.get("LAST_UPDATE_DATE").toString().substring(0,10)) %></li>
 
				<!-- 댓글 수정 start -->
				<form id="comment_form_<%=i %>" action="modify_comment_submit.jsp" method="post">			
					<input name="article_comment_seq" id="article_comment_seq" type="hidden" value="<%=etcutil.checkNull(commentMap.get("ARTICLE_COMMENT_SEQ").toString()) %>"/>
					<input name="last_modifier" id="last_modifier" type="hidden" value="담당자"/> 	
					<input name="article_nid" id="article_nid" type="hidden" value="<%=etcutil.checkNull(dataMap.get("ARTICLE_NID").toString())  %>"/>
				<div class="reply_modify" id="comment_div_<%=i %>" style="display:none;">
					<fieldset><legend>댓글수정</legend>
						<div class="board_re_text"><textarea name="comment_comtents" id="comment_comtents" cols="0" rows="0" title="댓글 내용을 입력하세요."><%=etcutil.checkNull(commentMap.get("COMMENT_COMTENTS").toString()) %></textarea></div>
						<div class="board_re_btn"><input type="button" value="댓글수정" onclick="goUpdateComment(<%=i %>);" /></div>
					</fieldset>									
				</div>
				</form>
				<!-- //댓글 수정 end -->
			</ul>
		</li>

 	<%} %>
 
		</ul>
	
	</div>
	<!-- //댓글목록 end -->
 
 
	<!-- 댓글 등록 start -->
	<form name="com_form" id="com_form" method="post" action="insert_comment_submit.jsp" >	
		<input name="article_nid" id="article_nid" type="hidden" value="<%=etcutil.checkNull(dataMap.get("ARTICLE_NID").toString())  %>"/>
		<input name="last_modifier" id="last_modifier" type="hidden" value="담당자"/>
		<input type="hidden" name="article_pwd" value="<%=dataMap.get("ARTICLE_PWD") %>">
		<!-- <input type="hidden" name="page" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page"))) %>">
		<input type="hidden" name="field" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))) %>">
		<input type="hidden" name="searchValue" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("searchValue"))) %>"> 
		-->
	<%
		if(isMaster){
	%>
	<div class="board_re_write">
	<fieldset><legend>댓글등록</legend>
		<div class="board_re_name2">댓글입력</div>
		<div class="board_re_text"><textarea name="comment_comtents" id="comment_comtents" cols="0" rows="0" title="댓글 내용을 입력하세요."></textarea></div>
		<div class="board_re_btn"><input type="button" value="댓글등록" onclick="goSubmitFn();"/></div>
	</fieldset>
	</div>
	<%} %>
	</form>
	<!-- //댓글 등록 end -->
 
 
 

				
				
				<div class="boardbtm mtm10">
					<div class="btnsec">
					<%
						if(isUser){ 
					%>
						<a href="#Modify" onclick="goModifyPage('<%=etcutil.checkNull(dataMap.get("ARTICLE_NID").toString())  %>');return false;"><input type="image" src="/images/board/btn_modi.gif" alt="수정" /></a>
					<%
						}
					%>
						<a href="#Delete" onclick="goDeletePage('<%=etcutil.checkNull(dataMap.get("ARTICLE_NID").toString())  %>');return false;"><input type="image" src="/images/board/btn_del.gif" alt="삭제" /></a>
						<a href="#content" onclick="goListPage();return false;"><input type="image" src="/images/board/btn_list.gif" alt="목록" /></a>
					</div>
				</div>								
							
			</div>	
		</div>
	</div>
</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>