<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.channel.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="ChannelMa" scope="page" class="kr.co.knoc.channel.ChannelManager" />
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","04"); 
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%> 
<% request.setCharacterEncoding("euc-kr"); %>
<%@include file="/channel/_channel_inc.jsp"%>
<%
	String mode = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("m")));
	if (mode == null || mode.equals("")) {
		mode = "G";
	}
	if (mode == null || mode.equals("")) {
		return;
	}
	
	if (channel_user_id == null || (!channel_user_id.equals(_CHANNEL_USER)
		&& !channel_user_id.equals(_CEO_USER)))  
	{ 
%>
<script type="text/javascript">
	location.href = "channel_login.jsp";	
</script>
<%		
		return;
	}
	
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("qpwd")));
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
<%	
		return;
	}	
	
	String action_url = "";
	if (mode.equals("V")) {
		action_url = "channel_view.jsp";
	} else if (mode.equals("E")) {
		action_url = "channel_edit.jsp";
	}
%>        
<%@include file="/include/comheader.jsp"%>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
                    &gt; <span>CEO</span>
                    &gt; <span class="locanow">GREAT WAY</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_1_4.gif" alt="GREAT WAY" /></h3>
				</div>
				<div id="boardsec">
						<script type="text/javascript">
						//<!--
							String.prototype.trim = function() {
							    return this.replace(/(^ *)|( *$)/g, "");
							}
							function do_submit(f) {
								if(f.pwd.value == "") {
							 		alert('비밀번호를 입력하세요.');
							 		f.pwd.focus();
							 	}
							 	else if(f.pwd.value.length < 6) {
							 		alert('비밀번호는 최소 6자 이상 입력하셔야만 합니다.');
							 		f.pwd.focus();
							 	}
								else if(!check_pwd(f.pwd.value)){
									alert('비밀번호는 영문 숫자를 반드시 혼용하여야만합니다.');
									f.pwd.focus();
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
				    <table cellspacing="0" cellpadding="0" class="listtype" summary="GREAT WAY 게시판의 패스워드를 입력합니다.">
				<form action="<%=action_url %>" method="post" name="abs_w" onsubmit="do_submit(this); return false;">
			   	<input type="hidden" name="no" value="<%=no %>">
			   	<input type="hidden" name="page" value="<%=nowpage %>">    
					<caption>비밀번호 확인</caption>
					<colgroup><col width="130px" /><col width="150px" /><col width="70px" /><col width="370px" /></colgroup>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" value="" id="pwd" name="pwd" class="input" /></td>
							<td><input type="image" src="/images/board/btn_ok.gif" alt="확인" /></td>
							<td></td>
						</tr>
						<tr>
							<td class="td2" colspan="4"></td>
						</tr>
				</form>		
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>