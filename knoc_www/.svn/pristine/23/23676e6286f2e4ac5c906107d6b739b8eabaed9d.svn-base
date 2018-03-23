<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@page import="com.neoboard.common.StringFormat, com.neoboard.util.EtcUtil"%>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<%@ page import="com.neoboard.data.*, com.neoboard.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "게시판관리";  		// 서브 Depth 제목
    String gNavSubName = "neoboard";				// 서브 Depth 이름
    String gNavDepthTitle1 = "04"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

    application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");        
	String gNavPage = "게시판관리";  					// 현제 페이지 제목
	
	EtcUtil etcutil = new EtcUtil();
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<jsp:include flush="true" page="../inc/top.jsp" />

<script language=javascript>
window.onload = function() {
	initView();
}
function initView() {
	var f = document.boardform;
	if(f.useGroup[0].checked) {
		var dd = document.getElementById("GROUPCONFIG");
		if(dd) dd.style.display = "block";
	}
	else {
		var dd = document.getElementById("GROUPCONFIG");
		if(dd) dd.style.display = "none";	
	}
	if(f.useMailing.options.selectedIndex == 0 ) {
		var dd = document.getElementById("MAILINGCONFIG");
		if(dd) dd.style.display = "none";	
	}
	else {
		var dd = document.getElementById("MAILINGCONFIG");
		if(dd) dd.style.display = "block";	
	}
}
function checkField(obj, type, length) {
	if(obj.value == "") return;
	var value = obj.value;
	if(type == "number") {
		if(length == null) {
			var reg = RegExp("^[0-9]+$");
			if(!reg.test(value)) msgFocus(obj,"숫자를 입력해 주세요.");
		}
		else {
			var reg = RegExp("^[0-9]{" + length + "}$");
			if(!reg.test(value)) msgFocus(obj,length + "자리 숫자를 입력해 주세요.");
		}
		
	}
	else if(type == "alpha") {
		if(length == null) {
			var reg = RegExp("^[a-zA-Z]+$");
			if(!reg.test(value)) msgFocus(obj,"영문자를 입력해 주세요.");
		}
		else {
			var reg = RegExp("^[a-zA-Z]{" + length + "}$");
			if(!reg.test(value)) msgFocus(obj,length + "자리 영문자를 입력해 주세요.");
		}
	}
	else if(type == "alphanumeric"){ 
		if(length == null) {
			var reg = RegExp("^[a-zA-Z0-9,\-]+$");
			if(!reg.test(value)) msgFocus(obj,"영문 또는 숫자를 ','입력해 주세요.");
		}
		else {
			var reg = RegExp("^[a-zA-Z0-9,\-]{" + length + "}$");
			if(!reg.test(value)) msgFocus(obj,length + "자리의 영문 또는 숫자 ','를 입력해 주세요.");
		}
	}
}
function msgFocus(obj,msg) {
	alert(msg);
	obj.focus();
	obj.select();
}

function saveBoard(f) {
	if(f == null) f = document.boardform;
	if(f.categoryID.selectedIndex == 0 ) {
		alert("카테고리를 선택해 주세요");
		return;
	}
	if(f.boardName.value == "") {
		alert("게시판 이름을 입력해 주세요.");
		return;
	}
	if(f.boardID.value == "") {
		alert("게시판 아이디을 입력해 주세요.");
		return;
	}
	if(f.skinID.selectedIndex == 0) {
		alert("게시판 스킨을 선택해 주세요.");
		return;
	}
	if(f.maxSubjectLength.value == "") {
		alert("제목 최대 글자 수를 입력해 주세요.");
		return;
	}
	if(f.listPerPage.value == "") {
		alert("페이지당 목록 수를 입력해 주세요.");
		return;
	}
	if(f.pagePerBlock.value == "") {
		alert("블럭당 페이지 수를 입력해 주세요.");
		return;
	}	
	if(f.maxUpload.value =="") {
		alert("최대 첨부화일 용량을 입력해 주세요.");
		return;
	}
	
	f.categoryName.value = f.categoryID.options[f.categoryID.selectedIndex].text;
	f.skinName.value = f.skinID.options[f.skinID.selectedIndex].text;
	if(confirm(f.boardName.value + " 게시판을 수정하시겠습니까?")) {
		f.submit();
	}
}

