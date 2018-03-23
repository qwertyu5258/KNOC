<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.faq.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="FaqMa" scope="page" class="kr.co.knoc.faq.FaqManager" />
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

	application.setAttribute("gNavMenuDepth1", "05");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "FAQ관리";  					// 현제 페이지 제목
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
	
	FaqBean fb = FaqMa.getFaq(no);	
%>
<script type="text/javascript">
	var gubun = new Array();
	gubun[1] = new Array();
	gubun[2] = new Array();
	gubun[3] = new Array();
	gubun[1][1] = "지원접수";
	gubun[1][2] = "채영전형";
	gubun[1][3] = "근무조건";
	gubun[1][4] = "기타";

	gubun[2][1] = "테스트";
	gubun[2][2] = "테스트2";
	gubun[2][3] = "테스트3";
	gubun[2][4] = "테스트4";

	gubun[3][1] = "석유상식";
	gubun[3][2] = "석유개발";
	gubun[3][3] = "석유비축";
	gubun[3][4] = "일반사항";
	
	function refreshList(indexnum){
		if (indexnum > 0) {
			for(i=document.wForm.gubun.options.length;i>=1;i--){
				document.wForm.gubun.options.remove(i);
			}
			for(var i=1; i<gubun[indexnum].length; i++){
				document.wForm.gubun.options.add(new Option(gubun[indexnum][i],i));			 	   					  
			}
		}
	}			
	
	function jsEdit()
	{
		var f = document.wForm;
		if(f.menu[0].selected) {
			alert("메뉴를 선택해 주시기 바랍니다.");
		} else if(f.title.value == "") {
			alert("제목을 입력해 주시기 바랍니다.");
			f.title.focus();			
		} else {
			oEditors[0].exec("UPDATE_IR_FIELD", []);
			f.submit();						
		}		
	}
</script>
<!-- SmartEditor 삽입 -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > FAQ 관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 기타 관리 > FAQ 관리</span></td>
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
<form name="wForm" method="post" action="faqEditOk.jsp">
<INPUT TYPE="hidden" name="key_gbn" value="<%=key_gbn%>">
<INPUT TYPE="hidden" name="key_word" value="<%=key_word%>">
<INPUT TYPE="hidden" name="page" value="<%=nowpage%>">
<INPUT TYPE="hidden" name="no" value="<%=no%>">
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">메뉴명</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="menu" onchange="refreshList(document.wForm.menu.selectedIndex);">
		<option value="0">== 선택 ==</option>
		<option value="1" <% if (etcutil.checkNull(fb.getMenu()).equals("1")) { %>selected<% } %>>채용FAQ</option>
		<option value="2" <% if (etcutil.checkNull(fb.getMenu()).equals("2")) { %>selected<% } %>>윤리경영Q&A</option>
		<option value="3" <% if (etcutil.checkNull(fb.getMenu()).equals("3")) { %>selected<% } %>>고객참여FAQ</option>
		</select>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">분류</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="gubun">
		<option value="0">== 선택 ==</option>
		<% if (etcutil.checkNull(fb.getMenu()).equals("1")) { %>
		<option value="1" <% if (etcutil.checkNull(fb.getGubun()).equals("1")) { %>selected<% } %>>지원접수</option>
		<option value="2" <% if (etcutil.checkNull(fb.getGubun()).equals("2")) { %>selected<% } %>>채용전형</option>
		<option value="3" <% if (etcutil.checkNull(fb.getGubun()).equals("3")) { %>selected<% } %>>근무조건</option>
		<option value="4" <% if (etcutil.checkNull(fb.getGubun()).equals("4")) { %>selected<% } %>>기타</option>
		<% } else if (etcutil.checkNull(fb.getMenu()).equals("3")) { %>
		<option value="1" <% if (etcutil.checkNull(fb.getGubun()).equals("1")) { %>selected<% } %>>석유상식</option>
		<option value="2" <% if (etcutil.checkNull(fb.getGubun()).equals("2")) { %>selected<% } %>>석유개발</option>
		<option value="3" <% if (etcutil.checkNull(fb.getGubun()).equals("3")) { %>selected<% } %>>석유비축</option>
		<option value="4" <% if (etcutil.checkNull(fb.getGubun()).equals("4")) { %>selected<% } %>>일반사항</option>
		<% } %>
		</select>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">제목</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="title" value="<%=fb.getTitle()%>" maxlength=200 style="width:430px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">내용</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><textarea name="HTML_BODY" cols="85" rows="15" class="area"><%=fb.getContent() %></textarea></td>
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
					<td><input type=button value="수정" onclick="javascript:jsEdit()"></td>
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
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "HTML_BODY",
	sSkinURI: "/smartEditor/SEditorSkin.html",
	fCreator: "createSEditorInIFrame"
});
</script>
<%@ include file="../inc/bottom.jsp" %>