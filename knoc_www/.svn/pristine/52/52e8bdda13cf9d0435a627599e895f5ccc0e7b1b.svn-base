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
%>   
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String mode = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("m")));

	
%>

<%		
	
	
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
	//out.print("<script>if(!"+isUser+"){alert(\"접근 권한이 없습니다.\");location.href = \"/sub04/sub04_8.jsp\";}</script>");
%>        

     
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contents">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->

<script type="text/javascript">
<!--
	if(!<%=isUser %>){
		alert("접근 권한이 없습니다.");
		location.href = "/sinmungo/main.jsp";
	}
	
	function onSubmit(){
		
		if(document.getElementById("user_nm").value == ""){
			alert("청탁자 성명을 입력해 주세요.");
			document.getElementById("user_nm").focus();
			return;
		}
		if(document.getElementById("obm_type").value == ""){
			alert("부서명을 입력해 주세요.");
			document.getElementById("obm_type").focus();
			return;
		}
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
		if(document.getElementById("article_pwd").value.length < 6){
			alert("패스워드는 6자 이상 입력해야 합니다.");
			document.getElementById("article_pwd").focus();			
			return;
		}
		if(!check_pwd(document.getElementById("article_pwd").value)){
			alert('비밀번호는 영문 숫자를 반드시 혼용하여야만합니다.');
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
	
	
	function check_pwd(str) {
		var reg = new RegExp("^[0-9a-zA-Z]+$");
		var reg2 = new RegExp("[0-9]+");
		var reg3 = new RegExp("[a-zA-Z]+");
		return reg.test(str) && reg2.test(str) && reg3.test(str);
	}
	
	var filecount = 1;
	
	function addfile(){
		filecount++;
		var filearea = "<div id='div"+ filecount +"' style='margin-top: 5px'></div><input type='file' id='file"+ filecount +"' name='filex"+ filecount +"'/>";
		$("#filearea").append(filearea);
	}
	
	function removefile(){
		if(filecount < 2){
			alert("더이상 삭제할 수 없습니다.");
			return;
		}
		$("#div"+filecount).remove();
		$("#file"+filecount).remove();
		filecount--;
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

<form action="submit.jsp" method="post" name="form01" id="form01" enctype="multipart/form-data">
	<input type="hidden" name="order_no" value="0">
	<input type="hidden" name="status_no" value="1">
	<input type="hidden" name="level_no" value="0">				
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
						<td class="td1"><input type="text" value="" id="user_nm" name="user_nm" maxlength="20" class="input" style="width:240px;" /></td>
						<th scope="row" class="th1"><label for="obm_type">부서명</label></th>
						<td class="td1"><input type="text" value="" id="obm_type" name="obm_type" maxlength="20" class="input" style="width:240px;" /></td>
					
					</tr>						
					<tr>
						<th scope="row" class="th1"><label for="subject">제&nbsp;&nbsp;목</label></th>
						<td colspan="3" class="td1"><input type="text" value="" id="subject" name="subject" maxlength="200" class="input" style="width:570px;" /></td>
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="content">내&nbsp;&nbsp;용</label></th>
						<td colspan="3" class="cnts1"><textarea name="content" id="content" cols="120" style="width:100%;height:300px" class="inputST"></textarea></td>
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="pwd">첨부파일</label></th>
						<td colspan="3" id="filearea" class="cnts1">
							<input id="file1" type="file" name="filex1"/> <a href="#add" onclick="addfile();" title="파일 추가 " ><img src="/images/customer/btn_plus.gif" alt="파일 추가 " /></a> <a href="#del" onclick="removefile();" title="파일 삭제 "><img src="/images/customer/btn_delete.gif" alt="파일 삭제 " /></a>			
							<%--
							<div style="margin-top: 5px"></div>
							<input type="file" name="filex2"/> 파일 크기는 10MB까지 가능합니다.						
							--%>
						</td>
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="content">패스워드</label></th>
						<td class="cnts1" colspan="3"><input type="password" value="" id="article_pwd" name="article_pwd" maxlength="12" class="input" style="width:120px;" /> 비밀번호는 영문/숫자를 섞어 6자 이상입니다.</td>
					</tr>			
				</table>
</form>					
					<div class="boardbtm mtm10">
						<div class="btnsec">
							<a href="#content" onclick="onSubmit();return false;"><input type="image" src="/images/board/btn_ok.gif" alt="확인" /></a>
							<a href="/sinmungo/notice.jsp?user_id=<%=session.getAttribute("SINMUNGO_ID") %>"><img src="/images/board/btn_cancel.gif" alt="취소" /></a>
						</div>
					</div>								
							
			</div>	
		</div>
	</div>
</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>