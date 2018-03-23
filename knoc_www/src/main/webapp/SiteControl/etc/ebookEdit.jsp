<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.ebook.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="EbookMa" scope="page" class="kr.co.knoc.ebook.EbookManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "기타 관리";  		// 서브 Depth 제목
    String gNavSubName = "etc";				// 서브 Depth 이름
    String gNavDepthTitle1 = "05"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1", "06");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "EBOOK관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")));
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")));
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
%>		
	<stl:msgBack msg="존재하지 않는 게시물입니다."/>
<%	
		return;
	}
	EbookBean eb = EbookMa.getEbook(no);
%>
<script type="text/javascript">	
	function jsWrite()
	{
		var f = document.wForm;
		if(f.menu[0].selected) {
			alert("메뉴를 선택해 주시기 바랍니다.");
		} else if(f.title.value == "") {
			alert("제목을 입력해 주시기 바랍니다.");
			f.title.focus();
		} else if(f.link.value == "") {
			alert("URL을 입력해 주시기 바랍니다.");
			f.link.focus();			
		} else {
			f.submit();						
		}		
	}

	function checkFile(c, index) {
		var fo = eval("document.wForm.file" + index);
		if(typeof(fo) != "object") return;
		
		if(c.checked) {
			fo.disabled = 0;
		}else {
		fo.disabled = 1;
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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > EBOOK관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 기타 관리 > EBOOK관리</span></td>
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
<form name="wForm" method="post" action="ebookEditOk.jsp" enctype="multipart/form-data">
<INPUT TYPE="hidden" name="key_gbn" value="<%=key_gbn%>">
<INPUT TYPE="hidden" name="key_word" value="<%=key_word%>">
<INPUT TYPE="hidden" name="page" value="<%=nowpage%>">
<INPUT TYPE="hidden" name="no" value="<%=no%>">
<INPUT TYPE="hidden" name="oldFilename2" value="<%=eb.getNewFilename()%>">
<INPUT TYPE="hidden" name="oldFilename" value="<%=eb.getNewImagename()%>">
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">메뉴명</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="menu">
		<option value="0">== 선택 ==</option>
		<option value="1" <% if (etcutil.checkNull(eb.getMenu()).equals("1")) { %>selected<% } %>>Annual Report</option>
		<option value="2" <% if (etcutil.checkNull(eb.getMenu()).equals("2")) { %>selected<% } %>>석유사랑(전자사보)</option>
		<option value="3" <% if (etcutil.checkNull(eb.getMenu()).equals("3")) { %>selected<% } %>>만화</option>
		<option value="4" <% if (etcutil.checkNull(eb.getMenu()).equals("4")) { %>selected<% } %>>페트로메이션</option>
		<option value="5" <% if (etcutil.checkNull(eb.getMenu()).equals("5")) { %>selected<% } %>>석유영상실</option>
		<option value="6" <% if (etcutil.checkNull(eb.getMenu()).equals("6")) { %>selected<% } %>>석유만화방</option>
		<option value="7" <% if (etcutil.checkNull(eb.getMenu()).equals("7")) { %>selected<% } %>>영문사이트(Annual Report)</option>
		</select>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">제목</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="title" value="<%=eb.getTitle() %>" maxlength=200 style="width:430px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">e-book URL</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="link" value="<%=eb.getLink() %>" maxlength=200 style="width:430px" class=input></td>
		</tr>		
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">이미지 업로드</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="file" name="file1" value="" maxlength=200 style="width:350px" class=input <% if (eb.getImage() != null && !eb.getImage().equals("")) { %>disabled<% } %>>
		<% if (eb.getImage() != null && !eb.getImage().equals("")) { %>
		<div style="height:24px;">
			<a tabindex="0"><font style='font-size:8pt;color=gray'>첨부파일: <b><%=eb.getImage()%></font></a>
			<br><input title="파일삭제" type="checkbox" name="fileupdate1" id="fileupdate1" value="<%=eb.getNo()%>" onclick="checkFile(this, 1);" onkeypress="checkFile(this, 1);">
		<span style="padding-top:3px"><a tabindex="0"><font style='font-size:8pt;color=gray'>왼쪽 체크박스를 선택하시면 이미 첨부된 화일은 삭제됩니다.</font></a></span>
		</div>
		<% } %>		
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">PDF파일 업로드</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="file" name="file2" value="" maxlength=200 style="width:350px" class=input <% if (eb.getFilename() != null && !eb.getFilename().equals("")) { %>disabled<% } %>>
		<% if (eb.getFilename() != null && !eb.getFilename().equals("")) { %>
		<div style="height:24px;">
			<a tabindex="0"><font style='font-size:8pt;color=gray'>첨부파일: <b><%=eb.getFilename()%></font></a>
			<br><input title="파일삭제" type="checkbox" name="fileupdate2" id="fileupdate2" value="<%=eb.getNo()%>" onclick="checkFile(this, 2);" onkeypress="checkFile(this, 2);">
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
					<td><input type=button value="등록" onclick="javascript:jsWrite()"></td>
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