<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.term.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
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

	String gNavPage = "웹진관리 ";			// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
	int	webjin_nid	= (request.getParameter("webjin_nid")==null)?0:Integer.parseInt(request.getParameter("webjin_nid"));

	if(webjin_nid <= 0) {
%>
	<stl:msgBack msg="존재하지 않는 게시물입니다."/>
<%
		return;
	}
	WebzineBean pb = TermMa.getWebzineBean2(webjin_nid);
	String strLinkType = "";
	if(pb != null) {
		strLinkType = pb.getLinkType();
	}
%>
<script type="text/javascript">
	function jsWrite()
	{
		var f = document.wForm;
		if(f.title.value == "") {
			alert("제목을 입력해 주시기 바랍니다.");
			f.title.focus();
		} else {
			f.submit();
		}
	}


	function jsDelete() {
	    if (confirm("삭제를 하시겠습니까?")) {
	    	location.href = "webzineDeleteOk.jsp?no=<%=webjin_nid%>&nowpage=<%=nowpage%>";
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 웹진관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">기타 관리 > 웹진관리</span></td>
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
		<table width="80%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="wForm" method="post" action="webzineEditOk.jsp" >
<INPUT TYPE="hidden" name="page" value="<%=nowpage%>">
<INPUT TYPE="hidden" name="webjin_nid" value="<%=webjin_nid%>">
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">ALT</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="alt_name" value="<%=pb.getAlt_name() %>" maxlength=200 style="width:430px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">웹진URL</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="link_url" value="<%=pb.getLink_url() %>" maxlength=200 style="width:430px" class=input></td>
		</tr>
		<tr>
			<td width="100px" height="25" bgcolor="E7E7E7" align="center">링크방식<%=pb.getLinkType() %></td>
			<td bgcolor="#FFFFFF" style="padding-left:10;">
			<select name="linkType">
	            <option value="_blank" <%if (strLinkType.equals("_blank")) { %>selected<%} %>>새창으로</option>
				<option value="_top" <%if (strLinkType.equals("_top")) { %>selected<%} %>>현재창으로</option>
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
					<td><input type=button value="수정" onclick="javascript:jsWrite()"></td>
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