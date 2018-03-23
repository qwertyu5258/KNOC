<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.MenuManager" />		
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

	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "메뉴관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	int no = request.getParameter("no") == null ? 0 : Integer.parseInt(request.getParameter("no"));
	String depth1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth1")),"8859_1");
	if (no <=0) {
%>
<script language="javascript">
	alert("잘못된 호출입니다.");
	history.back();
</script>
<%	
		return;
	}
	MenuBean mb = MenuMa.getMenu(no);
	
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */	
	String mb_code_substr = mb.getMCode().substring(0,2);
	if(mb_code_substr == null){ mb_code_substr = "";}
	String mb_get_code = mb.getMCode();
	if(mb_get_code == null){ mb_get_code = "";}
	
	String menu = "";
	if (mb_code_substr!= null && mb_code_substr.equals("01")) { 
		menu = "공사소개";
	} else if (mb_code_substr!= null && mb_code_substr.equals("02")) { 
		menu = "열린경영";
	} else if (mb_code_substr!= null && mb_code_substr.equals("03")) { 
		menu = "사업소개";
	} else if (mb_code_substr!= null && mb_code_substr.equals("04")) { 
		menu = "고객참여";
	} else if (mb_code_substr!= null && mb_code_substr.equals("05")) { 
		menu = "정보마당";
	} else if (mb_code_substr!= null && mb_code_substr.equals("06")) { 
		menu = "석유기술연구";
	} else if (mb_code_substr!= null && mb_code_substr.equals("07")) { 
		menu = "어린이";
	} else if (mb_code_substr!= null && mb_code_substr.equals("08")) { 
		menu = "이사회";
	} else if (mb_code_substr!= null && mb_code_substr.equals("09")) { 
		menu = "기타서비스";
	} else if (mb_code_substr!= null && mb_code_substr.equals("10")) { 
		menu = "사이트검색";
	}
	menu += MenuMa.getMenuName(mb_get_code);
%>
<script type="text/javascript">
	function jsEdite()
	{
		var f = document.f_regi;
		if(f.name.value == "") {
			alert("메뉴명을 입력해 주시기 바랍니다.");
			f.name.focus();	
		} else if(f.url.value == "") {
			alert("파일경로를 입력해 주시기 바랍니다.");
			f.url.focus();		
		} else {
			f.action = "menuEditOk.jsp";
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 메뉴 관리 > 메뉴관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">메뉴 관리 > 메뉴관리</span></td>
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
<form name="f_regi" method="post" action="menuEdit.jsp">
<input type="hidden" name="no" value="<%=no %>">
<input type="hidden" name="depth1" value="<%=depth1 %>">
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">메뉴경로</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><%=menu %></td>
		</tr>			
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">메뉴명</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="name" value="<%=mb.getName() %>" maxlength=100 style="width:400px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">파일경로</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="url" value="<%=etcutil.checkNull(mb.getUrl()) %>" style="width:400px" class=input></td>
		</tr>
		<% 
			/**
			 * 2016.3.21 JSM
			 * 보안약점 조치
			 */		
			String mb_status = mb.getStatus();
			if(mb_status == null){
				mb_status = "";
			}		
		%>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">사용여부</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type=radio name="status" value="Y" <% if (mb_status.equals("Y")) { %>checked<% } %>>사용
		<input type=radio name="status" value="N" <% if (mb_status.equals("N")) { %>checked<% } %>>사용안함</td>
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
					<td><input type=button value="수정" onclick="javascript:jsEdite()"></td>
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