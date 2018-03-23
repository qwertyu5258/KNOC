<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*, com.neoboard.* , com.neoboard.session.*, com.neoboard.util.*" %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!--
	자료실01 목록 스킨 
--> 

<jsp:useBean id="bm" class="com.neoboard.NeoBoardManager" scope="page" />
<jsp:useBean id="etc" class="com.neoboard.util.EtcUtil" scope="page" />

<%	

	String sessionName = (String)pageContext.getAttribute("NB_SESNAME",PageContext.REQUEST_SCOPE);
	
	UserSession userSession = null;
	if(sessionName == null || sessionName.equals(""))	
		userSession = (UserSession)session.getAttribute("USERSESSION");
	else
		userSession = (UserSession)session.getAttribute(sessionName);
	PageAttribute pageBean = (PageAttribute)pageContext.getAttribute("NB_PAGE",PageContext.REQUEST_SCOPE);
	
	Search schBean = (Search)pageContext.getAttribute("NB_SEARCH",PageContext.REQUEST_SCOPE);
	
	Property propBean = (Property)pageContext.getAttribute("NB_PROPERTY",PageContext.REQUEST_SCOPE);
	
	Authority authBean = (Authority)pageContext.getAttribute("NB_AUTHORITY",PageContext.REQUEST_SCOPE);		
	
	// 공지글 리스트
	Articles articles_notice = bm.getArticlesNotice(userSession, pageBean, schBean, propBean, authBean);		
	pageBean.setPageSize(Integer.toString(Integer.parseInt(pageBean.getPageSize()) - articles_notice.size()));	
	// 공지글을 제외한 리스트
	Articles articles = bm.getArticles(userSession, pageBean, schBean, propBean, authBean);
	
	String skinRoot = Property.SKIN_URL_IMG + "/" + propBean.getSkinID();
		
	String user_id = "";
	String userLevel = "9";
	if (userSession!=null && !userSession.equals("")) {
		user_id = userSession.getUserID();
		userLevel = userSession.getUserLevel();
	}

	int pageTotal = articles.getTotalCount() / Integer.parseInt(pageBean.getPageSize());
	if(articles.getTotalCount() % Integer.parseInt(pageBean.getPageSize())>0)
		pageTotal+=1;

%>
<script type="text/javascript" src="/neoboard/js/comm.js"></script>
<script type="text/javascript">
	function group_change() {
		var f = document.searchform;
		f.submit();
	}

	function do_search(f)
	{
		//if(f.text.value == "") alert("검색어를 입력해 주세요.");
		//else 
			f.submit();
	}
	function changePsize() {
		document.searchform.submit();
	}
	function popup_passwd(bno) {
		window.open("","bform","width=302px,height=151px,scrollbars=no");
		document.bform.bno.value = bno
		document.bform.submit();
	}
</script>	

<form name="bform" method="post" action="/neoboard/popup_passwd.jsp" target="bform" onsubmit="do_search(this); return false;">
	<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />			
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="callback" value="<%=pageBean.getPageUrl()%>" />			
	<input type="hidden" name="mode" value="view" />
</form>	

<!-- list -->	
<table width="720" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
	<table width="720" border="0" cellspacing="0" cellpadding="5">
	<tr>
	<th scope="col" width="50" height="25" align="center" bgcolor="f1f1f1" class="board_titletop">No.</th>
	<th scope="col" height="25" align="center" bgcolor="f1f1f1" class="board_titletop">Title</td>
	<th scope="col" width="90" height="25" align="center" bgcolor="f1f1f1" class="board_titletop">Write</th>
	<th scope="col" width="90" height="25" align="center" bgcolor="f1f1f1" class="board_titletop">Date</th>
	<th scope="col" width="65" height="25" align="center" bgcolor="f1f1f1" class="board_titletop">File</th>
	<th scope="col" width="50" height="25" align="center" bgcolor="f1f1f1" class="board_titletop">Hit</th>
	</tr>

