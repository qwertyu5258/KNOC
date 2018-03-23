<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*,com.neoboard.*,com.neoboard.session.*,com.neoboard.util.*" %>
<%@ page import="java.util.Vector" %>
<%@ page import="kr.co.knoc.division.DivisionListManager"%>
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
	
	String zipno1 = "";
	if (article.getZipcode() != null && !article.getZipcode().equals("")) {
		zipno1 = article.getZipcode();		
	}
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
	<% //if (manager.checkID(propBean.getBoardID(), Integer.toString(no)) && checkid && (user_id == null || user_id.equals("") || user_id.equals("guest"))) { %>
		//alert("로그인 후 이용 가능하십니다.");	
	<% //} else if (!manager.checkManager(authBean, propBean, userSession) && !checkid) { %>
		window.open("","PasswdPop","width=302px,height=151px,scrollbars=no");
		document.formPop.callback.value = URL;	
		document.formPop.submit();	
	<% //} else { %>
		//location.href = URL;
	<% //} %>		
}
//]]>
</script>

<form name="formPop" action="/neoboard/popup_passwd.jsp" method="post" target="PasswdPop">	
	<input type="hidden" name="callback" value="" />
	<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />
	<input type="hidden" name="bno" value="<%=article.getNo()%>" />
	<input type="hidden" name="mode" value="edit" />
</form>	


<!-- view -->
<div id="boardsec">

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
		<% //if (!manager.checkID(propBean.getBoardID(), Integer.toString(no)) && !manager.checkManager(authBean, propBean, userSession) && !checkid) { %>
			document.all.articledelete.style.pixelLeft = event.clientX-200;
			document.all.articledelete.style.pixelTop = event.clientY + document.documentElement.scrollTop;
			document.all.articledelete.style.visibility = "visible";
		<% //} else { %>
			//deleteSubmit(document.deleteform);
		<% //} %>
	}
	function deleteCancel() {
		document.all.articledelete.style.visibility = "hidden";
	}
	function deleteSubmit(f) {	
		<%//if (!manager.checkManager(authBean, propBean, userSession) && !checkid) { %>
		if(f.passwd.value == "" ) {
			alert("비밀번호를 입력해 주세요.");
			f.passwd.focus();
			return false;
		}
		<% //} %>
		if(confirm("글을 삭제하시겠습니까?"))	 {
			f.submit();
			return;
		}
	}
	</script>	
	
<div id="articledelete" style="left:0px; top:1px; z-index:1; visibility:hidden;background:#FFFFFF;">
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
		<caption><%=propBean.getBoardName() %> 패스워드</caption>
		<colgroup><col width="130px" /><col width="150px" /><col width="70px" /></colgroup>
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password" value="" name="passwd" id="userpw" class="input" title="비공개글입니다. 비밀번호를 입력해주시기 바랍니다." /></td>
				<td><input type="image" src="<%=skinRoot %>/images/btn_ok.gif" alt="확인" /></td>
			</tr>
</form>			
		</table>			
</div>
<% } %>		

	<table cellspacing="0" cellpadding="0" class="viewtype" summary="해당게시판은 <%=propBean.getBoardName() %>의 상세내용을 보여줍니다">
	<caption><%=propBean.getBoardName() %> 상세보기</caption>
	<colgroup><col width="13%" /><col width="37%" /><col width="13%" /><col width="37%" /></colgroup>
		<tr>
			<th scope="row" class="th1">처리부서</th>
			<td class="td1"><%=DivisionListManager.getDName(article.getBuse()) %></td>
			<th scope="row" class="th1">처리상태</th>
			<td class="td1"><% if (article.getStatus() == null || article.getStatus().equals("")) { %>처리중<% } else { %><%=EtcUtil.checkNull(article.getStatus()) %><% } %></td>
		</tr>
		<tr>
			<th scope="row" class="th1">성명</th>
			<td class="td1"><%=article.getName() %></td>
			<th scope="row" class="th1">등록일</th>
			<td class="td1"><span title="<%=article.getRegDateString("yyyy년 MM월 dd일 HH시 mm분 ss초")%>"><%=article.getRegDateString("yyyy-MM-dd")%></span></td>
		</tr>
		<tr>
			<th scope="row" class="th1">전화번호</th>
			<td class="td1"><%=article.getPhone() %></td>
			<th scope="row" class="th1">이메일</th>
			<td class="td1"><%=EtcUtil.checkNull(article.getAnsEmail()) %></td>
		</tr>
		<tr>
			<th scope="row" class="th1">주소</th>
			<td class="td1" colspan="3">[<%=zipno1 %>] <%=article.getAddr1() %> <%=article.getAddr2() %></td>
		</tr>
		<% if ( propBean.getUseSecret().equals("1")) { %>		
		<tr>
			<th scope="row" class="th1">공개형태</th>
			<td class="td1" colspan="3"><%if(article.getSecret().equals("1")){%>비공개<% } else { %>공개<% } %></td>
		</tr>
		<% } %>
		<tr>
			<th scope="row" class="th1">분류</th>
			<td class="td1" colspan="3"><%=article.getContGubun() %></td>
		</tr>
		<tr>
			<th scope="row" class="th1">제목</th>
			<td class="td1" colspan="3"><%=StringUtil.replaceInString(article.getSubject(),"[답변]","<span class=font_12px_20_bold>[답변]</span>")%></td>
		</tr>
		<tr>
			<th scope="row" class="th1">내용</th>
			<td class="td1" colspan="3">
