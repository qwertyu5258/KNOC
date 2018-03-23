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
<div id="boardsec">
	<table cellspacing="0" cellpadding="0" class="listtype" summary="해당게시판은 <%=propBean.getBoardName() %>의 목록을 보여줍니다">
	<caption><%=propBean.getBoardName() %> 목록</caption>
	<colgroup><col width="55px" /><col width="375px" /><col width="110px" /><col width="85px" /><col width="45px" /><col width="50px" /></colgroup>
		<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">성명</th>
			<th scope="col">등록일</th>
			<th scope="col">첨부</th>
			<th scope="col">조회</th>
		</tr>
		</thead>
		<tbody>

<% if ( articles.size() == 0 && articles_notice.size() == 0) { %>
		<tr>
		<td colspan="6">검색 내용이 없습니다.</td>
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
			<td>
			<% if ( articleN.getNotice().equals("1") ) { %>
			<img src="<%=skinRoot %>/images/btn_no.gif" alt="공지" class="ic" style="vertical-align:middle;" />
			<% } else { %>
			<%=articleN.getSeq()%>
			<% } %>
			</td>
			<td class="subj">
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
			<td><%=articleN.getName()%></td>
			<td><span title="<%=articleN.getRegDateString("yyyy년 MM월 dd일 HH시 mm분 ss초")%>"><%=articleN.getRegDateString("yyyy-MM-dd")%></span></td>
			<td>
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
			<td><%=articleN.getHitcnt()%></td>
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
			<td>
			<% if ( article.getNotice().equals("1") ) { %>
			<img src="<%=skinRoot %>/images/btn_no.gif" alt="공지" class="ic" style="vertical-align:middle;" />
			<% } else { %>
			<%=article.getSeq()%>
			<% } %>
			</td>
			<td class="subj">
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
			<td><%=article.getName()%></td>
			<td><span title="<%=article.getRegDateString("yyyy년 MM월 dd일 HH시 mm분 ss초")%>"><%=article.getRegDateString("yyyy-MM-dd")%></span></td>
			<td>
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
			<td><%=article.getHitcnt()%></td>
		</tr>	
<% 
	}
} 
%>
	</tbody>
	</table>	
<!-- list //-->

	<div class="boardbtm">
		<!-- paging -->
		<div class="leftdv">		
			<neo:neoPager pageName="NB_PAGE" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="<%=propBean.getPagePerBlock()%>" totalCount="<%=articles.getTotalCount()%>" />
			<!--// paging: start //-->
			<div class="paging">
				<% if((int)((pageBean.getNPage()-1)/pages.size())+1 <=1) { %>
				<a href="#boardsec" onclick="<%=prevBlock.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/preview.gif" alt="처음페이지로" style="vertical-align:middle;" /></a>
				<% } else { %>
				<a href="<%=prevBlock.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/preview.gif" alt="처음페이지로" style="vertical-align:middle;" /></a>
				<% } %>				
				<% if(pageBean.getNPage()<=1) { %>
				<a href="#boardsec" onclick="<%=prevPage.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/ppreview.gif" alt="전페이지" style="vertical-align:middle;" /></a>
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
				<a href="#boardsec" onclick="<%=nextPage.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/nnext.gif" alt="다음페이지" style="vertical-align:middle;" /></a>	
				<% } else { %>
				<a href="<%=nextPage.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/nnext.gif" alt="다음페이지" style="vertical-align:middle;" /></a>
				<% } %>				
				<% if((int)((pageBean.getNPage()-1)/10) +1 >= (int)((int)((articles.getTotalCount()-1)/pageBean.getNPageSize())/10)+1) { %>
				<a href="#boardsec" onclick="<%=nextBlock.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/next.gif" alt="맨끝페이지로" style="vertical-align:middle;" /></a>
				<% } else { %>
				<a href="<%=nextBlock.getAnchor(schBean.makeQueryString("","mode=list&amp;bid="+propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/next.gif" alt="맨끝페이지로" style="vertical-align:middle;" /></a>
				<% } %>
			</div>
			<!--// paging: end //-->
		</div>
		<!-- paging //--> 
		<!-- 버튼 -->
		<div class="rightdv">		
			<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("write",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>"><img src="<%=skinRoot %>/images/btn_write.gif" alt="글쓰기" /></a>	
			<% if ( propBean.getUseRss().equals("1")) { %>				
			<a href="#boardsec" onclick="javascript:boardrss('rss'); return false"><img src="/images/board/btn_rss.gif" alt="RSS" />	</a>
			<input type="hidden" name="rss" value="http://<%=request.getServerName() %>/neoboard/rss.jsp?bid=<%=propBean.getBoardID()%>&amp;url=<%=pageBean.getPageUrl()%>" />
			<% } %>
		</div>
		<!-- 버튼 //-->
	</div>
	
<!-- search -->
<form name="searchform" method="post" action="<%=pageBean.getPageUrl()%>" onsubmit="do_search(this); return false;">
<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />
<input type="hidden" name="ses" value="<%=sessionName%>" />
<input type="hidden" name="mode" value="list" />		
	<!--// searchbox: end //-->
	<div id="schsec">
		<fieldset class="schset">
			<legend>Search Box</legend>
<% if ( propBean.getUseGroup().equals("1")) { %>	
			<select name="grp" class="formNo"  title="그룹검색">
			<option value="" selected="selected">선택</option>
			<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), schBean.getGroup()) %>
			</select>			
<% } %>			
			<label for="field" class="nlabel">검색조건 선택</label>
			<select id="field" name="field">
				<option value="subject">제목</option>
				<option value="name">성명</option>
				<option value="content">내용</option>
			</select>
			
			<label for="schinput" class="nlabel">목록검색</label>
			<input type="text" value="" id="schinput" name="text" class="input" />							
			
			<div class="btndv"><input type="image" src="<%=skinRoot %>/images/btn_search.gif" alt="검색" onclick="do_search(document.searchform);" style="width:33px; height:19px;" /></div>
	  </fieldset>
	</div>
	<!--// searchbox: end //-->
</form>
<!-- search //-->	
</div>	