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

		if(f.subject.value == "") {
			alert("글 제목을 입력해 주시기 바랍니다.");
			f.subject.focus();
			f.subject.select();
			return;
		}

		if(f.name.value == "") {
			alert("성명을 입력해 주시기 바랍니다.");
			f.name.focus();
			f.name.select();
			return;
		}


		if(f.passwd.value=='') {
			alert("비밀번호를 입력해 주시기 바랍니다.");
			f.passwd.focus();
			return;
		}

		if(f.HTML_BODY.value =="") {
			alert("글 내용을 입력해 주시기 바랍니다.");
			f.HTML_BODY.focus();
			return;
		}

		if(!checkAllFileExt(f)){
			alert("선택하신 파일은 업로드 할 수 없습니다.");
			return;
		}

		if(confirm("글을 등록하시겠습니까?")) {

			f.submit();

			/*
			oEditors[0].exec("UPDATE_IR_FIELD", []);
			// 에디터의 내용에 대한 값 검증은 이곳에서 textarea 필드인 ir1의 값을 이용해서 처리하면 됩니다.

			if (checkBanwd(f.subject) && checkBanwd(f.HTML_BODY)) { //금지어 체킹
				try{
					// 이 라인은 현재 사용 중인 폼에 따라 달라질수 있습니다.
					f.submit();
				}catch(e){}
			}
			*/
		}
	}

// 업로드 파일의 확장자 검사
	function filterExtension(obj){
		if( !checkFileExt(obj) ) alert ( "선택하신 파일은 업로드 하실 수 없습니다. 다시 선택해주세요" );
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
	            alert("'" + banwd[i] + "'는(은) 등록할 수 없는 단어입니다.");
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
<!-- SmartEditor 삽입 -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<a tabindex="0"><%=propBean.getTopIncludeText()%></a>

<!-- form -->
<div id="boardsec">
	<table cellspacing="0" cellpadding="0" class="viewtype" summary="<%=propBean.getBoardName() %>에 게시물을 등록합니다">
<form name="writeform" method="post" action="<%=action.toString()%>" enctype="multipart/form-data">
<input name="id" type="hidden" value="<%= userSession==null ? "":userSession.getUserID()%>" />
	<caption><%=propBean.getBoardName() %>게시물등록</caption>
	<colgroup><col width="110px" /><col width="590px" /></colgroup>
		<tr>
			<th class="th1"><label for="subjtxt">제&nbsp;&nbsp;목</label></th>
			<td class="td1"><input type="text" value="[답변]<%=article.getSubject() %>" id="subjtxt" name="subject" class="input" style="width:570px;" maxlength="<%=propBean.getMaxSubjectLength()%>" /></td>
		</tr>
		<% if ( propBean.getUseGroup().equals("1")) { %>
		<!--  그룹 시작  -->
		<tr>
			<th class="th1"><label for="subjtxt">그룹선택</label></th>
			<td class="td1">
				<select name="grp" style="wihdt:150px;">
				<option value="" >선택해 주세요</option>
				<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), "") %>
				</select>
			</td>
		</tr>
		<!-- 그룹 종료  -->
		<% } %>
        <tr>
			<th class="th1"><label for="subjtxt">성명</label></th>
			<td class="td1"><input type="text" id="name" name="name" class="input" style="width:130px;" value="<%= userSession==null ? "":userSession.getUserName() %>" maxlength="32" <%if(userSession!=null && propBean.getUseAuth().equals("1")) { %>readonly="readonly"<% } %> /></td>
		</tr>
		<tr>
			<th class="th1"><label for="subjtxt">비밀번호</label></th>
			<td class="td1"><input type="password" value="" id="passwd" name="passwd" class="input" style="width:130px;" maxlength="16" /></td>
		</tr>
		<tr>
			<th class="th1"><label for="catesel">내&nbsp;&nbsp;용</label></th>
			<td class="td12">
<%
	StringBuffer content = new StringBuffer();
	content.append("<BR><BR><BR><HR>");
	content.append(article.getName());
	content.append("님께서 작성하신 내용<BR>");
	content.append("<font color=blue>");
	content.append(article.getContent().replaceAll("\\\"","&quot;").replaceAll("<BR />","<BR> > "));
	content.append("</font>");

%>
			<textarea name="HTML_BODY" cols="95" rows="15" class="area"><%=content.toString()%></textarea>
			</td>
		</tr>
		<% if ( propBean.getUseSecret().equals("1")) { %>
		<tr>
			<th class="th1"><label for="subjtxt">공개여부</label></th>
			<td class="td1">
				<input type="radio" name="secret" value="0" checked />공개 <input type="radio" name="secret" value="1" /> 비공개
			</td>
		</tr>
		<% } %>
		<% if ( propBean.getUseMovie().equals("1")) { %>
		<tr>
			<th class="th1"><label for="subjtxt">동영상 URL</label></th>
			<td class="td1">
				<input type="text" value="" name="url" id="url" class="input" style="width:430px;" maxlength="200" />
			</td>
		</tr>
		<% } %>
		<tr>
			<th class="th1"><label for="fileadd">첨부파일</label></th>
			<td class="td1">
				<div class="filedv1">
			<%
			if (propBean.getMaxFileAttach() > 0) {
				for( int i = 1 ; i <= propBean.getMaxFileAttach(); i++) {
					%>
					<input type="file" name="file<%=i%>" id="file<%=i%>" value="" class="input" style="width:330px;" title="첨부파일<%=i%>" /><span class="f_pad"> <%=propBean.getMaxUploadLimit("MB")%></span><br />
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
			<img src="<%=skinRoot %>/images/btn_ok.gif" alt="확인" onclick="do_submit(document.writeform);" style="cursor:hand" />
			<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName,false)%>"><img src="<%=skinRoot %>/images/btn_cancel.gif" alt="취소" /></a>
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