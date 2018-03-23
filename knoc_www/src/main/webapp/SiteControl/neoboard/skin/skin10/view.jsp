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
<script language="javascript" src="/neoboard/js/comm.js"></script>
<script type="text/javascript">
function resizeImage(img) {
	var oHeight = img.height;
	var oWidth = img.width;
	if(oWidth > 580) {
		img.width = 580;
		img.height = oHeight * (580 / oWidth);
	}
}

function PasswdPop(URL) {		
	<% if (checkid && (user_id == null || user_id.equals("") || user_id.equals("guest"))) { %>
		alert("로그인 후 이용 가능하십니다.");	
	<% } else if (!manager.checkManager(authBean, propBean, userSession) && !checkid) { %>
		window.open("","PasswdPop","width=302px,height=151px,scrollbars=no");
		document.formPop.callback.value = URL;	
		document.formPop.submit();	
	<% } else { %>
		location.href = URL;
	<% } %>		
}
</script>

<form name="formPop" action="/neoboard/popup_passwd.jsp" method="post" target="PasswdPop">	
	<input type="hidden" name="callback" value="" />
	<input type="hidden" name="bid" value="<%=propBean.getBoardID()%>" />
	<input type="hidden" name="bno" value="<%=article.getNo()%>" />
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
		<% if (!manager.checkManager(authBean, propBean, userSession) && !checkid) { %>
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
		<% if (!manager.checkManager(authBean, propBean, userSession) && !checkid) { %>
		if(f.passwd.value == "" ) {
			alert("비밀번호를 입력해 주세요.");
			f.passwd.focus();
			return false;
		}
		<% } %>
		if(confirm("글을 삭제하시겠습니까?"))	 {
			f.submit();
			return;
		}
	}
	</script>	
	
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
		<caption><%=propBean.getBoardName() %> 패스워드</caption>
		<colgroup><col width="130px" /><col width="150px" /><col width="70px" /></colgroup>
			<tr>
				<th>비밀번호</th>
				<th><input type="password" value="" name="passwd" id="userpw" class="input" title="비공개글입니다. 비밀번호를 입력해주시기 바랍니다." /></th>
				<th><input type="image" src="<%=skinRoot %>/images/btn_ok.gif" alt="확인" /></th>
			</tr>
</form>			
		</table>			
</div>
<% } %>		

	<table cellspacing="0" cellpadding="0" class="viewtype" summary="해당게시판은 <%=propBean.getBoardName() %>의 상세내용을 보여줍니다">
	<caption><%=propBean.getBoardName() %> 상세보기</caption>
	<colgroup><col width="100px" /><col width="260px" /><col width="100px" /><col width="260px" /></colgroup>
		<tr>
			<th class="th1">제&nbsp;&nbsp;목</th>
			<td class="td1" colspan="3"><%=StringUtil.replaceInString(article.getSubject(),"[답변]","<span class=font_12px_20_bold>[답변]</span>")%></td>
		</tr>
        <tr>
			<th class="th1">성명</th>
			<td class="td1"><%=article.getName()%></td>
			<th class="th2">등록일</th>
			<td class="td1"><span title="<%=article.getRegDateString("yyyy년 MM월 dd일 HH시 mm분 ss초")%>"><%=article.getRegDateString("yyyy-MM-dd")%></span></td>
		</tr>
		<tr>
			<th class="th1">사진</th>
			<td class="td1" colspan="5">
