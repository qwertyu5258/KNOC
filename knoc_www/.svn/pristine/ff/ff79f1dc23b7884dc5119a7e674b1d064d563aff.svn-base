<%@page import="kr.co.knoc.prroom.PrRoomBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.banner.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="prma" scope="page" class="kr.co.knoc.prroom.PrRoomManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "기타 관리";  		// 서브 Depth 제목
    String gNavSubName = "etc";				// 서브 Depth 이름
    String gNavDepthTitle1 = "05"; 			// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 			// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1", "17");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "영문메인관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	pp.setPageUrl("");
	ArrayList al = prma.getPrRoomList();		
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
		
	function edit(nid) {		
       	document.form01.action = 'prRoomEdit.jsp?nid='+nid;
       	document.form01.submit();
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
	<td valign="top">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td valign="top">			
			<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 영문메인관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 기타 관리 > 영문메인관리</span></td>
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
			<br>		
<!-- ROW 시작 -->	
			<table width="60%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form id="form01" name="form01" method="post">
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center width="20%">구분</td>
			<td align=center width="70%">연결 콘텐츠</td>
			<td align=center width="10%">관리</td>
			</tr>
	<%
		int i = 1;
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			PrRoomBean prm = (PrRoomBean)iter.next();			
	%>
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=prm.getName() %></td>			
			<td align=center><input type="text" id="url" name="url_<%=i %>" value="<%if(prm.getUrl() != null && !"".equals(prm.getUrl())){ %><%=prm.getUrl() %><%}else{} %>" size="60" /></td>
			<td align=center><input type=button value='적용' class="button" onClick="edit('<%=prm.getNid() %>');"></td>			
			</tr>			
<%
			i++;
		}
%>				
			</table>
		</td>
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