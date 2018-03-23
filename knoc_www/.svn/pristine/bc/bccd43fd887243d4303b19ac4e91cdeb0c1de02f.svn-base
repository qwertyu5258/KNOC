<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="kr.co.knoc.sitectrl.mgr.*" %>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
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

    application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "게시판생성";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	MgrSession ses = (MgrSession)session.getAttribute("ADMINSESSION");
	String userLevel = ""; 
	if (ses != null) {
		userLevel = ses.getUserLevel();		
	}
%>
<jsp:include flush="true" page="../inc/top.jsp" />
<style type="text/css">
A:link, A:visited, A:hover, A:active{
	text-decoration:none;
	color:#000;
}
A:hover	{	color:#666;}



.this_box_flow_1_d1_1 A:link, .this_box_flow_1_d1_1 A:visited, .this_box_flow_1_d1_1 A:hover, .this_box_flow_1_d1_1 A:active{
	text-decoration:none;
	color:#FFF;
}
.this_box_flow_1_d1_1 A:hover	{	color:#efefef;}


.this_box_flow_1_d1_1{
	padding-top:10;
	padding-bottom:6;
	text-align:center;
	background:#767676;
	color:#FFF;
}
.this_box_flow_1_d2_1{
	padding-top:4;
	text-align:center;
	border:1 #B5B5B5 solid;
	background:#EBEBEB;
	color:#000;
}
.this_box_flow_1_d2_3{
	padding-top:4;
	padding-left:5;
	text-align:left;
	border:1 #B5B5B5 solid;
	background:#EBEBEB;
	color:#000;
}
.this_box_flow_1_d3_1{
	padding-top:4;
	padding-left:5;
	border:1 #B5B5B5 solid;
	background:#F9F9F9;
	color:#000;
}
.this_box_flow_1_d3_2{
	padding-top:4;
	padding-bottom:4;
	padding-left:5;
	border:1 #B5B5B5 solid;
	background:#F9F9F9;
	color:#000;
	line-height:18px;
}

.this_box_flow_1_d4_1{
	padding-top:4;
	padding-left:5;
	border:1 #B5B5B5 solid;
	background:#FFF;
	color:#000;
}
.this_box_flow_1_d4_2{
	padding-top:4;
	padding-bottom:3;
	padding-left:5;
	border:1 #B5B5B5 solid;
	background:#FFF;
	color:#000;
	line-height:18px;
}
</style>
<script language=javascript>
function deleteBoard(bid) {
	if(confirm("게시판을 삭제하시겠습니까?")) {
		if(confirm("게시판을 삭제하시면, 등록된 게시물과 첨부파일은 복구하실 수 없습니다. 계속하시겠습니까?"))  {
			document.deleteform.bid.value = bid;
			document.deleteform.submit();
		}
	}
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 게시판 관리 > 게시판관리(설정)</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">게시판 관리 > 게시판관리(설정)</span></td>
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
	String categoryID = com.neoboard.util.EtcUtil.strBlockSpecialTags(request.getParameter("categoryID"));
	if (categoryID == null || categoryID.equals("")) {
		categoryID = com.neoboard.PropertyManager.getTopComID("CATE");
	}	
%>			
<form name=deleteform action="board_delete.jsp" method=post>
<input type=hidden name=bid value="">
<input type=hidden name=categoryID value="<%=categoryID%>">
</form>				
			<table cellSpacing="0" cellPadding="0" border="0"width="100%" style="margin-top:15;">			
<form name=searchform method=get action="">
			<TR>
			<TD width=80 align=right> <b>카테고리 : </td>
			<TD>&nbsp;


			<select style="width:160;" name=categoryID onchange="document.searchform.submit()">
			<%=com.neoboard.PropertyManager.getCommons("CATE",categoryID)%>				
			</select>
			</td>
			</tr>
</form>
			</table>
<%
	java.util.Vector pv = (new com.neoboard.PropertyManager()).getPropertiesByCategory(categoryID);
%>
			<table cellSpacing="0" cellPadding="0" border="1" borderColor="#B5B5B5" width="100%" class="link_board_1" style="margin-top:20; text-align:center; color:#5c5c5c;">
			<tr height="25" style="background:#E7E7E7; color:#000;">
				<td><div align=center>번호</div></td>
				<td><div align=center>게시판 아이디</div></td>
				<td><div align=center>게시판 이름</div></td>
				<td><div align=center>보기</div></td>
				<td><div align=center>수정</div></td>
				<td><div align=center>삭제</div></td>
			</tr>
<%
	for ( int i = 0 ; i < pv.size() ; i++ ) {
		com.neoboard.data.Property p = (com.neoboard.data.Property)pv.get(i);
%>
			<tr height="30" align=center>
				<td><div align=center><%=i+1%></div></td>
				<td><div align=center><%=p.getBoardID()%></div></td>
				<td><div align=center><%=p.getBoardName()%></div></td> 
				<td><div align=center><a href="view_board.jsp?bid=<%=p.getBoardID()%>" target="_blank">보기</a></div></td>
				<td><div align=center><% if (userLevel.equals("1")) { %><input type=button value="수정" onClick="javascript:location.href='board_02_edit.jsp?bid=<%=p.getBoardID()%>'"><% } else { %>&nbsp;<% } %></div></td>
				<td><div align=center><% if (userLevel.equals("1")) { %><input type=button value="삭제" onClick="javascript:deleteBoard('<%=p.getBoardID()%>');"><% } else { %>&nbsp;<% } %></div></td>
			</tr>
<%
	}
%>
			</table>
				
		</td>
		</tr>
		</table>
	</td>
	</tr>
	<tr height=20px>
	<td></td>
	</tr>
	</table>
</td>
</tr>
</table>
<jsp:include flush="true" page="../inc/bottom.jsp"/>