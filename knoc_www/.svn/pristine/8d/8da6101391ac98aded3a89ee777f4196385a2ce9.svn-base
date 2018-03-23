<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.satisfy.*"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="SatisfyMa" scope="page" class="kr.co.knoc.satisfy.SatisfyManager" />
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

	application.setAttribute("gNavMenuDepth1", "04");
	application.setAttribute("gNavMenuDepth2", "01");

	String gNavPage = "만족도현황";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));

	String depth1 =  "02";
	String depth2 =  "02";
	String depth3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth3")));
	if (depth3 == null || depth3.equals("")) {
		depth3 = "00";
	}
	String mcode = depth1 + depth2 + depth3;

	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList al = SatisfyMa.getSatisfyList(pp.getNPage(), pp.getNPageSize());

	int count = SatisfyMa.getSatisfyListCount();
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();

	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	if(seq < 0) { seq = 1; }

	SatisfyBean sfbT = SatisfyMa.getSatisfyTotal(mcode);
	//System.out.println(sfbT.getTotal());
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function goFind()
	{
		var t = document.schform;
		t.submit();
	}
	function view(mcode) {
		window.open("satisfyCmtList.jsp?mcode="+mcode, "cmt", "width=600px; height=500px; scrollbars=yes;");
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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 만족도현황</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 기타 관리 > 만족도현황</span></td>
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
			<table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td><b>총 메뉴별 접수현황</b></td>
			</tr>
			</table>
			<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">
<form name=schform method=post action="satisfyList.jsp">
			<tr>
			<td class=descBorder_r>
			열린경영 > 경영공시 >
			<select name="depth3" onChange="document.schform.submit();">
			<option value="00">== 선택 ==</option>
			<%=MenuManager.getMCodeSelect3(mcode) %>
			</select>
			</td>
			</tr>
</form>
			</table>
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center width="80">매우만족</td>
			<td align=center width="80">만족</td>
			<td align=center width="80">보통</td>
			<td align=center width="80">불만족</td>
			<td align=center width="80">매우불만족</td>
			<td align=center>총합</td>
			</tr>
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=sfbT.getScore1() %></td>
			<td align=center><%=sfbT.getScore2() %></td>
			<td align=center><%=sfbT.getScore3() %></td>
			<td align=center><%=sfbT.getScore4() %></td>
			<td align=center><%=sfbT.getScore5() %></td>
			<td align=center><%=sfbT.getTotal() %></td>
			</tr>
			</table>
<!-- ROW 시작 -->
			<table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td></td>
			</tr>
			</table>
			<table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td><b>메뉴별 현황</b></td>
			</tr>
			</table>
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="bForm" method="post" action="faqList.jsp">
<input type=hidden name=page value="<%=nowpage%>">
<input type="hidden" name="no" value="">
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center width="80">메뉴코드</td>
			<td align=center>메뉴명</td>
			<td align=center width="80">매우만족</td>
			<td align=center width="80">만족</td>
			<td align=center width="80">보통</td>
			<td align=center width="80">불만족</td>
			<td align=center width="80">매우불만족</td>
			<td align=center width="80">총합</td>
			</tr>
<%  if(count==0) { %>
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan=8>등록된 자료가 없습니다.</td>
			</tr>
<%
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			SatisfyBean sfb = (SatisfyBean)iter.next();
%>
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=sfb.getMcode()==null || "null".equals(sfb.getMcode()) ?"":sfb.getMcode()%></td>
			<td align=center>열린경영<%= MenuManager.getMenuName(sfb.getMcode()==null ? "0000000000":sfb.getMcode()) %> <input type=button value=' 댓글보기 ' class='button' onClick="javascript:view('<%=sfb.getMcode() %>');"></td>
			<td align=center><%=sfb.getScore5() %></td>
			<td align=center><%=sfb.getScore4() %></td>
			<td align=center><%=sfb.getScore3() %></td>
			<td align=center><%=sfb.getScore2() %></td>
			<td align=center><%=sfb.getScore1() %></td>
			<td align=center><%=sfb.getTotal() %></td>
			</tr>
<%
			seq--;
		}
	}
%>
			</table>
		</td>
		</tr>
</form>
		</table>
		<br>
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=SatisfyMa.getSatisfyListCount()%>" />
	<table class="pagezig_table" align="center">
		<tr>
			<td><a href="<%=prevBlock.getAnchor("&depth3="+depth3)%>"><img src="../images/btn_list_first.gif" alt="처음페이지로" align="absmiddle"></a> <a href="<%=prevPage.getAnchor("&depth3="+depth3)%>"><img src="../images/btn_prev_1.gif" alt="이전페이지로" align="absmiddle"></a></td>
			<td class="pagezig">
			<% int ll = 1; %>
			<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
			<% if ( p.getPage() == pp.getNPage()) { %>
			<span><b><%=p.getPage()%></b></span> <% if (ll != pages.size()) {%> / <% } %>
			<% } else { %>
			<a href="<%=p.getAnchor("&depth3="+depth3)%>" class="num01"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> / <% } %>
			<% } %>
			<% ll++; %>
			</stl:loop>
			</td>
			<td><a href="<%=nextPage.getAnchor("&depth3="+depth3)%>"><img src="../images/btn_next_1.gif" alt="다음페이지로" align="absmiddle"></a> <a href="<%=nextBlock.getAnchor("&depth3="+depth3)%>"><img src="../images/btn_list_last.gif" alt="맨끝페이지로" align="absmiddle"></a></td>
		</tr>
	</table>

	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>