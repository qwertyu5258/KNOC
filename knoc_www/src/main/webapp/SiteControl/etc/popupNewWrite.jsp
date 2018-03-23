<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "기타 관리";  		// 서브 Depth 제목
    String gNavSubName = "etc";				// 서브 Depth 이름
    String gNavDepthTitle1 = "05"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1", "05");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "팝업관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));	
%>

<%@ include file="../inc/top.jsp" %>
<!-- SmartEditor 삽입 -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	function jsWrite()
	{		
		oEditors.getById["content"].exec("UPDATE_IR_FIELD", []);
		var f = document.wForm;
		if(f.title.value == "") {
			alert("제목을 입력해 주시기 바랍니다.");
			f.title.focus();
		} else if(f.width.value == "") {
			alert("가로사이즈를 입력해 주시기 바랍니다.");
			f.width.focus();
		} else if(!isNum(f.width.value)) {
			alert("가로사이즈는 숫자만 입력해 주시기 바랍니다.");
			f.width.focus();
		} else if(f.height.value == "") {
			alert("세로사이즈를 입력해 주시기 바랍니다.");
			f.height.focus();
		} else if(!isNum(f.height.value)) {
			alert("세로사이즈는 숫자만 입력해 주시기 바랍니다.");
			f.height.focus();		
		} else {
			try{
				f.submit();
			}catch(e){}					
		}		
	}

	function isNum(str)
	{
		var vString = "1234567890";
		for (var i=0 ;i<str.length;i++)
		{
			if(vString.indexOf(str.charAt(i)) <0)
			{
				return false;
			}
		}
		return true;
	}	
</script>
<script type="text/javascript" src="/share/js/calendar.js"></script>
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 팝업관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">기타 관리 > 팝업관리</span></td>
			</tr>
			<tr>
			<td height="2" colspan="2" bgcolor="EAEAEC"></td>
			</tr>
			</table>
		</td>
		</tr>
		</table>
		<table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td></td>
		</tr>
		</table>
		<table width="80%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="wForm" method="post" action="popupNewWriteOk.jsp">
<INPUT TYPE="hidden" name="page" value="<%=nowpage%>">
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">게시기한</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<input name="StartDate" type="text" size=15 value="" readonly="readonly" class="input date">
		~ <input name="EndDate" type="text" size=15 value="" readonly="readonly" class="input date">
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">표출여부</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="radio" name="visibility" value="Y" checked>표출<input type="radio" name="visibility" value="N">표출안함</td>
		</tr>				
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">제목</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="title" value="" maxlength=200 style="width:430px" class=input></td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">내용</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><textarea id="content" name="content" cols="85" rows="15" class="area"></textarea></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">가로사이즈</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="width" value="" maxlength=5 style="width:130px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">세로사이즈</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="height" value="" maxlength=5 style="width:130px" class=input> (쿠키 사용할 경우 25px를 더 추가해주세요.)</td>
		</tr>		
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">스크롤 사용여부</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<input type="radio" name="scroll" value="Y" checked />사용 <input type="radio" name="scroll" value="N" />미사용
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">쿠키 사용여부</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<input type="radio" name="cookie" value="Y" checked />사용 <input type="radio" name="cookie" value="N" />미사용
		</td>
		</tr>	
		
</form>				
		</table>
		<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
		<td height="10"></td>
		</tr>
		<tr>
		<td align="right">
			<table cellSpacing="0" cellPadding="0" border="0" style="color:#4c4c4c;">
			<tr>
			<td>
				<table cellSpacing="0" cellPadding="0" border="0" style="color:#4c4c4c;">
				<tr>
				<td>
					<table cellSpacing="0" cellPadding="0" border="0">
					<tr height="22">
					<td></td>
					<td><input type=button value="등록" onclick="javascript:jsWrite()"></td>
					<td></td>
					</tr>
					</table>
				</td>
				</tr>
				</table>
			</td>
			<td width="15"></td>
			<td>
				<table cellSpacing="0" cellPadding="0" border="0">
				<tr height="22">
				<td></td>
				<td><input type=button value="취소" onclick="javascript:history.back()"></td>
				<td></td>
				</tr>
				</table>
			</td>
			</tr>
			</table>
		</td>
		</tr>
		<tr>
		<td height="8" align="center"></td>
		</tr>
		</table>
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/smartEditor/SEditorSkin.html",
	fCreator: "createSEditorInIFrame"
});
</script>
<%@ include file="../inc/bottom.jsp" %>