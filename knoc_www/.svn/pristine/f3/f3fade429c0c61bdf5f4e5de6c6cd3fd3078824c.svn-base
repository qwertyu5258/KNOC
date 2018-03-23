<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.mobile.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="EventMa" scope="page" class="kr.co.knoc.mobile.EventManager" />
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

	application.setAttribute("gNavMenuDepth1", "01");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "배너관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	
%>		
	
<%	
		
	EventBean pb = EventMa.getEvent();
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

	function checkFile(c) {
		var fo = eval("document.wForm.filename");
		if(typeof(fo) != "object") return;
		
		if(c.checked) {
			fo.disabled = 0;
		}else {
		fo.disabled = 1;
		}
	}

	function jsDelete() {
	    if (confirm("삭제를 하시겠습니까?")) {	
	    	location.href = "bannerDeleteOk.jsp?no=<%=no%>&nowpage=<%=nowpage%>";	    		
	    }
	}
</script>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript" src="/share/js/calendar.js"></script>
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
			<td><img src="../images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 배너관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">기타 관리 > 배너관리</span></td>
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
<form name="wForm" method="post" action="event_manager_update.jsp" enctype="multipart/form-data">
<INPUT TYPE="hidden" name="page" value="<%=nowpage%>">
<INPUT TYPE="hidden" name="no" value="<%=no%>">
<INPUT TYPE="hidden" name="oldFilename" value="<%=pb.getNewFilename()%>">
	
		<tr>
			<td width="100px" height="25" bgcolor="E7E7E7" align="center">표출여부</td>
			<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="radio" name="visibility" value="Y" <% if (etcutil.checkNull(pb.getVisibility()).equals("Y")) { %>checked<% } %>>표출<input type="radio" name="visibility" value="N" <% if (etcutil.checkNull(pb.getVisibility()).equals("N")) { %>checked<% } %>>표출안함</td>
		</tr>
		<tr>
			<td width="100px" height="25" bgcolor="E7E7E7" align="center">링크URL</td>
			<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="linkurl" value="<%=pb.getLinkUrl() %>" maxlength=200 style="width:430px" class=input></td>
		</tr>
		<tr>
			<td width="100px" height="25" bgcolor="E7E7E7" align="center">링크방식</td>
			<td bgcolor="#FFFFFF" style="padding-left:10;">
			<select name="linkType">
	            <option value="_blank" <% if (etcutil.checkNull(pb.getLinkType()).equals("_blank")) { %>selected<% } %>>새창으로</option>
				<option value="_top" <% if (etcutil.checkNull(pb.getLinkType()).equals("_top")) { %>selected<% } %>>현재창으로</option>
			</select>
			</td>
		</tr>	
		<tr>
			<td width="100px" height="25" bgcolor="E7E7E7" align="center">이미지 파일</td>
			<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="file" name="filename" value="" maxlength=200 style="width:350px" class=input <% if (pb.getFilename() != null && !pb.getFilename().equals("")) { %>disabled<% } %>> (높이는 25px로 맞춰주세요.)
			<% if (pb.getFilename() != null && !pb.getFilename().equals("")) { %>
			<div style="height:24px;">
				<a tabindex="0"><font style='font-size:8pt;color=gray'>첨부파일: <b><%=pb.getFilename()%></font></a>
				<input title="파일삭제" type="checkbox" name="fileupdate" id="fileupdate" value="<%=pb.getNo()%>" onclick="checkFile(this);" onkeypress="checkFile(this);">
			<span style="padding-top:3px"><a tabindex="0"><font style='font-size:8pt;color=gray'>왼쪽 체크박스를 선택하시면 이미 첨부된 화일은 삭제됩니다.</font></a></span>
			</div>
			<% } %>
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