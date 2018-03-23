<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import = "kr.co.knoc.satisfy.*"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="SatisfyMa" scope="page" class="kr.co.knoc.satisfy.SatisfyManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String mcode = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mcode")));
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));

	if (mcode == null || mcode.equals("")) {
%>
<script type="text/javascript">
	alert("잘못된 호출입니다.");
	self.close();
</script>
<%
	}

	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList al = SatisfyMa.getSatisfyCmtList(mcode, pp.getNPage(), pp.getNPageSize());

	int count = SatisfyMa.getSatisfyCmtListCount(mcode);

	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	if(seq < 0) { seq = 1; }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="../share/css/admin.css" rel="stylesheet" type="text/css">
<title>만족도현황 댓글보기</title>
</head>
<body leftmargin=0 topmargin=0>
<br>
열린경영<%= MenuManager.getMenuName(mcode) %>
<br>
<table cellpadding=1 cellspacing=1 border=0 width=100% bgcolor=#EFEFEF>
<TR bgcolor=#A1A1A1>
<TD style="font-weight:bold;color:white;text-align:center">댓글</TD>
<TD width="100"  style="font-weight:bold;color:white;text-align:center">만족도</TD>
<TD width="100"  style="font-weight:bold;color:white;text-align:center">등록일</TD>
</TR>
<%  if(count==0) { %>
<TR bgcolor=white>
<td align=center colspan=2>등록된 자료가 없습니다.</td>
</tr>
<%
	} else {
		String score = "";
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			SatisfyBean sfb = (SatisfyBean)iter.next();
			if (sfb.getScore1() == 1) {
				score = "매우 불만족";
			} else if (sfb.getScore1() == 2) {
				score = "불만족";
			} else if (sfb.getScore1() == 3) {
				score = "보통";
			} else if (sfb.getScore1() == 4) {
				score = "만족";
			} else if (sfb.getScore1() == 5) {
				score = "매우 만족";
			} else {
				score = "";
			}

%>
<TR bgcolor=white>
<TD><%=sfb.getComment() %></TD>
<TD align="center"><%=score %></TD>
<TD align="center"><%=sfb.getRegDateString("yyyy-MM-dd") %></TD>
</TR>
<%
			seq--;
		}
	}
%>
</table>
<br>
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=SatisfyMa.getSatisfyCmtListCount(mcode)%>" />
<%
prevBlock.setAnchor("&mcode="+mcode);
%>
	<table class="pagezig_table" align="center">
		<tr>
			<td><a href="<%=prevBlock.getAnchor("&mcode="+mcode)%>"><img src="../images/btn_list_first.gif" alt="처음페이지로" align="absmiddle"></a> <a href="<%=prevPage.getAnchor("&mcode="+mcode)%>"><img src="../images/btn_prev_1.gif" alt="이전페이지로" align="absmiddle"></a></td>
			<td class="pagezig">
			<% int ll = 1; %>
			<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
			<% if ( p.getPage() == pp.getNPage()) { %>
			<span><b><%=p.getPage()%></b></span> <% if (ll != pages.size()) {%> / <% } %>
			<% } else { %>
			<a href="<%=p.getAnchor("&mcode="+mcode)%>" class="num01"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> / <% } %>
			<% } %>
			<% ll++; %>
			</stl:loop>
			</td>
			<td><a href="<%=nextPage.getAnchor("&mcode="+mcode)%>"><img src="../images/btn_next_1.gif" alt="다음페이지로" align="absmiddle"></a> <a href="<%=nextBlock.getAnchor("&mcode="+mcode)%>"><img src="../images/btn_list_last.gif" alt="맨끝페이지로" align="absmiddle"></a></td>
		</tr>
	</table>
		<br>

</body>
</html>