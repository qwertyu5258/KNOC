<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.mgr.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrMa" scope="page" class="kr.co.knoc.mgr.MgrHelper" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "회원관리";  		// 서브 Depth 제목
    String gNavSubName = "member";				// 서브 Depth 이름
    String gNavDepthTitle1 = "02"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "회원리스트";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")),"8859_1");
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");	
	String userid = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("userid")),"8859_1");	
	
	MgrDO mgr = MgrMa.queryMgr(userid);
	
	String phone1 = "";
	String phone2 = "";
	String phone3 = "";
	String mobile1 = "";
	String mobile2 = "";
	String mobile3 = "";
	String zipcode1 = "";
	String zipcode2 = "";
	
	int tag1 = 0;
	int tag2 = 0;
	if (mgr.getPhoneNumber() != null && !mgr.getPhoneNumber().equals("")) {
		tag1 = mgr.getPhoneNumber().indexOf("-");
       	tag2 = mgr.getPhoneNumber().indexOf("-", tag1+1);
       	if ((tag1 > 0) && (tag2 > 0))
       	{
       		phone1 = mgr.getPhoneNumber().substring(0, tag1);
            phone2 = mgr.getPhoneNumber().substring(tag1+1, tag2);
            phone3 = mgr.getPhoneNumber().substring(tag2+1, mgr.getPhoneNumber().length());
		}
	}
	if (mgr.getMobileNumber() != null && !mgr.getMobileNumber().equals("")) {
		tag1 = mgr.getMobileNumber().indexOf("-");
	    tag2 = mgr.getMobileNumber().indexOf("-", tag1+1);
	    if ((tag1 > 0) && (tag2 > 0))
	    {
	    	mobile1 = mgr.getMobileNumber().substring(0, tag1);
	        mobile2 = mgr.getMobileNumber().substring(tag1+1, tag2);
	        mobile3 = mgr.getMobileNumber().substring(tag2+1, mgr.getMobileNumber().length());
		}
	}
	if (mgr.getZipcode() != null && !mgr.getZipcode().equals("")) {
		tag1 = mgr.getZipcode().indexOf("-");
	    if (tag1 > 0)
	    {
	    	zipcode1 = mgr.getZipcode().substring(0, tag1);
	        zipcode2 = mgr.getZipcode().substring(tag1+1, mgr.getZipcode().length());
		}
	}
%>
<script type="text/javascript">
	function do_edit()
	{
		var f = document.f_regi;		
		if(f.email.value == "") {
			alert("이메일 주소를 입력해 주시기 바랍니다.");
			f.email.focus();	
		/**
		} else if(f.phone1.value =="" || f.phone2.value =="" || f.phone3.value =="") { 
			alert("전화번호를 입력해 주시기 바랍니다"); 
			f.phone1.focus();
		} else if(!isNum(f.phone1.value) || !isNum(f.phone2.value) || !isNum(f.phone3.value)) { 
			alert("전화번호는 숫자만 가능합니다."); 
			f.phone1.focus();
		**/ 
		} else {
			f.submit();						
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

	function openZipcode() {
		window.open("/member/pop_post.jsp","pop_post","width=362,height=280,scrollbars=yes");			
	}
	
	function setZipcode(zipcode1,zipcode2,addr1) {
		document.f_regi.zipcode1.value = zipcode1;
		document.f_regi.zipcode2.value = zipcode2;
		document.f_regi.addr1.value = addr1;
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 회원관리 > 회원리스트</td>
			<td width="500" align="right" style="padding-right:20;">HOME &lt; <span class="style6">회원관리 &lt; 회원리스트</span></td>
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
		<td>회원기본정보</td>
		</tr>
		</table>
		<table width="80%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="f_regi" method="post" action="memberEditOk.jsp">
<INPUT TYPE="hidden" name="key_gbn" value="<%=key_gbn%>">
<INPUT TYPE="hidden" name="key_word" value="<%=key_word%>">
<INPUT TYPE="hidden" name="page" value="<%=nowpage%>">
<INPUT TYPE="hidden" name="userid" value="<%=userid%>">		
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">이름</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><%=mgr.getName() %></td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">ID</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><%=mgr.getId() %></td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">우편번호</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="zipcode1" value="<%=zipcode1 %>" class="input" maxlength=3 style="width:50px" onclick="openZipcode()" readonly>
		- <input type="text" name="zipcode2" value="<%=zipcode2 %>" class="input" maxlength=3 style="width:50px" onclick="openZipcode()" readonly>
		<input type=button value=' 우편번호 ' class='button' onClick="javascript:openZipcode();">
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center" rowspan=2>주소</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="addr1" value="<%=mgr.getAddr1() %>" maxlength=100 style="width:400px" class=input onclick="openZipcode()" readonly></td>
		</tr>
		<tr>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="addr2" value="<%=mgr.getAddr2() %>" maxlength=100 style="width:400px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">전화번호</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="phone1" value="<%=phone1 %>" maxlength=3 style="width:30px" class=input>
		- <input type="text" name="phone2" value="<%=phone2 %>" maxlength=4 style="width:40px" class=input>
		- <input type="text" name="phone3" value="<%=phone3 %>" maxlength=4 style="width:40px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">휴대전화</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="mobile1" value="<%=mobile1 %>" maxlength=3 style="width:30px" class=input>
		- <input type="text" name="mobile2" value="<%=mobile2 %>" maxlength=4 style="width:40px" class=input>
		- <input type="text" name="mobile3" value="<%=mobile3 %>" maxlength=4 style="width:40px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">E-mail</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="email" value="<%=mgr.getEmail() %>" maxlength=100 style="width:400px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">메일링서비스</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="radio" name="letter" value="Y" <% if (mgr.getLetter().equals("Y")) { %>checked<% } %>>동의<input type="radio" name="letter" value="N" <% if (mgr.getLetter().equals("N")) { %>checked<% } %>>동의하지 않음</td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">직업</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><select name="job">
		<option value="">== 선택 ==</option>
		</select></td>
		</tr>	
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">회원레벨</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="u_level">
              <option value="7" <% if (mgr.getLevel() != null && !mgr.getLevel().equals("") && mgr.getLevel().equals("7")) { %>selected<% } %>>이사회</option>
              <option value="8" <% if (mgr.getLevel() != null && !mgr.getLevel().equals("") && mgr.getLevel().equals("8")) { %>selected<% } %>>일반회원</option>
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
					<td><input type=button value="수정" onclick="javascript:do_edit()"></td>
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
