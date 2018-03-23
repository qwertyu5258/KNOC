<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*, com.neoboard.* , com.neoboard.session.*, com.neoboard.tags.JUtil, com.neoboard.util.* " %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<!--
자료실01 쓰기 스킨
-->
<jsp:useBean id="bm" class="com.neoboard.NeoBoardManager" scope="page" />
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
	String neoRoot = Property.ROOT_URL;
%>
<% if(!Property.isViewable("reply",authBean,propBean,userSession) && !article.getNotice().equals("1")) { %>
	<script type="text/javascript">
		alert("글쓰기 권한이 없습니다.");
		history.back();
	</script>
	<%
	return;
} %>
<script type="text/javascript">
	function do_submit(f) {

		if(f.name.value == "") {
			alert("Input name to name input orchid.");
			f.name.focus();
			f.name.select();
			return;
		}


		if(f.passwd.value=='') {
			alert('Input password to password input orchid.');
			f.passwd.focus();
			return;
		}

		if(f.subject.value == "") {
			alert("Input title to title input orchid.");
			f.subject.focus();
			f.subject.select();
			return;
		}

		if(f.HTML_BODY.value =="") {
			alert('Input contents to contents input orchid.');
			f.HTML_BODY.focus();
			return;
		}

		if(!checkAllFileExt(f)){
			alert("File is no upload.");
			return;
		}

		if(confirm("Submit?")) {

			if (checkBanwd(f.subject) && checkBanwd(f.HTML_BODY)) { //금지어 체킹
				try{
					// 이 라인은 현재 사용 중인 폼에 따라 달라질수 있습니다.
					f.submit();
				}catch(e){}
			}
		}
	}

// 업로드 파일의 확장자 검사
	function filterExtension(obj){
		if( !checkFileExt(obj) ) alert ( "File is no upload." );
	}

	// 업로드 파일의 확장자 검사
	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	function checkFileExt(obj){
		<%
		String strDefaultNotAllowedExtension = propBean.getDefaultNotAllowedExtension();
		if(strDefaultNotAllowedExtension == null) { strDefaultNotAllowedExtension = ""; }
		strDefaultNotAllowedExtension = strDefaultNotAllowedExtension.replaceAll(",","|");
		%>
		if( obj.value.toLowerCase().match(/(<%=strDefaultNotAllowedExtension%>)$/) ){
			return false;
		}

		return true;
	}

	function checkAllFileExt(f){
	<%for( int i = 1 ; i <= propBean.getMaxFileAttach() ; i++) {%>
		if ( f.file<%=i%>.value != "" ){
			if(!checkFileExt(f.file<%=i%>) ) return false;
		}
	<%}%>

		return true;
	}

// 금지어 검사 함수
	function checkBanwd(obj) {
	    var banwd = new Array();
<%
	    String[] banwd_ar;
		if (propBean.getBanwd() != null && !propBean.getBanwd().equals("")){
			banwd_ar = propBean.getBanwd().split(",");
			for (int i = 0; i < banwd_ar.length; i++) {
%>
				banwd[<%=i%>] = "<%=banwd_ar[i]%>";
<%
			}
%>
		var len = banwd.length;
	    var content = obj.value;
	    var ban_text = "";
	    var idx = -1;
	    for(i = 0 ; i < len ; i++) {
	        idx = content.indexOf(banwd[i]);
	        if(-1 < idx) {
	            alert("'" + banwd[i] + "' is no submit.");
	            return false;
	        }
	    }
<%
		}
%>
		return true;
	}
</script>

<%
StringBuffer action = new StringBuffer();
action.append(EtcUtil.SSL_DOMAIN_URL);
action.append(Property.SERVLET_ROOT);
action.append("/ReplyArticle");
action.append("?num=");
action.append(article.getNo());
action.append("&amp;bid=");
action.append(propBean.getBoardID());
action.append("&amp;callback=");
action.append(pageBean.getPageUrl());
action.append("&amp;ses=");
action.append(sessionName);
action.append("&amp;page=");
action.append(pageBean.getPage());
action.append("&amp;mode=");
action.append(pageBean.getPageMode());
for(int i = 0 ; i < schBean.getSearchParam().size(); i++) {
SearchParam sp = (SearchParam)schBean.getSearchParam().get(i);
action.append("&amp;field=");
action.append(sp.getField());
action.append("&amp;text=");
action.append(sp.getText());
}
action.append("&amp;dir=");
action.append(schBean.getDir());
action.append("&amp;order=");
action.append(schBean.getOrder());
action.append("&amp;grp=");
action.append(schBean.getGroup());
action.append("&amp;psize=");
action.append(propBean.getListPerPage());

