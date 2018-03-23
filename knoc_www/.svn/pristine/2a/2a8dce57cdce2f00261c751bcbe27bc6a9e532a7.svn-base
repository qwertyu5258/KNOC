<%@page import="com.neoboard.data.AttachFile"%>
<%@page import="kr.co.knoc.gov_public.GovPublicBean"%>
<%@page import="kr.co.knoc.util.EtcUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>

<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="govPublicManager" scope="page" class="kr.co.knoc.gov_public.GovPublicManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<%

	String gpk2 = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("gpk")));
	int gpk = 0;
	if(gpk2!=null && !gpk2.equals("")){
		gpk = Integer.parseInt(gpk2);
	}
	String sType = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("sType")));
	String sWord = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("sWord")),"8859_1");

	String gov_public_kind_nm = "";
	String[] gov_public_kind_nm_arr = {
			"통합검색","회사현황", "HSEQ", "감사", "사업계획",
			"계약관리", "사회공헌", "인사복지", "예산재무",
			"정보통신", "상생협력", "석유개발", "석유비축",
			"알뜰주유소", "석유정보", "홍보"};

	String[] gNavMenuDepth4Arr = {
			"00", "01", "02", "03", "04",
			"05", "06", "07", "08",
			"09", "10", "11", "12",
			"13", "14", "15"
	};

	String[] imageArr = {
			"/images/information/ttl_sub05_3_total.gif", //통합검색
			"/images/information/ttl_sub04_9_2_1.gif", //회사현황
			"/images/information/ttl_sub04_9_2_2.gif", //HSEQ
			"/images/information/ttl_sub04_9_2_3.gif", //감사
			"/images/information/ttl_sub04_9_2_4.gif", //사업계획
			"/images/information/ttl_sub04_9_2_5.gif", //계약관리
			"/images/information/ttl_sub04_9_2_6.gif", //사회공헌
			"/images/information/ttl_sub04_9_2_7.gif", //인사복지
			"/images/information/ttl_sub04_9_2_8.gif", //예산재무
			"/images/information/ttl_sub04_9_2_9.gif", //정보통신
			"/images/information/ttl_sub04_9_2_10.gif", //상생협력
			"/images/information/ttl_sub04_9_2_11.gif", //석유개발
			"/images/information/ttl_sub04_9_2_12.gif", //석유비축
			"/images/information/ttl_sub04_9_2_13.gif", //알뜰주유소
			"/images/information/ttl_sub04_9_2_14.gif", //석유정보
			"/images/information/ttl_sub04_9_2_15.gif" //홍보
	};

	if(gpk > 0){
		/**
		* 2016. 03. 21 / MYM
		* 보안약점 조치
		*/
		if(gpk < 0) { gpk = 0; }
		gov_public_kind_nm = gov_public_kind_nm_arr[gpk];
	}

	else{
		gov_public_kind_nm = "통합검색";
	}

	String nowpage = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("page")));

	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");

	ArrayList<HashMap<String, String>> govPublicList = govPublicManager.getGovPublicKindList2(gpk, pp.getNPage(), pp.getNPageSize(), sType, sWord);

	int count = govPublicManager.getGovPublicKindListCount2(gpk,sType,sWord);
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	if(seq < 0) { seq = 1; }
%>

<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","13");
	application.setAttribute("gNavMenuDepth3","11");

	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	if(gpk < 0) { gpk = 0; }
	application.setAttribute("gNavMenuDepth4",gNavMenuDepth4Arr[gpk]);
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>

<%!
	private String getFileImage(HttpServletRequest request, String fileName){

		String imgFileNm = fileName.toLowerCase();
		String mime = "";
		String imgSrc = "";

		if(imgFileNm.lastIndexOf(".") > -1)
	    	mime = imgFileNm.substring(imgFileNm.lastIndexOf(".")+1);
	    else
	    	mime = "unknown";

	    if(AttachFile.containsMime(mime))
	    	imgSrc = "/neoboard/skin/skin01/images/mime_" + mime + ".gif";
	    else
	    	imgSrc = "/neoboard/skin/skin01/images/mime_unknown.gif";

		return imgSrc;
	}
%>

