<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="kr.co.knoc.sitectrl.mgr.*" %>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
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

    application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "게시판생성";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	MgrSession ses = (MgrSession)session.getAttribute("ADMINSESSION");
	String userLevel = ""; 
	if (ses != null) {
		if (ses.getUserLevel().equals("") || !ses.getUserLevel().equals("1")) {
%>
<script language="javascript">
	alert("접근 권한이 없습니다.");
	history.back();
</script>
<%			
			return;
		}		
	}
%>
<jsp:include flush="true" page="../inc/top.jsp" />

<script language=javascript>
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
	if(confirm(f.boardName.value + " 게시판을 생성하시겠습니까?")) {
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
<jsp:include flush="true" page="left.jsp"/>
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 게시판 관리 > 게시판 생성</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">게시판 관리 > 게시판 생성</span></td>
			</tr>
			<tr>
			<td height="2" colspan="2" bgcolor="EAEAEC"></td>
			</tr>
			</table>

<form name=boardform action="board_01_ok.jsp" method=post>
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
							<td align="center" colSpan="2" style="background:#E7E7E7; color:#000;padding-left:10px">게시판 설정</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">게시판카테고리</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type=hidden name=categoryName value="">
								<select style="width:160;" name=categoryID>
									<option value="">----------선택----------</option>
									<%=com.neoboard.PropertyManager.getCommons("CATE","")%>													
								</select> <input type=button value=" 게시판카테고리 관리 " style="height:19px" onclick="openCommon('CATE');">
							</td> 
						</tr>			
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;">게시판명</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" style="width:160; heigth:20;" name=boardName maxlength=32 value=""><br>
								(한글 32자, 영문 64자 이내)
							</td>
						</tr>			
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">게시판ID</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" style="width:160; heigth:20;" name=boardID maxlength=8 onblur="checkField(this,'alphanumeric');"><BR>
								영문 숫자 조합 8 자 이내로 입력해 주세요.(필수)
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">게시판타입</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<select style="width:160;" name=boardType>
									<option value="DEFAULT" selected>기본형</option>
									<option value="SANGDAM">상담형</option>
									<option value="INFOOPEN">정보공개형</option>
								</select>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">게시판스킨</td>
							<input type=hidden name=skinName value="">
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<select style="width:160;" name=skinID>
									<option value="">----------선택----------</option>	
									<%=com.neoboard.PropertyManager.getCommons("SKIN","")%>													
								</select> <input type=button value=" 게시판스킨 관리 " style="height:19px" onclick="openCommon('SKIN');">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">제목 최대 글자수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" value="90" style="width:160; heigth:20;" name=maxSubjectLength onblur="checkField(this,'number');">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">페이지당 목록 수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" value=12 style="width:160; heigth:20;" name=listPerPage onblur="checkField(this,'number');">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">블럭당 페이지 수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input type="text" value=10 style="width:160; heigth:20;" name=pagePerBlock onblur="checkField(this,'number');">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">게시판상단에<br>출력할 내용</td>
							<td style="padding-top:7; padding-bottom:7; padding-left:10;" bgcolor="#FFFFFF">
								<textarea name=topIncludeText style="width:90%; height:50;"></textarea>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">게시판하단에<br>출력할 내용</td>
							<td style="padding-top:7; padding-bottom:7; padding-left:10;" bgcolor="#FFFFFF">
								<textarea name=bottomIncludeText style="width:90%; height:50;"></textarea>
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">기능 선택</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000; font-size:11;">
								<tr>
									<td><input type="checkbox" style="border:0px" name=useRegistration value="1" checked></td>
									<td style="padding-top:2;">등록</td>
									<td><input type="checkbox" style="border:0px" name=useReply value="1" checked></td>
									<td style="padding-top:2;">답변</td>
									<td><input type="checkbox" style="border:0px" name=useEdit value="1" checked></td>
									<td style="padding-top:2;">수정</td>
									<td><input type="checkbox" style="border:0px" name=useDelete value="1" checked></td>
									<td style="padding-top:2;">삭제</td>
								</tr>
								<tr>
									<td><input type="checkbox" style="border:0px" name=useComment value="1" checked></td>
									<td style="padding-top:2;">댓글</td>
									<td><input type="checkbox" style="border:0px" name=useImageView value="1" checked></td>
									<td style="padding-top:2;">이미지게시판</td>
									<td><input type="checkbox" style="border:0px" name=useSecret value="1"></td>
									<td style="padding-top:2;">비밀글</td>
									<td><input type="checkbox" style="border:0px" name=useNotice value="1"></td>
									<td style="padding-top:2;">공지글</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">로그인 여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" style="border:0px" name=useAuth value="1" checked></td>
									<td style="padding-top:2;">로그인 체크</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name=useAuth value="0"></td>
									<td style="padding-top:2;">로그인 체크안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">첨부 업로드 확장자</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=allowedExtension type="text" style="width:110; heigth:20;">＊ 공백일 경우 제한하지 않음
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">첨부 업로드 용량</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=maxUpload type="text" style="width:110; heigth:20;" value="10000" onblur="checkField(this,'number');">
								KB 이하
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">첨부 가능 파일 개수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<select style="width:160;" name=maxFileAttach>
								<option value="0">없음
								<option value="1">1개
								<option value="2" selected>2개
								<option value="3">3개
								<option value="4">4개
								<option value="5">5개
								<option value="6">6개
								<option value="7">7개
								<option value="8">8개
								<option value="9">9개
								<option value="10">10개
								</select>
								
							</td>
						</tr>

						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">그룹기능 사용</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000000;">
								<tr>
									<td><input type="radio" style="border:0px" name=useGroup value="1"></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name=useGroup value="0" checked></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
								
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">새글표시 사용여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" style="border:0px" name="useNew" value="1" checked></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="useNew" value="0"></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">새글표시 허용일수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">금일부터 
								<select style="width:40;" name=newLimit>
								<option value="1" selected>1
								<option value="2">2
								<option value="3">3
								<option value="4">4
								<option value="5">5
								<option value="6">6
								<option value="7">7
								</select> 일까지
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">인기글표시 사용여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" style="border:0px" name="useCool" value="1"></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="useCool" value="0" checked></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">인기글 조회수</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">조회수 
								<input name=coolLimit type="text" style="width:40; heigth:20;" value="100" onblur="checkField(this,'number');">이상
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
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td>
									<select name=useMailing onchange="enableMailing(this);">
									<option value="0">사용안함</option>
									<option value="W">글등록시 사용</option>
									<option value="WR">글등록,답변등록시 사용</option>
									<option value="EWR">글수정,글등록,답변등록시 사용</option>
									<option value="E">글수정시 사용</option>
									<option avlue="ER">글수정,답변등록시 사용</option>
									<option avlue="WE">글등록,글수정시 사용</option>									
									<option value="R">답변 등록시 사용</option>
									</select>
									</td>
								</tr>
								</table>
								<div id="MAILINGCONFIG" style="display:none">
								<table cellSpacing="1" cellPadding="3" border="0" width=100% style="color:#000000;" bgcolor="#FFFFFF">
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일 보내는 사람</td>
								<TD bgcolor="#FFFFFF"><input name=mailFrom type="text" style="width:98%; heigth:20;" value=""><BR>보내는 사람을 지정하지 않으면 글 등록자의 이메일을 사용합니다.</TD>
								</tr>
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일 받는 사람</td>
								<TD bgcolor="#FFFFFF"><input name=mailTo type="text" style="width:98%; heigth:20;" value=""><BR>받는 사람을 지정하지 않으면 글등록자의 이메일로 메일을 발송합니다.</TD>
								</tr>
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일서버</td>
								<TD bgcolor="#FFFFFF"><input name=mailServer type="text" style="width:98%; heigth:20;" value="localhost"></TD>
								</tr>
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일서버계정</td>
								<TD bgcolor="#FFFFFF"><input name=mailAccount type="text" style="width:98%; heigth:20;" value=""></TD>
								</tr>
								<TR>
								<TD bgcolor="#EFEFEF" width=100>메일서버계정비밀번호</td>
								<TD bgcolor="#FFFFFF"><input name=mailPasswd type="text" style="width:98%; heigth:20;" value=""></TD>
								</tr>
								</table>
								<table cellSpacing="1" cellPadding="2" border="0" width=100% style="color:#000000;" bgcolor="#FFFFFF">
								<TR>
								<TD bgcolor="#EFEFEF" align=center height=22>메일 Template</TD>
								</TR>
								<TR>
								<TD><textarea name=mailTemplate rows=6 cols=20 style="width:99%">[##이름##]님이 [##제목##]의 [##글종류##]을 [##등록일##] 에 남기셨습니다.

게시물 URL : [##게시물URL##]</textarea>
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
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" style="border:0px" name="useDouble" value="1"></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="useDouble" value="0" checked></td>
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
									<td><input type="radio" style="border:0px" name="useRss" value="1"></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="useRss" value="0" checked></td>
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
									<td><input type="radio" style="border:0px" name="useMovie" value="1"></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="useMovie" value="0" checked></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">게시판 사용여부</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000;">
								<tr>
									<td><input type="radio" style="border:0px" name="status" value="1" checked></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name="status" value="0"></td>
									<td style="padding-top:2;">폐쇄</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">금지어</td>
							<td style="padding-top:7; padding-bottom:7; padding-left:10;" bgcolor="#FFFFFF">
								<textarea name=banwd style="width:90%; height:50;"></textarea>
								<br>(","로 연결해 주세요.)
							</td>
						</tr>
						<tr height="30">
							<td style="background:#EBEBEB; color:#000;padding-left:10px">금지IP</td>
							<td style="padding-top:7; padding-bottom:7; padding-left:10;" bgcolor="#FFFFFF">
								<textarea name=banIp style="width:90%; height:50;"></textarea>
								<br>(","로 연결해 주세요.)
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">통합검색 사용</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000000;">
								<tr>
									<td><input type="radio" style="border:0px" name=useSearch value="1"></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name=useSearch value="0" checked></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
								
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">페이지 경로</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=pageUrl type="text" style="width:210; heigth:20;">
								<br>＊ 검색에서 페이지 이동시에 필요합니다.
								<br>(사용자 페이지의 페이지 경로를 입력해 주세요.)
							</td>
						</tr>
						<tr height="30">
							<td style="padding-top:5; padding-bottom:3; background:#f9f9f9; color:#000;padding-left:10px">SMS 사용</td>
							<td style="padding-left:6;" bgcolor="#FFFFFF">
								<table cellSpacing="0" cellPadding="0" border="0" style="color:#000000;">
								<tr>
									<td><input type="radio" style="border:0px" name=useSms value="1"></td>
									<td style="padding-top:2;">사용</td>
									<td width="42"></td>
									<td><input type="radio" style="border:0px" name=useSms value="0" checked></td>
									<td style="padding-top:2;">사용안함</td>
								</tr>
								</table>
								
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">SMS 메세지</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=smsText type="text" style="width:210; heigth:20;">
							</td>
						</tr>
						<tr height="30">
							<td style="background:#f9f9f9; color:#000;padding-left:10px">SMS 받는사람 번호</td>
							<td style="padding-left:10;" bgcolor="#FFFFFF">
								<input name=smsNumber type="text" style="width:210; heigth:20;">
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
								<table cellSpacing="0" cellPadding="0" border="0" bgcolor="#FFFFFF">
								<col width="9" />
								<col />
								<col width="9" />
								<tr valign="top">
									<td></td>
									<!--하단 여백조절-->
									<td width="96%" style="padding-top:10; padding-bottom:150;" bgcolor="#FFFFFF">

										<table cellSpacing="0" cellPadding="0" border="0" style="table-layout:fixed;" bgcolor="#FFFFFF">
										<col width="100" />
										<col />
										<tr valign="top">
											<td>
												<table cellSpacing="1" cellPadding="0" border="0" bgcolor="#B5B5B5" frame="below" rules="rows" width="100%" style="margin-top:26; text-align:center; color:#000000;">
												<tr height="29">
													<td style="background:#EBEBEB;padding-left:10px">리스트 보기</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;padding-left:10px">내용보기</td>
												</tr>
												<tr height="30">
													<td style="background:#EBEBEB;padding-left:10px">등록</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;padding-left:10px">답변</td>
												</tr>
												<tr height="30">
													<td style="background:#EBEBEB;padding-left:10px">수정</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;padding-left:10px">삭제</td>
												</tr>
												<tr height="30">
													<td style="background:#EBEBEB;padding-left:10px">댓글쓰기</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;padding-left:10px">댓글삭제</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;padding-left:10px">공지글</td>
												</tr>
												<tr height="30">
													<td style="background:#f9f9f9;padding-left:10px">다운로드</td>
												</tr>
												</table>
											</td>
											<td bgcolor="#FFFFFF">
												<table cellSpacing="1" cellPadding="0" border="0" bgcolor="#B5B5B5" width="100%" style="text-align:center; border-right:none; color:#000;">
												<col width="30%" />
												<col width="70%" />
												<tr height="25">
													<td style="background:#EBEBEB;padding-left:10;">레벨 설정</td>
													<td style="background:#EBEBEB;padding-left:10;">특정 아이디</td>
												</tr>
												<tr height="29" bgcolor="#FFFFFF">
													<td style="padding-left:10;" bgcolor="#FFFFFF">
														<select style="width:90%;" name=levelList>
															<option value="1">1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8">8 레벨</option>
															<option value="9" selected>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=listAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td style="padding-left:10;">
														<select style="width:90%;" name=levelView>
															<option value="1">1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8">8 레벨</option>
															<option value="9" selected>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=viewAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td style="padding-left:10;">
														<select style="width:90%;" name=levelRegistration>
															<option value="1">1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8" selected>8 레벨</option>
															<option value="9">9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=registrationAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td style="padding-left:10;">
														<select style="width:90%;" name=levelReply>
															<option value="1">1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8" selected>8 레벨</option>
															<option value="9">9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=replyAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td style="padding-left:10;">
														<select style="width:90%;" name=levelEdit>
															<option value="1" selected>1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8">8 레벨</option>
															<option value="9">9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=editAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td style="padding-left:10;">
														<select style="width:90%;" name=levelDelete>
															<option value="1" selected>1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8">8 레벨</option>
															<option value="9">9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=deleteAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td style="padding-left:10;">
														<select style="width:90%;" name=levelCommentWrite>
															<option value="1">1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8" selected>8 레벨</option>
															<option value="9">9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=commentWriteAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td style="padding-left:10;">
														<select style="width:90%;" name=levelCommentDelete>
															<option value="1" selected>1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8">8 레벨</option>
															<option value="9">9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=commentDeleteAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td style="padding-left:10;">
														<select style="width:90%;" name=levelNotice>
															<option value="1" selected>1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8">8 레벨</option>
															<option value="9">9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=noticeAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
													</td>
												</tr>
												<tr height="30" bgcolor="#FFFFFF">
													<td style="padding-left:10;">
														<select style="width:90%;" name=levelDown>
															<option value="1">1 레벨</option>
															<option value="2">2 레벨</option>
															<option value="3">3 레벨</option>
															<option value="4">4 레벨</option>
															<option value="5">5 레벨</option>
															<option value="6">6 레벨</option>
															<option value="7">7 레벨</option>
															<option value="8">8 레벨</option>
															<option value="9" selected>9 레벨</option>
														</select>
													</td>
													<td style="padding-left:10;padding-right:10;">
														<input name=downAllowedUser type="text" style="width:100%; heigth:20;" maxlength=200>
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
											<td style="background:#f9f9f9;padding-left:10px">게시판총괄관리자</td>
											<td style="padding-left:10;padding-right:10;">
												<input type="text" style="width:100%; heigth:20;" name=master onblur="checkField(this,'alphanumeric');" maxlength=1500>
											</td>
										</tr>
										</table>

										<div style="margin-top:20; padding-left:10; color:#000;">
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
					<input type=button value=" 게시판 만들기 " style="height:19px" onclick="saveBoard();">
				</div>
				<BR>

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