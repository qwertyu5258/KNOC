<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.sitectrl.mgr.*"%>
<%@ page import = "kr.co.knoc.division.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrH" scope="page" class="kr.co.knoc.sitectrl.mgr.MgrHelper" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "관리자관리";  		// 서브 Depth 제목
    String gNavSubName = "manager";				// 서브 Depth 이름
    String gNavDepthTitle1 = "01"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "관리자정보/권한설정";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")),"8859_1");
	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")),"8859_1");
	
	pp.setPage(nowpage);
	pp.setPageSize("20");
	pp.setPageUrl("");
	ArrayList al = MgrH.getAdminList(key_gbn, key_word, pp.getNPage(), pp.getNPageSize());		
	
	int count = MgrH.getAdminListCount(key_gbn, key_word);
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function goFind()
	{
		var t = document.schform;
		t.submit();
	}	
	function edit(user_id) {
         	document.bForm.action = 'adminEdit.jsp';
          	document.bForm.userid.value = user_id;
           	document.bForm.submit();
	}
	function jsWrite() {
		location.href = "adminWrite.jsp";
	}
	function jsDelete() {
		var ff = document.bForm;
	    if (!isSelect(document.bForm, "uid")) {
	        alert("삭제할 게시물을 선택하세요.");
	        return;
	    }
	    if (confirm("삭제를 하시겠습니까?")) {	
	    	ff.action = "adminDeleteOk.jsp";
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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 관리자 관리 > 관리자정보/권한설정</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">관리자 관리 > 관리자정보/권한설정</span></td>
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
<form name=schform method=post action="adminList.jsp">			
			<tr>
			<td class=descBorder_r>
			<input type=button value=' 관리자 등록 ' class=button onClick="jsWrite();">
			</td>
			</tr>        
			</table>
			<br>
			<table align=center border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			<td class=descBorder_l>			
			</td>
			<td class=descBorder_r>
			검색구분 :
		      <select name=key_gbn class=select>
		      <option <% if (key_gbn.equals("")) { %>selected<% } %> value="">전체
		      <option <% if (!key_gbn.equals("") && key_gbn.equals("id")) { %>selected<% } %> value="id">아이디</option>
		      <option <% if (!key_gbn.equals("") && key_gbn.equals("name")) { %>selected<% } %> value="name">성명</option>
		      <option <% if (!key_gbn.equals("") && key_gbn.equals("email")) { %>selected<% } %> value="email">이메일</option>
		      </select>
		      		
		      <input type=text name=key_word size=15 maxlength=20 value="<%=key_word%>" class=input_re>
			<input type=button value=' 검색 ' class='button' onClick="javascript:goFind();">
			</td>
			<td style="text-align:right;">
				<input type=button value='엑셀다운로드' class=button onClick="location.href='/SiteControl/manager/adminExcel.jsp';" />
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
<form name="bForm" method="post" action="adminList.jsp">
<input type=hidden name=page value="<%=nowpage%>">		
<input type="hidden" name="key_word" value="<%=key_word%>">	
<input type="hidden" name="key_gbn" value="<%=key_gbn%>">	
<input type="hidden" name="userid" value="">	
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center width="60"><a href="JavaScript:selectChkAll(document.bForm,'uid');">선택</a></td>
			<td align=center width="80">아이디</td>
			<td align=center width="80">성명</td>
			<td align=center width="100">부서명</td>
			<td align=center width="100">전화번호</td>
			<td align=center width="100">휴대폰</td>
			<td align=center width="150">이메일</td>
			<td align=center width="150">최종로그인IP</td>
			<td align=center width="150">최종로그인일시</td>	
			<td align=center>비고</td>	
			</tr>    
<%  if(count==0) { %>				
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan="10">등록된 관리자가 없습니다.</td>
			</tr>
<% 
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			MgrDO mdo = (MgrDO)iter.next();
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><input type="checkbox" name="uid" value="<%=mdo.getId() %>"></td>			
			<td align=center><a href="javascript:edit('<%= mdo.getId() %>')"><%= mdo.getId() %></a></td>
			<td align=center><%=mdo.getName()%></td>
			<td align=center><%=DivisionListManager.getDName(mdo.getDCode())%></td>
			<td align=center><%=etcutil.checkNull(mdo.getPhone())%></td>
			<td align=center><%=etcutil.checkNull(mdo.getMobile())%></td>
			<td align=center><%=etcutil.checkNull(mdo.getEmail())%></td>
			<td align=center><%=etcutil.checkNull(mdo.getIp())%></td>
			<td align=center><%=etcutil.checkNull(mdo.getLastLoginDateTime())%></td>
			<td align=center><%=etcutil.checkNull(mdo.getEtc())%></td>
			</tr>
<%				
		}
	}
%>				
			</table>
		</td>
		</tr>
</form>		
		</table>
		<br>
		<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">		
		<tr>
		<td align="right">
		<input type=button value=' 삭제 ' class=button onClick="jsDelete();">
		</td>
		</tr>        
		</table>
		<br>		
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=MgrH.getAdminListCount(key_gbn,key_word)%>" />
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