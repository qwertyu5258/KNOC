<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<%@page import="kr.co.knoc.sinmungo.ArticleManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.knoc.util.*"%>

<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="ChannelMa" scope="page" class="kr.co.knoc.channel.ChannelManager" />
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/

	ArticleManager articleManager = new ArticleManager();
	SinmungoUserManager userManager = new SinmungoUserManager();


	boolean isMaster = false;
	boolean isUser = false;

	if(session.getAttribute("SINMUNGO_STATUS_NO") != null){
		if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("1")){
			isMaster = true;
		}else if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("2")){
			isUser = true;
		}
	}

	request.setCharacterEncoding("euc-kr");
	String mode = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("m")));

	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("qpwd")));

	HashMap searchMap = new HashMap();
	searchMap.put("searchValue", etcutil.InjectionDefender(etcutil.checkNull(request.getParameter("searchValue"))));
	searchMap.put("field", etcutil.InjectionDefender(etcutil.checkNull(request.getParameter("field"))));
	searchMap.put("type", etcutil.InjectionDefender(etcutil.checkNull(request.getParameter("type"))));
	searchMap.put("article_pwd", etcutil.InjectionDefender(etcutil.checkNull(request.getParameter("article_pwd"))));



	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList articleList = null;
	int count = 0;
	if(isMaster){
		articleList = articleManager.getArticlePageList(pp.getNPage(), pp.getNPageSize(), searchMap);
	}else{
		articleList = articleManager.getArticleUserPageList(pp.getNPage(), pp.getNPageSize(), searchMap);
	}

	if(isMaster){
		count = articleManager.getArticleCount(searchMap);
	}else{
		count = articleManager.getArticleUserCount(searchMap);
	}


	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */
	if(seq < 0){seq=1;}




%>




<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contents">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
<script type="text/javascript">
<!--
	if(!<%=isMaster %> && !<%=isUser %>){
		alert("접근 권한이 없습니다.");
		location.href = "/sinmungo/main.jsp";
	}

	function goViewPage(p_article_nid){

		document.getElementById("article_nid").value = p_article_nid;
		document.getElementById("searchform").action = "/sinmungo/view.jsp";
		document.getElementById("searchform").submit();
	}
	
	function do_search(f)
	{
		if(f.article_pwd.value == "") alert("검색어를 입력해 주세요.");
		else 
			f.submit();
	}	
	
	function pass_ch_pop(){

	}

	function goUserChange(){

		var Url ="";
		Url = "/sinmungo/password.jsp";
		window.open(Url, "_blank");

	}
//-->
</script>
	<div id="rightarea">
		<div id="subcnts">
		<form name="searchform" id="searchform" method="post" action="/sinmungo/list.jsp" onsubmit="do_search(this); return false;">
			<!-- 디자인팀 수정요청[start] -->
			<%@include file="/include/subtop_04.jsp"%>
			<!-- 디자인팀 수정요청[end] -->

			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
				&gt; <span>고객참여</span>&gt; <span>청탁등록</span><!-- &gt; <span class="locanow"></span>  -->
			</div>
			<!--// location: end //-->
			<div class="pagetle">
				<h3><img src="/images/customer/ttl_sub04_8_2.gif" alt="청탁등록 사항 확인" /></h3>
			</div>
			<div id="boardsec">
<!--
				<form action="channel_list.jsp" method="post" name="abs_w" onsubmit="do_submit(this); return false;">
				<input type="hidden" name="page" value="<%=nowpage%>">
				<table cellspacing="0" cellpadding="0" class="listtype" summary="GREAT WAY 게시판 패스워드를 입력할 수 있습니다.">
					<caption>비밀번호 확인</caption>
					<colgroup>
						<col width="130px" />
						<col width="150px" />
						<col width="70px" />
						<col width="370px" />
					</colgroup>
					<tr>
						<th scope="col"><label for="qpwd">비밀번호</label></th>
						<td><input type="password" value="" id="qpwd" name="qpwd" class="input" /></td>
						<td><input type="image" src="/images/board/btn_ok.gif" alt="확인" /></td>
						<td></td>
					</tr>
					<tr>
						<td class="td2" colspan="4"></td>
					</tr>

				</table>
				</form>
