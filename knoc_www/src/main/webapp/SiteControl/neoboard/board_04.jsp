<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.sague.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="Saguemanager" scope="page" class="kr.co.knoc.sague.SagueManager" />

<% request.setCharacterEncoding("euc-kr"); %>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList sague = Saguemanager.getSagueList(pp.getNPage(), pp.getNPageSize());		
	
	int count = Saguemanager.getSaguerListCount();
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	if(seq < 0){ seq = 1;} // 보안약점 조치 2016.03.21 ECJ
%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/

    application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","01");
        
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<jsp:include flush="true" page="../inc/top.jsp" />

<script language=javascript>

	function WriteFn(){
		location.href = "/SiteControl/neoboard/board_04_edit.jsp";
	}

	function GoViewFn(sague_nid){
		document.pform.action="board_04_view.jsp";
		document.pform.sague_nid.value = sague_nid;
		document.pform.submit();
	}
	
</script>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="195" valign="top">  
		<jsp:include flush="true" page="left.jsp"/>    
		</td>
		<td valign="top">
			<table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td valign="top">
					<table width="100%"  border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">
								<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td><img src="../images/admin_left_03.gif" width="11" height="11"> 게시판 관리 > 사규 제·개정 예고</td>
										<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">게시판 관리 > 사규 제·개정 예고</span></td>
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

								<form name="pform" method="post" action="/">
								<input type=hidden name=page value="<%=nowpage%>">	
								<input type="hidden" name="sague_nid" value="">
									<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
										<tr height="25"  bgcolor="E7E7E7">
											<td align=center width="80">번호</td>
											<td align=center > 제·개정 예고 사규명</td>
											<td align=center width="200">게시일</td>
											<td align=center width="80">조회수</td>
										</tr>
									<%  if(count==0) { %> 
										<tr height="25"  bgcolor="#FFFFFF">
										<td align=center colspan=4>등록된 자료가 없습니다.</td>
										</tr>
									<% 
										} else {
											Iterator iter = sague.iterator();
											while(iter.hasNext()){
												SagueBean sb = (SagueBean)iter.next();
									%>
										<tr height="25"  bgcolor="#FFFFFF">
											<td align="center"><%=seq %></td>
											<td align="left">
												<span style="color:brown; margin-right:10px;"></span>
												<a href="#GoView" onclick ="GoViewFn('<%=sb.getSague_nid() %>')"><strong><%=sb.getSubject() %>&nbsp;<font color="red">[<%=sb.getComment_cnt() %>]</font></strong></a>
											</td>
											<td align="center"><%=sb.getRegDateString("yyyy-MM-dd") %></td> 
											<td align="center"><%=sb.getClick_cnt() %></td>
										</tr>
									<%				
												seq--;
											}
										}
									%>	
									</table>
									<br>
									<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="B5B5B5">
										<tr>
											<td width="100px" height="25" bgcolor="#FFFFFF" align="center"></td>
											<td bgcolor="#FFFFFF" align="right"><input type="button" value="등록" style="width:80px; padding-top:4px;" onclick="WriteFn(); return false;"></td>
										</tr>
									</table>	
								</form>	
								
								<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=Saguemanager.getSaguerListCount()%>" />
								<table class="pagezig_table" align="center">
									<tr>
										<td>
											<a href="<%=prevBlock.getAnchor()%>"><img src="../images/btn_list_first.gif" alt="처음페이지로" align="absmiddle"></a> 
											<a href="<%=prevPage.getAnchor()%>"><img src="../images/btn_prev_1.gif" alt="이전페이지로" align="absmiddle"></a>
										</td>
										<td class="pagezig">
										<% int ll = 1; %>
										<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
										<% if ( p.getPage() == pp.getNPage()) { %>
										<span><b><%=p.getPage()%></b></span> <% if (ll != pages.size()) {%> / <% } %>
										<% } else { %>
										<a href="<%=p.getAnchor()%>" class="num01"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> / <% } %> 
										<% } %>
										<% ll++; %>
										</stl:loop>
										</td>
										<td>
											<a href="<%=nextPage.getAnchor()%>"><img src="../images/btn_next_1.gif" alt="다음페이지로" align="absmiddle"></a> 
											<a href="<%=nextBlock.getAnchor()%>"><img src="../images/btn_list_last.gif" alt="맨끝페이지로" align="absmiddle"></a>
										</td>
									</tr>
								</table>
											
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr height=20px>
				
			</tr>
		</table>
	</td>
	</tr>
</table>
<jsp:include flush="true" page="../inc/bottom.jsp"/>