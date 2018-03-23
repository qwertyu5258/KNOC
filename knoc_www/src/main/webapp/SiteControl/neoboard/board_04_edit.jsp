<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.sague.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="Saguemanager" scope="page" class="kr.co.knoc.sague.SagueManager" />

<% request.setCharacterEncoding("euc-kr"); %>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	int sague_nid = (request.getParameter("sague_nid"))==null?0:Integer.parseInt(etcutil.strBlockSpecialTags(request.getParameter("sague_nid")));
	
	SagueManager sague = new SagueManager();
	HashMap hash = sague.getSaguebeanView(sague_nid);
	
	hash.get("sagueBean"); 
	hash.get("sagueFileBean");
	
	SagueBean sb = (SagueBean)hash.get("sagueBean");
	SagueFileBean sfb = (SagueFileBean)hash.get("sagueFileBean");

%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>

<script language=javascript>
	
	function goRegistrationPage(){ 
		if(document.getElementById("subject").value == ""){
			alert("사규의 명칭을 작성해 주세요.");
			document.getElementById("subject").focus();
			return;
		}
		if(document.getElementById("reason").value == ""){
			alert("제·개정 이유를 작성해 주세요.");
			document.getElementById("reason").focus();
			return;
		}
		if(document.getElementById("opinion").value == ""){
			alert("의견 제출을 작성해 주세요.");
			document.getElementById("opinion").focus();
			return;
		}
		if(document.getElementById("opinion_term").value == ""){
			alert("제출기한을 작성해 주세요.");
			document.getElementById("opinion_term").focus();
			return;
		}
		if(document.getElementById("email").value == ""){
			alert("이메일을 작성해 주세요.");
			document.getElementById("email").focus();
			return;
		}
		if(confirm("등록 하시겠습니까?")){
			oEditors.getById["HTML_BODY"].exec("UPDATE_IR_FIELD", []);	
			document.boardform01.submit();
		}
	}
	
	
	function fileDelFn(p_file_nid, p_sague_nid){
		if(confirm("삭제하시겠습니까?")){
			location.href = "./board_04_file_delete.jsp?sague_nid="+p_sague_nid+"&file_nid="+p_file_nid;			
		}
	}
	
	function goModifyPage(){ 
		oEditors.getById["HTML_BODY"].exec("UPDATE_IR_FIELD", []);	
		if(document.getElementById("subject").value == ""){
			alert("사규의 명칭을 작성해 주세요.");
			document.getElementById("subject").focus();
			return;
		}
		if(document.getElementById("reason").value == ""){
			alert("제·개정 이유를 작성해 주세요.");
			document.getElementById("reason").focus();
			return;
		}
		//if(document.getElementById("HTML_BODY").value.trim() == "") {
	 	//	alert('주요제·개정 내용을 입력 하세요.');
	 	//	oEditors.getById["HTML_BODY"].exec("FOCUS",[]);
	 	//}
		if(document.getElementById("opinion").value == ""){
			alert("의견 제출을 작성해 주세요.");
			document.getElementById("opinion").focus();
			return;
		}
		if(document.getElementById("opinion_term").value == ""){
			alert("제출기한을 작성해 주세요.");
			document.getElementById("opinion_term").focus();
			return;
		}
		if(document.getElementById("email").value == ""){
			alert("이메일을 작성해 주세요.");
			document.getElementById("email").focus();
			return;
		}
		if(confirm("수정 하시겠습니까?")){
			document.boardform01.action="board_04_edit_modify_ok.jsp";
			document.boardform01.submit();
		}
	}
	
	function GoCancel(){
		document.boardform01.action="board_04.jsp?page=<%=nowpage%>";
		document.boardform01.submit();
	}
	
</script>

