<%@page import="kr.co.knoc.postbox.PostBoxBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.postbox.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>


<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />

<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","05");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%> 

<%@include file="/postbox/_channel_inc.jsp"%>
<%	
	if (channel_user_id == null || (!channel_user_id.equals(_CHANNEL_USER)
		&& !channel_user_id.equals(_CEO_USER)))  
	{ 
%>
<script type="text/javascript">
	location.href = "channel_login.jsp";	
</script>
<%		
		return;
	}


	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("pwd")));
	System.out.println("no ================>" + request.getParameter("no"));
	int	no	= (request.getParameter("no")==null||"".equals(request.getParameter("no")))?0 :Integer.parseInt(request.getParameter("no"));
	request.setCharacterEncoding("euc-kr");
	if(no <= 0) {
%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
<%	
		return;
	}	
	
	PostBoxBean cb = PostBoxMa.getChannel(no);	
	if (!channel_user_id.equals(_CEO_USER)) {
		if (pwd == null || pwd.equals(""))  
		{ 
%>
<script type="text/javascript">
	location.href = "/postbox/channel_pwd.jsp?m=E&no=<%=no%>";	
</script>
<%	
			return;
		}
			
		/* 비밀번호 인증 */
		if(!pwd.equals(cb.getPwd())) {
%>		
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다."); 
	history.back();
</script>
<%
			return;
		}
	}
%>        

<%@include file="/include/comheader.jsp"%>
<!-- SmartEditor 삽입 -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
//<!--
	String.prototype.trim = function() {
	    return this.replace(/(^ *)|( *$)/g, "");
	}
	function do_delete() {
		var f = document.abs_w;
		if(f.pwd.value.length < 6) {
	 		alert('비밀번호는 최소 6자 이상 입력하셔야만 합니다.');
	 		f.pwd.focus();
	 	}
	 	else {
 			if(confirm("본 의견을 삭제하시겠습니까?")) {
 				f.m.value="D";
				f.submit();
			}
			
	 	}
	}
	function do_submit(f) {
		oEditors.getById["content"].exec("UPDATE_IR_FIELD", []);
		if(f.subject.value.trim() == "") {
	 		alert('제목을 입력하세요.');
	 		f.subject.focus();
	 	}
 		else if(document.getElementById("content").value.trim() == "") {
	 		alert('내용을 입력하세요.');
	 		oEditors.getById["content"].exec("FOCUS",[]);
	 	}
	 	else if(f.pwd.value == "") {
	 		alert('비밀번호를 입력하세요.');
	 		f.pwd.focus();
	 	}
	 	else if(f.pwd.value.length < 6) {
	 		alert('비밀번호는 최소 6자 이상 입력하셔야만 합니다.');
	 		f.pwd.focus();
	 	}
		else if(!check_pwd(f.pwd.value)){
			alert('비밀번호는 영문 숫자를 반드시 혼용하여야만합니다.');
			f.pwd.focus();
		}
	 	else {
 			try{
 				f.m.value="E";
				f.submit();
			}catch(e){}
	 	}

	}
	function check_pwd(str) {
		var reg = new RegExp("^[0-9a-zA-Z]+$");
		var reg2 = new RegExp("[0-9]+");
		var reg3 = new RegExp("[a-zA-Z]+");
		return reg.test(str) && reg2.test(str) && reg3.test(str);
	}
//-->		
</script>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_04.jsp"%>
				
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>고객참여</span>
                    &gt; <span class="locanow">e청렴엽서함</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub04_5_4.gif" alt="e_POST" /></h3>
				</div>
				
				<div id="boardsec">
					<table cellspacing="0" cellpadding="0" class="viewtype" summary="GREAT WAY게시판은 말씀자료의 상세내용을 보여줍니다">
					<caption>GREAT WAY게시판 상세보기</caption>
					<colgroup><col width="100px" /><col width="620px" /></colgroup>
<form action="channel_proc.jsp" method="post" name="abs_w" onsubmit="do_submit(this); return false;">
<input type="hidden" name="no" value="<%=no %>">
<input type="hidden" name="m" value="E">
<input type="hidden" name="page" value="<%=nowpage %>">
						<tr>
							<th scope="row" class="th1"><label for="subject">제&nbsp;&nbsp;목</label></th>
							<td class="td1"><input type="text" value="<%=cb.getTitle() %>" id="subject" name="subject" maxlength="200" class="input" style="width:570px;" /></td>
						</tr>
						<tr>
							<th scope="row" class="th1"><label for="content">내&nbsp;&nbsp;용</label></th>
							<td class="cnts1"><textarea name="content" id="content" cols="120" style="width:100%;height:300px" class="inputST"><%=cb.getContent() %></textarea></td>
						</tr>
				
						<tr>
							<th scope="row" class="th1"><label for="pwd">비밀번호</label></th>
							<td class="cnts1"><input type="password" value="" id="pwd" name="pwd" maxlength="20" class="input" style="width:330px;"> (비밀번호는 영문 숫자 혼용 6자 이상입니다.)</td>
						</tr>				
					</table>
					<div class="boardbtm mtm10">
						<div class="btnsec">
							<input type="image" src="/images/board/btn_modi.gif" alt="수정" />
							<img src="/images/board/btn_del.gif" alt="삭제" onclick="do_delete();" style="cursor:pointer;"/>		
							<a href="channel_list.jsp?page=<%=nowpage %>&no=<%=no %>"><img src="/images/board/btn_list.gif" alt="목록" /></a>
						</div>
					</div>
</form>							
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder: "content",
sSkinURI: "/smartEditor/SEditorSkin.html",
fCreator: "createSEditorInIFrame"
});
</script>		
										
				</div>	
				
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>				