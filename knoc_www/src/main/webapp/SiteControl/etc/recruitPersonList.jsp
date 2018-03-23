<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.recruit.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="RecruitPMa" scope="page" class="kr.co.knoc.recruit.RecruitPersonManager" />
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

	application.setAttribute("gNavMenuDepth1", "08");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "상시인재등록관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")),"8859_1");
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList al = RecruitPMa.getRecruitPersonList(key_gbn, key_word, pp.getNPage(), pp.getNPageSize());		
	
	int count = RecruitPMa.getRecruitPersonListCount(key_gbn, key_word);
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function goFind()
	{
		var t = document.schform;
		t.submit();
	}	
	function edit(no) {
         	document.bForm.action = 'recruitPersonEdit.jsp';
         	document.bForm.no.value = no;
           	document.bForm.submit();
	}
	function jsWrite() {
		location.href = "recruitPersonWrite.jsp";
	}
	function jsDelete(no) {
		var ff = document.bForm;	    
	    if (confirm("삭제를 하시겠습니까?")) {	
	    	ff.action = "recruitPersonDeleteOk.jsp";
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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 상시인재등록관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 기타 관리 > 상시인재등록관리</span></td>
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
			<table align=center border="0" cellpadding="0" cellspacing="0" width="100%">
<form name=schform method=post action="recruitPersonList.jsp">				
			<tr>
			<td class=descBorder_l>			
			</td>
			<td class=descBorder_r>
			검색구분 :
		      <select name=key_gbn class=select>
		      <option <% if (key_gbn.equals("")) { %>selected<% } %> value="">전체</option>
		      <option <% if (!key_gbn.equals("") && key_gbn.equals("name")) { %>selected<% } %> value="name">이름</option>
		      <option <% if (!key_gbn.equals("") && key_gbn.equals("bunya")) { %>selected<% } %> value="bunya">분야</option>
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
<form name="bForm" method="post" action="recruitPersonList.jsp">
<input type=hidden name=page value="<%=nowpage%>">	
<input type="hidden" name="no" value="">	
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center width="60">번호</td>
			<td align=center width="80">이름</td>
			<td align=center>E-mail</td>
			<td align=center width="80">연락처</td>
			<td align=center width="80">최종학력</td>
			<td align=center width="80">최종학교</td>
			<td align=center width="80">분야</td>
			<td align=center width="100">등록일</td>
			<td align=center width="120">관리</td>
			</tr>    
<%  if(count==0) { %>				
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan=9>등록된 자료가 없습니다.</td>
			</tr>
<% 
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			RecruitPersonBean rpb = (RecruitPersonBean)iter.next();
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=seq %></td>
			<td align=center><%=rpb.getName() %></td>			
			<td align=center><%=rpb.getEmail() %></td>
			<td align=center><%=rpb.getMobile() %></td>
			<td align=center><%=rpb.getAcademic() %></td>
			<td align=center><%=rpb.getSchool() %></td>
			<td align=center><%=rpb.getBunya() %></td>
			<td align=center><%=rpb.getRegDateString("yyyy-MM-dd") %></td>
			<td align=center><input type=button value=' 수정' class=button onClick="edit('<%=rpb.getNo() %>');"> <input type=button value=' 삭제 ' class=button onClick="jsDelete('<%=rpb.getNo() %>');"></td>
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
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=RecruitPMa.getRecruitPersonListCount(key_gbn,key_word)%>" />
	<table class="pagezig_table" align="center">
		<tr>
			<td><a href="<%=prevBlock.getAnchor("&key_gbn="+key_gbn+"&key_word="+key_word)%>"><img src="../images/btn_list_first.gif" alt="처음페이지로" align="absmiddle"></a> <a href="<%=prevPage.getAnchor("&key_gbn="+key_gbn+"&key_word="+key_word)%>"><img src="../images/btn_prev_1.gif" alt="이전페이지로" align="absmiddle"></a></td>
			<td class="pagezig">
			<% int ll = 1; %>
			<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
			<% if ( p.getPage() == pp.getNPage()) { %>
			<span><b><%=p.getPage()%></b></span> <% if (ll != pages.size()) {%> / <% } %>
			<% } else { %>
			<a href="<%=p.getAnchor("&key_gbn="+key_gbn+"&key_word="+key_word)%>" class="num01"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> / <% } %> 
			<% } %>
			<% ll++; %>
			</stl:loop>
			</td>
			<td><a href="<%=nextPage.getAnchor("&key_gbn="+key_gbn+"&key_word="+key_word)%>"><img src="../images/btn_next_1.gif" alt="다음페이지로" align="absmiddle"></a> <a href="<%=nextBlock.getAnchor("&key_gbn="+key_gbn+"&key_word="+key_word)%>"><img src="../images/btn_list_last.gif" alt="맨끝페이지로" align="absmiddle"></a></td>
		</tr>
	</table>			
		
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>	