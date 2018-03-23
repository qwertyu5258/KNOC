<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*, com.neoboard.* , com.neoboard.session.*, com.neoboard.util.*" %>
<%@ page import="kr.co.knoc.division.DivisionListManager"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
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
	
	// 공지글을 제외한 리스트
	Articles articles = bm.getSangdamArticles(userSession, pageBean, schBean, propBean, authBean);
	
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
<script language="javascript" src="/neoboard/js/comm.js"></script>
<script language=javascript>
	function group_change() {
		//location.href="?mode=list&bid=<%=propBean.getBoardID()%>&ses=<%=sessionName%>";
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
	<colgroup>
		<col width="50px" />
<% if(!"SANGDAM".equals(propBean.getBoardID()) && !"CLEAR2".equals(propBean.getBoardID()) ){ %>
		<col width="75px" />
<%} %>
		<col width="180px" />
		<col width="75px" />
		<col width="70px" />
		<col width="60px" />
		<col width="50px" />
		<col width="70px" />
		<col width="80px" />
	
	</colgroup>
		<tr>
			<th>번호</th>
<% if(!"SANGDAM".equals(propBean.getBoardID()) && !"CLEAR2".equals(propBean.getBoardID()) ){ %>
			<th>구분 </th>
<%} %>

			<th>제목</th>
			<th>공개유무</th>
			<th>성명</th>
            <th>날짜</th>
            <th>조회수</th>
			<th>처리상황</th>
			<th>담당부서</th>
		</tr>
<% if ( articles.size() == 0) { %>
		<tr>
		<td colspan="9">검색 내용이 없습니다.</td>
		</tr>
<% } else { %>		
<%
	String bgcolor = "";
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
			<img src="<%=skinRoot %>/images/btn_no.gif" alt="공지" class="ic" align="absmiddle" />
			<% } else { %>
			<%=article.getSeq()%>
			<% } %>
			</td>
<% if(!"SANGDAM".equals(propBean.getBoardID()) && !"CLEAR2".equals(propBean.getBoardID()) ){ %>
			<td><%=article.getContGubun() %></td>
<%} %>
			
			<td class="subj">
			<% if (article.getIsDelete().equals("Y")) { %>
				<img src="<%=skinRoot %>/images/btn_reple_del.gif" alt="삭제" tabindex="0" align="absmiddle" />
			<% } else { %>
				<!-- 비공개 여부 표시 -->			
				<%if(article.getSecret().equals("1")){%>
				<img src="<%=skinRoot %>/images/ico_secret.gif" alt="" tabindex="0" align="absmiddle" />
				<% } %>
			<% } %>
			<!-- 답글 공백 깊이 -->
			<%=article.makeReply("<img src='"+skinRoot+"/images/btn_re.gif' alt='답변' class='re'/>","&nbsp;&nbsp;")%>
			<!-- 링크  시작 -->
			<% if (article.getSecret().equals("1") && !bm.checkManager(authBean, propBean, userSession)) { %>
				<% if (checkid) { %>
					<% if (userSession == null) { %>
					<a href="javascript:alert('로그인 후 이용 가능하십니다.');">
					<% } else { %>					
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false)%>" class="board" tabindex="0">					
					<% } %>
				<% } else { %>
					<a href="javascript:popup_passwd('<%=article.getNo()%>');">
				<% } %>
			<% } else { %>
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false)%>" class="board" tabindex="0">								
			<% } %>
			<!-- 제목 출력 -->
					<%=article.getSubject(30)%></a>
			<!-- 링크 끝  -->	
			
			<!-- New 아이콘 -->		
			<% if ( propBean.getUseNew().equals("1")) { %><span ><%=article.makeNew("<img alt='new' tabindex='0' src='"+skinRoot+"/images/btn_new.gif'>",propBean.getNewLimit()*24)%></span><% } %>
			<!-- Cool 아이콘 -->
			<% if ( propBean.getUseCool().equals("1") && (article.getHitcnt() >= propBean.getCoolLimit())) { %><span ><img alt='new' tabindex='0' src='<%=skinRoot %>/images/btn_cool.gif'></span><% } %>
			<!-- 댓글 개수 -->
			<% if (propBean.getUseComment().equals("1")) { %><span><%=article.makeCmtCnt("(",")")%></span><% } %>
			</td>
			<td>
			<%if(article.getSecret().equals("1")){%>
			비공개
			<% } else { %>
			공개
			<% } %>
			</td>
			<td><%=article.getName()%></td>
			<td><span title="<%=article.getRegDateString("yyyy년 MM월 dd일 HH시 mm분 ss초")%>"><%=article.getRegDateString("yyyy-MM-dd")%></span></td>
            <td><%=article.getHitcnt() %></td>
            <td><%=etc.checkNull(article.getStatus()) %></td>            
            <td><%=DivisionListManager.getDName(article.getBuse()) %></td>
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
				<a href="<%=prevBlock.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/preview.gif" alt="처음페이지로" align="absmiddle"/></a>		
				<a href="<%=prevPage.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/ppreview.gif" alt="전페이지" align="absmiddle"/></a>
				<% int ll = 1; %>
				<neo:loop name="pages" loopId="p" className="com.neoboard.data.NeoAnchor">
				<% if ( p.getPage() == pageBean.getNPage()) { %>
				<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %>
				<% } else { %>
				<a href="<%=p.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <% } %> 
				<% } %>
				<% ll++; %>
				</neo:loop>				
				<a href="<%=nextPage.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/nnext.gif" alt="다음페이지" align="absmiddle"/></a>					
				<a href="<%=nextBlock.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/next.gif" alt="맨끝페이지로" align="absmiddle"/></a>
			</div>
			<!--// paging: end //-->
		</div>
		<!-- paging //--> 
		<!-- 버튼 -->
		<div class="rightdv">
			<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("write",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false)%>"><img src="<%=skinRoot %>/images/btn_write.gif" alt="글쓰기" /></a>
			<% if ( propBean.getUseRss().equals("1")) { %>	
			<img src="/images/board/btn_rss.gif" alt="RSS" onclick="javascript:boardrss('rss');" style="cursor:hand" />	
			<input type="hidden" name="rss" value="http://<%=request.getServerName() %>/neoboard/rss.jsp?bid=<%=propBean.getBoardID()%>&url=<%=pageBean.getPageUrl()%>" />
			<% } %>
		</div>
		<!-- 버튼 //-->
	</div>
	
<!-- search -->
<form name=searchform method=post action="<%=pageBean.getPageUrl()%>" onsubmit="do_search(this); return false;">
<input type=hidden name=bid value="<%=propBean.getBoardID()%>">
<input type=hidden name=ses value="<%=sessionName%>">
<input type=hidden name=mode value="list">		
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
			<label for="schsel" class="nlabel">목록검색선택</label>
			<select id="field" name="field">
				<option value="subject">제목</option>
				<option value="name">성명</option>
				<option value="content">내용</option>
			</select>
			
			<label for="schinput" class="nlabel">목록검색</label>
			<input type="text" value="" id="schinput" name="text" class="input" />							
			
			<div class="btndv"><img src="<%=skinRoot %>/images/btn_search.gif" alt="검색" onclick="do_search(document.searchform);" style="cursor:hand" /></div>
	  </fieldset>
	</div>
	<!--// searchbox: end //-->
</form>
<!-- search //-->	
</div>	