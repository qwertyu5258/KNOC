<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.neoboard.data.*, com.neoboard.* , com.neoboard.session.* " %>
<%@ page import="com.neoboard.util.*"%>
<%@ page import="com.neoboard.log.*"%>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="prop" class="com.neoboard.PropertyManager" scope="page" />
<jsp:useBean id="bm" class="com.neoboard.NeoBoardManager" scope="page" />
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<jsp:useBean id="pp" class="com.neoboard.data.PageAttribute" scope="request"/>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	EtcUtil etc = new EtcUtil();
	int num = request.getParameter("num")==null?0:Integer.parseInt(request.getParameter("num"));
	String boardID = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("bid")));
	String pg = EtcUtil.strBlockSpecialTags(request.getParameter("page"));	
	
	pp.setPage(pg);
	pp.setPageSize("10");
	pp.setPageUrl("");
	
	Property propBean = new Property();
	propBean = prop.getProperty(boardID);
	
	int total = bm.getLogCount(num, boardID);        // 전체 게시물 수
	int totalpage = (int)((total-1)/Integer.parseInt(pp.getPageSize())) + 1;     	// 전체 페이지 수
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */
	 if(totalpage<0){totalpage=1;}
	
	Vector vDataList = bm.getLogList(num,boardID, pp.getNPage(), pp.getNPageSize());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
<title>로그정보</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link href="css/pop.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>


</head>
<body>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td background="images/popup_bg.gif"><img src="images/pop_tl_log.gif" alt="로그정보" tabIndex="0"></td>
		<td background="images/popup_bg.gif" align="right"></td>
	</tr>
</table>
<div style="padding:10px 10px 0 10px;">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td style="font-size:13px;color:#005ddc;"><b>게시판명 : <%=propBean.getBoardName()%>(<%=propBean.getBoardID()%>)</b></td>
			<td tabindex="0" class="page_total" width="200" align="right">Total : <span><%=total%></span>개 [ <%=pp.getPage()%>/<%=totalpage%>pages ]</td>
		</tr>
	</table>	
	<table cellpadding="0" cellspacing="0" border="0" class="common_list_table" width="675">
<form name=bform method="post" action="">			
<input type=hidden name=no value="">
<input type=hidden name=seq value="">
<input type=hidden name=num value="<%=num%>">
<input type=hidden name=bid value="<%=boardID%>">
<input type=hidden name=page value="<%=pp.getPage()%>">			
		<tr>
			<th width="50" tabindex="0" height="26">번호</th>
			<th tabindex="0">로그번호</th>
			<th tabindex="0">쿼리</th>
			<th tabindex="0">작업자ID</th>
			<th tabindex="0">작업자명</th>
			<th tabindex="0">작업일</th>
			<th width="100" tabindex="0">접속IP</th>
		</tr>
<!-- ROW 시작 -->
<%  if(vDataList.isEmpty()) { %>
		<tr onmouseover="this.className='bg_over';" onMouseOut="this.className='bg_out'">
			<td tabindex="0" colspan=7 align=center>등록된 자료가 없습니다.</td>
		</tr>
<% 
	} else {
		int bun = 0;
		if (total == 0) {
			bun = total;
		} else {
			bun = total - (Integer.parseInt(pp.getPage())-1)*Integer.parseInt(pp.getPageSize());
			/**
			 * 2016.3.21 JSM
			 * 보안약점 조치
			 */
			if(bun<0){bun=0;}
		}	
		for(int i = 0 ; i < vDataList.size(); i++ ) {
			Article article = (Article)vDataList.elementAt(i);
%>						                             
		<tr onmouseover="this.className='bg_over';" onMouseOut="this.className='bg_out'">
			<td tabindex="0"><%=bun%></td>
			<td tabindex="0"><%=article.getLogNo()%></td>
			<td tabindex="0"><% if (article.getLogQuery() != null && !article.getLogQuery().equals("")) { %><% if (article.getLogQuery().equals("C")) { %>등록(c)<% } else if (article.getLogQuery().equals("U")) { %>수정(u)<% } else if (article.getLogQuery().equals("D")) { %>삭제<% } %><% } %></td>
			<td tabindex="0"><%=article.getId()%></td>
			<td tabindex="0"><%=article.getName()%></td>
			<td tabindex="0"><%=article.getRegDateString("yyyy/MM/dd")%></td>
			<td tabindex="0"><%=article.getIp()%></td>
		</tr>                        
<%
			bun--;
		}
	}
%>
</form>				
	</table>
</div>

<neo:neoPager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=bm.getLogCount(num, boardID)%>" />
	<table class="pagezig_table" align="center">
		<tr>
			<td><a href="<%=prevBlock.getAnchor("&bid="+boardID)%>"><img src="images/btn_first.gif" alt="처음페이지로"></a><a href="<%=prevPage.getAnchor("&bid="+boardID)%>"><img src="images/btn_prev.gif" alt="이전페이지로"></a></td>
			<td class="pagezig">
			<% int ll = 1; %>
			<neo:loop name="pages" loopId="p" className="com.neoboard.data.NeoAnchor">
			<% if ( p.getPage() == pp.getNPage()) { %>
			<span><b><%=p.getPage()%></b></span> <% if (ll != pages.size()) {%> / <% } %>
			<% } else { %>
			<a href="<%=p.getAnchor("&bid="+boardID)%>" class="num01"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> / <% } %> 
			<% } %>
			<% ll++; %>
			</neo:loop>
			</td>
			<td><a href="<%=nextPage.getAnchor("&bid="+boardID)%>"><img src="images/btn_next.gif" alt="다음페이지로"></a><a href="<%=nextBlock.getAnchor("&bid="+boardID)%>"><img src="images/btn_last.gif" alt="맨끝페이지로"></a></td>
		</tr>
	</table>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td align="center" style="padding-top:15px;">
			<a href='javascript:window.close();'><img src="images/pop_close.gif" alt="창닫기" tabindex="0" /></a>
		</td>
	</tr>
</table>
</body>
</html>