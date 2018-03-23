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
<script language="javascript"  type="text/javascript" src="/neoboard/js/comm.js"></script>
<script language=javascript  type="text/javascript">
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

	function resizeImage(img) {
		var oHeight = img.height;
		var oWidth = img.width;
		
		//가로가 세로보다 클경우
		if (oWidth > oHeight) {		
			if (oHeight > 120) {
				img.width = oWidth * (120 / oHeight);
				img.height = 120;
			}else if(oWidth > 180) {
				img.height = oHeight * (180 / oWidth);
				img.width = 180;
			}	
		//세로가 가로보다 클경우
		} else if (oWidth < oHeight) {
			if (oHeight > 120) {
				img.width = oWidth * (120 / oHeight);
				img.height = 120;
			}		
		//가로,세로 같을경우
		} else	{
			if (oWidth > 120) {
				img.width = 120;
				img.height = 120;
			}
		}
	}
	function openImg(bno) {
		window.open(bno,"bform","width=800px,height=600px,scrollbars=auto");
		
	}
</script>	

<form name="bform" method="post" action="/neoboard/popup_passwd.jsp" target="bform" onsubmit="do_search(this); return false;">
	<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />			
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="callback" value="<%=pageBean.getPageUrl()%>" />			
	<input type="hidden" name="mode" value="view" />
</form>	

<!-- list -->	
<%
	for(int i = 0 ; i < articles.size(); i++ ) {
		Article article = articles.getArticle(i);
		int no = article.getNo();
		if (article.getRefLevel() > 0) {
			no = article.getRef();
		}		
		boolean checkid = bm.checkID(propBean.getBoardID(), Integer.toString(no));
%>	

					<div>
						

<% 
			if(article.getFiles() != null && article.getFiles().size() > 0) { 
				AttachFiles afs = article.getFiles();
					 for(int k = 0 ; k < 1; k++) {
						 AttachFile af = afs.getAttachFile(k);
							 if(af.getMimeType().equals("gif") || af.getMimeType().equals("jpg") || af.getMimeType().equals("jpeg") ) {
%>
					 <div><h4><a href="javascript:openImg('/upload/neoboard/<%=propBean.getBoardID()%>/<%=af.getNewFileName()%>')"><img src="/upload/neoboard/<%=propBean.getBoardID()%>/T<%=af.getNewFileName()%>" alt="<%=article.getSubject()%>" width="180" height="120" /></a></h4></div>
<% 
							}//if...
					 }//for...
			}//if...
%> 


						<h3><%=article.getSubject()%></h3>
						<p><%=article.getContent()%> </p>
					</div>

<%
	}//for...	
%>
<!-- list //-->

	<div class="boardbtm" style="border:0px;">
		<!-- paging -->
		<div class="leftdv" style="border:0px;text-align:center;width:800px;">		
			<neo:neoPager pageName="NB_PAGE" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="<%=propBean.getPagePerBlock()%>" totalCount="<%=articles.getTotalCount()%>" />
			<!--// paging: start //-->
			<div class="paging" style="border:0px;text-align:center;width:800px;">
				<a href="<%=prevBlock.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/preview.gif" alt="처음페이지로"  /></a>		
				<a href="<%=prevPage.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/ppreview.gif" alt="전페이지"  /></a>
				<% int ll = 1; %>
				<neo:loop name="pages" loopId="p" className="com.neoboard.data.NeoAnchor">
				<% if ( p.getPage() == pageBean.getNPage()) { %>
				<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %>
				<% } else { %>
				<a href="<%=p.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <% } %> 
				<% } %>
				<% ll++; %>
				</neo:loop>				
				<a href="<%=nextPage.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/nnext.gif" alt="다음페이지"  /></a>					
				<a href="<%=nextBlock.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/next.gif" alt="맨끝페이지로" /></a>
			</div>
			<!--// paging: end //-->
		</div>
		<!-- paging //--> 	
	</div>	