-->

				<div style="text-align: right; margin-bottom: 10px">
				<%if(isMaster){ %>
					<a href="#" onclick="goUserChange();return false;"><img src="/images/member/btn_changepass.gif" alt="비밀번호 변경"/></a>
				<%}%>


				</div>
				<table cellspacing="0" cellpadding="0" class="listtype" summary="사내직원들의 의견 목록을 보여줍니다.">
					<caption>GREAT WAY 게시판 목록</caption>
					<colgroup>
						<col width="55px" />
						<col width="350px" />
						<col width="170px" />
						<col width="170px" />
						<col width="auto" />
						<col width="50px" />
					</colgroup>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">등록일</th>
						<th scope="col">등록자</th>
						<th scope="col">부서명</th>
						<th scope="col">첨부</th>

					</tr>
				<%

					for(int i=0; i<articleList.size(); i++){
						HashMap articleMap = (HashMap)articleList.get(i);
				%>
					<tr>
						<td><%=seq %></td>
						<td class="subj"><a href="#" onclick="goViewPage(<%=articleMap.get("ARTICLE_NID") %>);return false;"><%=articleMap.get("SUBJECT") %></a></td>
						<td><%=articleMap.get("REG_DATE") %></td>
						<td>
							<% if(articleMap.get("USER_NM")==null || "null".equals(articleMap.get("USER_NM"))){ %>
							<%}else{ %>
							<%=articleMap.get("USER_NM") %>
							<%} %>
						</td>
						<td>
						<% if(articleMap.get("OBM_TYPE")==null || "null".equals(articleMap.get("OBM_TYPE"))){ %>
							<%}else{ %>
							<%=articleMap.get("OBM_TYPE") %>
							<%} %>
						</td>
						<td>
							<%if(etcutil.checkNullInt(articleMap.get("FILE_COUNT").toString(), 0) > 0){ %>
							<img alt="파일" src="/images/common/icon_disket.gif">
							<%} %>
						</td>
					</tr>
				<%
						seq--;
					}

					if(articleList.size() == 0){
						out.print("<tr><td colspan='6'>등록된 데이타가 없습니다.</td></tr>");
					}
				%>
				</table>



					<input type="hidden" name="article_nid"  id="article_nid"/>
					<!--// searchbox: end //-->
					<div id="schsec">
						<fieldset class="schset">
						<!--
							<legend>Search Box</legend>
							<label for="field" class="nlabel">검색조건 선택</label>
							<select name="type" id="type" style="width:auto">
								<option value="">신고유형</option>
								<option value="1" <%if(etcutil.checkNullInt(request.getParameter("type"), 0) == 1){out.print("selected");} %>>인사 청탁행위 신고</option>
								<option value="2" <%if(etcutil.checkNullInt(request.getParameter("type"), 0) == 2){out.print("selected");} %>>인사 알선행위 신고 </option>
								<option value="3" <%if(etcutil.checkNullInt(request.getParameter("type"), 0) == 3){out.print("selected");} %>>기타 인사관련 비리행위 신고 </option>
							</select>

							<select id="field" name="field" style="width:auto">
								<option value="subject" <%if("subject".equals(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))))){out.print("selected");} %>>제목</option>
								<option value="contents" <%if("contents".equals(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))))){out.print("selected");} %>>내용</option>
								<option value="all" <%if("all".equals(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))))){out.print("selected");} %>>제목+내용</option>
							</select>
						-->
						<%
							if(isMaster){
						%>
							<legend>Search Box</legend>
							<label for="field" class="nlabel">검색조건 선택</label>
							<select name="type" id="type" style="width:auto">
								<option value="">신고유형</option>
								<option value="1" <%if(etcutil.checkNullInt(request.getParameter("type"), 0) == 1){out.print("selected");} %>>인사 청탁행위 신고</option>
								<option value="2" <%if(etcutil.checkNullInt(request.getParameter("type"), 0) == 2){out.print("selected");} %>>인사 알선행위 신고 </option>
								<option value="3" <%if(etcutil.checkNullInt(request.getParameter("type"), 0) == 3){out.print("selected");} %>>기타 인사관련 비리행위 신고 </option>
							</select>

							<select id="field" name="field" style="width:auto">
								<option value="subject" <%if("subject".equals(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))))){out.print("selected");} %>>제목</option>
								<option value="contents" <%if("contents".equals(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))))){out.print("selected");} %>>내용</option>
								<option value="all" <%if("all".equals(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))))){out.print("selected");} %>>제목+내용</option>
							</select>

							<label for="schinput" class="nlabel">목록검색</label>
							<input type="text" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("searchValue"))) %>" id="schinput" name="searchValue" class="input" />
							<input type="image" src="/neoboard/skin/skin08/images/btn_search.gif" style="width:33px; height:19px;" alt="검색"/>
						<%
							}else{
						%>
							<label for="schinput" class="nlabel">패스워드</label>
							패스워드 :: <input type="password" name="article_pwd" id="article_pwd" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("article_pwd"))) %>"/>
							<input type="image" src="/neoboard/skin/skin08/images/btn_search.gif" style="width:33px; height:19px;" alt="검색"/>
						<%
							}
						%>
					  </fieldset>
					</div>
					<!--// searchbox: end //-->
				</form>

				<div class="boardbtm">
					<div class="leftdv">
						<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=count%>" />
						<div class="paging">
							<a href="<%=prevBlock.getAnchor("&="+mode)%>"><img src="/images/board/preview.gif" alt="처음" /></a>
							<a href="<%=prevPage.getAnchor("&m="+mode)%>"><img src="/images/board/ppreview.gif" alt="이전" /></a>
							<% int ll = 1; %>
							<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
							<% if ( p.getPage() == pp.getNPage()) { %>
							<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %>
							<% } else { %>
							<a href="<%=p.getAnchor("&m="+mode)%>"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <% } %>
							<% } %>
							<% ll++; %>
							</stl:loop>
							<a href="<%=nextPage.getAnchor("&m="+mode)%>"><img src="/images/board/nnext.gif" alt="다음" /></a>
							<a href="<%=nextBlock.getAnchor("&m="+mode)%>"><img src="/images/board/next.gif" alt="끝" /></a>
						</div>
						<!--// paging: end //-->
					</div>
					<div class="rightdv"></div>
				</div>
			</div>

			<!-- new_officer -->
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"></td>
					<td class="contact_team"><strong>담당부서 : </strong>감사실 청렴감사팀</td>
					<td class="contact_user"><strong>담당자 : </strong>황민철</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2124</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->

		</div>
	</div>
</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>