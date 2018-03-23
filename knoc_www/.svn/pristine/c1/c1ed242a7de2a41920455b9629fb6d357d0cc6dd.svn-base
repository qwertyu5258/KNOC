<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "메뉴 관리";  		// 서브 Depth 제목
    String gNavSubName = "content";				// 서브 Depth 이름
    String gNavDepthTitle1 = "03"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "메뉴관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String depth1 = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth1")),"8859_1");
	String depth2 = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth2")),"8859_1");
	String depth3 = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth3")),"8859_1");
	String depth4 = "00";		
	String mcode = depth1 + depth2 + depth3 + depth4;
	if (mcode == null || mcode.equals("") || mcode.equals("00")) {
		mcode = "01000000";
	}
%>
<script type="text/javascript">
	function do_join()
	{
		var f = document.f_regi;
		if(f.name.value == "") {
			alert("메뉴명을 입력해 주시기 바랍니다.");
			f.name.focus();	
		} else if(f.url.value == "") {
			alert("파일경로를 입력해 주시기 바랍니다.");
			f.url.focus();				
		} else {
			f.action = "engMenuWriteOk.jsp";
			f.submit();						
		}		
	}
</script>
<%@ include file="../inc/top.jsp" %>		
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 메뉴 관리 > 영문메뉴관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">메뉴 관리 > 영문메뉴관리</span></td>
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
		<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
		<tr height=30>
		<td>메뉴정보</td>
		</tr>
		</table>
		<table width="80%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="f_regi" method="post" action="engMenuWrite.jsp">
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">1Depth</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="depth1" onChange="document.f_regi.submit();">
		<option value="01" <% if (depth1.equals("01")) { %>selected<% } %>>Who we are</option>
		<option value="02" <% if (depth1.equals("02")) { %>selected<% } %>>Corporate Responsibility</option>
		<option value="03" <% if (depth1.equals("03")) { %>selected<% } %>>Operations</option>
		<option value="04" <% if (depth1.equals("04")) { %>selected<% } %>>Investor Relations</option>		
		<option value="05" <% if (depth1.equals("05")) { %>selected<% } %>>Service</option>		
		<option value="06" <% if (depth1.equals("06")) { %>selected<% } %>>E&P Technology Institute</option>	
		<option value="07" <% if (depth1.equals("07")) { %>selected<% } %>>Site Search</option>
		</select>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">2Depth</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="depth2" onChange="document.f_regi.submit();">
		<option value="00">== 선택 ==</option>		
		<%=EngMenuManager.getMCodeSelect2(mcode) %>				
		</select>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">3Depth</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="depth3" onChange="document.f_regi.submit();">
		<option value="00">== 선택 ==</option>		
		<%=EngMenuManager.getMCodeSelect3(mcode) %>				
		</select>
		</td>
		</tr>			
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">메뉴명</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="name" value="" maxlength=100 style="width:400px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">파일경로</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="url" value="" maxlength=100 style="width:400px" class=input></td>
		</tr>					
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">사용여부</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type=radio name="status" value="Y" checked>사용
		<input type=radio name="status" value="N">사용안함</td>
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
					<td><input type=button value="등록" onclick="javascript:do_join()"></td>
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
<%@ include file="../inc/bottom.jsp" %>