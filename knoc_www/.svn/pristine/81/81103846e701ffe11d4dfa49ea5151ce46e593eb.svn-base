<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*,com.neoboard.*,com.neoboard.session.*,com.neoboard.util.*" %>
<%@ page import="java.util.Vector" %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<jsp:useBean id="bm" class="com.neoboard.NeoBoardManager" scope="page" />
<jsp:useBean id="prop" class="com.neoboard.PropertyManager" scope="page" />
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
	
	
	Article article = (Article)pageContext.getAttribute("NB_ARTICLE",PageContext.REQUEST_SCOPE);
	
	String skinRoot = Property.SKIN_URL_IMG + "/" + propBean.getSkinID();
	

	String user_id = "";
	String userLevel = "9";
	if (userSession!=null && !userSession.equals("")) {
		user_id = userSession.getUserID();
		userLevel = userSession.getUserLevel();
	}

	NeoBoardManager manager = new NeoBoardManager();	
	int no = article.getNo();
	if (article.getRefLevel() > 0 && article.getSecret().equals("1")) {
		no = article.getRef();
	}
	boolean checkid = manager.checkMyArticle(propBean.getBoardID(), Integer.toString(no), user_id);
%>
<script type="text/javascript" src="/neoboard/js/comm.js"></script>
<script type="text/javascript">
//<![CDATA[
           
           $(function(){
	$(".resize-img").each(function(){resizeImage(this);});
});
           
function resizeImage(img) {
	var oHeight = img.height;
	var oWidth = img.width;
	if(oWidth > 580) {
		img.width = 580;
		img.height = oHeight * (580 / oWidth);
	}
}

function PasswdPop(URL) {		
	<% if (manager.checkID(propBean.getBoardID(), Integer.toString(no)) && checkid && (user_id == null || user_id.equals("") || user_id.equals("guest"))) { %>
		alert("로그인 후 이용 가능하십니다.");	
	<% } else if (!manager.checkManager(authBean, propBean, userSession) && !checkid) { %>
		window.open("","PasswdPop","width=302px,height=151px,scrollbars=no");
		document.formPop.callback.value = URL;	
		document.formPop.submit();	
	<% } else { %>
		location.href = URL;
	<% } %>		
}
//]]>
</script>

<form name="formPop" action="/neoboard/eng_popup_passwd.jsp" method="post" target="PasswdPop">	
	<input type="hidden" name="callback" value="" />
	<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />
	<input type="hidden" name="bno" value="<%=article.getNo()%>" />
</form>	


<!-- view -->

