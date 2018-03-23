<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.popup.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="PopupMa" scope="page" class="kr.co.knoc.popup.PopupNewManager" />
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

	application.setAttribute("gNavMenuDepth1", "05");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "팝업관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList al = PopupMa.getPopupNewList(pp.getNPage(), pp.getNPageSize());		
	
	int count = PopupMa.getPopupNewListCount();
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */
	if(seq < 0){seq=1;}
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function goFind()
	{
		var t = document.schform;
		t.submit();
	}	
	function edit(no) {
         	document.bForm.action = 'popupNewEdit.jsp';
         	document.bForm.no.value = no;
           	document.bForm.submit();
	}
	function jsWrite() {
		location.href = "popupNewWrite.jsp";
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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 팝업관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 기타 관리 > 팝업관리</span></td>
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
			<input type=button value=' 팝업등록  ' class=button onClick="jsWrite();">
			</td>
			</tr>        
			</table>	
			<br>		
<!-- ROW 시작 -->	
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="bForm" method="post" action="popupNewList.jsp">
<input type=hidden name=page value="<%=nowpage%>">	
<input type="hidden" name="no" value="">	
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center width="80">번호</td>
			<td align=center>제목</td>
			<td align=center width="150">기간</td>
			<td align=center width="80">등록일</td>
			</tr>    
<%  if(count==0) { %>				
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan=4>등록된 자료가 없습니다.</td>
			</tr>
<% 
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			PopupNewBean pnb = (PopupNewBean)iter.next();
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=seq %></td>			
			<td align=center><a href="javascript:edit('<%= pnb.getNo() %>')"><%= pnb.getTitle() %></a></td>
			<td align=center><%=StringUtil.getDateType(pnb.getStartDate(),"-") %> ~ <%=StringUtil.getDateType(pnb.getEndDate(),"-") %></td>
			<td align=center><%=pnb.getRegDateString("yyyy-MM-dd") %></td>
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
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=PopupMa.getPopupNewListCount()%>" />
	<table class="pagezig_table" align="center">
		<tr>
			<td><a href="<%=prevBlock.getAnchor("")%>"><img src="../images/btn_list_first.gif" alt="처음페이지로" align="absmiddle"></a> <a href="<%=prevPage.getAnchor("")%>"><img src="../images/btn_prev_1.gif" alt="이전페이지로" align="absmiddle"></a></td>
			<td class="pagezig">
			<% int ll = 1; %>
			<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
			<% if ( p.getPage() == pp.getNPage()) { %>
			<span><b><%=p.getPage()%></b></span> <% if (ll != pages.size()) {%> / <% } %>
			<% } else { %>
			<a href="<%=p.getAnchor("")%>" class="num01"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> / <% } %> 
			<% } %>
			<% ll++; %>
			</stl:loop>
			</td>
			<td><a href="<%=nextPage.getAnchor("")%>"><img src="../images/btn_next_1.gif" alt="다음페이지로" align="absmiddle"></a> <a href="<%=nextBlock.getAnchor("")%>"><img src="../images/btn_list_last.gif" alt="맨끝페이지로" align="absmiddle"></a></td>
		</tr>
	</table>			
		
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>	