<% if ( articles.size() == 0 && articles_notice.size() == 0) { %>
	<tr>
	<td colspan="6" align="center">No Data.</td>
	</tr>
<% } else { %>	
<%
	String bgcolor = "";	
	for(int i = 0 ; i < articles_notice.size(); i++ ) {
		bgcolor="";
		Article articleN = articles_notice.getArticle(i);
		int no2 = articleN.getNo();
		if (articleN.getRefLevel() > 0) {
			no2 = articleN.getRef();
		}
		if (i % 2 == 0) {
			bgcolor="#f5f5f5";
		}			
		boolean checkidN = bm.checkID(propBean.getBoardID(), Integer.toString(no2));
%>	
	<tr>
	<td width="50" align="center" class="board_listbott">
	<% if ( articleN.getNotice().equals("1") ) { %>
	<img src="<%=skinRoot %>/images/btn_no.gif" alt="공지" class="ic" style="vertical-align:middle;" />
	<% } else { %>
	<%=articleN.getSeq()%>
	<% } %>
	</td>
	<td align="left" class="board_listbott">
	<!-- 삭제 여부 표시 -->
			<% if (articleN.getIsDelete().equals("Y")) { %>
				<img src="<%=skinRoot %>/images/btn_reple_del.gif" alt="삭제" style="vertical-align:middle;" />
			<% } else { %>
				<!-- 비공개 여부 표시 -->
				<%if(articleN.getSecret().equals("1")){%>
				<img src="<%=skinRoot %>/images/ico_secret.gif" alt="" style="vertical-align:middle;" />
				<% } %>
			<% } %>
			<!-- 답글 공백 깊이 -->
			<%=articleN.makeReply("<img src='"+skinRoot+"/images/icon_reply.gif' alt='답변' class='re' style='vertical-align:middle;' />","&nbsp;&nbsp;")%>
			<!-- 링크  시작 -->
			<% if (articleN.getSecret().equals("1") && !bm.checkManager(authBean, propBean, userSession)) { %>
				<% if (checkidN) { %>
					<% if (userSession == null) { %>
					<a href="javascript:alert('로그인 후 이용 가능하십니다.');">
					<% } else { %>					
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(articleN.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">					
					<% } %>
				<% } else { %>
					<a href="javascript:popup_passwd('<%=articleN.getNo()%>');">
				<% } %>
			<% } else { %>
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(articleN.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">								
			<% } %>
			<!-- 제목 출력 -->
					<%=articleN.getSubject(30)%></a>
			<!-- 링크 끝  -->	
			
			<!-- New 아이콘 -->		
			<% if ( propBean.getUseNew().equals("1")) { %><span ><%=articleN.makeNew("<img alt='new' src='"+skinRoot+"/images/btn_new.gif' style='vertical-align:middle;' />",propBean.getNewLimit()*24)%></span><% } %>
			<!-- Cool 아이콘 -->
			<% if ( propBean.getUseCool().equals("1") && (articleN.getHitcnt() >= propBean.getCoolLimit())) { %><span ><img alt='new' src='<%=skinRoot %>/images/btn_cool.gif' style='vertical-align:middle;' /></span><% } %>
			<!-- 댓글 개수 -->
			<% if (propBean.getUseComment().equals("1")) { %><span><%=articleN.makeCmtCnt("(",")")%></span><% } %>
	</td>
	<td width="90" align="center" class="board_listbott"><%=articleN.getName()%></td>
	<td width="90" align="center" class="board_listbott"><%=articleN.getRegDateString("yyyy-MM-dd")%></td>
	<td width="65" align="center" class="board_listbott">
			<% if(articleN.getFiles() != null && articleN.getFiles().size() > 0) { %>			
			<%  AttachFiles afsN = articleN.getFiles();
					 for(int k = 0 ; k < afsN.size(); k++) {
						 AttachFile afN = afsN.getAttachFile(k);  %>
					 <a target="_parent" href="<%=Property.SERVLET_ROOT%>/Download?num=<%=articleN.getNo()%>&amp;fno=<%=afN.getNo()%>&amp;bid=<%=propBean.getBoardID()%>&amp;callback=<%=pageBean.getPageUrl()%>&amp;ses=<%=sessionName%>"><img src="<%=afN.makeMimeIcon(skinRoot + "/images")%>" border="0" width="16" height="16" alt="<%=afN.getFileName()%> : <%=afN.getFileSize("HB")%>" /></a>
				<% } %>  
			<% } else { %>
						&nbsp;
			<% } %>	
	</td>
	<td width="50" align="center" class="board_listbott"><%=articleN.getHitcnt()%></td>
	</tr>	
<% 
	}
		
	for(int i = 0 ; i < articles.size(); i++ ) {
		bgcolor="";
		Article article = articles.getArticle(i);
		int no = article.getNo();
		if (article.getRefLevel() > 0) {
			no = article.getRef();
		}
		if (i % 2 == 0) {
			bgcolor="#f5f5f5";
		}			
		boolean checkid = bm.checkID(propBean.getBoardID(), Integer.toString(no));
%>	
	<tr>
	<td width="50" align="center" class="board_listbott">
	<% if ( article.getNotice().equals("1") ) { %>
			<img src="<%=skinRoot %>/images/btn_no.gif" alt="공지" class="ic" style="vertical-align:middle;" />
			<% } else { %>
			<%=article.getSeq()%>
			<% } %>
	</td>
	<td align="left" class="board_listbott">
	<!-- 삭제 여부 표시 -->
			<% if (article.getIsDelete().equals("Y")) { %>
				<img src="<%=skinRoot %>/images/btn_reple_del.gif" alt="삭제" style="vertical-align:middle;" />
			<% } else { %>
				<!-- 비공개 여부 표시 -->			
				<%if(article.getSecret().equals("1")){%>
				<img src="<%=skinRoot %>/images/ico_secret.gif" alt="" style="vertical-align:middle;" />
				<% } %>
			<% } %>
			<!-- 답글 공백 깊이 -->
			<%=article.makeReply("<img src='"+skinRoot+"/images/btn_re.gif' alt='답변' class='re' style='vertical-align:middle;' />","&nbsp;&nbsp;")%>
			<!-- 링크  시작 -->
			<% if (article.getSecret().equals("1") && !bm.checkManager(authBean, propBean, userSession)) { %>
				<% if (checkid) { %>
					<% if (userSession == null) { %>
					<a href="javascript:alert('로그인 후 이용 가능하십니다.');">
					<% } else { %>					
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">					
					<% } %>
				<% } else { %>
					<a href="javascript:popup_passwd('<%=article.getNo()%>');">
				<% } %>
			<% } else { %>
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">								
			<% } %>
			<!-- 제목 출력 -->
					<%=article.getSubject(30)%></a>
			<!-- 링크 끝  -->	
						
			<!-- New 아이콘 -->	
			<% if ( propBean.getUseNew().equals("1")) { %><span ><%=article.makeNew("<img alt='new' src='"+skinRoot+"/images/btn_new.gif' style='vertical-align:middle;' />",propBean.getNewLimit()*24)%></span><% } %>
			<!-- Cool 아이콘 -->			
			<% if ( propBean.getUseCool().equals("1") && (article.getHitcnt() >= propBean.getCoolLimit())) { %><span ><img alt='new' src='<%=skinRoot %>/images/btn_cool.gif' style='vertical-align:middle;' /></span><% } %>
			<!-- 댓글 개수 -->			
			<% if (propBean.getUseComment().equals("1")) { %><span><%=article.makeCmtCnt("(",")")%></span><% } %>
	</td>
	<td width="90" align="center" class="board_listbott">&nbsp;<%=article.getName()%>&nbsp;</td>
	<td width="90" align="center" class="board_listbott"><%=article.getRegDateString("yyyy-MM-dd")%></td>
	<td width="65" align="center" class="board_listbott">
	<% if(article.getFiles() != null && article.getFiles().size() > 0) { %>			
			<%  AttachFiles afs = article.getFiles();
					 for(int k = 0 ; k < afs.size(); k++) {
						 AttachFile af = afs.getAttachFile(k);  %>
					 <a target="_parent" href="<%=Property.SERVLET_ROOT%>/Download?num=<%=article.getNo()%>&amp;fno=<%=af.getNo()%>&amp;bid=<%=propBean.getBoardID()%>&amp;callback=<%=pageBean.getPageUrl()%>&amp;ses=<%=sessionName%>"><img src="<%=af.makeMimeIcon(skinRoot + "/images")%>" border="0" width="16" height="16" alt="<%=af.getFileName()%> : <%=af.getFileSize("HB")%>" /></a>
				<% } %>  
			<% } else { %>
						&nbsp;
			<% } %>	
	</td>
	<td width="50" align="center" class="board_listbott"><%=article.getHitcnt()%></td>
	</tr>	
<% 
	}
} 
%>
	</table>
</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td align="center">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td align="center">&nbsp;</td>
	<td width="230" align="center">
		<!-- paging -->	
		<neo:neoPager pageName="NB_PAGE" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="<%=propBean.getPagePerBlock()%>" totalCount="<%=articles.getTotalCount()%>" />
			<!--// paging: start //-->
				<% if((int)((pageBean.getNPage()-1)/pages.size())+1 <=1) { %>
				<a href="#" onclick="<%=prevBlock.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/preview.gif" alt="처음페이지로" style="vertical-align:middle;" /></a>
				<% } else { %>
				<a href="<%=prevBlock.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/preview.gif" alt="처음페이지로" style="vertical-align:middle;" /></a>
				<% } %>				
				<% if(pageBean.getNPage()<=1) { %>
				<a href="#" onclick="<%=prevPage.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/ppreview.gif" alt="전페이지" style="vertical-align:middle;" /></a>
				<% } else { %>							
				<a href="<%=prevPage.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/ppreview.gif" alt="전페이지" style="vertical-align:middle;" /></a>
				<% } %>
				<% int ll = 1; %>
				<neo:loop name="pages" loopId="p" className="com.neoboard.data.NeoAnchor">
				<% if ( p.getPage() == pageBean.getNPage()) { %>
				<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %>
				<% } else { %>
				<a href="<%=p.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <% } %> 
				<% } %>
				<% ll++; %>
				</neo:loop>			
				<% if(pageBean.getNPage() >= (int)((articles.getTotalCount()-1)/pageBean.getNPageSize())+1) { %>
				<a href="#" onclick="<%=nextPage.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/nnext.gif" alt="다음페이지" style="vertical-align:middle;" /></a>	
				<% } else { %>
				<a href="<%=nextPage.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/nnext.gif" alt="다음페이지" style="vertical-align:middle;" /></a>
				<% } %>				
				<% if((int)((pageBean.getNPage()-1)/10) +1 >= (int)((int)((articles.getTotalCount()-1)/pageBean.getNPageSize())/10)+1) { %>
				<a href="#" onclick="<%=nextBlock.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/next.gif" alt="맨끝페이지로" style="vertical-align:middle;" /></a>
				<% } else { %>
				<a href="<%=nextBlock.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/next.gif" alt="맨끝페이지로" style="vertical-align:middle;" /></a>
				<% } %>
			<!--// paging: end //-->
	</td>
		<!-- paging //-->
	<td align="center">&nbsp;</td> 
		<!-- 버튼 -->
	<td width="40" align="center">
	<!--
			<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("write",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>"><img src="<%=skinRoot %>/images/btn_write.gif" alt="write" border="0" /></a>	
	-->
			<% if ( propBean.getUseRss().equals("1")) { %>				
			<img src="/images/board/btn_rss.gif" alt="RSS" onclick="javascript:boardrss('rss');" style="cursor:pointer" border="0" />	
			<input type="hidden" name="rss" value="http://<%=request.getServerName() %>/neoboard/rss.jsp?bid=<%=propBean.getBoardID()%>&amp;url=<%=pageBean.getPageUrl()%>" />
			<% } %>
	</td>
		<!-- 버튼 //-->
	</tr>
	</table>
</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>	
<!-- search -->
<tr>
<td align="center">
	<table width="260" border="0" cellspacing="0" cellpadding="2">
<form name="searchform" method="post" action="<%=pageBean.getPageUrl()%>" onsubmit="do_search(this); return false;">
<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />
<input type="hidden" name="ses" value="<%=sessionName%>" />
<input type="hidden" name="mode" value="list" />		
	<tr>
	<td width="70" align="center">
<% if ( propBean.getUseGroup().equals("1")) { %>	
	<select name="grp" class="select"  title="그룹검색">
	<option value="" selected="selected">select</option>
	<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), schBean.getGroup()) %>
	</select>			
<% } %>				
	<select name="field" class="select" id="field"  title="검색 조건 선택">
	<option value="subject">Title</option>
	<option value="name">Write</option>
	<option value="content">Content</option>
	</select></td>
	<td align="center"><input name="text" type="text" class="textfield" id="textfield" /></td>
	<td width="50" align="center"><img src="../images/btn/btn_search.gif" width="40" height="21" onclick="do_search(document.searchform);" style="cursor:pointer" /></td>
	</tr>
</form>	
	</table>
</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
</table>
<!-- search //-->	