<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<jsp:include flush="true" page="../inc/top.jsp" />
	
	<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="195" valign="top">  
			<%@ include file = "left.jsp" %> 
			</td>
			<td valign="top">
				<table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top">
							<table width="100%"  border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td valign="top">
										<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td><img src="../images/admin_left_03.gif" width="11" height="11"> 게시판 관리 > 사규 제·개정 예고</td>
												<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">게시판 관리 > 사규 제·개정 예고</span></td>
											</tr>
											<tr>
												<td height="2" colspan="2" bgcolor="EAEAEC"></td>
											</tr>
										</table>
										
										<div style="clear:both; height:45px;"></div>
									
									<form name="boardform01" action="board_04_edit_ok.jsp" method="post" enctype="multipart/form-data">	
										<input type="hidden" name="sague_nid"  value="<%=sb.getSague_nid() %>">
										<input type="hidden" name="file_nid"  value="<%=sfb.getFile_nid() %>">
										<input type="hidden" name="page" value="<%=nowpage%>">
									<div id="fileDelArea">
									</div>
									
										<table width="950" align="center"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
											<tr height="25">
												<td width="120" align="left" bgcolor="#e7e7e7">1. 사규의 명칭</td>
												<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;" >
													<input type="text" id="subject" name="subject" class="input" size="70%" value="<%=etcutil.checkNull(sb.getSubject()) %>" maxlength="100"  />
												</td>
											</tr>	
											<tr height="25">
												<td align="left" bgcolor="#e7e7e7">2. 제·개정 이유<br />&nbsp;&nbsp;&nbsp;(취지)</td>
											    <td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											  		<input type="text" id="reason" name="reason" class="input" size="70%"  value="<%=etcutil.checkNull(sb.getReason()) %>" maxlength="200"  />
											  	</td>
											</tr>		
											<tr height="25">
											    <td align="left" bgcolor="#e7e7e7">3. 주요제·개정 내용</td>
											  	<td class="td1" colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											 		<textarea name="HTML_BODY" id="HTML_BODY" cols="100" rows="15" class="area"><%=etcutil.checkNull(sb.getContents()) %></textarea>
											  	</td>
											</tr>
											<tr height="25">
											  	<td align="left" bgcolor="#e7e7e7">4. 의견 제출</td>
											  	<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											  		<input type="text" id="opinion" name="opinion" class="input" size="70%" value="<%=etcutil.checkNull(sb.getOpinion()) %>" maxlength="600"  />
											  	</td>
											</tr>
											<tr height="25">
											  	<td align="left" bgcolor="#e7e7e7">5. 의견 제출기한<br />&nbsp;&nbsp;&nbsp;(도착기준)</td>
											  	<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											  		<input type="text" id="opinion_term" name="opinion_term" class="input" size="70%" value="<%=etcutil.checkNull(sb.getOpinion_term()) %>" maxlength="20"  />
											  	</td>
											</tr>				
											<tr height="25">
												<td align="left" bgcolor="#e7e7e7">6. 보내실곳</td>
												<td colspan="3" align="left" bgcolor="#e7e7e7" style="padding-left:10;"></td>
											</tr>	
											<tr height="25">
												<td align="center" bgcolor="#e7e7e7">- 접수부서</td>
											  	<td align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											  		<input type="text" id="department" name="department" class="input"   value="<%=etcutil.checkNull(sb.getDepartment()) %>" maxlength="20"  />
											  	</td>
												<td width="120" align="center" bgcolor="#e7e7e7">- 담당자</td>
												<td align="left" bgcolor="#FFFFFF" style="padding-left:10;">
													<input type="text" id="representatives" name="representatives" class="input"  value="<%=etcutil.checkNull(sb.getRepresentatives()) %>" maxlength="10"  />
												</td>
										  	</tr>	
											<tr height="25">
											  	<td align="center" bgcolor="#e7e7e7">- 전화번호</td>
											  	<td bgcolor="#FFFFFF" align="left" style="padding-left:10;">
											  		<input type="text" id="tel_no" name="tel_no" class="input"  value="<%=etcutil.checkNull(sb.getTel_no()) %>" maxlength="15"  />
											  	</td>
												<td width="120" align="center" bgcolor="#e7e7e7">- 팩스번호</td>
											  	<td bgcolor="#FFFFFF" align="left" style="padding-left:10;">
											  		<input type="text" id="fax_no" name="fax_no" class="input"  value="<%=etcutil.checkNull(sb.getFax_no()) %>" maxlength="15"  />
											  	</td>
											</tr>
											<tr height="25">
											  	<td align="center" bgcolor="#e7e7e7">- 이메일</td>
											  	<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											  		<input type="text" id="email" name="email" class="input" size="70%" value="<%=etcutil.checkNull(sb.getEmail()) %>" maxlength="30"  />
											  	</td>
											</tr>
											<tr height="25" id="fileArea02">
											  	<td align="left" bgcolor="#e7e7e7">7. 첨부파일</td>
											  	<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
												  	<%if(sfb.getOrg_filenm() != null){ %>
												  		<span id="downFile_<%=sfb.getFile_nid() %>"><a href="board_04_filedown.jsp?sague_nid=<%=sb.getSague_nid() %>"><%=etcutil.checkNull(sfb.getOrg_filenm()) %></a>&nbsp;&nbsp;&nbsp;
												  		<a href="#" onclick="fileDelFn('<%=sfb.getFile_nid() %>','<%=sb.getSague_nid()%>'); return false;"><font color="red">삭제</font></a></span>
												  	<%}else{ %>	
												  		<input type="file" name="file1" value="" size="50%" class="input"  title="첨부파일1" />
													<%} %>
												</td>
											</tr>
										</table>
									</form>	
										
										<table width="70%"  border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="10"></td>
											</tr>
											<tr>
												<td align="left"><input type=button value="취소" onclick="GoCancel();" /></td>
												<%if(request.getParameter("sague_nid") == null){ %>
													<td align="right"><input type=button onclick="goRegistrationPage(); return false;" value="등록" /></td>
												<%}else{ %>
													<td align="right"><input type=button onclick="goModifyPage(); return false;" value="수정" /></td>
												<%} %>
											</tr>
											<tr>
												<tr height=20px>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br /><br /><br /><br />
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "HTML_BODY",
			sSkinURI: "/smartEditor/SEditorSkin.html",
			fCreator: "createSEditorInIFrame"
		});
	</script>
	
	<%@ include file="../inc/bottom.jsp" %>