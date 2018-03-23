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
	
	//한글깨지는 현상으로 추가 20160526 ecj
	schBean.setName(etc.strBlockSpecialTags(etc.checkNull(request.getParameter("name"))), true);
	
	Property propBean = (Property)pageContext.getAttribute("NB_PROPERTY",PageContext.REQUEST_SCOPE);
	
	Authority authBean = (Authority)pageContext.getAttribute("NB_AUTHORITY",PageContext.REQUEST_SCOPE);		
	
	// 공지글을 제외한 리스트
	//Articles articles = bm.getSangdamArticles(userSession, pageBean, schBean, propBean, authBean);
	Articles articles = bm.getSangdamArticlesCk(userSession, pageBean, schBean, propBean, authBean);	
	
	String skinRoot = Property.SKIN_URL_IMG + "/" + propBean.getSkinID();
		
	String user_id = "";
	String userLevel = "9";
	String user_virtualNo = "";
	if (userSession!=null && !userSession.equals("")) {
		user_id = userSession.getUserID();
		userLevel = userSession.getUserLevel();
		user_virtualNo = userSession.getUserVirtualno();
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
	<colgroup>
		<col width="50px" />
<% if(!"SANGDAM".equals(propBean.getBoardID()) && !"CLEAR2".equals(propBean.getBoardID()) ){ %>
		<col width="75px" />
<%} %>
		<col width="230px" />
		<col width="75px" />
		<col width="70px" />
		<col width="60px" />
		<col width="70px" />
		<col width="80px" />
	</colgroup>
		<tr>
			<th scope="col">번호</th>
<% if(!"SANGDAM".equals(propBean.getBoardID()) && !"CLEAR2".equals(propBean.getBoardID()) ){ %>
			<th scope="col">구분 </th>
<%} %>
			<th scope="col">제목</th>
			<th scope="col">공개유무</th>
			<th scope="col">성명</th>
            <th scope="col">날짜</th>
			<th scope="col">처리상황</th>
			<th scope="col">담당부서</th>
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
			<img src="<%=skinRoot %>/images/btn_no.gif" alt="공지" class="ic" style="vertical-align:middle;" />
			<% } else { %>
			<%=article.getSeq()%>
			<% } %>
			</td>
<% if(!"SANGDAM".equals(propBean.getBoardID()) && !"CLEAR2".equals(propBean.getBoardID()) ){ %>
			<td><%=article.getContGubun() %></td>
<%} %>
			<td class="subj">
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
			<%-- 기존 비밀글에 대한 조건 변경 20130531 kgs 
			<% if (article.getSecret().equals("1") && !bm.checkManager(authBean, propBean, userSession)) { %>
				<% if (checkid) { %>
					<% if (userSession == null) { %>
					<a href="javascript:alert('로그인 후 이용 가능하십니다.');">
					<% }else if (userSession != null && ("1".equals(article.getSecret()) && !user_virtualNo.equals(article.getVirtualno()))) { %>
					<a href="javascript:alert('비공개 글입니다.');">
					<% } else { %>					
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">					
					<% } %>
				<% } else { %>
					<a href="javascript:popup_passwd('<%=article.getNo()%>');">
				<% } %>
			<% } else { %>
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">								

			<% } %>
			--%>
			<%
				if("1".equals(article.getSecret()) && !bm.checkManager(authBean, propBean, userSession)){
					if(userSession != null){
						if("guest".equals(article.getId())){
							if(user_virtualNo.equals(article.getVirtualno())){
								//out.print("<a href=\"" + pageBean.getPageUrl() + pageBean.makeQueryString(article.getNo(),"view",true) + schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false) + "\" class=\"board\">");
								out.print("<a href=\"javascript:popup_passwd('" + article.getNo() + "');\">");
							}else{
								out.print("<a href=\"javascript:alert('이 글은 비공개 글입니다. 타인이 열람하실 수 없습니다.');\">");
							}	
						}else{
							out.print("<a href=\"javascript:popup_passwd('" + article.getNo() + "');\">");							
						}
						
					}else{
						out.print("<a href=\"javascript:alert('로그인 후 이용 가능하십니다.');\">");
					}
				}else{
					//out.print("<a href=\"" + pageBean.getPageUrl() + pageBean.makeQueryString(article.getNo(),"view",true) + schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false) + "\" class=\"board\">");
					out.print("<a href=\"javascript:popup_passwd('" + article.getNo() + "');\">");
				}
			%>
		
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
			<td>
			<%if(article.getSecret().equals("1")){%>
			비공개
			<% } else { %>
			공개
			<% } %>
			</td>
			<td><%=article.getName()%></td>
			<td><span title="<%=article.getRegDateString("yyyy년 MM월 dd일 HH시 mm분 ss초")%>"><%=article.getRegDateString("yyyy-MM-dd")%></span></td>            
            <td><%=etc.checkNull(article.getStatus()) %></td>
            <td><%=DivisionListManager.getDName(article.getBuse()) %></td>
		</tr>
<% 
	}
}
%>
	</table>	
<!-- list //-->

	<div class="boardbtm">
		<!-- paging -->
		<div class="leftdv">		
			<neo:neoPager pageName="NB_PAGE" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="<%=propBean.getPagePerBlock()%>" totalCount="<%=articles.getTotalCount()%>" />
		</div>
		<!-- paging //--> 
		<!-- 버튼 -->
	</div>
	
<!-- search -->
<form name="searchform" method="post" action="<%=pageBean.getPageUrl()%>" onsubmit="do_search(this); return false;">
<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />
<input type="hidden" name="ses" value="<%=sessionName%>" />
<input type="hidden" name="mode" value="list" />		
	<!--// searchbox: end //-->
</form>
<!-- search //-->	
</div>	