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
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	ArticleManager articleManager = new ArticleManager();
	SinmungoUserManager userManager = new SinmungoUserManager(); 
	
	
	boolean isMaster = false;
	boolean isUser = false;

	if(session.getAttribute("SINMUNGO_STATUS_NO") != null){
		if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("3")){
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
	
	HashMap gpinMap = new HashMap();
	gpinMap.put("article_pwd", session.getAttribute("virtualno"));
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList articleList = null;
	int count = 0;
	if(isMaster){
		
		String obm_type = session.getAttribute("SINMUNGO_OBM_TYPE").toString();
		
		articleList = articleManager.getArticleObmPageList(pp.getNPage(), pp.getNPageSize(), searchMap, obm_type);
	}else{
		articleList = articleManager.getArticleObmUserPageList(pp.getNPage(), pp.getNPageSize(), gpinMap);
	}
	  
	if(isMaster){
		String obm_type = session.getAttribute("SINMUNGO_OBM_TYPE").toString();
		count = articleManager.getArticleObmCount(searchMap, obm_type);
	}else{
		count = articleManager.getArticleObmUserCount(gpinMap);
	}
	
	
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */
	if(seq < 0 ){seq=1;}
	
	
	
	
%>        




<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contents">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
<script type="text/javascript">
<!--
	if(!<%=isMaster %> && !<%=isUser %>){
		alert("접근 권한이 없습니다.");
		location.href = "/ombudsman/main.jsp";
	}
	
	function goViewPage(p_article_nid){
		
		document.getElementById("article_nid").value = p_article_nid;
		document.getElementById("searchform").action = "/ombudsman/view.jsp";
		document.getElementById("searchform").submit();
	}
	
	
	function goUserChange(){
		document.getElementById("searchform").action = "/ombudsman/password.jsp";
		document.getElementById("searchform").submit();
		
	}
//-->
</script>
	<div id="rightarea">
		<div id="subcnts">			
		<form name="searchform" id="searchform" method="post" action="/ombudsman/list.jsp" onsubmit="do_search(this); return false;">
			<!-- 디자인팀 수정요청[start] -->
			<div class="subTop04">
				<h2><img src="/images/customer/tit_customer.gif" alt="고객참여(Customer Participation)" /></h2>
				<p><img src="/images/customer/txt_customer.gif" alt="수많은 가능성을 확인한 오랜 시간들, 새로운 환경과 어려움에 도전하며 에너지 영토를 넓혀가고 있습니다." /></p>
			</div>
			<!-- 디자인팀 수정요청[end] -->
			
			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
				&gt; <span>고객참여</span>&gt; <span>청렴 옴부즈맨 신고센터</span><!-- &gt; <span class="locanow"></span>  -->
			</div>
			<!--// location: end //-->
			<div class="pagetle">
				<h3><img src="/images/omb/ttl_sub04_8_10.gif" alt="청렴 옴부즈맨 신고센터" /></h3> 
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
						<col width="50px" />						
						<col width="auto" />
					</colgroup>
					<tr>
						<th scope="col">번호</th>
						
						<th scope="col">제목</th>
						<th scope="col">파일</th>							
						<th scope="col">등록일</th>
					</tr>
				<%
					String comment_count = "";
					for(int i=0; i<articleList.size(); i++){
						HashMap articleMap = (HashMap)articleList.get(i);
						comment_count =articleMap.get("COMMENT_COUNT").toString();
				%>					
					<tr>
						<td><%=seq %></td>						
						
						<td class="subj"><p align="center"><a href="#" onclick="goViewPage(<%=articleMap.get("ARTICLE_NID") %>);return false;"><%=articleMap.get("SUBJECT") %>
						<%if(!comment_count.equals("0")){ %>
						&nbsp;[<font color="red">답변완료</font>]
						<%}else{ %>
						
						<%} %>
						</a></p></td>
						<td>
							<%if(etcutil.checkNullInt(articleMap.get("FILE_COUNT").toString(), 0) > 0){ %>
							<img alt="파일" src="/images/common/icon_disket.gif">
							<%} %>
						</td>
						<td><%=articleMap.get("REG_DATE") %></td>
					</tr>
				<%
						seq--;
					}
				
					if(articleList.size() == 0){
						out.print("<tr><td colspan='5'>등록된 데이타가 없습니다.</td></tr>");
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
							
							
							<select id="field" name="field" style="width:auto">
								<option value="subject" <%if("subject".equals(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))))){out.print("selected");} %>>제목</option>
								<option value="contents" <%if("contents".equals(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))))){out.print("selected");} %>>내용</option>
								<option value="all" <%if("all".equals(etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))))){out.print("selected");} %>>제목+내용</option>
							</select>
							
							<label for="schinput" class="nlabel">목록검색</label>
							<input type="text" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("searchValue"))) %>" id="schinput" name="searchValue" class="input" />							
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
		</div>
	</div>
</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>