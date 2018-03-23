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
	
	int num = request.getParameter("num") == null ? 0 : Integer.parseInt(request.getParameter("num"));
	if (num <= 0) {
		num = bm.getNo(propBean, schBean, 0);
	}
	Article article_top = bm.getArticle(num, propBean, schBean);

%>
<script type="text/javascript" src="/neoboard/js/comm.js"></script>
<script type="text/javascript">
	//<![CDATA[
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

	function resizeImage(str, imgNo) {	
		var img = new Image(); 
		img.src = (str); 
		var oHeight = img.height;
		var oWidth = img.width;		
		
		//가로가 세로보다 클경우
		if (oWidth > oHeight) {		
			if (oHeight > 96) {
				img.width = oWidth * (96 / oHeight);
				img.height = 96;
			}else if(oWidth > 152) {
				img.height = oHeight * (152 / oWidth);
				img.width = 152;
			}	
		//세로가 가로보다 클경우
		} else if (oWidth < oHeight) {
			if (oHeight > 96) {
				img.width = oWidth * (96 / oHeight);
				img.height = 96;
			}		
		//가로,세로 같을경우
		} else	{
			if (oWidth > 96) {
				img.width = 96;
				img.height = 96;
			}
		}
		var myImg = document.getElementById("img" + imgNo);
		myImg.width = img.width;
		myImg.height = img.height;
	}
	function popup_passwd(bno) {
		window.open("","bform","width=302px,height=151px,scrollbars=no");
		document.bform.bno.value = bno
		document.bform.submit();
	}
	//]]>			
</script>	

<form name="bform" method="post" action="/neoboard/popup_passwd.jsp" target="bform">
	<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />			
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="callback" value="<%=pageBean.getPageUrl()%>" />			
	<input type="hidden" name="mode" value="view" />
</form>	

<!-- list -->	
<div id="boardsec">
 	<table cellspacing="0" cellpadding="0" border="0" class="viewtype_noline" summary="해당게시판은 말씀자료의 목록을 보여줍니다">
	<caption><%=propBean.getBoardName() %> 목록</caption>
	<colgroup><col width="480px" /><col width="200px" /></colgroup>
		<tbody>
		<tr>
		<td rowspan="4">
			<%
			/**
			 * 2016.3.21 JSM
			 * 보안약점 조치
			 */
			if(article_top!=null){
				if (article_top.getUrl() != null && !article_top.getUrl().equals("")) { %>
			<!--[if IE]>
			<object width="385" height="321" classid="CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6">
				<param name="url" value="<%=article_top.getUrl() %>"/>
				<param name="volume" value="100"/>
				<param name="autoStart" value="true"/>
			</object>		
			<![endif]-->
			<!--[if !IE]> <-->
			<% /*  
			<object id="MediaPlayer" type="video/x-ms-wmv" data="" width="385" height="321" title="동영상">   data="article_top.getUrl()"
				<param name="Filename" value="" />  value="article_top.getUrl()"
				<param name="AutoStart" value="1" />
				<param name="AutoSize" value="0" />
				<param name="AnimationAtStart" value="0" />
				<param name="DisplaySize" value="0" />
				<param name="EnableContextMenu" value="false" />
				<param name="EnablePositionControls" value="-1" />
				<param name="EnableFullScreenControls" value="0" />
				<param name="Mute" value="0" />
				<param name="stretchToFit" value="0" />
				<param name="ShowCaptioning" value="0" />
				<param name="ShowControls" value="1" />
				<param name="ShowAudioControls" value="1" />
				<param name="ShowDisplay" value="0" />
				<param name="ShowGotoBar" value="0" />
				<param name="ShowPositionControls" value="-1" />
				<param name="ShowStatusBar" value="1" />
				<param name="ShowTracker" value="-1" />
				<param name="Volume" value="100" />
				<param name="SendMouseClickEvents" value="-1" />
			</object>
			*/ %>
			<!--> <![endif]-->
			
			<iframe width="480" height="270" src="<%=article_top.getUrl() %>" frameborder="0" allowfullscreen></iframe>
					
			  <% }	} %>
		</td>
		<th scope="col"><div class="mov"><img src="/images/board/mov_tex1.gif" alt="동영상 제목" /></div></th>
		</tr>
        <tr>
        <td><div class="movtype"><%=article_top.getSubject() %></div></td>
        </tr>
        <tr>
        <th scope="col"><div class="mov"><img src="/images/board/mov_tex2.gif" alt="동영상 내용 및 대본" /></div></th>
        </tr>
        <tr>
        <td><div class="movtype2" style="overflow-x:hidden;overflow-y:scroll;height:175px;width:95%"><% if (article_top.getContent() != null && !article_top.getContent().equals("")) { 
			String content = article_top.getContent().replace("<BR />", "<br />");
			content = content.replace("P", "p");
		%>
		<%=content %>
		<% } %></div></td>
        </tr>
		</tbody>
	</table>
	<br />
	<table cellspacing="0" cellpadding="0" class="viewtype_noline" summary="해당게시판은 <%=propBean.getBoardName() %>의 목록을 보여줍니다">
	<caption><%=propBean.getBoardName() %> 목록</caption>
	<colgroup><col width="170px" /><col width="170px" /><col width="170px" /><col width="170px" /></colgroup>		
	<tbody>
