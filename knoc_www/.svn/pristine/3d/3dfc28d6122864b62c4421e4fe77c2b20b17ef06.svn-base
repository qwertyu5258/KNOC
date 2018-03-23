<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.sague.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="Saguemanager" scope="page" class="kr.co.knoc.sague.SagueManager" />
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","07");
	application.setAttribute("gNavMenuDepth4","04");	
//	application.setAttribute("gNavMenuDepth3","01"); 경영공시 메뉴개편
//	application.setAttribute("gNavMenuDepth4","08");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>

<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));

	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList sague = Saguemanager.getSagueList(pp.getNPage(), pp.getNPageSize());

	int count = Saguemanager.getSaguerListCount();
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();

	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	if(seq < 0) { seq = 1; }


%>


<%@include file="/include/comheader.jsp"%>

<script type="text/javascript">
function GoViewFn(p_sague_nid){
	location.href= "./sub02_2_1_8_view.jsp?sague_nid=" + p_sague_nid + "&page=<%=nowpage%>";
}
</script>
	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->

		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>열린경영</span>
                    &gt; <span>경영공시</span>
					&gt; <span>일반현황</span>
					&gt; <span class="locanow">사규 제·개정 예고</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_1.gif" alt="일반현황" /></h3>
				</div>
				<!--시작-->
				<div class="status">
					<h4><img src="/images/management/tit_2_2_1_8.gif" alt="사규 제·개정 예고"/></h4>
				</div>
				<div class="rules">

					<table class="cr_list" summary="사규 제·개정 예고 리스트">
					<caption>사규 제·개정 예고 리스트</caption>
					<colgroup>
						<col width="15%" />
						<col width="auto" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제·개정 예고 사규명</th>
							<th scope="col">게시일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<%  if(count==0) { %>
							<tr>
								<td align=center colspan=4>등록된 자료가 없습니다.</td>
							</tr>
						<%
							} else {
								Iterator iter = sague.iterator();
								while(iter.hasNext()){
									SagueBean sb = (SagueBean)iter.next();
						%>
							<tr>
								<td><%=seq %></td>
								<td class="bbs_tit">
									<a href="#GoView" onclick ="GoViewFn('<%=sb.getSague_nid() %>')"><%=sb.getSubject() %></a>
								</td>
								<td><%=sb.getRegDateString("yyyy-MM-dd") %></td>
								<td><%=sb.getClick_cnt() %></td>
							</tr>
						<%
									seq--;
								}
							}
						%>
					</tbody>
					</table>

				</div><!-- rules end -->
				<div class="boardbtm" style="text-align: center;">
				<!--// paging: start //-->
				<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=count%>" />
							<div class="paging">
								<a href="<%=prevBlock.getAnchor()%>"><img src="/images/board/preview.gif" alt="처음" /></a>
								<a href="<%=prevPage.getAnchor()%>"><img src="/images/board/ppreview.gif" alt="이전" /></a>
								<% int ll = 1; %>
								<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
								<% if ( p.getPage() == pp.getNPage()) { %>
								<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %>
								<% } else { %>
								<a href="<%=p.getAnchor()%>"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <% } %>
								<% } %>
								<% ll++; %>
								</stl:loop>
								<a href="<%=nextPage.getAnchor()%>"><img src="/images/board/nnext.gif" alt="다음" /></a>
								<a href="<%=nextBlock.getAnchor()%>"><img src="/images/board/next.gif" alt="끝" /></a>
							</div>
							<!--// paging: end //-->
				</div>


				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
						<tbody>
							<tr>
								<td class="write_day"></td>
								<td class="contact_team"><strong>담당부서 : </strong>경영관리본부 법무팀</td>
								<td class="contact_user"><strong>담당자 : </strong>박원</td>
								<td class="contact_tel"><strong>연락처 : </strong>052-216-2272</td>
							</tr>
						</tbody>
					</table>
				</div>	


				<!-- div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div-->
				<!--//끝-->


			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>