%>

<script type="text/javascript" src="/neoboard/js/comm.js"></script>

<a tabindex="0"><%=propBean.getTopIncludeText()%></a>

<!-- form -->
<form name="writeform" method="post" action="<%=action.toString()%>" enctype="multipart/form-data">
<input name="id" type="hidden" value="<%= userSession==null ? "":userSession.getUserID()%>" />
<input name="virtualno" type="hidden" value="<%= userSession==null ? "":userSession.getUserVirtualno()%>" />
<input name="html" type="hidden" value="0" />
<table width="720" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
	<table width="720" border="0" cellspacing="0" cellpadding="5">
	<tr>
	<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop">Write</td>
	<td align="left" class="board_titletop2"><input name="name" type="text" class="textfield" id="name" size="20" value="<%= userSession==null ? "":userSession.getUserName() %>" maxlength="32" <%if(userSession!=null && propBean.getUseAuth().equals("1")) { %>readonly="readonly"<% } %> /></td>
	<td width="90" align="center" bgcolor="#F1F1F1" class="board_titletop">password</td>
	<td width="250" align="left" class="board_titletop2"><input name="passwd" type="password" class="textfield" id="passwd" size="20" maxlength="16" /></td>
	</tr>
	<tr>
	<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Title</td>
	<td colspan="3" align="left" class="board_listbott">
	<input name="subject" type="text" class="textfield" id="subject" value="[Re]<%=article.getSubject() %>" size="50" maxlength="<%=propBean.getMaxSubjectLength()%>" />
	</td>
	</tr>
	<% if ( propBean.getUseGroup().equals("1")) { %>
	<tr>
	<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Group</td>
	<td colspan="3" align="left" class="board_listbott">
				<select name="grp" style="wihdt:150px;">
				<option value="" >select</option>
				<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), "") %>
				</select>
	</td>
	</tr>
	<% } %>
	<% if ( propBean.getUseSecret().equals("1")) { %>
	<tr>
	<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Secret</td>
	<td colspan="3" align="left" class="board_listbott">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td width="35" align="left">Open</td>
		<td width="50" align="left"><input type="radio" name="secret" value="0" /></td>
		<td width="55" align="left">Not Open</td>
		<td width="50" align="left"><input type="radio" name="secret" value="1" /></td>
		<td>&nbsp;</td>
		</tr>
		</table>
	</td>
	</tr>
	<% } %>
	<tr>
	<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Content</td>
	<td colspan="3" align="left" class="board_listbott">
<%
	StringBuffer content = new StringBuffer();
	content.append("\n\n\n");
	content.append("It is writing that " + article.getName()+ " uses.\n");
	content.append(article.getContent().replaceAll("\\\"","&quot;").replaceAll("<br />","\n > "));

%>
	<textarea name="HTML_BODY" cols="70" rows="10" class="textfield2" id="HTML_BODY"><%=content.toString()%></textarea>
	</td>
	</tr>
	<tr>
	<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">File</td>
	<td colspan="3" align="left" class="board_listbott">
<%
			if (propBean.getMaxFileAttach() > 0) {
				for( int i = 1 ; i <= propBean.getMaxFileAttach(); i++) {
					%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td>
		<input name="file<%=i%>" type="file" class="textfield" id="file<%=i%>" size="50" /> <%=propBean.getEngMaxUploadLimit("MB")%>
		</td>
		</tr>
		</table>
					<%
					}
				}
			%>
	</td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50" align="right">
			<a href="#" onclick="do_submit(document.writeform);"><img src="<%=skinRoot %>/images/btn_ok.gif" alt="ok" border="0" /></a>
			<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName,false)%>"><img src="<%=skinRoot %>/images/btn_cancel.gif" border="0" alt="cancel" /></a>
</td>
</tr>
</table>
</form>
<!-- form //-->
