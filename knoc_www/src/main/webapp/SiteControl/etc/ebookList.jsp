<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.ebook.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="EbookMa" scope="page" class="kr.co.knoc.ebook.EbookManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "기타 관리";  		// 서브 Depth 제목
    String gNavSubName = "etc";				// 서브 Depth 이름
    String gNavDepthTitle1 = "05"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1", "06");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "EBOOK관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String menu = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("menu")));
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")));
	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")));
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	if (menu.equals("")) {
		menu = "1";
	}
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList al = EbookMa.getEbookList(menu, key_gbn, key_word, pp.getNPage(), pp.getNPageSize());		
	
	int count = EbookMa.getEbookListCount(menu, key_gbn, key_word);
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	if(seq < 0){ seq = 1;} // 보안약점 조치 2016.03.21 ECJ
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function goFind()
	{
		var t = document.schform;
		t.submit();
	}	
	function edit(no) {
         	document.bForm.action = 'ebookEdit.jsp';
         	document.bForm.no.value = no;
           	document.bForm.submit();
	}
	function jsWrite() {
		location.href = "ebookWrite.jsp";
	}
	function jsDelete(no) {
		var ff = document.bForm;	    
	    if (confirm("삭제를 하시겠습니까?")) {	
	    	ff.action = "ebookDeleteOk.jsp";
	    	ff.no.value = no;
	        ff.submit();
	
	    }
	}
</script>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="195" valign="top">  
<%@ include file = "left.jsp" %>  
</td>  
<td valign=top>
	<table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td valign="top">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td valign="top">			
			<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > EBOOK관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 기타 관리 > EBOOK관리</span></td>
			</tr>
			<tr>
			<td height="2" colspan="2" bgcolor="EAEAEC"></td>
			</tr>
			</table>
			<table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td></td>
			</tr>
			</table>
			<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">			
			<tr>
			<td class=descBorder_r>
			<input type=button value=' EBOOK등록  ' class=button onClick="jsWrite();">
			</td>
			</tr>        
			</table>
			<table align=center border="0" cellpadding="0" cellspacing="0" width="100%">
<form name=schform method=post action="ebookList.jsp">				
			<tr>
			<td class=descBorder_l>			
			</td>
			<td class=descBorder_r>
			메뉴 :
		      <select name=menu class=select onchange="document.schform.submit();">
		      <option <% if (!menu.equals("") && menu.equals("1")) { %>selected<% } %> value="1">Annual Report</option>
		      <option <% if (!menu.equals("") && menu.equals("2")) { %>selected<% } %> value="2">석유사랑(전자사보)</option>
		      <option <% if (!menu.equals("") && menu.equals("3")) { %>selected<% } %> value="3">만화</option>
		      <option <% if (!menu.equals("") && menu.equals("4")) { %>selected<% } %> value="4">페트로메이션</option>
		      <option <% if (!menu.equals("") && menu.equals("5")) { %>selected<% } %> value="5">석유영상실</option>
		      <option <% if (!menu.equals("") && menu.equals("6")) { %>selected<% } %> value="6">석유만화방</option>
		      <option <% if (!menu.equals("") && menu.equals("7")) { %>selected<% } %> value="7">영문사이트(Annual Report)</option>
		      </select>
			검색구분 :
		      <select name=key_gbn class=select>
		      <option <% if (key_gbn.equals("")) { %>selected<% } %> value="">전체</option>
		      <option <% if (!key_gbn.equals("") && key_gbn.equals("title")) { %>selected<% } %> value="title">제목</option>
		      </select>
		      		
		      <input type=text name=key_word size=15 maxlength=20 value="<%=key_word%>" class=input_re>
			<input type=button value=' 검색 ' class='button' onClick="javascript:goFind();">
			</td>		
			</tr>
			<tr height=10>
			<td></td>
			<td></td>
			</tr>
</form>		
			</table>	
<!-- ROW 시작 -->	
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="bForm" method="post" action="ebookList.jsp">
<input type=hidden name=page value="<%=nowpage%>">	
<input type="hidden" name="no" value="">	
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center width="80">번호</td>
			<td align=center>제목</td>
			<td align=center width="150">표지이미지</td>			
			<td align=center width="150">URL</td>
			<td align=center width="150">관리</td>
			</tr>    
<%  if(count==0) { %>				
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan=5>등록된 자료가 없습니다.</td>
			</tr>
<% 
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			EbookBean eb = (EbookBean)iter.next();
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=seq %></td>
			<td align=center><a href="javascript:edit('<%= eb.getNo() %>')"><%= eb.getTitle() %></a></td>
			<td align=center><% if (eb.getNewImagename() != null && !eb.getNewImagename().equals("")) { %><img src="/upload/EBOOK/<%=eb.getNewImagename() %>" width="130" height="70" /><% } %></td>						
			<td align=center><%=eb.getLink() %></td>
			<td align=center><input type=button value=' 수정' class=button onClick="edit('<%=eb.getNo() %>');"> <input type=button value=' 삭제 ' class=button onClick="jsDelete('<%=eb.getNo() %>');"></td>
			</tr>
<%				
			seq--;
		}
	}
%>				
			</table>
		</td>
		</tr>
</form>		
		</table>
		<br>		
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=EbookMa.getEbookListCount(menu, key_gbn, key_word)%>" />
	<table class="pagezig_table" align="center">
		<tr>
			<td><a href="<%=prevBlock.getAnchor("&menu="+menu+"&key_gbn="+key_gbn+"&key_word="+key_word)%>"><img src="../images/btn_list_first.gif" alt="처음페이지로" align="absmiddle"></a> <a href="<%=prevPage.getAnchor("&menu="+menu+"&key_gbn="+key_gbn+"&key_word="+key_word)%>"><img src="../images/btn_prev_1.gif" alt="이전페이지로" align="absmiddle"></a></td>
			<td class="pagezig">
			<% int ll = 1; %>
			<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
			<% if ( p.getPage() == pp.getNPage()) { %>
			<span><b><%=p.getPage()%></b></span> <% if (ll != pages.size()) {%> / <% } %>
			<% } else { %>
			<a href="<%=p.getAnchor("&menu="+menu+"&key_gbn="+key_gbn+"&key_word="+key_word)%>" class="num01"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> / <% } %> 
			<% } %>
			<% ll++; %>
			</stl:loop>
			</td>
			<td><a href="<%=nextPage.getAnchor("&menu="+menu+"&key_gbn="+key_gbn+"&key_word="+key_word)%>"><img src="../images/btn_next_1.gif" alt="다음페이지로" align="absmiddle"></a> <a href="<%=nextBlock.getAnchor("&menu="+menu+"&key_gbn="+key_gbn+"&key_word="+key_word)%>"><img src="../images/btn_list_last.gif" alt="맨끝페이지로" align="absmiddle"></a></td>
		</tr>
	</table>			
		
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>	