<%
	String content = StringUtil.replaceInString(article.getContent(),"[답변]","<span class=font_12px_20_bold>[답변]</span>");
	content = StringUtil.replaceInString(content,"<BR />","<br />");
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
		<tr>
			<th scope="row" class="th1">첨부파일</th>
			<td class="td1" colspan="3">
<% 	if ( article.getFilecnt() > 0 ) { 
		AttachFiles afs = article.getFiles(); 
		for(int k = 0 ; k < afs.size(); k++) { 
			AttachFile af = afs.getAttachFile(k);
%>
					<a href="<%=Property.SERVLET_ROOT%>/Download?num=<%=pageBean.getNum()%>&amp;fno=<%=af.getNo()%>&amp;bid=<%=propBean.getBoardID()%>&amp;callback=<%=pageBean.getPageUrl()%>&amp;ses=<%=sessionName%>"><img src="<%=af.makeMimeIcon(skinRoot + "/images")%>" width="16" height="16" border="0" alt="<%=af.getFileName()%> : <%=af.getFileSize("HB")%>" style="vertical-align:middle;" /> <%=af.getFileName()%> : <%=af.getFileSize("HB")%></a><br />
<% 		
		} 	
	} else { %>
					없음
<%	} %>			
			</td>
		</tr>	
<!-- 게시물 중복 등록 -->			
<% if(Property.isViewable("useDouble",authBean,propBean,userSession)) { %>		
<script type="text/javascript">		
	function move() {
		if (document.moveform.movebid[0].selected) {
			alert("게시판명을 선택하여 주십시오.");			
		} else {
			document.moveform.submit();
		}
	}
</script>		
<form name="moveform" method="post" action="<%=EtcUtil.SSL_DOMAIN_URL%><%=Property.SERVLET_ROOT%>/MoveArticle">
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
		<tr>
			<th scope="row" class="th1"><label for="movebid">게시물이동</label></th>
			<td class="td1" colspan="3">
			<select name="movebid" id="movebid" class="schsel">			
			<option value="">::게시판명::</option>
<%
	Vector vNeoboardPropery = new Vector();
	vNeoboardPropery = prop.selectboardName(propBean.getBoardID(),propBean.getBoardType());
	if(vNeoboardPropery.isEmpty()) {
	} else {
		for(int i = 0 ;i < vNeoboardPropery.size() ; i++) {
			Property propB = (Property)vNeoboardPropery.elementAt(i);			
%>		
			<option value="<%=propB.getBoardID()%>"><%=propB.getBoardName()%></option>
<%
		}	
	}
%>			
			</select> <img src="<%=skinRoot %>/images/btn_mi.gif" align="top" alt="이동" onclick="move()" style="cursor:pointer" align="absmiddle" />
			</td>
		</tr>
</form>		
<% } %>	
<!-- 게시물 중복 등록 끝 -->			
	</table>