function openCommon(comGubun) {
	window.open("commonList.jsp?comGubun="+comGubun, "common", "width=400px; height=400px; scrollbars=yes;");
}
</script>
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 게시판 관리 > 게시판 수정</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">게시판 관리 > 게시판 수정</span></td>
			</tr>
			<tr>
			<td height="2" colspan="2" bgcolor="EAEAEC"></td>
			</tr>
			</table>
			<table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td></td>
			</tr>
			</table>
      
<%
	String boardID = request.getParameter("bid");
	if(boardID == null || boardID.equals("")) boardID = "TEST";
	Property p = (new PropertyManager()).getProperty(boardID);
	Authority a = (new AuthorityManager()).getAuthority(boardID);
%>
<form name=boardform action="board_02_edit_ok.jsp" method=post>
				<table cellSpacing="0" cellPadding="0" border="0" width="100%">
				<col width="55%" />
				<col width="6" />
				<col />
				<tr valign="top">
					<td>
						<table cellSpacing="1" cellPadding="0" border="0" bgcolor="#B5B5B5" width="100%" style="margin-top:20; color:#000;">
						<col width="125" align="center" />
						<col />
						<tr height="25">
							<td align="center" colSpan="2" style="background:#E7E7E7; color:#000;">게시판 설정</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;">게시판카테고리</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type=hidden name=categoryName value="">
								<select style="width:160;" name=categoryID>
									<option value="">----------선택----------</option>
									<%=com.neoboard.PropertyManager.getCommons("CATE",p.getCategoryID())%>													
								</select> <input type=button value=" 게시판카테고리 관리 " style="height:19px" onclick="openCommon('CATE');">
							</td> 
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;">게시판명</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" style="width:160; heigth:20;" name=boardName maxlength=32 value="<%=p.getBoardName()%>"><br>
								(한글 32자, 영문 64자 이내)
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;">게시판ID</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" style="width:160; heigth:20;" name=boardID value="<%=p.getBoardID()%>" readonly maxlength=10 onblur="checkField(this,'alphanumeric');"><BR>
								영문 숫자 조합 10 자 이내로 입력해 주세요.(필수)
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">게시판타입</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<select style="width:160;" name=boardType>
									<option value="DEFAULT" <% if (p.getBoardType().equals("DEFAULT")) { %>selected<% } %>>기본형</option>
									<option value="SANGDAM" <% if (p.getBoardType().equals("SANGDAM")) { %>selected<% } %>>상담형</option>
									<option value="INFOOPEN" <% if (p.getBoardType().equals("INFOOPEN")) { %>selected<% } %>>정보공개형</option>
								</select>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;">게시판스킨</td>
							<input type=hidden name=skinName value="">
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<select style="width:160;" name=skinID>
									<option value="">----------선택----------</option>	
									<%=com.neoboard.PropertyManager.getCommons("SKIN",p.getSkinID())%>	
								</select> <input type=button value=" 게시판카테고리 관리 " style="height:19px" onclick="openCommon('SKIN');">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;">제목 최대 글자수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" value="<%=p.getMaxSubjectLength()%>" style="width:160; heigth:20;" name=maxSubjectLength onblur="checkField(this,'number');">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;">페이지당 목록 수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" value="<%=p.getListPerPage()%>" style="width:160; heigth:20;" name=listPerPage onblur="checkField(this,'number');">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;">블럭당 페이지 수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" value="<%=p.getPagePerBlock()%>" style="width:160; heigth:20;" name=pagePerBlock onblur="checkField(this,'number');">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;">게시판상단에<br>출력할 내용</td>
							<td style="padding-top:7; padding-bottom:7; padding-left:10;" bgcolor="#FFFFFF">
								<textarea name=topIncludeText style="width:90%; height:80;"><%=p.getTopIncludeText()%></textarea>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;">게시판하단에<br>출력할 내용</td>
							<td style="padding-top:7; padding-bottom:7; padding-left:10;" bgcolor="#FFFFFF">
								<textarea name=bottomIncludeText style="width:90%; height:80;"><%=p.getBottomIncludeText()%></textarea>
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;">기능 선택</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000; font-size:11;">
								<tr>
									<td><input type="checkbox" name=useRegistration value="1" <% if ( p.getUseRegistration().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">등록</td>
									<td><input type="checkbox" name=useReply value="1" <% if ( p.getUseReply().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">답변</td>
									<td><input type="checkbox" name=useEdit value="1" <% if ( p.getUseEdit().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">수정</td>
									<td><input type="checkbox" name=useDelete value="1" <% if ( p.getUseDelete().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">삭제</td>
								</tr>
								<tr>
									<td><input type="checkbox" name=useComment value="1" <% if ( p.getUseComment().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">댓글</td>
									<td><input type="checkbox" name=useImageView value="1" <% if ( p.getUseImageView().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">이미지게시판</td>
									<td><input type="checkbox" name=useSecret value="1" <% if ( p.getUseSecret().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">비밀글</td>
									<td><input type="checkbox" name=useNotice value="1" <% if ( p.getUseNotice().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">공지글</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;">로그인 여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" name=useAuth value="1"  <% if ( p.getUseAuth().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;" >로그인 체크</td>
									<td width="42"></td>
									<td><input type="radio" name=useAuth value="0" <% if ( p.getUseAuth().equals("0")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;"  >로그인 체크안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;">첨부 업로드 확장자</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=allowedExtension type="text" style="width:110; heigth:20;" value="<%=p.getAllowedExtension()%>"> 예) jsp,txt ＊기본값:  <%= p.getDefaultNotAllowedExtension()%>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;">첨부 업로드 용량</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=maxUpload type="text" style="width:110; heigth:20;" value="<%=p.getMaxUpload()%>" onblur="checkField(this,'number');">
								KB 이하
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;">첨부 가능 파일 개수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<select style="width:160;" name=maxFileAttach>
								<option value="0" <%if ( p.getMaxFileAttach() == 0) { out.print("selected"); } %>>없음
								<option value="1" <%if ( p.getMaxFileAttach() == 1) { out.print("selected"); } %>>1개
								<option value="2" <%if ( p.getMaxFileAttach() == 2) { out.print("selected"); } %>>2개
								<option value="3" <%if ( p.getMaxFileAttach() == 3) { out.print("selected"); } %>>3개
								<option value="4" <%if ( p.getMaxFileAttach() == 4) { out.print("selected"); } %>>4개
								<option value="5" <%if ( p.getMaxFileAttach() == 5) { out.print("selected"); } %>>5개
								<option value="6" <%if ( p.getMaxFileAttach() == 6) { out.print("selected"); } %>>6개
								<option value="7" <%if ( p.getMaxFileAttach() == 7) { out.print("selected"); } %>>7개
								<option value="8" <%if ( p.getMaxFileAttach() == 8) { out.print("selected"); } %>>8개
								<option value="9" <%if ( p.getMaxFileAttach() == 9) { out.print("selected"); } %>>9개
								<option value="10" <%if ( p.getMaxFileAttach() == 10) { out.print("selected"); } %>>10개
								</select>
							</td>
						</tr>
						
<script language=javascript>
function enableGroup(o) {
	if(o.value == "1") {
		// enable
		var gc = document.getElementById("GROUPCONFIG");
		if(gc){
			gc.style.display = "block";
		}
	}
	else {
		// disable
		var gc = document.getElementById("GROUPCONFIG");
		if(gc){
			gc.style.display = "none";
		}
	}
}
</script>

						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">그룹기능 사용</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" name=useGroup onclick="enableGroup(this);" value="1" <% if ( p.getUseGroup().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" name=useGroup onclick="enableGroup(this);" value="0" <% if ( p.getUseGroup().equals("0")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
								<div id="GROUPCONFIG" style="display:none">
								<iframe src="groupList.jsp?bid=<%=p.getBoardID() %>" width=100% height=190 frameborder=0 scrolling=yes></iframe>								
								</div>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">새글표시 사용여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" name="useNew" value="1" <% if ( p.getUseNew().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" name="useNew" value="0" <% if ( p.getUseNew().equals("0")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">새글표시 허용일수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">금일부터 
								<select style="width:40;" name="newLimit">
								<option value="1" <%if ( p.getNewLimit() == 1) { out.print("selected"); } %>>1
								<option value="2" <%if ( p.getNewLimit() == 2) { out.print("selected"); } %>>2
								<option value="3" <%if ( p.getNewLimit() == 3) { out.print("selected"); } %>>3
								<option value="4" <%if ( p.getNewLimit() == 4) { out.print("selected"); } %>>4
								<option value="5" <%if ( p.getNewLimit() == 5) { out.print("selected"); } %>>5
								<option value="6" <%if ( p.getNewLimit() == 6) { out.print("selected"); } %>>6
								<option value="7" <%if ( p.getNewLimit() == 7) { out.print("selected"); } %>>7
								</select> 일까지
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">인기글표시 사용여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" name="useCool" value="1" <% if ( p.getUseCool().equals("1")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" name="useCool" value="0" <% if ( p.getUseCool().equals("0")) { out.print("checked"); } %>></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">인기글 조회수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">조회수 
								<input name=coolLimit type="text" maxlength=10 style="width:40; heigth:20;" value="<%=p.getCoolLimit()%>">이상
							</td>
						</tr>
						
<script language=javascript>
function enableMailing(s) {
	if(s.selectedIndex == 0 ){
		var dd = document.getElementById("MAILINGCONFIG");
		if(dd) dd.style.display = "none";
	}
	else {
		var dd = document.getElementById("MAILINGCONFIG");
		if(dd) dd.style.display = "block";
	}
}
</script>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">메일기능사용여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td>
									<select name="useMailing" onchange="enableMailing(this);">
									<option value="0" <% if(p.getUseMailing().equals("0")) out.print("selected"); %>>사용안함</option>
									<option value="W" <% if(p.getUseMailing().equals("W")) out.print("selected"); %>>글등록시 사용</option>
									<option value="WR" <% if(p.getUseMailing().equals("WR")) out.print("selected"); %>>글등록,답변등록시 사용</option>
									<option value="EWR" <% if(p.getUseMailing().equals("EWR")) out.print("selected"); %>>글수정,글등록,답변등록시 사용</option>
									<option value="E" <% if(p.getUseMailing().equals("E")) out.print("selected"); %>>글수정시 사용</option>
									<option avlue="ER" <% if(p.getUseMailing().equals("ER")) out.print("selected"); %>>글수정,답변등록시 사용</option>
									<option avlue="WE" <% if(p.getUseMailing().equals("WE")) out.print("selected"); %>>글등록,글수정시 사용</option>									
									<option value="R" <% if(p.getUseMailing().equals("R")) out.print("selected"); %>>답변 등록시 사용</option>
									</select>
									</td>
								</tr>
								</table>
								<div id="MAILINGCONFIG" style="display:none">
								<table cellSpacing="1" cellPadding="3" border="0" width=100% style="color:#000000;" bgcolor="#FFFFFF">
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일 보내는 사람</td>
								<TD bgcolor="#FFFFFF"><input name=mailFrom type="text" style="width:98%; heigth:20;" value="<%=StringFormat.replaceInString(p.getMailFrom(),"\"","&quot;") %>"><BR>보내는 사람을 지정하지 않으면 글 등록자의 이메일을 사용합니다.</TD>
								</tr>
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일 받는 사람</td>
								<TD bgcolor="#FFFFFF"><input name=mailTo type="text" style="width:98%; heigth:20;" value="<%=StringFormat.replaceInString(p.getMailTo(),"\"","&quot;") %>"><BR>받는 사람을 지정하지 않으면 글등록자의 이메일로 메일을 발송합니다.</TD>
								</tr>
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일서버</td>
								<TD bgcolor="#FFFFFF"><input name=mailServer type="text" style="width:98%; heigth:20;" value="<%=StringFormat.replaceInString(p.getMailServer(),"\"","&quot;") %>"></TD>
								</tr>
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일서버계정</td>
								<TD bgcolor="#FFFFFF"><input name=mailAccount type="text" style="width:98%; heigth:20;" value="<%=StringFormat.replaceInString(p.getMailAccount(),"\"","&quot;") %>"></TD>
								</tr>
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일서버계정비밀번호</td>
								<TD bgcolor="#FFFFFF"><input name=mailPasswd type="text" style="width:98%; heigth:20;" value="<%=StringFormat.replaceInString(p.getMailPasswd(),"\"","&quot;") %>"></TD>
								</tr>
								</table>
								<table cellSpacing="1" cellPadding="2" border="0" width=100% style="color:#000000;" bgcolor="#FFFFFF">
								<TR>
								<TD bgcolor="#EFEFEF" align=center height=22>메일 Template</TD>
								</TR>
								<TR>
								<TD><textarea name=mailTemplate rows=6 cols=20 style="width:99%"><%=p.getMailTemplate()%></textarea>
[##이름##] : 작성자 이름<br>
[##등록일##] : 글 작성일<br>
[##제목##] : 글 제목, 뎃글 내용<br>
[##글종류##] : 글의 종류(일반글,답변글,뎃글)<br>
[##내용##] : 글 내용<br>
[##게시물URL##] : 게시물의 URL<br>
</TD>
								</TR>
								</table>
								</div>
							</td>
						</tr>
						
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">이첩(게시글 이동,중복입력)기능</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" style="border:0px" name="useDouble" value="1" <% if(etcutil.checkNull(p.getUseDouble()).equals("1")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="useDouble" value="0"  <% if(etcutil.checkNull(p.getUseDouble()).equals("0")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">RSS사용여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" style="border:0px" name="useRss" value="1" <% if(p.getUseRss().equals("1")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="useRss" value="0"<% if(p.getUseRss().equals("0")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">동영상URL 사용여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" style="border:0px" name="useMovie" value="1" <% if(p.getUseMovie().equals("1")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="useMovie" value="0" <% if(p.getUseMovie().equals("0")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">게시판 사용여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" style="border:0px" name="status" value="1"  <% if(etcutil.checkNull(p.getStatus()).equals("1")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="status" value="0"  <% if(etcutil.checkNull(p.getStatus()).equals("0")) out.print("checked");%>></td>
									<td style="padding-top:2;">폐쇄</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">금지어</td>
							<td style="padding-top:7; padding-bottom:7; padding-left:10;" bgcolor="#FFFFFF">
								<textarea name=banwd style="width:90%; height:50;"><%=p.getBanwd() %></textarea>
								<br>(","로 연결해 주세요.)
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">금지IP</td>
							<td style="padding-top:7; padding-bottom:7; padding-left:10;" bgcolor="#FFFFFF">
								<textarea name=banIp style="width:90%; height:50;"><%=p.getBanIp() %></textarea>
								<br>(","로 연결해 주세요.)
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">통합검색 사용</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000000;">
								<tr>
									<td><input type="radio" style="border:0px" name=useSearch value="1"  <% if(p.getUseSearch().equals("1")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name=useSearch value="0" <% if(p.getUseSearch().equals("0")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
								
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">페이지 경로</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=pageUrl type="text" value="<%=p.getPageUrl() %>" style="width:210; heigth:20;">
								<br>＊ 검색에서 페이지 이동시에 필요합니다.
								<br></br>(사용자 페이지의 페이지 경로를 입력해 주세요.)
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">SMS 사용</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000000;">
								<tr>
									<td><input type="radio" style="border:0px" name=useSms value="1" <% if(p.getUseSms().equals("1")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name=useSms value="0" <% if(p.getUseSms().equals("0")) out.print("checked");%>></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
								
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">SMS 메세지</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=smsText type="text" value="<%=p.getSmsText() %>" style="width:210; heigth:20;">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">SMS 받는사람 번호</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=smsNumber type="text" value="<%=p.getSmsNumber() %>" style="width:210; heigth:20;">
								<br>(여러사람일 경우 ";"로 연결해 주세요.  예)010-2222-3333;011-5555-6666;)
							</td>
						</tr>
						</table>
					</td>
					



					<td></td>



					<td>
						<table cellSpacing="1" cellPadding="0" border="0" bgcolor="#B5B5B5" width="100%" style="margin-top:20; color:#000;">
						<tr height="25">
							<td align="center" style="background:#E7E7E7; color:#000;padding-left:10px">권한 설정</td>
						</tr>
						<tr valign="top">
							<td bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0">
								<col width="9" />
								<col />
								<col width="9" />
								<tr valign="top" bgcolor="#FFFFFF">
									<td></td>
									<!--하단 여백조절-->
									<td width="96%" style="padding-top:10; padding-bottom:150;">

										<table cellSpacing="0" cellPadding="0" border="0" style="table-layout:fixed;">
										<col width="100" />
										<col />
										<tr valign="top">
											<td bgcolor="#FFFFFF">
												<table cellSpacing="1" cellPadding="0" border="0" bgcolor="#B5B5B5" frame="below" rules="rows" width="100%" style="margin-top:26; text-align:center; color:#000000;">
												<tr height="29">
													<td style="background:#EBEBEB;">리스트 보기</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;">내용보기</td>
												</tr>
												<tr height="30">
													<td style="background:#EBEBEB;">등록</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;">답변</td>
												</tr>
												<tr height="30">
													<td style="background:#EBEBEB;">수정</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;">삭제</td>
												</tr>
												<tr height="30">
													<td style="background:#EBEBEB;">댓글쓰기</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;">댓글삭제</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;">공지글</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;">다운로드</td>
												</tr>
												</table>
											</td>
											<td bgcolor="#FFFFFF">
												<table cellSpacing="1" cellPadding="0" border="0" bgcolor="#B5B5B5" width="100%" style="text-align:center; border-right:none; color:#000;">
												<col width="30%" />
												<col width="70%" />
												<tr height="25">
													<td style="background:#EBEBEB;">레벨 설정</td>
													<td style="background:#EBEBEB;">특정 아이디</td>
												</tr>
												<tr height="29" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelList>
															<option value="1" <%if ( a.getLevelList() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelList() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelList() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelList() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelList() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelList() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelList() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelList() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelList() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=listAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getListAllowedUser() != null && !a.getListAllowedUser().equals("") && !a.getListAllowedUser().equals("null")) { %><%=a.getListAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelView>
															<option value="1" <%if ( a.getLevelView() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelView() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelView() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelView() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelView() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelView() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelView() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelView() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelView() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=viewAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getViewAllowedUser() != null && !a.getViewAllowedUser().equals("") && !a.getViewAllowedUser().equals("null")) { %><%=a.getViewAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelRegistration>
															<option value="1" <%if ( a.getLevelRegistration() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelRegistration() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelRegistration() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelRegistration() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelRegistration() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelRegistration() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelRegistration() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelRegistration() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelRegistration() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=registrationAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getRegistrationAllowedUser() != null && !a.getRegistrationAllowedUser().equals("") && !a.getRegistrationAllowedUser().equals("null")) { %><%=a.getRegistrationAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelReply>
															<option value="1" <%if ( a.getLevelReply() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelReply() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelReply() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelReply() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelReply() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelReply() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelReply() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelReply() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelReply() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=replyAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getReplyAllowedUser() != null && !a.getReplyAllowedUser().equals("") && !a.getReplyAllowedUser().equals("null")) { %><%=a.getReplyAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelEdit>
															<option value="1" <%if ( a.getLevelEdit() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelEdit() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelEdit() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelEdit() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelEdit() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelEdit() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelEdit() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelEdit() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelEdit() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=editAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getEditAllowedUser() != null && !a.getEditAllowedUser().equals("") && !a.getEditAllowedUser().equals("null")) { %><%=a.getEditAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelDelete>
															<option value="1" <%if ( a.getLevelDelete() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelDelete() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelDelete() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelDelete() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelDelete() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelDelete() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelDelete() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelDelete() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelDelete() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=deleteAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getDeleteAllowedUser() != null && !a.getDeleteAllowedUser().equals("") && !a.getDeleteAllowedUser().equals("null")) { %><%=a.getDeleteAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelCommentWrite>
															<option value="1" <%if ( a.getLevelCommentWrite() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelCommentWrite() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelCommentWrite() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelCommentWrite() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelCommentWrite() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelCommentWrite() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelCommentWrite() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelCommentWrite() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelCommentWrite() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=commentWriteAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getCommentWriteAllowedUser() != null && !a.getCommentWriteAllowedUser().equals("") && !a.getCommentWriteAllowedUser().equals("null")) { %><%=a.getCommentWriteAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelCommentDelete>
															<option value="1" <%if ( a.getLevelCommentDelete() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelCommentDelete() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelCommentDelete() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelCommentDelete() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelCommentDelete() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelCommentDelete() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelCommentDelete() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelCommentDelete() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelCommentDelete() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=commentDeleteAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getCommentDeleteAllowedUser() != null && !a.getCommentDeleteAllowedUser().equals("") && !a.getCommentDeleteAllowedUser().equals("null")) { %><%=a.getCommentDeleteAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelNotice>
															<option value="1" <%if ( a.getLevelNotice() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelNotice() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelNotice() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelNotice() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelNotice() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelNotice() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelNotice() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelNotice() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelNotice() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=noticeAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getNoticeAllowedUser() != null && !a.getNoticeAllowedUser().equals("") && !a.getNoticeAllowedUser().equals("null")) { %><%=a.getNoticeAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td>
														<select style="width:50;" name=levelDown>
															<option value="1" <%if ( a.getLevelDown() == 1) { out.print("selected"); } %>>1 레벨</option>
															<option value="2" <%if ( a.getLevelDown() == 2) { out.print("selected"); } %>>2 레벨</option>
															<option value="3" <%if ( a.getLevelDown() == 3) { out.print("selected"); } %>>3 레벨</option>
															<option value="4" <%if ( a.getLevelDown() == 4) { out.print("selected"); } %>>4 레벨</option>
															<option value="5" <%if ( a.getLevelDown() == 5) { out.print("selected"); } %>>5 레벨</option>
															<option value="6" <%if ( a.getLevelDown() == 6) { out.print("selected"); } %>>6 레벨</option>
															<option value="7" <%if ( a.getLevelDown() == 7) { out.print("selected"); } %>>7 레벨</option>
															<option value="8" <%if ( a.getLevelDown() == 8) { out.print("selected"); } %>>8 레벨</option>
															<option value="9" <%if ( a.getLevelDown() == 9) { out.print("selected"); } %>>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:3;">
														<input name=downAllowedUser type="text" style="width:180; heigth:20;" value="<% if (a.getDownAllowedUser() != null && !a.getDownAllowedUser().equals("") && !a.getDownAllowedUser().equals("null")) { %><%=a.getDownAllowedUser()%><% } %>" maxlength=200>
													</td>
												</tr>
												</table>
											</td>
										</tr>
										</table>

										<table cellSpacing="1" cellPadding="0" border="0" bgcolor="#B5B5B5" width="100%" style="margin-top:20; text-align:center; border-right:none; color:#000;">
										<col width="120" />
										<col />
										<tr height="30" bgcolor="#FFFFFF">
											<td style="background:#f9f9f9;">게시판총괄관리자</td>
											<td style="padding-left:3;">
												<input type="text" style="width:230; heigth:20;" name=master onblur="checkField(this,'alphanumeric');" value="<%=a.getMaster()%>" maxlength=1500>
											</td>
										</tr>
										</table>

										<div style="margin-top:20; padding-left:10; color:#000;">
											※ Master(레벨1) 및 게시판 총괄 관리자는 모든 권한 부여
											※ Master(레벨1) 및 게시판 총괄 관리자는 모든 권한 부여
											<br>레벨1 : 총괄 관리자 (모든 권한 부여)
											<br>레벨5 : 부서관리자
											<br>레벨8 : 일반회원
											<br>레벨9 : Guest
										</div>
									</td>
									<td></td>
								</tr>
								</table>


						</td>
						</table>
					</td>
				</tr>
				</table>

				<div style="text-align:center; margin-top:10;">
					<table cellSpacing="0" cellPadding="0" border="0" class="btn_cursor_1">
					<tr height="22">
						<td class="btn_type_1_left"></td>
						<td class="btn_type_1_center"><input type=button value="수정완료" onClick="javascript:saveBoard();"></td>
						<td class="btn_type_1_left"></td>
					</tr>
					</table>
				</div>
</form>

		</td>
		</tr>
		</table>
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<jsp:include flush="true" page="../inc/bottom.jsp"/>
						