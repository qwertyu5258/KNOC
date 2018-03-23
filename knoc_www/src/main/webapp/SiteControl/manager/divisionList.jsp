<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.division.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="DivisionMa" scope="page" class="kr.co.knoc.division.DivisionListManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "관리자관리";  		// 서브 Depth 제목
    String gNavSubName = "manager";				// 서브 Depth 이름
    String gNavDepthTitle1 = "01"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

    application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "부서관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	ArrayList al = DivisionMa.getDivisionList();		
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">	
	function jsWrite() {
		var f = document.wform;
		if (f.d_name.value == "") {
			alert("부서명을 입력해 주세요.");
			f.d_name.focus();
		} else if (f.d_tell1.value == "" || f.d_tell2.value == "" || f.d_tell3.value == "") {
			alert("전화번호를 입력해 주세요.");
			f.d_tell1.focus();
		} else if (!isNum(f.d_tell1.value) || !isNum(f.d_tell2.value) || !isNum(f.d_tell3.value)) {
			alert("전화번호는 숫자만 허용합니다.");
			f.d_tell1.focus();			
		} else {
			f.submit();
		}
	}
	
	function jsDelete() {
		var ff = document.bform;
	    if (!isSelect(document.bform, "d_code")) {
	        alert("삭제할 게시물을 선택하세요.");
	        return;
	    }
	    if (confirm("삭제를 하시겠습니까?")) {	
	    	ff.action = "divisionDeleteOk.jsp";
	        ff.submit();
	
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
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="195" valign="top">  
<%@ include file = "left.jsp" %>  
</td>  
<td valign=top>
	<table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td valign="top" align=center>
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td valign="top">			
			<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 관리자관리 > 부서관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">관리자관리 > 부서관리</span></td>
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
<!-- ROW 시작 -->	
			<table width="80%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5" align=center>
<form name=bform method=post action="">				
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center width="60"><a href="JavaScript:selectChkAll(document.bform,'d_code');">선택</a></td>
			<td align=center>부서명</td>
			<td align=center width="110">전화번호</td>
			</tr>    
<%  if(al.size()==0) { %>				
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan=3>등록된 부서가 없습니다.</td>
			</tr>
<% 
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			DivisionListBean dlb = (DivisionListBean)iter.next();
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><input type="checkbox" name="d_code" value="<%=dlb.getDCode() %>"></td>
			<td align=center><%=dlb.getDName()%></td>
			<td align=center><%=dlb.getDTell()%></td>
			</tr>
<%				
		}
	}
%>				
</form>
			</table>
		</td>
		</tr>
		</table>
		<br>
		<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="80%">		
		<tr>
		<td align="right">
		<input type=button value=' 삭제 ' class=button onClick="jsDelete();">
		</td>
		</tr>        
		</table>
		<br>		
		<table width="80%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="wform" method="post" action="divisionWriteOk.jsp">
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">부서명</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="d_name" value="" maxlength=100 style="width:100px" class=input></td>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">전화번호</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="d_tell1" value="" maxlength=3 style="width:25px" class=input>
		- <input type="text" name="d_tell2" value="" maxlength=4 style="width:35px" class=input>
		- <input type="text" name="d_tell3" value="" maxlength=4 style="width:35px" class=input>
		</td>
		<td bgcolor="#FFFFFF" align=center><input type=button value="등록" onclick="javascript:jsWrite()"></td>
		</tr>	
</form>		
		</table>		
		<br>
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>	