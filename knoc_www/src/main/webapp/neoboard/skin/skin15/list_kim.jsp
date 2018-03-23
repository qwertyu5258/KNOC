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

	String top_img = "";
	String top_title = "";
	if(article_top.getFiles() != null && article_top.getFiles().size() > 0) {			
		AttachFiles afs = article_top.getFiles();
		AttachFile af = afs.getAttachFile(0);
		if(af.getMimeType().equals("gif") || af.getMimeType().equals("jpg") || af.getMimeType().equals("jpeg") ) {
			top_img = "/upload/neoboard/"+propBean.getBoardID()+"/T"+af.getNewFileName();
			top_title = article_top.getSubject();
		}  
	}
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

	function resizeImage(img) {
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
	}

	function changeImg(src,tit) {
		document.all.bimg.src = src;
		document.all.titleView.innerHTML = tit;
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
<table width="720" border="0" cellpadding="0" cellspacing="0">
<tr>
<td>
	<table width="720" border="0" cellspacing="0" cellpadding="0">
<% if ( articles.size() == 0) { %>
	<tr>
	<td align=center colspan=2>No Data.</td>
	</tr>
<% } else { %>		
	<tr>
	<td valign="top">
		<table width="387" border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td height="380">
		<img src="<%=top_img %>" id="bimg" width="370" height="320" />
		</td>
		</tr>
		<tr>
		<td><span id="titleView"><%=top_title%></span></td>
		</tr>
		</table>
	</td>
	<td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
	int j = 1;
	for(int i = 0 ; i < articles.size(); i++ ) {
		Article article = articles.getArticle(i);
		int no = article.getNo();
		if (article.getRefLevel() > 0) {
			no = article.getRef();
		}		
		boolean checkid = bm.checkID(propBean.getBoardID(), Integer.toString(no));
		if (j % 3 == 1) {
%>
		<tr>
<%			
		}			
%>				
		<td width="90" height="95" valign="top" class="simg">
		<% if(article.getFiles() != null && article.getFiles().size() > 0) { %>			
			<%  AttachFiles afs = article.getFiles();
					AttachFile af = afs.getAttachFile(0);
					if(af.getMimeType().equals("gif") || af.getMimeType().equals("jpg") || af.getMimeType().equals("jpeg") ) {
			%>
		<img src="/upload/neoboard/<%=propBean.getBoardID()%>/T<%=af.getNewFileName()%>" width="80" height="50" onclick="changeImg('/upload/neoboard/<%=propBean.getBoardID()%>/T<%=af.getNewFileName()%>','<%=article.getSubject()%>');" style="cursor:pointer" />
		<% 
					} %>  
			<% } else { %>
				&nbsp;
			<% } %>		
		</td>
<%		if (j !=0 && j % 3 == 0) { %>																		
			</tr>
<%			
		}						
		j++;
	}

	if (j % 3 == 2) {
%>
		<td></td>
		<td></td>
		</tr>
<%			
	} else if (j % 3 == 0) {
%>
		<td></td>
		</tr>
<%
	}
%>						
		</table>
	</td>
	</tr>
<%
}
%>		
	</table>

</td>
</tr>
<tr>
<td>&nbsp;</td>
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
	<select name="field" class="select" id="field">
	<option value="subject">Title</option>
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