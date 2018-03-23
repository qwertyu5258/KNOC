<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.EngMenuManager" />
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
        
	String gNavPage = "영문메뉴관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String depth1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth1")),"8859_1");
	if (depth1 == null || depth1.equals("")) {
		depth1 = "01";
	}
	String menu_name1 = "";
	if (depth1.equals("01")) {
		menu_name1 = "Who we are";
	} else if (depth1.equals("02")) {
		menu_name1 = "Corporate Responsibility";
	} else if (depth1.equals("03")) {
		menu_name1 = "Operations";
	} else if (depth1.equals("04")) {
		menu_name1 = "Investor Relations";
	} else if (depth1.equals("05")) {
		menu_name1 = "Service";
	} else if (depth1.equals("06")) {
		menu_name1 = "E&P Technology Institute";
	} else if (depth1.equals("07")) {
		menu_name1 = "Site Search";
	}	
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function jsEdit(no) {
         	document.bForm.action = 'engMenuEdit.jsp';
          	document.bForm.no.value = no;
           	document.bForm.submit();
	}
	function jsWrite() {
		document.bForm.action = "engMenuWrite.jsp";
       	document.bForm.submit();
	}
	function jsDelete(mcode) {
		var ff = document.bForm;
	    if (confirm("메뉴의 하위 메뉴가 있으실 경우 하위메뉴도 삭제 되십니다.\n삭제를 하시겠습니까?")) {	
	    	ff.action = "engMenuDeleteOk.jsp";
	    	ff.mcode.value = mcode;
	        ff.submit();
	
	    }
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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 메뉴 관리 > 영문메뉴관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">메뉴 관리 > 영문메뉴관리</span></td>
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
			<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">		
			<tr>
			<td class=descBorder_r>
			<input type=button value=' 영문 메뉴 등록 ' class=button onClick="jsWrite();">
			<input type=button value=' 영문 메뉴 순서 변경' class=button onClick="location.href='engMenuListEdit.jsp';">
			</td>
			</tr>        
			</table>		
			<br></br>
			<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">		
			<tr>
			<td class=descBorder_r>
			<a href="engMenuList.jsp?depth1=01">Who we are</a> | <a href="engMenuList.jsp?depth1=02">Corporate Responsibility</a>
			 | <a href="engMenuList.jsp?depth1=03">Operations</a>
			 | <a href="engMenuList.jsp?depth1=04">Investor Relations</a>
			 | <a href="engMenuList.jsp?depth1=05">Service</a>
			 | <a href="engMenuList.jsp?depth1=06">E&P Technology Institute</a>
			 | <a href="engMenuList.jsp?depth1=07">Site Search</a>
			 </td>
			</tr>        
			</table>				
<!-- ROW 시작 -->	
<form name="bForm" method="post" action="engMenuList.jsp">
<input type="hidden" name="no" value="">
<input type="hidden" name="mcode" value="">
<input type="hidden" name="depth1" value="<%=depth1 %>">	
</form>
<% 
	ArrayList al01 = MenuMa.getMenuList(depth1,"");	
%>
			<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
			<tr height="25"  bgcolor="000000">
			<td align=center width="60"><font color=ffffff>no.</font></td>
			<td align=center width="100"><font color=ffffff>메뉴코드</font></td>
			<td align=center width="100"><font color=ffffff>메뉴명</font></td>			
			<td align=center><font color=ffffff>경로</font></td>			
			<td align=center width="150"><font color=ffffff>관리</font></td>						
			</tr>    
<%
	Iterator iter = al01.iterator();
	int i = 1;
	String bgcolor = "";	
	String delMcode = "";
	while(iter.hasNext()){		
		EngMenuBean mb = (EngMenuBean)iter.next();
		if (mb.getMCode().substring(4,8).equals("0000")) {
			bgcolor = "#8FA4BB";
			delMcode = mb.getMCode().substring(0,4);
		} else if (mb.getMCode().substring(6,8).equals("00")) {
			bgcolor = "#BBD5F0";
			delMcode = mb.getMCode().substring(0,6);
		} else {
			bgcolor = "#ECF4FC";			
			delMcode = mb.getMCode();
		}
%>																																	
			<tr height="25"  bgcolor="<%=bgcolor %>">
			<td align=center><%=i %></td>						
			<td align=center><%=mb.getMCode() %></td>			
			<td align=center><%=mb.getName() %></td>			
			<td align=center><a href="<%=mb.getUrl()%>" target="_blank"><%=menu_name1 %> <%=MenuMa.getMenuName(mb.getMCode()) %></a></td>						
			<td align=center><input type=button value=' 수정 ' class=button onClick="jsEdit(<%=mb.getNo() %>);">
			<input type=button value=' 삭제 ' class=button onClick="jsDelete('<%=delMcode %>');"></td>
			</tr>
<%				
		i = i + 1;
	}
%>				
			</table>
		</td>
		</tr>
		</table>		
		<br>					
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>	