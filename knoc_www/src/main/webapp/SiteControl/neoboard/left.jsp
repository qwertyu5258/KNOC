<%@page import="kr.co.knoc.sitectrl.mgr.MgrSession"%>
<%@page pageEncoding="euc-kr"%> 
<%
	String gNavMenuDepth1 = (String)application.getAttribute("gNavMenuDepth1");
	String gNavMenuDepth2 = (String)application.getAttribute("gNavMenuDepth2");
%>

<%
	boolean govPublic = false;
	MgrSession leftMs = (MgrSession)request.getSession().getAttribute("ADMINSESSION");
	if(leftMs != null && (Integer.parseInt(leftMs.getUserLevel()) < 6)){
		govPublic = true;
	}
%>

<table height="100%"  border="0" cellpadding="0" cellspacing="0" valign=top>
<tr>
<td width="180" height="5" bgcolor="EAEAEC"></td>
<td width="15"></td>
</tr>
<tr>
<td bgcolor="EAEAEC" align="center" valign="top">
	<table width="170" height="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="D6D4D4">
	<tr>
	<td bgcolor="#FFFFFF" align="center" valign=top>
		<table width="158" height="40" border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td style="padding:0 0 0 8"><img src="/img/admin/admin_left_title.GIF" width="9" height="9"><b> 게시판 관리</b></td>
		</tr>
		</table>
		<table width="158" border="0" cellpadding="0" cellspacing="0" bgcolor="F4F3F3">		
		<tr>
		<td height="28" style="padding:0 0 0 15"><img src="/img/admin/admin_left_02.GIF" width="3" height="3"><a href="board_02.jsp" onfocus="this.blur();"><% if (gNavMenuDepth1.equals("02")) { %><span class="style7"><% } else { %><span><% } %> 게시판 관리</a></td>
		</tr>		
		<tr>
		<td height="1" bgcolor="#FFFFFF"></td>
		</tr>	
		<tr>
		<td height="28" style="padding:0 0 0 15"><img src="/img/admin/admin_left_02.GIF" width="3" height="3"><a href="board_01.jsp" onfocus="this.blur();"><% if (gNavMenuDepth1.equals("01")) { %><span class="style7"><% } else { %><span><% } %> 게시판 생성</span></a></td>
		</tr>
		<tr>
		<td height="1" bgcolor="#FFFFFF"></td>
		</tr>
		<tr>
		<td height="28" style="padding:0 0 0 15"><img src="/img/admin/admin_left_02.GIF" width="3" height="3"><a href="board_03.jsp?question_nid=1" onfocus="this.blur();"><% if (gNavMenuDepth1.equals("03")) { %><span class="style7"><% } else { %><span><% } %> 사보 독자 참여</span></a></td>
		</tr>
		<tr>
		<td height="1" bgcolor="#FFFFFF"></td>
		</tr>
		<tr>
		<td height="28" style="padding:0 0 0 15"><img src="/img/admin/admin_left_02.GIF" width="3" height="3"><a href="board_04.jsp" onfocus="this.blur();"><% if (gNavMenuDepth1.equals("04")) { %><span class="style7"><% } else { %><span><% } %> 사규 제·개정 예고</span></a></td>
		</tr>
		<tr>
		<td height="1" bgcolor="#FFFFFF"></td>
		</tr>
	<%if(govPublic){ %>
		<tr>
		<td height="28" style="padding:0 0 0 15"><img src="/img/admin/admin_left_02.GIF" width="3" height="3"><a href="board_05.jsp" onfocus="this.blur();"><% if (gNavMenuDepth1.equals("05")) { %><span class="style7"><% } else { %><span><% } %> 사전정보공개</span></a></td>
		</tr>
		<tr>
		<td height="1" bgcolor="#FFFFFF"></td>
		</tr>	
	<%} %>
		</table>
		<table width="158" height="5" border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td></td>
		</tr>
		</table>
	</td>
	</tr>
	</table>
</td>
<td></td>
</tr>
<tr>
<td height="5" align="center" valign="top" bgcolor="EAEAEC"></td>
<td></td>
</tr>
</table>