<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_05.jsp"%>

				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>정보공개</span>
					&gt; <span>사전정보공표</span>
					&gt; <span>카테고리별 정보</span>
					&gt; <span class="locanow"><%=gov_public_kind_nm %></span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3 class="tleimg"><img src="<%=imageArr[gpk] %>" alt="<%=gov_public_kind_nm_arr[gpk] %>" /></h3>
				</div>
				<form name="searchform" action="./sub05_12_list.jsp" method="post">
				<input name="ses" type="hidden" value="USERSESSION">
				<input name="mode" type="hidden" value="list">
					<!--// searchbox: end //-->
					<div id="schsec" class="st_box1">
						<fieldset class="schset">
							<legend>Search Box</legend>

							<select name="sType" title="목록검색선택" id="sType">
								<option value="TITLE"<%if(sType.equals("TITLE")){%> selected="selected"<%}%>>제목</option>
								<option value="DEPARTMENT"<%if(sType.equals("DEPARTMENT")){%> selected="selected"<%}%>">부서별</option>
							</select>

							<label class="nlabel" for="schinput">목록검색</label>
							<input name="sWord" class="input" id="schinput" type="text" value="<%=sWord%>">

							<div class="btndv"><input style="width: 33px; height: 19px;" type="image" alt="검색" src="/neoboard/skin/skin01/images/btn_search.gif"></div>
					  </fieldset>
					</div>
					<!--// searchbox: end //-->
				</form>

				<% if(!sWord.equals("")) { %>
				<!-- 검색 결과값 -->
				<p class="results_area">검색어 <strong>'<%=sWord%>'</strong> 에 대해 <%=count%>개의 문서를 찾았습니다.</p>
				<!-- //검색 결과값 -->
				<% } %>


				<!-- list -->
				<div id="boardsec">
					<table cellspacing="0" cellpadding="0" class="listtype" summary="">
						<caption></caption>
						<colgroup>
							<col width="10%" />
							<% if(gpk==0) { %>
							<col width="18%" />
							<% } %>
							<col width="*" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="9%" />
							<col width="10%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<% if(gpk==0) { %>
								<th scope="col">게시판명</th>
								<% } %>
								<th scope="col">업무</th>
								<th scope="col">담당부서</th>
								<th scope="col">공표시기</th>
								<th scope="col">공개주기</th>
								<th scope="col">공표매체</th>
							</tr>
						</thead>
						<tbody>
						<%if(count == 0){ %>
							<tr>
								<td colspan="7">등록된 정보가 없습니다.</td>
							</tr>
						<%
							}else{
								Iterator<HashMap<String, String>> iter = govPublicList.iterator();
								while(iter.hasNext()){
									HashMap<String, String> hashMap = iter.next();
						%>
							<tr>
								<td><%=seq %></td>
								<% if(gpk==0) { %>
								<td><%=gov_public_kind_nm_arr[Integer.parseInt(EtcUtil.checkNull(hashMap.get("GOV_PUBLIC_KIND")))] %></td>
								<% } %>
								<td class="subj">
									<%if(!"".equals(EtcUtil.checkNull(hashMap.get("PUBLIC_LINK")))){ %>
									<a href="<%=EtcUtil.checkNull(hashMap.get("PUBLIC_LINK")) %>" target="_blank">
										<%=EtcUtil.checkNull(hashMap.get("TITLE"))%>
									</a>
									<%} else {
									if(gpk==0){
										gpk2 = EtcUtil.checkNull(hashMap.get("GOV_PUBLIC_KIND"));
									}

									%>
									<a href="/sub05/sub05_12_filelist.jsp?gpk=<%=gpk2%>&page=<%=nowpage %>&gov_public_nid=<%=EtcUtil.checkNull(hashMap.get("GOV_PUBLIC_NID")) %>&sType=<%=sType%>&sWord=<%=sWord %>">
										<%=EtcUtil.checkNull(hashMap.get("TITLE")) %>
									</a>
									<%} %>
								</td>
								<td><%=EtcUtil.checkNull(hashMap.get("DEPARTMENT")) %></td>
								<td><%=EtcUtil.checkNull(hashMap.get("PUBLIC_TIME")) %></td>
								<td><%=EtcUtil.checkNull(hashMap.get("PUBLIC_CYCLE")) %></td>
								<td><%if(!"".equals(EtcUtil.checkNull(hashMap.get("PUBLIC_LINK")))){ %>
								<a href="<%=EtcUtil.checkNull(hashMap.get("PUBLIC_LINK")) %>" target="_blank"><img src="/images/information/btn_shift.gif" alt="이동" /></a>
									<%} else {}%>
								</td>
							</tr>
						<%
									seq--;
								}
							}
						%>
						</tbody>
					</table>
				</div>
				<div class="boardbtm" style="text-align: center; padding-top:10px;">
					<!--// paging: start //-->
					<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=count %>" />
					<div class="paging">
						<a href="<%=prevBlock.getAnchor("&gpk="+gpk+"&sType="+sType+"&sWord="+sWord)%>"><img src="/images/board/preview.gif" alt="처음" /></a>
						<a href="<%=prevPage.getAnchor("&gpk="+gpk+"&sType="+sType+"&sWord="+sWord)%>"><img src="/images/board/ppreview.gif" alt="이전" /></a>
						<%int ll = 1; %>
						<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
						<%if(p.getPage() == pp.getNPage()){ %>
							<span class="pagenow"><%=p.getPage()%></span> <%if(ll != pages.size()){%> <%} %>
						<%}else{%>
							<a href="<%=p.getAnchor("&gpk="+gpk+"&sType="+sType+"&sWord="+sWord)%>"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <%} %>
						<%} %>
						<% ll++; %>
						</stl:loop>
						<a href="<%=nextPage.getAnchor("&gpk="+gpk+"&sType="+sType+"&sWord="+sWord)%>"><img src="/images/board/nnext.gif" alt="다음" /></a>
						<a href="<%=nextBlock.getAnchor("&gpk="+gpk+"&sType="+sType+"&sWord="+sWord)%>"><img src="/images/board/next.gif" alt="끝" /></a>
					</div><!--// paging: end //-->
				</div>

				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"></td>
							<td class="contact_team"><strong>담당부서 : </strong>총무관리처 상생지원팀</td>
							<td class="contact_user"><strong>담당자 : </strong>차정민</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2607</td>
						</tr>
					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>

</body>
</html>