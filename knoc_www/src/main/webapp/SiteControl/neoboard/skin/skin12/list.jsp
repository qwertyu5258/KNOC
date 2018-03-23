<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*, com.neoboard.* , com.neoboard.session.*, com.neoboard.util.*" %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!--
	�ڷ��01 ��� ��Ų 
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
	
	// ������ ����Ʈ
	Articles articles_notice = bm.getArticlesNotice(userSession, pageBean, schBean, propBean, authBean);		
	pageBean.setPageSize(Integer.toString(Integer.parseInt(pageBean.getPageSize()) - articles_notice.size()));	
	// �������� ������ ����Ʈ
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
<script language="javascript" src="/neoboard/js/comm.js"></script>
<script language=javascript>
	function group_change() {
		//location.href="?mode=list&bid=<%=propBean.getBoardID()%>&ses=<%=sessionName%>";
		var f = document.searchform;
		f.submit();
	}

	function do_search(f)
	{
		//if(f.text.value == "") alert("�˻�� �Է��� �ּ���.");
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
	<table cellspacing="0" cellpadding="0" class="listtype" summary="�ش�Խ����� <%=propBean.getBoardName() %>�� ����� �����ݴϴ�">
	<caption><%=propBean.getBoardName() %> ���</caption>
	<colgroup><col width="55px" /><col width="375px" /><col width="110px" /><col width="85px" /><col width="45px" /><col width="50px" /></colgroup>
		<tr>
			<th>No</th>
			<th>Subject</th>
			<th>Name</th>
			<th>Date</th>
			<th>File</th>
			<th>View</th>
		</tr>

<% if ( articles.size() == 0 && articles_notice.size() == 0) { %>
		<tr>
		<td colspan="6">No Data.</td>
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
			<img src="<%=skinRoot %>/images/btn_no.gif" alt="����" class="ic"/>
			<% } else { %>
			<%=articleN.getSeq()%>
			<% } %>
			</td>
			<td class="subj">
			<!-- ���� ���� ǥ�� -->
			<% if (articleN.getIsDelete().equals("Y")) { %>
				<img src="<%=skinRoot %>/images/btn_reple_del.gif" alt="����" tabindex="0">
			<% } else { %>
				<!-- ����� ���� ǥ�� -->
				<%if(articleN.getSecret().equals("1")){%>
				<img src="<%=skinRoot %>/images/ico_secret.gif" alt="" tabindex="0">
				<% } %>
			<% } %>
			<!-- ��� ���� ���� -->
			<%=articleN.makeReply("<img src='"+skinRoot+"/images/icon_reply.gif' alt='�亯' class='re'/>","&nbsp;&nbsp;")%>
			<!-- ��ũ  ���� -->
			<% if (articleN.getSecret().equals("1") && !bm.checkManager(authBean, propBean, userSession)) { %>
				<% if (checkidN) { %>
					<% if (userSession == null) { %>
					<a href="javascript:alert('�α��� �� �̿� �����Ͻʴϴ�.');">
					<% } else { %>					
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(articleN.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false)%>" class="board" tabindex="0">					
					<% } %>
				<% } else { %>
					<a href="javascript:popup_passwd('<%=articleN.getNo()%>');">
				<% } %>
			<% } else { %>
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(articleN.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false)%>" class="board" tabindex="0">								
			<% } %>
			<!-- ���� ��� -->
					<%=articleN.getSubject(30)%></a>
			<!-- ��ũ ��  -->	
			
			<!-- New ������ -->		
			<% if ( propBean.getUseNew().equals("1")) { %><span ><%=articleN.makeNew("<img alt='new' tabindex='0' src='"+skinRoot+"/images/btn_new.gif'>",propBean.getNewLimit()*24)%></span><% } %>
			<!-- Cool ������ -->
			<% if ( propBean.getUseCool().equals("1") && (articleN.getHitcnt() >= propBean.getCoolLimit())) { %><span ><img alt='new' tabindex='0' src='<%=skinRoot %>/images/btn_cool.gif'></span><% } %>
			<!-- ��� ���� -->
			<% if (propBean.getUseComment().equals("1")) { %><span><%=articleN.makeCmtCnt("(",")")%></span><% } %>
			</td>
			<td><%=articleN.getName()%></td>
			<td><span title="<%=articleN.getRegDateString("yyyy�� MM�� dd�� HH�� mm�� ss��")%>"><%=articleN.getRegDateString("yyyy-MM-dd")%></span></td>
			<td>
			<% if(articleN.getFiles() != null && articleN.getFiles().size() > 0) { %>			
			<%  AttachFiles afsN = articleN.getFiles();
					 for(int k = 0 ; k < afsN.size(); k++) {
						 AttachFile afN = afsN.getAttachFile(k);  %>
					 <a target=_parent href="<%=Property.SERVLET_ROOT%>/Download?num=<%=articleN.getNo()%>&fno=<%=afN.getNo()%>&bid=<%=propBean.getBoardID()%>&callback=<%=pageBean.getPageUrl()%>&ses=<%=sessionName%>"><img src="<%=afN.makeMimeIcon(skinRoot + "/images")%>" border="0" width="16" height="16" alt="<%=afN.getFileName()%> : <%=afN.getFileSize("HB")%>"></a>
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
			<img src="<%=skinRoot %>/images/btn_no.gif" alt="����" class="ic" align="absmiddle" />
			<% } else { %>
			<%=article.getSeq()%>
			<% } %>
			</td>
			<td class="subj">
			<!-- ���� ���� ǥ�� -->
			<% if (article.getIsDelete().equals("Y")) { %>
				<img src="<%=skinRoot %>/images/btn_reple_del.gif" alt="����" tabindex="0" align="absmiddle" />
			<% } else { %>
				<!-- ����� ���� ǥ�� -->			
				<%if(article.getSecret().equals("1")){%>
				<img src="<%=skinRoot %>/images/ico_secret.gif" alt="" tabindex="0" align="absmiddle" />
				<% } %>
			<% } %>
			<!-- ��� ���� ���� -->
			<%=article.makeReply("<img src='"+skinRoot+"/images/btn_re.gif' alt='�亯' class='re' align='absmiddle' />","&nbsp;&nbsp;")%>
			<!-- ��ũ  ���� -->
			<% if (article.getSecret().equals("1") && !bm.checkManager(authBean, propBean, userSession)) { %>
				<% if (checkid) { %>
					<% if (userSession == null) { %>
					<a href="javascript:alert('�α��� �� �̿� �����Ͻʴϴ�.');">
					<% } else { %>					
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false)%>" class="board" tabindex="0">					
					<% } %>
				<% } else { %>
					<a href="javascript:popup_passwd('<%=article.getNo()%>');">
				<% } %>
			<% } else { %>
					<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(article.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false)%>" class="board" tabindex="0">								
			<% } %>
			<!-- ���� ��� -->
					<%=article.getSubject(30)%></a>
			<!-- ��ũ ��  -->	
						
			<!-- New ������ -->	
			<% if ( propBean.getUseNew().equals("1")) { %><span ><%=article.makeNew("<img alt='new' tabindex='0' src='"+skinRoot+"/images/btn_new.gif' align='absmiddle' />",propBean.getNewLimit()*24)%></span><% } %>
			<!-- Cool ������ -->			
			<% if ( propBean.getUseCool().equals("1") && (article.getHitcnt() >= propBean.getCoolLimit())) { %><span ><img alt='new' tabindex='0' src='<%=skinRoot %>/images/btn_cool.gif' align='absmiddle' /></span><% } %>
			<!-- ��� ���� -->			
			<% if (propBean.getUseComment().equals("1")) { %><span><%=article.makeCmtCnt("(",")")%></span><% } %>			
			</td>
			<td><%=article.getName()%></td>
			<td><span title="<%=article.getRegDateString("yyyy�� MM�� dd�� HH�� mm�� ss��")%>"><%=article.getRegDateString("yyyy-MM-dd")%></span></td>
			<td>
			<% if(article.getFiles() != null && article.getFiles().size() > 0) { %>			
			<%  AttachFiles afs = article.getFiles();
					 for(int k = 0 ; k < afs.size(); k++) {
						 AttachFile af = afs.getAttachFile(k);  %>
					 <a target=_parent href="<%=Property.SERVLET_ROOT%>/Download?num=<%=article.getNo()%>&fno=<%=af.getNo()%>&bid=<%=propBean.getBoardID()%>&callback=<%=pageBean.getPageUrl()%>&ses=<%=sessionName%>"><img src="<%=af.makeMimeIcon(skinRoot + "/images")%>" border="0" width="16" height="16" alt="<%=af.getFileName()%> : <%=af.getFileSize("HB")%>"></a>
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
				<a href="<%=prevBlock.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/preview.gif" alt="ó����������" align="absmiddle"/></a>		
				<a href="<%=prevPage.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/ppreview.gif" alt="��������" align="absmiddle"/></a>
				<% int ll = 1; %>
				<neo:loop name="pages" loopId="p" className="com.neoboard.data.NeoAnchor">
				<% if ( p.getPage() == pageBean.getNPage()) { %>
				<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %>
				<% } else { %>
				<a href="<%=p.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <% } %> 
				<% } %>
				<% ll++; %>
				</neo:loop>				
				<a href="<%=nextPage.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/nnext.gif" alt="����������" align="absmiddle"/></a>					
				<a href="<%=nextBlock.getAnchor(schBean.makeQueryString("","mode=list&bid="+propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false))%>"><img src="<%=skinRoot %>/images/next.gif" alt="�ǳ���������" align="absmiddle"/></a>
			</div>
			<!--// paging: end //-->
		</div>
		<!-- paging //--> 
		<!-- ��ư -->
		<div class="rightdv">
			<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("write",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName+"&psize="+propBean.getListPerPage(),false)%>"><img src="<%=skinRoot %>/images/btn_write.gif" alt="�۾���" /></a>
			<% if ( propBean.getUseRss().equals("1")) { %>				
			<img src="/images/board/btn_rss.gif" alt="RSS" onclick="javascript:boardrss('rss');" style="cursor:hand" />	
			<input type="hidden" name="rss" value="http://<%=request.getServerName() %>/neoboard/rss.jsp?bid=<%=propBean.getBoardID()%>&url=<%=pageBean.getPageUrl()%>" />
			<% } %>
		</div>
		<!-- ��ư //-->
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
			<select name="grp" class="formNo"  title="�׷�˻�">
			<option value="" selected="selected">����</option>
			<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), schBean.getGroup()) %>
			</select>			
<% } %>			
			<label for="schsel" class="nlabel">��ϰ˻�����</label>
			<select id="field" name="field">
				<option value="subject">����</option>
				<option value="name">����</option>
				<option value="content">����</option>
			</select>
			
			<label for="schinput" class="nlabel">��ϰ˻�</label>
			<input type="text" value="" id="schinput" name="text" class="input" />							
			
			<div class="btndv"><img src="<%=skinRoot %>/images/btn_search.gif" alt="�˻�" onclick="do_search(document.searchform);" style="cursor:hand" /></div>
	  </fieldset>
	</div>
	<!--// searchbox: end //-->
</form>
<!-- search //-->	
</div>	