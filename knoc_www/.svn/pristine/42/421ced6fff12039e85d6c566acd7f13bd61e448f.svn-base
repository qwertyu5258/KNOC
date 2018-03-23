<%@page import="kr.co.knoc.postbox.PostBoxBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<% request.setCharacterEncoding("euc-kr"); %>
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
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
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
	location.href = "/postbox/channel_pwd.jsp?m=V&no=<%=no%>";
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
<script type="text/javascript">
	function do_edit() {
		document.abs_editor.submit();
	}
</script>
<!-- SmartEditor 삽입 -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

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
					<table cellspacing="0" cellpadding="0" class="viewtype" summary="해당게시판은 말씀자료의 상세내용을 보여줍니다">
					<caption>해당게시판 상세보기</caption>
					<colgroup><col width="100px" /><col width="260px" /><col width="100px" /><col width="260px" /></colgroup>
<form action="channel_edit.jsp" method="post" name="abs_editor" id="abs_w">
<input type="hidden" name="no" value="<%=no %>">
<input type="hidden" name="m" value="E">
<input type="hidden" name="page" value="<%=nowpage %>">
<input type="hidden" name="pwd" value="<%=pwd %>">
</form>
						<tr>
							<th scope="row" class="th1">제&nbsp;&nbsp;목</th>
							<td class="td1"><%=cb.getTitle() %></td>
							<th scope="row" class="th2">등록일</th>
							<td class="td1"><%=cb.getRegDateString("yyyy-MM-dd") %></td>
						</tr>
						<tr>
							<th scope="row" class="th1">내&nbsp;&nbsp;용</th>
							<td class="cnts1" colspan="3"><%=cb.getContent() %></td>
						</tr>
				<%
					if (channel_user_id.equals(_CEO_USER)) {
				%>
				<script type="text/javascript">
					function do_reply(f) {
						oEditors.getById["answer"].exec("UPDATE_IR_FIELD", []);
						if(f.answer.value.trim() == "") {
					 		alert('답변 내용을 입력하여 주시기 바랍니다.');
							oEditors.getById["answer"].exec("FOCUS", []);
							return false;
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
							<th scope="row" class="th1"><label for="answer">답&nbsp;&nbsp;변</label></th>
							<td class="cnts1" colspan="3"><textarea name="answer" id="answer" cols="120" style="width:100%;height:300px" class="inputST"><%=cb.getAnswer() %></textarea></td>
						</tr>
					</table>
					<div class="boardbtm mtm10">
						<div class="btnsec">
							<input type="image" src="/images/board/btn_answer2.gif" alt="답변" />
							<a href="channel_list.jsp?page=<%=nowpage %>&no=<%=no %>"><img src="/images/board/btn_list.gif" alt="목록" /></a>
						</div>
					</div>
				</form>

				<%
					} else {
						if (cb.getAnswer() != null && !cb.getAnswer().equals("")) {
				%>
						<tr>
							<th scope="row" class="th1">답변일</th>
							<td class="cnts1" colspan="3"><%=cb.getAnswerDateString("yyyy-MM-dd") %></td>
						</tr>
						<tr>
							<th scope="row" class="th1">답&nbsp;&nbsp;변</th>
							<td class="cnts1" colspan="3"><%=cb.getAnswer() %></td>
						</tr>
				<%		} %>
					</table>
					<div class="boardbtm mtm10">
						<div class="btnsec">
							<img src="/images/board/btn_modi.gif" alt="수정" onclick="do_edit();" style="cursor:pointer;"/>
							<img src="/images/board/btn_del.gif" alt="삭제" onclick="do_edit();" style="cursor:pointer;"/>
							<a href="channel_list.jsp?page=<%=nowpage %>&no=<%=no %>"><img src="/images/board/btn_list.gif" alt="목록" /></a>
						</div>
					</div>
				<%
					}
				%>

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
</div>
</body>
</html>