<!-- 게시물 삭제 비밀번호 창 -->		
<% if(Property.isViewable("delete",authBean,propBean,userSession,article.getId())) { %>
	<script type="text/javascript">
		function restoreArticle() {
			<% if (manager.checkManager(authBean, propBean, userSession) && article.getIsDelete().equals("Y")) { %>

			document.deleteform.action = "<%=EtcUtil.SSL_DOMAIN_URL%><%=Property.SERVLET_ROOT%>/restoreArticle";
			document.deleteform.mode.value = "restore";
			if(confirm("글을 복원하시겠습니까?"))	 {
				document.deleteform.submit();
			}
			<% } %>
		}
		
	function deleteArticle() {
		<% if (!manager.checkID(propBean.getBoardID(), Integer.toString(no)) && !manager.checkManager(authBean, propBean, userSession) && !checkid) { %>
			document.all.articledelete.style.pixelLeft = event.clientX-200;
			document.all.articledelete.style.pixelTop = event.clientY + document.documentElement.scrollTop;
			document.all.articledelete.style.visibility = "visible";
		<% } else { %>
			deleteSubmit(document.deleteform);
		<% } %>
	}
	function deleteCancel() {
		document.all.articledelete.style.visibility = "hidden";
	}
	function deleteSubmit(f) {	
		<% if (!manager.checkID(propBean.getBoardID(), Integer.toString(no)) && !manager.checkManager(authBean, propBean, userSession) && !checkid) { %>
		if(f.passwd.value == "" ) {
			alert("Input password to password input orchid.");
			f.passwd.focus();
			return false;
		}
		<% } %>
		if(confirm("Is Delete?"))	 {
			f.submit();
			return;
		}
	}
	</script>	
<div id="boardsec">	
<div id="articledelete" style="position:absolute; left:0px; top:1px; z-index:1; visibility:hidden;background:#FFFFFF;">
	<!--<p style="padding:8px 0 8px 65px;font-size:11px;margin:0;color:#487DB5;font-weight:bold;">비밀번호</p>-->
	
		<table cellspacing="0" cellpadding="0" class="listtype_pwd" summary="<%=propBean.getBoardName() %>은 패스워드입니다.">
<form name="deleteform" method="post" action="<%=EtcUtil.SSL_DOMAIN_URL%><%=Property.SERVLET_ROOT%>/DeleteArticle" onsubmit="deleteSubmit(this); return false;">
<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />		
<input type="hidden" name="callback" value="<%=pageBean.getPageUrl()%>" />
<input type="hidden" name="ses" value="<%=sessionName%>" />
<input type="hidden" name="num" value="<%=article.getNo()%>" />
<input type="hidden" name="page" value="<%=pageBean.getPage()%>" />
<input type="hidden" name="mode" value="<%=pageBean.getPageMode()%>" />
<% for(int i = 0 ; i < schBean.getSearchParam().size(); i++) { 
SearchParam sp = (SearchParam)schBean.getSearchParam().get(i);
%>
<input type="hidden" name="field" value="<%=sp.getField()%>" />
<input type="hidden" name="text" value="<%=sp.getText()%>" />
<% } %>
<input type="hidden" name="dir" value="<%=schBean.getDir()%>" />
<input type="hidden" name="order" value="<%=schBean.getOrder()%>" />	
<input type="hidden" name="grp" value="<%=schBean.getGroup()%>" />		
<input type="hidden" name="psize" value="<%=propBean.getListPerPage()%>" />
		<colgroup><col width="130px" /><col width="150px" /><col width="70px" /></colgroup>
			<tr>
				<th>Password</th>
				<th><input type="password" value="" name="passwd" id="userpw" class="input" title="비공개글입니다. 비밀번호를 입력해주시기 바랍니다." /></th>
				<th><input type="image" src="<%=skinRoot %>/images/btn_ok.gif" alt="ok" /></th>
			</tr>
</form>			
		</table>			
</div>
</div>
<% } %>		

	
<table width="720" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
	<table width="720" border="0" cellspacing="0" cellpadding="5">
	<tr>
	<td width="50" align="center" bgcolor="#F1F1F1" class="board_titletop">Title</td>
	<td align="left" class="board_titletop2"><%=StringUtil.replaceInString(article.getSubject(),"[Re]","<span class=font_12px_20_bold>[Re]</span>")%></td>
	<td width="90" align="center" bgcolor="#F1F1F1" class="board_titletop">Hit</td>
	<td width="200" align="left" class="board_titletop2"><%=article.getHitcnt() %></td>
	</tr>
	<tr>
	<td width="50" align="center" bgcolor="#F1F1F1" class="board_titletop3">Write</td>
	<td align="left" class="board_listbott"><%=article.getName()%></td>
	<td width="90" align="center" bgcolor="#F1F1F1" class="board_titletop3">Date</td>
	<td width="200" align="left" class="board_listbott"><%=article.getRegDateString("yyyy-MM-dd")%></td>
	</tr>
	<tr>
	<td width="50" align="center" bgcolor="#F1F1F1" class="board_titletop3">File</td>
	<td colspan="3" align="left" class="board_listbott">
