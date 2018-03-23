<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.channel.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="ChannelMa" scope="page" class="kr.co.knoc.channel.ChannelManager" />
<%
	if (mode == null || mode.equals("")) {
		return;
	}
	
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
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("qpwd")));
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
<%	
		return;
	}	
	
	ChannelBean cb = ChannelMa.getChannel(no);
	out.println(channel_user_id);
	if (!channel_user_id.equals("ywkang")) {
		if (pwd == null || pwd.equals(""))  
		{ 
%>
	<%@include file="/channel/_channel_pwd.jsp"%>
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
<!-- SmartEditor 삽입 -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<div id="boardsec">
	<table cellspacing="0" cellpadding="0" class="viewtype" summary="해당게시판은 말씀자료의 상세내용을 보여줍니다">
	<caption>해당게시판 상세보기</caption>
	<colgroup><col width="100px" /><col width="260px" /><col width="100px" /><col width="260px" /></colgroup>
		<tr>
			<th class="th1">제&nbsp;&nbsp;목</th>
			<td class="td1"><%=cb.getTitle() %></td>
			<th class="th2">등록일</th>
			<td class="td1"><%=cb.getRegDateString("yyyy-MM-dd") %></td>
		</tr>
		<tr>
			<th class="th1">내&nbsp;&nbsp;용</th>
			<td class="cnts1" colspan="3"><%=cb.getContent() %></td>
		</tr>
<%
	if (channel_user_id.equals("ywkang")) {
%>		
<script type="text/javascript">
	function do_reply(f) {
		oEditors.getById["answer"].exec("UPDATE_IR_FIELD", []);
		if(f.answer.value.trim() == "") {
	 		alert('답변 내용을 입력하여 주시기 바랍니다.');
			oEditors.getById["answer"].exec("FOCUS", []);
	 	}
 		else {
 			try{
				if(confirm("답변을 입력하시겠습니까? "))
					f.submit();
			}catch(e){}
	 	}

	}
</script>
<form action="channel_proc.jsp" method="post" name="abs_w" id="abs_w" onsubmit="do_reply(this); return false;">
<input type="hidden" name="no" value="<%=no %>">
<input type="hidden" name="m" value="R">
<input type="hidden" name="page" value="<%=nowpage %>">
		<tr>
			<th class="th1">답&nbsp;&nbsp;변</th>
			<td class="cnts1" colspan="3"><textarea name="answer" id="answer" cols="80" rows="9" class="inputST"><%=cb.getAnswer() %></textarea></td>
		</tr>
</form>		
	</table>
	<div class="boardbtm mtm10">
		<div class="btnsec">
			<input type="image" src="/images/board/btn_reply.gif" alt="답변" />
		</div>
	</div>
<script type="text/javascript">
	var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "answer",
		sSkinURI: "SmartEditor/SEditorSkin.html",
		fCreator: "createSEditorInIFrame"
		});
</script>		
<%
	} else {
		if (cb.getAnswer() != null && !cb.getAnswer().equals("")) {
%>
		<tr>
			<th class="th1">답변일</th>
			<td class="cnts1" colspan="3"><%=cb.getAnswerDateString("yyyy-MM-dd") %></td>
		</tr>
		<tr>
			<th class="th1">답&nbsp;&nbsp;변</th>
			<td class="cnts1" colspan="3"><%=cb.getAnswer() %></td>
		</tr>
	</table>		
<%			
		} else {
%>
	</table>
<%
		}
	}
%>		
					
	<div class="boardbtm mtm10">
		<div class="btnsec">
<% if (!channel_user_id.equals("ywkang")) { %>		
			<a href="channel.jsp?m=E&page=<%=nowpage %>&no=<%=no %>"><img src="/images/board/btn_modi.gif" alt="수정" /></a>
			<a href="channel.jsp?m=E&page=<%=nowpage %>&no=<%=no %>"><img src="/images/board/btn_del.gif" alt="삭제" /></a>
<% } %>			
			<a href="channel.jsp?m=L&page=<%=nowpage %>&no=<%=no %>"><img src="/images/board/btn_list.gif" alt="목록" /></a>
		</div>
	</div>
</div>	