<!-- 덧글 사용가능 게시판 일 경우 -->
<% if ( propBean.getUseComment().equals("1")) { %>				
<script type="text/javascript">
	//<![CDATA[			
	function chkReset(o) {
		o.cname.style.backgroundImage = '';
		o.passwd.style.backgroundImage = '';
	}	
	function checkcomment(f) {
		var f = document.commentform;
		if (f.cname.value == "") {
			alert("이름을 입력하여 주십시오.");
			f.cname.focus();
		<% if (user_id.equals("") || user_id.equals("guest")) { %>
		} else if (f.passwd.value == "") {
			alert("비밀번호를 입력하여 주십시오.");
			f.passwd.focus();
		<% } %>
		} else if (f.comment.value == "") {
			alert("내용을 입력하여 주십시오.");
			f.comment.focus();
		} else {
			f.submit();
		}		
	}
	
	function text_check(total){
	 	// total : 총 문자길이
	 	var obj = document.commentform.comment
	 	var len = obj.value.length;
	 	var count = 0;
	 	var one_ch="";
	 	var total2 = 0;
	 	for (i = 0; i < len ; i++){
	    	one_ch = obj.value.charAt(i);    //한문자만 추출
	     	if (escape(one_ch).length > 4) {
	         	count = count + 2;   //한글
	     	}else {
	        	count = count + 1;   //영문
	     	}
	 	}
	 	total2 = Math.floor(total/2);
	 	if (count > total) {
	     	alert("입력하신 내용은 한글 "+total2+", 영문 "+total+"자까지 쓰실 수 있습니다.\n\n문자 수를 확인하여 주시기 바랍니다.");
	  		obj.value = obj.value.substr(0,total);
	  		obj.focus();
	  		return false;
	 	}
	}
	//]]
>
</script>		
	<div class="replesec">
		<ul class="replul">
<%
		Comments cmts = article.getComments();
		for(int i = 0 ; i < cmts.size() ; i++) {
			Comment cmt = cmts.getComment(i);
			boolean checkCmtId = manager.checkCommentID(propBean.getBoardID(), Integer.toString(cmt.getNo()));
%>		
			<li>
				<div class="rpname"><img src="<%=skinRoot %>/images/ico_arrow.gif" alt="" /> <%=cmt.getName()%> :</div>
				<div class="rptxt"><%=cmt.getComment()%> <img src="/images/board/btn_reple_del.gif" alt="삭제" <% if (!checkCmtId) { %>onclick="deleteCmt(<%=cmt.getNo()%>);"<% } else { %>onclick="deleteCmtSubmit2(<%=cmt.getNo()%>);"<% } %> style="cursor:pointer" /></a></div>
			</li>
<%		} %>	
		</ul>
<form name="commentform" method="post" action="<%=EtcUtil.SSL_DOMAIN_URL%><%=Property.SERVLET_ROOT%>/AddComment" >
<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />		
<input type="hidden" name="callback" value="<%=pageBean.getPageUrl()%>" />
<input type="hidden" name="ses" value="<%=sessionName%>" />
<input type="hidden" name="num" value="<%=article.getNo()%>" />
<input type="hidden" name="page" value="<%=pageBean.getPage()%>" />
<input type="hidden" name="mode" value="<%=pageBean.getPageMode()%>" />
<% 
	for(int i = 0 ; i < schBean.getSearchParam().size(); i++) { 
	SearchParam sp = (SearchParam)schBean.getSearchParam().get(i);
%>
<input type="hidden" name="field" value="<%=sp.getField()%>" />
<input type="hidden" name="text" value="<%=sp.getText()%>" />
<% } %>
<input type="hidden" name="dir" value="<%=schBean.getDir()%>" />
<input type="hidden" name="order" value="<%=schBean.getOrder()%>" />	
<input type="hidden" name="grp" value="<%=schBean.getGroup()%>" />		
<input type="hidden" name="psize" value="<%=propBean.getListPerPage()%>" />		
		<div class="replwrite">
			<p>
				<label for="replname">이름 :</label> <input type="text" value="<%= userSession==null ? "":userSession.getUserName()%>" maxlength="9" name="cname" id="guestname" class="input" style="width:80px;" />
			</p>
			<% if (userSession == null || userSession.getUserID() == null || userSession.getUserID().equals("") || userSession.getUserID().equals("guest")) { %>
			<p>
				<label for="replpwd">비밀번호 :</label> <input type="password" name="passwd" id="guestpasswd" value="" class="input" maxlength="10" style="width:80px;" />
			</p>
			<% } %>
			<div class="reptxt">
				<div class="repdvleft">
					<label for="comment" class="nlabel">덧글입력</label>
					<textarea name="comment" id="comment" maxlength="100" onkeyup="text_check('100')" ></textarea>
				</div>
				<div class="repdvright"><img src="<%=skinRoot %>/images/btn_reple_wt.gif" alt="덧글쓰기" onclick="checkcomment();" style="cursor:pointer" /></a></div>
			</div>
		</div>
</form>		
	</div>
	
<script type="text/javascript">
function deleteCmt(cno) {
	document.cmtdeleteform.cno.value = cno;
<% if (!manager.checkManager(authBean, propBean, userSession)) { %>
	document.all.cmtdelete.style.pixelLeft = event.clientX + 5;
	document.all.cmtdelete.style.pixelTop = event.clientY + document.documentElement.scrollTop;
	document.all.cmtdelete.style.visibility = "visible";
<% } else { %>
	deleteCmtSubmit(document.cmtdeleteform);
<% } %>
	
}
function deleteCmtCancel() {
	document.all.cmtdelete.style.visibility = "hidden";
}
function deleteCmtSubmit(f) {
<% if (!manager.checkManager(authBean, propBean, userSession)) { %>
	if(f.passwd.value == "" ) {
		alert("비밀번호를 입력해 주세요.");
		f.passwd.focus();
		return false;
	}
<% } %>
	if(confirm("댓글을 삭제하시겠습니까?"))	 {
		f.submit();
		return;
	}
}
function deleteCmtSubmit2(cno) {
	document.cmtdeleteform.cno.value = cno;
	if(confirm("댓글을 삭제하시겠습니까?"))	 {
		document.cmtdeleteform.submit();
	}
}
</script>		
<div id="cmtdelete" style="position:absolute; left:0px; top:1px; z-index:1; visibility:hidden;background:#ffffff;">				
			
	<table cellspacing="0" cellpadding="0" class="listtype_pwd" summary="<%=propBean.getBoardName() %>은 패스워드입니다.">
<form name="cmtdeleteform" method="post" action="<%=EtcUtil.SSL_DOMAIN_URL%><%=Property.SERVLET_ROOT%>/DeleteComment" onsubmit="deleteCmtSubmit(this); return false;">
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
<input type="hidden" name="cno" value="" />					
		<caption><%=propBean.getBoardName() %> 패스워드</caption>
		<colgroup><col width="130px" /><col width="150px" /><col width="70px" /></colgroup>
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password" value="" name="passwd" id="userpw" class="input" title="비공개글입니다. 비밀번호를 입력해주시기 바랍니다." /></td>
				<td><input type="image" src="<%=skinRoot %>/images/btn_ok.gif" alt="확인" /></td>
			</tr>
</form>			
		</table>				
</div>
<% } %>								
<!-- //댓글-->		
		
