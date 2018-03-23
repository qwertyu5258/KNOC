<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.channel.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="ChannelMa" scope="page" class="kr.co.knoc.channel.ChannelManager" />
<%
	if (mode == null || mode.equals("")) {
		return;
	}
	
	if (channel_user_id == null || (!channel_user_id.equals(_CHANNEL_USER)
		&& !channel_user_id.equals(_CEO_USER)))  
	{ 
%>
<script type="text/javascript">
	  alert("<%=channel_user_id%>");  
	location.href = "channel_login.jsp";	
</script>
<%		
		return;
	}
	
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("qpwd")));
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	
	ArrayList al = new ArrayList();
	int count = 0;
	int seq = 0;
%>    
<div id="boardsec">
<% if(!channel_user_id.equals(_CEO_USER)) { %>
		<script type="text/javascript">
		//<!--
			String.prototype.trim = function() {
				return this.replace(/(^ *)|( *$)/g, "");
			}
			function do_submit(f) {
				/*if(f.no.value == "") {
					alert('글번호를 입력하세요.');
					f.no.focus();
				}
				else */
				if(f.qpwd.value == "") {
					alert('비밀번호를 입력하세요.');
					f.qpwd.focus();
				}
				else if(f.qpwd.value.length < 6) {
					alert('비밀번호는 최소 6자 이상 입력하셔야만 합니다.');
					f.qpwd.focus();
				}
				else if(!check_pwd(f.qpwd.value)){
					alert('비밀번호는 영문 숫자를 반드시 혼용하여야만합니다.');
					f.qpwd.focus();
				}
				else {
					try{
						f.submit();
					}catch(e){}
				}
			}
			function check_pwd(str) {
				var reg = new RegExp("^[0-9a-zA-Z]+$");
				var reg2 = new RegExp("[0-9]+");
				var reg3 = new RegExp("[a-zA-Z]+");
				return reg.test(str) && reg2.test(str) && reg3.test(str);
			}
		//-->		
		</script>
    <table cellspacing="0" cellpadding="0" class="listtype" summary="해당게시판은 패스워드입니다.">
<form action="channel.jsp" method="post" name="abs_w" onsubmit="do_submit(this); return false;">
<input type="hidden" name="m" value="L">
<input type="hidden" name="page" value="<%=nowpage%>">    
	<caption>해당게시판 패스워드</caption>
	<colgroup><col width="130px" /><col width="150px" /><col width="70px" /><col width="370px" /></colgroup>
		<tr>
			<th>비밀번호</th>
			<th><input type="password" value="" id="qpwd" name="qpwd" class="input" /></th>
			<th><input type="image" src="/images/board/btn_ok.gif" alt="확인" /></th>
			<th></th>
		</tr>
		<tr>
			<td class="td2" colspan="4"></td>
		</tr>
</form>		
	</table>
<%
		al = ChannelMa.getChannelList(pwd, pp.getNPage(), pp.getNPageSize());		
		
		count = ChannelMa.getChannelListCount(pwd);
		seq = count-(pp.getNPage()-1) * pp.getNPageSize();
		if(seq < 0){ seq = 1;} // 보안약점 조치 2016.03.21 ECJ
	} else {
		al = ChannelMa.getChannelList("", pp.getNPage(), pp.getNPageSize());		
		
		count = ChannelMa.getChannelListCount("");
		seq = count-(pp.getNPage()-1) * pp.getNPageSize();
		if(seq < 0){ seq = 1;} // 보안약점 조치 2016.03.21 ECJ
	}
%>
	<table cellspacing="0" cellpadding="0" class="listtype" summary="해당게시판은 말씀자료의 목록을 보여줍니다">
	<caption>해당게시판 목록</caption>
	<colgroup><col width="55px" /><col width="375px" /><col width="110px" /><col width="85px" /></colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
		</tr>
<%  if(count==0) { %>
		<tr>
			<td colspan="4" align="center">검색된 게시물이 존재하지 않습니다.</td>
		</tr>		
<% 
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			ChannelBean cb = (ChannelBean)iter.next();
%>			
		<tr>
			<td><%=seq %></td>
			<td class="subj"><a href="channel.jsp?m=V&no=<%=cb.getNo() %>&page=<%=nowpage %>&pwd=<%=pwd %>"><%=cb.getTitle() %></a></td>
			<td>무기명</td>
			<td><%=cb.getRegDateString("yyyy-MM-dd") %></td>
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
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=count%>" />			
			<div class="paging">
				<a href="<%=prevBlock.getAnchor("&m="+mode)%>"><img src="/images/board/preview.gif" alt="처음" /></a>
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
		<div class="rightdv">
			<!-- <a href="2-1write.jsp"><img src="/images/board/btn_write2.gif" alt="글쓰기" /></a> -->
		</div>
	</div>
	<!--// searchbox: end //-->
	<div id="schsec">
		<fieldset class="schset">
			<legend>Search Box</legend>
			
			<label for="schsel" class="nlabel">목록검색선택</label>
			<select id="schsel">
				<option>제목</option>
				<option>글쓴이</option>
				<option>내용</option>
			</select>
			
			<label for="schinput" class="nlabel">목록검색</label>
			<input type="text" value="" id="schinput" class="input" />							
			
			<div class="btndv"><a href="#"><img src="/images/board/btn_search.gif" alt="검색" /></a></div>
	  </fieldset>
	</div>
	<!--// searchbox: end //-->
</div>