<% 	if ( article.getFilecnt() > 0 ) { 
		AttachFiles afs = article.getFiles(); 
		for(int k = 0 ; k < afs.size(); k++) { 
			AttachFile af = afs.getAttachFile(k);
%>
					<a href="<%=Property.SERVLET_ROOT%>/Download?num=<%=pageBean.getNum()%>&fno=<%=af.getNo()%>&bid=<%=propBean.getBoardID()%>&callback=<%=pageBean.getPageUrl()%>&ses=<%=sessionName%>"><img src="<%=af.makeMimeIcon(skinRoot + "/images")%>" width="16" height="16" border=0 alt="<%=af.getFileName()%> : <%=af.getFileSize("HB")%>" align=absmiddle> <%=af.getFileName()%> : <%=af.getFileSize("HB")%></a><BR />
<% 		} 	
	} else { %>
					No Files
<%	} %>	
	</td>
	</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="20">
	<tr>
	<td align="left">
<%
	String content = StringUtil.replaceInString(article.getContent(),"[Re]","<span class=font_12px_20_bold>[Re]</span>");
	content = StringUtil.replaceInString(content,"\n","<br />");
%>			
<%=content%>
<%  if(propBean.getUseImageView().equals("1")) { 
		AttachFiles afs = article.getFiles(); 
		for(int k = 0 ; k < afs.size(); k++) { 
			AttachFile af = afs.getAttachFile(k);
			if(af.getMimeType().equals("gif") || af.getMimeType().equals("jpg") || af.getMimeType().equals("jpeg") ) {
%>
					<div align="center">
						<img class="resize-img" src="<%=Property.SERVLET_ROOT%>/ViewImage?num=<%=pageBean.getNum()%>&amp;fno=<%=af.getNo()%>&amp;bid=<%=propBean.getBoardID()%>&amp;ses=<%=sessionName%>" alt="<%=af.getFileName()%> : <%=af.getFileSize("HB")%>" />
					</div>
<%			}
		} 
  	} %>	
	</td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td>
<%
	Article prevArticle = article.getPrevArticle();
	Article nextArticle = article.getNextArticle(); 
%>	
	<table width="100%" border="0" cellspacing="0" cellpadding="5">
	<tr>
	<td width="100" align="center" class="board_pretitle"><img src="../images/ico_prevtxt.gif" width="5" height="3" class="img" /> Back</td>
	<td align="left" class="board_pretitle3"><% if ( prevArticle != null) { %><a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(prevArticle.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName,false)%>"><%=prevArticle.getSubject()%></a><% } else { %>no cont<% } %></td>
	</tr>
	<tr>
	<td width="100" align="center" class="board_pretitle2"><img src="../images/ico_nexttxt.gif" width="5" height="3" class="img2" /> Next</td>
	<td align="left" class="board_pretitle4"><% if ( nextArticle != null) { %><a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(nextArticle.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName,false)%>"><%=nextArticle.getSubject()%></a><% } else { %>no cont<% } %></td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td height="50" align="right">
	<% if(Property.isViewable("reply",authBean,propBean,userSession) && !article.getNotice().equals("1")) { %><a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("reply",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>"><img src="<%=skinRoot %>/images/btn_answer2.gif" alt="answer" border="0" /></a><% } %>
			<% if(Property.isViewable("edit",authBean,propBean,userSession)) { %><a href="#" onclick="PasswdPop('<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("edit",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>');"><img src="<%=skinRoot %>/images/btn_modifiy.gif" alt="수정" border="0" /><% } %>
			<% if(Property.isViewable("delete",authBean,propBean,userSession,article.getId())) { %><a href="#" onclick="deleteArticle();"><img src="<%=skinRoot %>/images/btn_delete.gif" alt="삭제" border="0" /><% } %>	    						
	        <a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>"><img src="<%=skinRoot %>/images/btn_list.gif" alt="list" border="0" /></a>
</td>
</tr>
</table>

			
	
												