<% if ( articles.size() == 0) { %>
		<tr>
		<td colspan="4">검색 내용이 없습니다.</td>
		</tr>
<% } else { %>		
<%
	int j = 1;
	for(int i = 0 ; i < articles.size(); i++ ) {
		Article article = articles.getArticle(i);
		int no = article.getNo();
		if (article.getRefLevel() > 0) {
			no = article.getRef();
		}		
		boolean checkid = bm.checkID(propBean.getBoardID(), Integer.toString(no));
		if (j % 4 == 1) {
%>
		<tr>
<%			
		}			
%>	
			<td>
				<table width="100" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>
			<% if(article.getFiles() != null && article.getFiles().size() > 0) { %>			
			<%  AttachFiles afs = article.getFiles();
					 for(int k = 0 ; k < 1; k++) {
						 AttachFile af = afs.getAttachFile(k);
						 if(af.getMimeType().equals("gif") || af.getMimeType().equals("jpg") || af.getMimeType().equals("jpeg") ) {
			%>
					 <div class="imgbg">
					 <!-- 링크  시작 -->
						<% if (article.getSecret().equals("1") && !bm.checkManager(authBean, propBean, userSession)) { %>
							<% if (checkid) { %>
								<% if (userSession == null) { %>
								<a href="javascript:alert('로그인 후 이용 가능하십니다.');">
								<% } else { %>					
								<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">					
								<% } %>
							<% } else { %>
								<a href="javascript:popup_passwd('<%=article.getNo()%>');">
							<% } %>
						<% } else { %>
								<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">								
						<% } %>
					 <img src="/upload/neoboard/<%=propBean.getBoardID()%>/T<%=af.getNewFileName()%>" alt="<%=af.getFileName()%>" id="img<%=i%>" />
					 </a>
					 </div>

				<% 
						 }
					} %>  
			<% } else { %>
						&nbsp;
			<% } %>
						</td>
					</tr>
					<tr>
						<td>
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
						<%=article.makeReply("<img src='"+skinRoot+"/images/icon_reply.gif' alt='답변' class='re' style='vertical-align:middle;' />","&nbsp;&nbsp;")%>
						<!-- 링크  시작 -->
						<% if (article.getSecret().equals("1") && !bm.checkManager(authBean, propBean, userSession)) { %>
							<% if (checkid) { %>
								<% if (userSession == null) { %>
								<a href="javascript:alert('로그인 후 이용 가능하십니다.');">
								<% } else { %>					
								<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">					
								<% } %>
							<% } else { %>
								<a href="javascript:popup_passwd('<%=article.getNo()%>');">
							<% } %>
						<% } else { %>
								<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>" class="board">								
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
					</tr>
				</table>
			</td>
<%
		if (j !=0 && j % 4 == 0) {
%>																			
		</tr>		
<% 
		}
		j++;
	}

	if (j % 4 == 2) {
%>
			<td></td>
			<td></td>
			<td></td>
		</tr>
<%
	} else if (j % 4 == 3) {
%>
			<td></td>
			<td></td>
		</tr>
<%
	} else if (j % 4 == 0) {
%>
			<td></td>
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
			<% if ( propBean.getUseRss().equals("1")) { %>	
			<a href="#boardsec"  onclick="javascript:boardrss('rss'); return false;"><img src="/images/board/btn_rss.gif" alt="RSS"/>	</a>
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
			
			<div class="btndv"><input type="image" src="<%=skinRoot %>/images/btn_search.gif" style="width:33px; height:19px;" alt="검색"  /></div>
	  </fieldset>
	</div>
	<!--// searchbox: end //-->
</form>
<!-- search //-->	
</div>	