<% 	if ( article.getFilecnt() > 0 ) { 
		AttachFiles afs = article.getFiles(); 
		for(int k = 0 ; k < afs.size(); k++) { 
			AttachFile af = afs.getAttachFile(k);
%>
					<a href="<%=Property.SERVLET_ROOT%>/Download?num=<%=pageBean.getNum()%>&fno=<%=af.getNo()%>&bid=<%=propBean.getBoardID()%>&callback=<%=pageBean.getPageUrl()%>&ses=<%=sessionName%>"><img src="<%=af.makeMimeIcon(skinRoot + "/images")%>" width="16" height="16" border=0 alt="<%=af.getFileName()%> : <%=af.getFileSize("HB")%>" align=absmiddle> <%=af.getFileName()%> : <%=af.getFileSize("HB")%></a><br>
<%					
		} 	
	} else { %>
					없음
<%	} %>			
				<!-- <img src="/images/common/ico_hwp.gif" alt="한글첨부파일" /><a href="#">신년사.hwp</a> <span class="gab">;</span>
				<img src="/images/common/ico_hwp.gif" alt="한글첨부파일" /><a href="#">신년사_2.hwp</a> -->
			</td>
		</tr>
<!-- 게시물 중복 등록 -->			
<% if(Property.isViewable("useDouble",authBean,propBean,userSession)) { %>		
<script language=javascript>		
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
			<th class="th1">게시물이동</th>
			<td class="td1" colspan="3">
			<select name="movebid" class="schsel">			
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
			</select> <img src="<%=skinRoot %>/images/btn_mi.gif" align="top" alt="이동" onclick="move()" style="cursor:hand" align="absmiddle" />
			</td>
		</tr>
</form>		
<% } %>	
<!-- 게시물 중복 등록 끝 -->	
	</table>
	

	<div class="boardbtm mtm10">
		<!--// prev/next list: start //-->
<%
	Article prevArticle = article.getPrevArticle();
	Article nextArticle = article.getNextArticle(); 
%>		
		<table cellspacing="0" cellpadding="0" class="viewtype2" summary="<%=propBean.getBoardName() %>의 이전다음글을 보여줍니다">
		<caption>이전/다음글</caption>
		<colgroup><col width="95px" /><col width="605px" /></colgroup>
			<tr>
				<th><img src="<%=skinRoot %>/images/ico_prevtxt.gif" alt="" /> 이전글</th>
				<td><% if ( prevArticle != null) { %><a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(prevArticle.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName,false)%>"><%=prevArticle.getSubject()%></a><% } else { %>이전글 없음<% } %></td>
			</tr>
			<tr>
				<th><img src="<%=skinRoot %>/images/ico_nexttxt.gif" alt="" /> 다음글</th>
				<td><% if ( nextArticle != null) { %><a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString(nextArticle.getNo(),"view",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&ses="+sessionName,false)%>"><%=nextArticle.getSubject()%></a><% } else { %>다음글 없음<% } %></td>
			</tr>
		</table>
		<!--// prev/next list: end //-->
	
	<div class="boardbtm mtm10">
		<div class="btnsec">
			<% if(Property.isViewable("edit",authBean,propBean,userSession)) { %><img src="<%=skinRoot %>/images/btn_modi.gif" alt="수정" onclick="PasswdPop('<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("edit",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>');" style="cursor:hand" /><% } %>
			<% if(Property.isViewable("delete",authBean,propBean,userSession,article.getId())) { %><img src="<%=skinRoot %>/images/btn_del.gif" alt="삭제" onclick="deleteArticle();" style="cursor:hand" /><% } %>
	        <a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;psize="+propBean.getListPerPage(),false)%>"><img src="<%=skinRoot %>/images/btn_list.gif" alt="목록" /></a>
	        <% if (manager.checkManager(authBean, propBean, userSession) && article.getIsDelete().equals("Y")) { %><img src="<%=skinRoot %>/images/btn_reset.gif" alt="복원" class="icon" onclick="restoreArticle();" style="cursor:hand" /><% } %>	
			<% if (manager.checkManager(authBean, propBean, userSession)) { %><img src="<%=skinRoot %>/images/btn_rog.gif" alt="로그보기" class="icon" onclick="popLog('<%=article.getNo()%>','<%=propBean.getBoardID()%>');" style="cursor:hand" /><% } %>
		</div>
	</div>
</div>	


			
	
												
