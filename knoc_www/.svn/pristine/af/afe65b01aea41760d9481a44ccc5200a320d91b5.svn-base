<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.participate.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="ParticipateBa" scope="page" class="kr.co.knoc.participate.ParticipateManager" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","11");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>    

<%
	request.setCharacterEncoding("euc-kr"); 	

	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")), "8859_1");
	String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")), "8859_1");
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	
	int	questionSeq	= (request.getParameter("question_nid")==null)?0:Integer.parseInt(request.getParameter("question_nid"));
	
	ParticipateBean pb = ParticipateBa.getParticipateQuestion(questionSeq); //관리자 질문 셋팅
	
	ArrayList al = ParticipateBa.getParticipateBbsList(pp.getNPage(), pp.getNPageSize(),questionSeq,schType, schText); //사보 독자 참여 게시판 리스트		
	
	int count = ParticipateBa.getParticipateBbsListCount(questionSeq,schType, schText); //사보 독자 참여 게시판 리스트 카운트
	
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */
	if(seq < 0){seq=1;}
	
	String QuestionContents = "";
	
	if(null == pb.getQuestion_contents() || "".equals(pb.getQuestion_contents()) || "null".equals(pb.getQuestion_contents())){
		QuestionContents = "";
	}else{
		QuestionContents = pb.getQuestion_contents();
	}
%>
<%@include file="/include/comheader.jsp"%>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
<script type="text/javascript">
<!--
	function passPop(bbsSeq){
		var URL = "bbs_pop_pw.jsp?participate_bbs_seq="+bbsSeq+"&page=<%=nowpage %>&schType=<%=schType %>&schText=<%=schText %>";
		window.open(URL, "pop_pw", "height=150,width=300,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no,top=450,left=750");
	}
//-->
</script>
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_11.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>사이버홍보실</span> &gt; <span>홍보간행물</span> &gt; <span>사보 - 석유사랑</span> &gt; <span class="locanow">사보독자참여</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/sabo_tit.gif" alt="사보독자참여" /></h3>
				</div>
				<!-- 질문 영역 디자인 필요 -->
				
				<div style="border:1px solid #d1d1d1 ; clear:both ; margin-top:20px ; padding:20px ;">
					<!-- 질문 영역 -->
					
					<%=QuestionContents.replaceAll("\r\n","<br />") %>
				</div>
				<div id="boardsec">
					
			  		<table cellspacing="0" cellpadding="0" class="listtype" summary="등록된 사보독자참여 목록을 확인할 수 있습니다.">
						<caption>사보독자참여 목록</caption>
						<colgroup><col width="55px" /><col width="150px" /><col width="214px" /><col width="100px" /><col width="60px" /><col width="60px" /><col width="60px" /></colgroup>
											
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>등록일</th>
						</tr>
						<%  if(count==0) { %>	
						<tr height="25"  bgcolor="#FFFFFF">
							<td align=center colspan=6>등록된 자료가 없습니다.</td>
						</tr>
						<% 
							} else {
								String beginTitle="";
								Iterator iter = al.iterator();
								while(iter.hasNext()){
									ParticipateBean pcb = (ParticipateBean)iter.next();
									if("qna".equals(pcb.getBegin_title())){
										beginTitle="[퀴즈정답]";
									}else if("cnq".equals(pcb.getBegin_title())){
										beginTitle="[사보의견]";
									}else{
										beginTitle="[사보신청]";
									}
						%>	
						<tr>
							<td><%=seq %></td>
							<td class="subj"><a href="#popup" onclick="passPop('<%=pcb.getParticipate_bbs_nid() %>'); return false;" target="_blank"><span style="color:brown; margin-right:10px;"><%=beginTitle%></span><strong><%=pcb.getBbs_title() %></strong></a></td>
						    <td><%=pcb.getWriter() %></td>
                            <td><%=pcb.getRegi_dt() %></td>
						</tr>
						<%				
									seq--;
								}
							}
						%>		
					</table>
						
			  		<div class="boardbtm">
						<div class="leftdv">
							<!--// paging: start //-->
							<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=ParticipateBa.getParticipateBbsListCount(questionSeq,schType, schText)%>" />			
							
							<div class="paging">
								<a href="<%=prevBlock.getAnchor("&question_nid=1&schType="+schType+"&schText="+schText)%>" title="처음 페이지로 이동"><img src="/images/board/preview.gif" alt="처음 페이지로 이동" /></a>
								<a href="<%=prevPage.getAnchor("&question_nid=1&schType="+schType+"&schText="+schText)%>" title="이전 페이지로 이동"><img src="/images/board/ppreview.gif" alt="이전 페이지로 이동" /></a>
								<% int ll = 1; %>
								<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
								<% if ( p.getPage() == pp.getNPage()) { %>
								<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %> 
								<% } else { %> 
								<a href="<%=p.getAnchor("&question_nid=1&schType="+schType+"&schText="+schText)%>" title="<%=p.getPage()%>페이지로 이동"><%=p.getPage()%></a><% if (ll != pages.size()) {%> <% } %>  
							 	<% } %>
								<% ll++; %> 
								</stl:loop>								
								<a href="<%=nextPage.getAnchor("&question_nid=1&schType="+schType+"&schText="+schText)%>" title="다음 페이지로 이동"><img src="/images/board/nnext.gif" alt="다음 페이지로 이동" /></a>
								<a href="<%=nextBlock.getAnchor("&question_nid=1&schType="+schType+"&schText="+schText)%> " title="끝 페이지로 이동"><img src="/images/board/next.gif" alt="끝 페이지로 이동" /></a>
							</div>
							<!--// paging: end //-->
						</div>
				
						<div class="rightdv">
							<a href="reader_participate_write.jsp"><img src="/images/board/btn_write3.gif" alt="글쓰기" /></a>
						</div>
					
					</div>
					<form name="searchform" id="searchform" method="post" action="/sub05/reader_participate_bbs.jsp" onsubmit="do_search(this); return false;">	
						<input type="hidden" id="question_nid" name="question_nid" value="1" />
						<input type="hidden" id="page" name="page" value="1" />
						
						<div id="schsec">
								<fieldset class="schset">
									<legend>Search Box</legend>
									
									<label for="schType" class="nlabel">목록검색선택</label>
									<select id="schType" name="schType" style="width:80px;">
										<option value="bbs_title" <% if (schType != null && !schType.equals("") && schType.equals("bbs_title")) { %>selected="selected"<% } %>>제목</option>
										<option value="writer" <% if (schType != null && !schType.equals("") && schType.equals("writer")) { %>selected="selected"<% } %>>글쓴이</option>
									</select>
									
									<label for="schText" class="nlabel">목록검색</label>
									<input type="text" value="<%=schText %>" id="schText" name="schText" class="input" />							
									
									<input type="image" src="/neoboard/skin/skin08/images/btn_search.gif" style="width:33px; height:19px;" alt="검색"/>
							  	</fieldset>
									  
						</div>
					</form>
				</div>
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"></td>
							<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
							<td class="contact_user"><strong>담당자 : </strong>조혜진</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2231</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
  <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>