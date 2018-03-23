<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.recruit.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="RecruitMa" scope="page" class="kr.co.knoc.recruit.RecruitManager" />
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

	application.setAttribute("gNavMenuDepth1", "09");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "채용설명회 신청관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")),"8859_1");
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");	
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
<%	
		return;
	}	
	
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH)+1;
	int day = now.get(Calendar.DATE);
	
	RecruitBean rb = RecruitMa.getRecruit(no);
	
	String mobile1 = "";
	String mobile2 = "";
	String mobile3 = "";
	String phone1 = "";
	String phone2 = "";
	String phone3 = "";
	String zipno1 = "";
	
	int tag1 = 0;
	int tag2 = 0;
	if (rb.getMobile() != null && !rb.getMobile().equals("")) {
		tag1 = rb.getMobile().indexOf("-");
       	tag2 = rb.getMobile().indexOf("-", tag1+1);
       	if ((tag1 > 0) && (tag2 > 0))
       	{
       		mobile1 = rb.getMobile().substring(0, tag1);
            mobile2 = rb.getMobile().substring(tag1+1, tag2);
            mobile3 = rb.getMobile().substring(tag2+1, rb.getMobile().length());
		}
	}
	if (rb.getPhone() != null && !rb.getPhone().equals("")) {
		tag1 = rb.getPhone().indexOf("-");
       	tag2 = rb.getPhone().indexOf("-", tag1+1);
       	if ((tag1 > 0) && (tag2 > 0))
       	{
       		phone1 = rb.getPhone().substring(0, tag1);
            phone2 = rb.getPhone().substring(tag1+1, tag2);
            phone3 = rb.getPhone().substring(tag2+1, rb.getPhone().length());
		}
	}
	if (rb.getZipcode() != null && !rb.getZipcode().equals("")) {

       		zipno1 = rb.getZipcode();            

	}
%>
<script type="text/javascript">	
	function jsEdit()
	{
		var f = document.wForm;
		if(f.name.value == "") {
			alert("이름을 입력해 주시기 바랍니다.");
			f.name.focus();		
		} else if(f.mobile2.value == "" || f.mobile3.value == "") {
			alert("휴대전화를 입력해 주시기 바랍니다.");
			f.mobile2.focus();			
		} else if(!isNum(f.mobile2.value) || !isNum(f.mobile3.value)) {
			alert("휴대전화는 숫자만 입력 가능합니다.");
			f.mobile2.focus();	
		} else {
			oEditors[0].exec("UPDATE_IR_FIELD", []);
			f.submit();						
		}		
	}

	function isNum(str)
	{
		var vString = "1234567890";
		for (var i=0 ;i<str.length;i++)
		{
			if(vString.indexOf(str.charAt(i)) <0)
			{
				return false;
			}
		}
		return true;
	}	
</script>
<!-- SmartEditor 삽입 -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript" src="/share/js/calendar.js"></script>
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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 채용설명회 신청관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 기타 관리 > 채용설명회 신청관리</span></td>
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
<form name="wForm" method="post" action="recruitEditOk.jsp">
<INPUT TYPE="hidden" name="key_gbn" value="<%=key_gbn%>">
<INPUT TYPE="hidden" name="key_word" value="<%=key_word%>">
<INPUT TYPE="hidden" name="page" value="<%=nowpage%>">
<INPUT TYPE="hidden" name="no" value="<%=no%>">
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">이름</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="name" value="<%=rb.getName() %>" maxlength=32 style="width:130px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">소속기관</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="company" value="<%=rb.getEmail() %>" maxlength=200 style="width:230px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">E-mail</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="email" value="<%=rb.getEmail() %>" maxlength=200 style="width:430px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">일반전화</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<input type="text" name="phone1" value="<%=phone1 %>" maxlength=3 style="width:35px" class=input>
		- <input type="text" name="phone2" value="<%=phone2 %>" maxlength=4 style="width:40px" class=input>
		- <input type="text" name="phone3" value="<%=phone3 %>" maxlength=4 style="width:40px" class=input>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">휴대전화</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="mobile1">
		<option value="010" <% if (mobile1.equals("010")) { %>selected<% } %>>010</option>
		<option value="011" <% if (mobile1.equals("011")) { %>selected<% } %>>011</option>
		<option value="016" <% if (mobile1.equals("016")) { %>selected<% } %>>016</option>
		<option value="017" <% if (mobile1.equals("017")) { %>selected<% } %>>017</option>
		<option value="018" <% if (mobile1.equals("018")) { %>selected<% } %>>018</option>
		<option value="019" <% if (mobile1.equals("019")) { %>selected<% } %>>019</option>
		</select>
		- <input type="text" name="mobile2" value="<%=mobile2 %>" maxlength=4 style="width:40px" class=input>
		- <input type="text" name="mobile3" value="<%=mobile3 %>" maxlength=4 style="width:40px" class=input>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center" rowspan=2>주소</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="zipno1" value="<%=zipno1 %>" maxlength=3 style="width:150px" class=input><br>
		<input type="text" name="addr1" value="<%=rb.getAddr1() %>" maxlength=200 style="width:430px" class=input></td>
		</tr>
		<tr>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><input type="text" name="addr2" value="<%=rb.getAddr2() %>" maxlength=200 style="width:430px" class=input></td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">참여날짜</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<input name="visitDate" type="text" size=15 value="<%=StringUtil.getDateType(rb.getVisitDate(),"-")%>" readonly onclick="showCalendar(this, visitDate, 'yyyy-mm-dd')" class=input>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">인원</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;">
		<select name="person">
		<% for (int i = 1; i <= 30; i++) { %>
		<option value="<%=i%>" <% if (rb.getPerson() == i) { %>selected<% } %>><%=i %>명</option>
		<% } %>
		</select>
		</td>
		</tr>
		<tr>
		<td width="100px" height="25" bgcolor="E7E7E7" align="center">내용</td>
		<td bgcolor="#FFFFFF" style="padding-left:10;"><textarea name="HTML_BODY" cols="85" rows="15" class="area"><%=rb.getContent() %></textarea></td>
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
