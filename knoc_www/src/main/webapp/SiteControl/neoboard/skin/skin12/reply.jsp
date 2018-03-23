<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*, com.neoboard.* , com.neoboard.session.*, com.neoboard.tags.JUtil, com.neoboard.util.* " %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<!--
�ڷ��01 ���� ��Ų
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
		alert("�۾��� ������ �����ϴ�.");
		history.back();
	</script>
	<%
	return;
} %>
<script type="text/javascript">
	function do_submit(f) {

		if(f.subject.value == "") {
			alert("�� ������ �Է��� �ֽñ� �ٶ��ϴ�.");
			f.subject.focus();
			f.subject.select();
			return;
		}

		if(f.name.value == "") {
			alert("������ �Է��� �ֽñ� �ٶ��ϴ�.");
			f.name.focus();
			f.name.select();
			return;
		}


		if(f.passwd.value=='') {
			alert("��й�ȣ�� �Է��� �ֽñ� �ٶ��ϴ�.");
			f.passwd.focus();
			return;
		}

		if(f.HTML_BODY.value =="") {
			alert("�� ������ �Է��� �ֽñ� �ٶ��ϴ�.");
			f.HTML_BODY.focus();
			return;
		}

		if(!checkAllFileExt(f)){
			alert("�����Ͻ� ������ ���ε� �� �� �����ϴ�.");
			return;
		}

		if(confirm("���� ����Ͻðڽ��ϱ�?")) {
			oEditors[0].exec("UPDATE_IR_FIELD", []);
			// �������� ���뿡 ���� �� ������ �̰����� textarea �ʵ��� ir1�� ���� �̿��ؼ� ó���ϸ� �˴ϴ�.

			if (checkBanwd(f.subject) && checkBanwd(f.HTML_BODY)) { //������ üŷ
				try{
					// �� ������ ���� ��� ���� ���� ���� �޶����� �ֽ��ϴ�.
					f.submit();
				}catch(e){}
			}
		}
	}

// ���ε� ������ Ȯ���� �˻�
	function filterExtension(obj){
		if( !checkFileExt(obj) ) alert ( "�����Ͻ� ������ ���ε� �Ͻ� �� �����ϴ�. �ٽ� �������ּ���" );
	}

	// ���ε� ������ Ȯ���� �˻�
	/**
	* 2016. 03. 21 / MYM
	* ���Ⱦ��� ��ġ
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

// ������ �˻� �Լ�
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
	            alert("'" + banwd[i] + "'��(��) ����� �� ���� �ܾ��Դϴ�.");
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
<!-- SmartEditor ���� -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<a tabindex="0"><%=propBean.getTopIncludeText()%></a>

<!-- form -->
<div id="boardsec">
	<table cellspacing="0" cellpadding="0" class="viewtype" summary="<%=propBean.getBoardName() %>�� �Խù��� ����մϴ�">
<form name="writeform" method="post" action="<%=action.toString()%>" enctype="multipart/form-data">
<input name="id" type="hidden" value="<%= userSession==null ? "":userSession.getUserID()%>" />
	<caption><%=propBean.getBoardName() %>�Խù����</caption>
	<colgroup><col width="110px" /><col width="590px" /></colgroup>
		<tr>
			<th class="th1"><label for="subjtxt">Subject</label></th>
			<td class="td1"><input type="text" value="[Re]<%=article.getSubject() %>" id="subjtxt" name="subject" class="input" style="width:570px;" maxlength="<%=propBean.getMaxSubjectLength()%>" /></td>
		</tr>
		<% if ( propBean.getUseGroup().equals("1")) { %>
		<!--  �׷� ����  -->
		<tr>
			<th class="th1"><label for="subjtxt">Group</label></th>
			<td class="td1">
				<select name="grp" style="wihdt:150px;">
				<option value="" >������ �ּ���</option>
				<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), "") %>
				</select>
			</td>
		</tr>
		<!-- �׷� ����  -->
		<% } %>
        <tr>
			<th class="th1"><label for="subjtxt">Name</label></th>
			<td class="td1"><input type="text" id="name" name="name" class="input" style="width:130px;" value="<%= userSession==null ? "":userSession.getUserName() %>" maxlength="32" <%if(userSession!=null && propBean.getUseAuth().equals("1")) { %>readonly="readonly"<% } %> /></td>
		</tr>
		<tr>
			<th class="th1"><label for="subjtxt">Password</label></th>
			<td class="td1"><input type="password" value="" id="passwd" name="passwd" class="input" style="width:130px;" maxlength="16" /></td>
		</tr>
		<tr>
			<th class="th1"><label for="catesel">Contents</label></th>
			<td class="td12">
<%
	StringBuffer content = new StringBuffer();
	content.append("<BR><BR><BR><HR>");
	content.append("It is writing that " + article.getName()+ " uses.<br />");
	content.append("<font color=blue>");
	content.append(article.getContent().replaceAll("\\\"","&quot;").replaceAll("<BR />","<BR> > "));
	content.append("</font>");

%>
			<textarea name="HTML_BODY" cols="95" rows="15" class="area"><%=content.toString()%></textarea>
			</td>
		</tr>
		<% if ( propBean.getUseSecret().equals("1")) { %>
		<tr>
			<th class="th1"><label for="subjtxt">Secret</label></th>
			<td class="td1">
				<input type="radio" name="secret" value="0" checked />No <input type="radio" name="secret" value="1" /> Yes
			</td>
		</tr>
		<% } %>
		<% if ( propBean.getUseMovie().equals("1")) { %>
		<tr>
			<th class="th1"><label for="subjtxt">Movie URL</label></th>
			<td class="td1">
				<input type="text" value="" name="url" id="url" class="input" style="width:430px;" maxlength="200" />
			</td>
		</tr>
		<% } %>
		<tr>
			<th class="th1"><label for="fileadd">File</label></th>
			<td class="td1">
				<div class="filedv1">
			<%
			if (propBean.getMaxFileAttach() > 0) {
				for( int i = 1 ; i <= propBean.getMaxFileAttach(); i++) {
					%>
					<input type="file" name="file<%=i%>" id="file<%=i%>" value="" class="input" style="width:330px;" title="÷������<%=i%>" /><span class="f_pad"> <%=propBean.getMaxUploadLimit("MB")%></span><br />
					<%
					}
				}
			%>
				</div>
			</td>
		</tr>
</form>
	</table>

	<div class="boardbtm">
		<div class="btnsec">
			<img src="<%=skinRoot %>/images/btn_ok.gif" alt="Ȯ��" onclick="do_submit(document.writeform);" style="cursor:hand" />
			<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName,false)%>"><img src="<%=skinRoot %>/images/btn_cancel.gif" alt="���" /></a>
		</div>
	</div>
</div>

<!-- form //-->

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "HTML_BODY",
	sSkinURI: "/smartEditor/SEditorSkin.html",
	fCreator: "createSEditorInIFrame"
});
</script>