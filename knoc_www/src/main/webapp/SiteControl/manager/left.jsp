<%@page pageEncoding="euc-kr"%> 
<%
	String gNavMenuDepth1 = (String)application.getAttribute("gNavMenuDepth1");
	String gNavMenuDepth2 = (String)application.getAttribute("gNavMenuDepth2");
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
		<td style="padding:0 0 0 8"><img src="../images/admin_left_title.GIF" width="9" height="9"><b> 包府磊包府</b></td>
		</tr>
		</table>
		<table width="158" border="0" cellpadding="0" cellspacing="0" bgcolor="F4F3F3">
		<tr>
		<td height="28" style="padding:0 0 0 15"><img src="../images/admin_left_02.GIF" width="3" height="3"><a href="adminList.jsp" onfocus="this.blur();"><% if (gNavMenuDepth1.equals("01")) { %><span class="style7"><% } else { %><span><% } %> 包府磊沥焊/鼻茄汲沥</span></a></td>
		</tr>
		<tr>
		<td height="1" bgcolor="#FFFFFF"></td>
		</tr>
		</table>
		<table width="158" border="0" cellpadding="0" cellspacing="0" bgcolor="F4F3F3">
		<tr>
		<td height="28" style="padding:0 0 0 15"><img src="../images/admin_left_02.GIF" width="3" height="3"><a href="divisionList.jsp" onfocus="this.blur();"><% if (gNavMenuDepth1.equals("02")) { %><span class="style7"><% } else { %><span><% } %> 何辑包府</span></a></td>
		</tr>
		<tr>
		<td height="1" bgcolor="#FFFFFF"></td>
		</tr>
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