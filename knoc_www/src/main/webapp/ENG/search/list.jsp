<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.search.*"%>
<%@ page import = "com.neoboard.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="SearchMa" scope="page" class="kr.co.knoc.search.EngSearchManager" />
<jsp:useBean id="PropertyMa" scope="page" class="com.neoboard.PropertyManager" />
<% request.setCharacterEncoding("euc-kr"); %>    
<% 

/*
 * 2016. 1 .20 영문 통합검색 생성
 */
 
/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Page Navigator section
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
application.setAttribute("gNavMenuDepth1","07");
application.setAttribute("gNavMenuDepth2","01");
application.setAttribute("gNavMenuDepth3","00");
application.setAttribute("gNavMenuDepth4","00");
/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>    
<%
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("search")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList al = SearchMa.getSearchList(key_word, pp.getNPage(), pp.getNPageSize());		
		
	int count = SearchMa.getSearchListCount(key_word);
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */
	if(seq < 0){seq=1;}
%>
<%@ include file="../include/topmenu.jsp" %>


<!-- contents -->
<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">

  <tr>
    <td align="center" valign="top"><table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="180" align="right" valign="top"><!-- leftmenu --><%@ include file="../include/leftmenu7.jsp" %></td>
        <td width="40">&nbsp;</td>
        <td valign="top">
        <table width="760" border="0" cellspacing="0" cellpadding="0">
         <tr>
            <td height="30">&nbsp;</td>
          </tr>
          <tr>
            <td><!-- contimg --><%@ include file="../include/contimg01.jsp" %></td>
          </tr>
          <tr>
			<td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt; Site Search &gt;<span class="loca_text"> Site Search </span></td>
          </tr>
           <tr>
            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub01/ttl_search.gif" alt="Search" /></td>
          </tr>
          <tr>
          	<td height="40">&nbsp;</td>
          </tr>
          <tr>
              	<td>
<table width="760" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
<td>
	<p align="center" class="pb20">Found a document of the website in <%=count %> on <span class="cDD0902_b">‘<%=key_word %>'</span></p>
	<table width="760" border="0" cellspacing="0" cellpadding="4">
	<tbody><tr>
	<th width="65" height="31" align="center" class="board_titletop" bgcolor="#f1f1f1" scope="col">No.</th>
	<th height="31" align="center" class="board_titletop" bgcolor="#f1f1f1" scope="col">Title</th>
	<th width="160" height="31" align="center" class="board_titletop" bgcolor="#f1f1f1" scope="col">Board</th>
	<th width="85" height="31" align="center" class="board_titletop" bgcolor="#f1f1f1" scope="col">Date</th>
	</tr>
<%  if(count==0) { %>	
						<tr>
						<td align="center" colspan="4">No Data.</td>
						</tr>
<% 
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			SearchBean sb = (SearchBean)iter.next();
%>									
						<tr>
							<td class="board_listbott" width="65" height="31" align="center"><%=seq %></td>
							<td class="board_listbott" height="31" align="left"><a href="/ENG<%=PropertyMa.getBoardPageUrl(sb.getBoardid()) %>?num=<%=sb.getBno() %>&amp;mode=view&amp;grp=<%=sb.getGrp() %>"><%=sb.getSubject() %></a></td>
							<td class="board_listbott" width="160" height="31" align="center"><%=PropertyMa.getBoardName(sb.getBoardid()) %></td>
							<td class="board_listbott" width="85" height="31" align="center"><%=sb.getRegDateString("yyyy-MM-dd") %></td>
						</tr>
<%				
			seq--;
		}
	}
%>		

	</tbody></table>
</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td align="center">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr>
	<td align="center">&nbsp;</td>
	<td width="230" align="center">
		<!-- paging -->	
		
			<!--// paging: start //-->
			<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=count%>" />			
				<a href="<%=prevBlock.getAnchor("&search="+key_word)%>"><img src="/images/board/preview.gif" alt="처음" /></a>
				<a href="<%=prevPage.getAnchor("&search="+key_word)%>"><img src="/images/board/ppreview.gif" alt="이전" /></a>
				<% int ll = 1; %>
				<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
				<% if ( p.getPage() == pp.getNPage()) { %>
				<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %>
				<% } else { %>
				<a href="<%=p.getAnchor("&search="+key_word)%>"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <% } %> 
				<% } %>
				<% ll++; %>
				</stl:loop>								
				<a href="<%=nextPage.getAnchor("&search="+key_word)%>"><img src="/images/board/nnext.gif" alt="다음" /></a>
				<a href="<%=nextBlock.getAnchor("&search="+key_word)%>"><img src="/images/board/next.gif" alt="끝" /></a>
                   
			<!--// paging: end //-->
	</td>
	<td align="center">&nbsp;</td> 
	</tr>
	</tbody></table>
</td>
</tr>
</tbody></table>

              	</td>
              </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<!-- contents end-->

<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->


</body>
</html>


