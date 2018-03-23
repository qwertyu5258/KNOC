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
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/

request.setCharacterEncoding("euc-kr");



	ArticleManager articleManager = new ArticleManager();
	HashMap dataMap = articleManager.getArticleInfo(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));
	ArrayList article_comment = null;
	article_comment = articleManager.getArticleCommentInfo(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));

	ArrayList fileList = articleManager.getArticleFileList(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));


	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("qpwd")));

	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");

	ArrayList al = new ArrayList();
	int count = 0;
	int seq = 0;

	boolean isMaster = false;
	boolean isUser = false;

	if(session.getAttribute("SINMUNGO_STATUS_NO") != null){
		if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("1")){
			isMaster = true;
		}else if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("2")){
			isUser = true;
		}
	}

	System.out.println("dataMap.toString() :: "+dataMap.toString());
%>


<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contentsLayer">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->

<script type="text/javascript">
<!--
	if(!<%=isMaster %> && !<%=isUser %>){
		alert("접근 권한이 없습니다.");
		location.href = "/sinmungo/main.jsp";
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
		location.href = "/sinmungo/delete_submit.jsp?article_nid="+article_nid;
		}
	}

	function goModifyPage(article_nid){
		location.href = "/sinmungo/modify.jsp?article_nid="+article_nid;
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
			<%@include file="/include/subtop_04.jsp"%>
			<!-- 디자인팀 수정요청[end] -->

			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
				&gt; <span>고객참여</span>&gt; <span>청탁등록</span><!-- &gt; <span class="locanow"></span>  -->
			</div>
			<!--// location: end //-->
			<div class="pagetle">
				<h3><img src="/images/customer/ttl_sub04_8_1.gif" alt="인사 청탁&bull;알선 신문고" /></h3>
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
						<col width="260px" />
						<col width="100px" />
						<col width="260px" />
					</colgroup>
					<tr>
						<th scope="row" class="th1"><label for="user_nm">청탁자 성명</label></th>
						<td class="td1">
							<%= dataMap.get("USER_NM")==null ? "": dataMap.get("USER_NM").toString()  %>
						</td>
						<th scope="row" class="th1"><label for="obm_type">부서명</label></th>
						<td class="td1">
							<%= dataMap.get("OBM_TYPE")==null ? "": dataMap.get("OBM_TYPE").toString()  %>
							<%--
							<%if(!"null".equals(etcutil.checkNull(dataMap.get("OBM_TYPE").toString()))){ %>
								<%=etcutil.checkNull(dataMap.get("OBM_TYPE").toString())  %>
							<%} %>
							 --%>
						</td>
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="subject">제&nbsp;&nbsp;목</label></th>
						<td colspan="3" class="td1">
							<%=etcutil.checkNull(dataMap.get("SUBJECT").toString())  %>
						</td>
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="content">내&nbsp;&nbsp;용</label></th>
						<td colspan="3" class="cnts1" style="height:250px;vertical-align:top;padding:20px 10px;"><%=etcutil.checkNull(dataMap.get("CONTENTS").toString().replaceAll("\r\n","</br>"))  %></td>
					</tr>

					<tr>
						<th scope="row" class="th1"><label for="pwd">첨부파일</label></th>
						<td colspan="3" class="cnts1">
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
<%-- 댓글 부분 주석처리
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
--%>





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

		<!-- new_officer -->
		<div class="new_officer">
			<table summary="담당부서 및 연락처 관리일">
			<caption>담당부서 및 연락처 관리일</caption>
			<tbody>
			<tr>
				<td class="write_day"></td>
				<td class="contact_team"><strong>담당부서 : </strong>감사실 청렴감사팀</td>
				<td class="contact_user"><strong>담당자 : </strong>황민철</td>
				<td class="contact_tel"><strong>연락처 : </strong>052-216-2124</td>
			</tr>
			</tbody>
			</table>
		</div>
		<!-- new_officer -->

	</div>
</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>