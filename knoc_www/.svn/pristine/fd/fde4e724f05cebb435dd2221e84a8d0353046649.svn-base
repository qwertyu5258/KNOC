<%@ page import="java.util.*"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<%@ page import="kr.co.knoc.sinmungo.ArticleManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="ChannelMa" scope="page" class="kr.co.knoc.channel.ChannelManager" />
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","00");
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
		articleList = articleManager.getArticlePageListEn(pp.getNPage(), pp.getNPageSize(), searchMap);
	}else{
		articleList = articleManager.getArticleUserPageListEn(pp.getNPage(), pp.getNPageSize(), searchMap);
	}
	  
	if(isMaster){
		count = articleManager.getArticleCountEn(searchMap);
	}else{
		count = articleManager.getArticleUserCountEn(searchMap);
	}
	
	
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */
	if(seq < 0){seq =1;}
	
	
%>   

<%@ include file="../include/topmenu.jsp" %>
<!-- topmenu end -->
<script type="text/javascript">
<!--
	if(!<%=isMaster %> && !<%=isUser %>){
		alert("Not have access.");
		location.href = "/ENG/sinmungo/notice.jsp";
	}
	
	function goViewPage(p_article_nid){
		
		document.getElementById("article_nid").value = p_article_nid;
		document.getElementById("searchform").action = "/ENG/sinmungo/view.jsp";
		document.getElementById("searchform").submit();
	}

	function do_search(f)
	{
		if(f.article_pwd.value == "") alert("Enter your search word.");
		else 
			f.submit();
	}
	
	function goUserChange(){
		
		var Url ="";
		Url = "/ENG/sinmungo/password.jsp";
		window.open(Url, "_blank");
		
	}
//-->
</script>

<!-- contents -->
<div id="container">
	<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">
	
	  <tr>
	    <td align="center" valign="top"><table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
	      <tr>
	        <td class="lnb_area"><!-- leftmenu -->
	        	<%@ include file="../include/leftmenu.jsp" %></td>
	        <td width="30">&nbsp;</td>
	        <td valign="top">
	        <table width="760" border="0" cellspacing="0" cellpadding="0">
	         <tr>
	            <td height="30">&nbsp;</td>
	          </tr>
	          <tr>
	            <td><!-- contimg --><%@ include file="../include/contimg05.jsp" %></td>
	          </tr>
	          <tr>
	            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt;Service &gt;<span class="loca_text"> E-Complaints Mailbox &#13;</span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img  src="/ENG/images/info/ttl_sub05_1_2.gif" width="161" height="24" alt=" E-Complaints Mailbox" /></td>
	          </tr>
	          <tr>
	            <td height="40" align="center">&nbsp;</td>
	          </tr>
	          <tr>
	           <td align="center" valign="top" background="0">
	           <div id="subcnts">			
				<form name="searchform" id="searchform" method="post" action="/ENG/sinmungo/list.jsp" onsubmit="do_search(this); return false;">
					<div style="text-align: right; margin-bottom: 10px">
					<%if(isMaster){ %>
						<a href="#" onclick="goUserChange();return false;"><img src="/images/member/eng_btn_changepass.gif" alt="비밀번호 변경"/></a>
					<%}%>	
						
				
					</div>
					<table width="99%" cellspacing="0" cellpadding="0" class="listtype" summary="사내직원들의 의견 목록을 보여줍니다.">
						<caption>GREAT WAY 게시판 목록</caption>
						<colgroup>
							<col width="10%" />
							<col width="60%" />
							<col width="10%" />
							<col width="20%" />
						</colgroup>
						<tr>
							<th  scope="col" width="10%" height="25" align="center" bgcolor="f1f1f1" class="board_titletop" >NO</th>
							<th scope="col" height="60%" align="center" bgcolor="f1f1f1" class="board_titletop" scope="col">Title</th>
							<th scope="col" width="10%" height="25" align="center" bgcolor="f1f1f1" class="board_titletop">Name</th>
							<th scope="col" width="20%" height="25" align="center" bgcolor="f1f1f1" class="board_titletop">Date</th>
						</tr>
					<%
						
						for(int j=0; j<articleList.size(); j++){
							HashMap articleMap = (HashMap)articleList.get(j);
					%>					
						<tr>
							<td  align="center"><%=seq %></td>						
							<td class="subj"><a href="#" onclick="goViewPage(<%=articleMap.get("ARTICLE_NID") %>);return false;"><%=articleMap.get("SUBJECT") %></a></td>
							<td align="center">No name</td>
							<td align="center"><%=articleMap.get("REG_DATE") %></td>
						</tr>
					<%
							seq--;
						}
					
						if(articleList.size() == 0){
							out.print("<tr><td colspan='5'align=\"center\">No Data.</td></tr>");
						}
					%>							
					</table>
					
	
							
						<input type="hidden" name="article_nid"  id="article_nid"/>			
						<!--// searchbox: end //-->
						<div id="schsec">
							<fieldset class="schset">
							 
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
								
								<label for="schinput" class="nlabel">search</label>
								<input type="text" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("searchValue"))) %>" id="schinput" name="searchValue" class="input" />							
								<input type="image" src="../images/btn/btn_search.gif" style="width:33px; height:19px;" alt="검색"/>
							<%
								}else{
							%>	
								<label for="schinput" class="nlabel">Password</label>
								 <input type="password" name="article_pwd" id="article_pwd" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("article_pwd"))) %>"/>							
								<input type="image" src="/neoboard/skin/skin12/images/btn_ok.gif" style="width:33px; height:19px;" alt="ok"/>
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
	           </td>
	          </tr>
	          <tr>
	              	<td>
	<div style="height:20px ;"></div>
	<div class="new_officer">
		<table summary="Department Contacts Updated">
		<caption>Department Contacts Updated</caption>		
		<tbody>
			<tr>
				<td class="write_day"><!-- strong>Updated : </strong>2016-04-05-->&nbsp;</td>
		        <td class="contact_team"><strong>Department : </strong>Internal Auditing</td>
		        <td class="contact_tel"><strong>Contacts : </strong>+82)52-216-2124</td>
			</tr>
		</tbody>
		</table>
	</div><!-- new_officer end -->  
	              	</td>
	              </tr>
	        </table></td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
</div>
<!-- contents end-->

<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->


</body>
</html>
