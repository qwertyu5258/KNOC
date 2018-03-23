<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.sitectrl.mgr.*"%>
<%@ page import = "kr.co.knoc.division.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@page import="kr.co.knoc.division.DivisionListManager"%>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
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

    application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "관리자정보/권한설정";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")),"8859_1");
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");	
%>
<script type="text/javascript">
	function do_join()
	{
		var f = document.f_regi;
		if(f.name.value == "") {
			alert("이름을 입력해 주시기 바랍니다.");
			f.name.focus();	
		} else if(f.userid.value == "") {
			alert("아이디를 입력해 주시기 바랍니다.");
			f.userid.focus();			
		//} else if(document.loginchkform.idck.value != "OK") {
		//	alert("아이디 중복확인을 해주시기 바랍니다.");
		//	f.userid.focus();			
		//	return false;
		} else if (f.userid.value.length < 4 || f.userid.value.length > 10) {
			alert("아이디는 영문소문자와 숫자와의 조합으로 4~10자입니다.");
			f.userid.focus();	
		} else if(f.userpwd.value == "") {
			alert("비밀번호를 입력해 주시기 바랍니다.");
			f.userpwd.focus();		
		} else if (f.userpwd.value.length < 4 || f.userpwd.value.length > 12) {
			alert("비빌번호는 영문소문자와 숫자의 조합으로 4~12자입니다.");
			f.userpwd.focus();
		} else if(f.userpwd.value != f.userpwd2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			f.userpwd.focus();											
		} else {
			f.submit();						
		}		
	}
	
	function automail(){
		var am = document.joinform.email.value;
		document.joinform.email_post.value = am;
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
	
	function idCheck() 
	{
	   	var comp="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
		var comp2="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		var string=document.f_regi.userid.value;
		var len=string.length;
		for(i=0;i<len;i++)
		{
		   if (i == 0) {
	   		if(comp2.indexOf(string.substring(i,i+1))<0)
	   		{
	   			//alert("첫자는  영문으로 시작해야 합니다.");
	   			//document.f_regi.userid.focus();
	   			//return;
	   		}
		   }
			if(comp.indexOf(string.substring(i,i+1))<0)
			{
				alert("허용된 문자가 아닙니다. 다시 입력해 주십시오");
				document.f_regi.userid.value="";
				document.f_regi.userid.focus();
				return;
			}
		}
		if(len <4) 
		{
			alert("아이디는 4자이상입니다.");
			return;
		}
	 	if(len >10)
	 	{
	   	alert("아이디는 10자 이하입니다.");
	   	document.f_regi.userid.focus();
	   	return;
	 	}
	
		if(document.f_regi.userid.value=="") 
		{
			alert("아이디를 입력하십시요");
			document.f_regi.userid.focus();
			return;
		}	
		window.open("checkID.jsp?userid="+document.f_regi.userid.value, "searchid","width=320,height=142,left=300,top=150");
	}
</script>
<%@ include file="../inc/top.jsp" %>
<form name="loginchkform" method="post" action="">					
<input type="hidden" name="idck" value="" />	
<input type="hidden" name="userid" value="" />	
</form>			
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 관리자 관리 > 관리자정보/권한설정</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">관리자 관리 > 관리자정보/권한설정</span></td>
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
		<td>관리자기본정보</td>
		</tr>
		</table>
		<table width="80%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="f_regi" method="post" action="adminWriteOk.jsp">
<INPUT TYPE="hidden" name="key_gbn" value="<%=key_gbn%>">
<INPUT TYPE="hidden" name="key_word" value="<%=key_word%>">
<INPUT TYPE="hidden" name="page" value="<%=nowpage%>">
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">부서명</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="d_code">
		<%=DivisionListManager.getDivisionSelect("") %>
		</select>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">이름</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="name" value="" maxlength=10 style="width:100px" class=input> (띄워쓰기 없이 한글로만)</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">ID</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="userid" value="" maxlength=10 style="width:100px" class=input>&nbsp;<input type=button value="ID중복체크" onclick="javascript:idCheck()">(영문,숫자포함 4~12자-대소문자 구분)</td>
		</tr>				
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">비밀번호</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="password" name="userpwd" value="" maxlength=10 style="width:100px" class=input> (영문,숫자 포함 4~12자 - 대소문자 구분) </td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">비밀번호확인</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="password" name="userpwd2" value="" maxlength=10 style="width:100px" class=input></td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">전화번호</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="phone1" value="" maxlength=3 style="width:25px" class=input>
		- <input type="text" name="phone2" value="" maxlength=4 style="width:35px" class=input>
		- <input type="text" name="phone3" value="" maxlength=4 style="width:35px" class=input></td>
		</tr>				
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">핸드폰번호</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><select name="mobile1">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>		
		<option value="018">018</option>		
		<option value="019">019</option>		
		</select>
		- <input type="text" name="mobile2" value="" maxlength=4 style="width:35px" class=input>
		- <input type="text" name="mobile3" value="" maxlength=4 style="width:35px" class=input></td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">팩스번호</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="fax1" value="" maxlength=3 style="width:25px" class=input>
		- <input type="text" name="fax2" value="" maxlength=4 style="width:35px" class=input>
		- <input type="text" name="fax3" value="" maxlength=4 style="width:35px" class=input></td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">메일주소</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="email" value="" maxlength=100 style="width:400px" class=input></td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">기타</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="etc" value="" maxlength=100 style="width:400px" class=input></td>
		</tr>						
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">관리자레벨</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="u_level">
              <option value="1">총괄관리자</option>
              <option value="5">부서관리자</option>
              </select> 
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