<!-- 답변 시작 -->
<% if (article.getBuse() != null && !article.getBuse().equals("")) { %>				
		<table cellspacing="0" cellpadding="0" class="viewtype" summary="해당게시판에 게시물을 등록합니다">
		<caption>게시물등록</caption>
		<colgroup><col width="720px" /></colgroup>
			<tr>
				<th class="th3"><img src="/images/board/6-1viewte.gif" alt="답변" /></th>
			</tr>
		</table>

		<table cellspacing="0" cellpadding="0" class="viewtype" summary="해당게시판에 게시물을 등록합니다">
		<caption>게시물등록</caption>
		<colgroup><col width="13%" /><col width="37%" /><col width="13%" /><col width="37%" /></colgroup>
			<tr>
				<th scope="row" class="th1">답변내용</th>
				<td class="td1" colspan="3"><%=StringUtil.replaceInString(EtcUtil.checkNull(article.getAnswer()),"<BR />","<br />")%></td>
			</tr>
			<tr>
				<th scope="row" class="th1">첨부파일</th>
				<td class="td1" colspan="3">
<% 	 
	AttachFiles afs = article.getAnsFiles();
	if ( afs.size() > 0 ) {
		for(int k = 0 ; k < afs.size(); k++) { 
			AttachFile af = afs.getAttachFile(k);
%>
					<a href="<%=Property.SERVLET_ROOT%>/Download?num=<%=pageBean.getNum()%>&amp;fno=<%=af.getNo()%>&amp;bid=<%=propBean.getBoardID()%>&amp;callback=<%=pageBean.getPageUrl()%>&amp;ses=<%=sessionName%>"><img src="<%=af.makeMimeIcon(skinRoot + "/images")%>" width="16" height="16" border="0" alt="<%=af.getFileName()%> : <%=af.getFileSize("HB")%>" style="vertical-align:middle;" /> <%=af.getFileName()%> : <%=af.getFileSize("HB")%></a><br />
<% 		
		} 	
	} else { %>
					없음
<%	} %>
				</td>
			</tr>
		</table>
<% } %>
<!-- 답변 끝 -->	
	
	<div class="boardbtm">
		<div class="btnsec">
		    <% if(Property.isViewable("reply",authBean,propBean,userSession) && !article.getNotice().equals("1")) { %><a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("reply",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>"><img src="<%=skinRoot %>/images/btn_answer.gif" alt="답글" /></a><% } %>
			<% if(Property.isViewable("edit",authBean,propBean,userSession)) { %><a href="#" onclick="PasswdPop('<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("edit",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>'); return false;"><img src="<%=skinRoot %>/images/btn_modi.gif" alt="수정" /></a><% } %>
			<% if(Property.isViewable("delete",authBean,propBean,userSession,article.getId())) { %><a href="#" onclick="deleteArticle();"><img src="<%=skinRoot %>/images/btn_del.gif" alt="삭제" /></a><% } %>
	        <a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage()+"&amp;pass="+request.getParameter("passwd")+"&amp;name="+article.getName()+"&amp;bno="+article.getNo(),false)%>"><img src="<%=skinRoot %>/images/btn_list.gif" alt="목록" /></a>
		</div>
	</div>
</div>	


			
	
												
