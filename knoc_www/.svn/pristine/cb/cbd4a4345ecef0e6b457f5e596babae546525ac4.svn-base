<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.term.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="TermMa" scope="page" class="kr.co.knoc.term.WebzineManager" />
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

	application.setAttribute("gNavMenuDepth1", "11");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "웹진 관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/	
	
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList al = TermMa.getTermList(pp.getNPage(), pp.getNPageSize());		
	
	WebzineBean pb = new WebzineBean();
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function goFind()
	{
		var t = document.schform;
		t.submit();
	}	
	function edit(webjin_nid) {
//         	document.bForm.action = 'termEdit.jsp';
			document.bForm.action = 'webzineEdit.jsp';
			document.bForm.webjin_nid.value = webjin_nid;
           	document.bForm.submit();
	}
	function jsWrite() {
		location.href = "webzineWrite.jsp";
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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 웹진 관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 기타 관리 > 웹진 관리</span></td>
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
			<input type=button value=' 웹진관리  ' class=button onClick="jsWrite();">
			</td>
			</tr>        
			</table>	
			<br>		
<!-- ROW 시작 -->	
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="bForm" method="post" action="webzineEdit.jsp">
<input type=hidden name=page value="<%=nowpage%>">
<input type="hidden" name="webjin_nid" value="<%=pb.getWebjin_nid()%>">	
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center width="80">번호</td>
			<td align=center>링크주소</td>
			<td align=center>ALT</td>			
			</tr>    

<% 
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			pb = (WebzineBean)iter.next();
			
			
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center>1</td>
			<td align=center><a href="javascript:edit('<%= pb.getWebjin_nid() %>')"><%= pb.getImg_path() %></a></td>
			<td align=center><a href="javascript:edit('<%= pb.getWebjin_nid() %>')"><%= pb.getLink_url() %></a></td>	
			</tr>
<%				
		System.out.println("pb.getWebjin_nid(): 02 =  " + pb.getWebjin_nid());
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