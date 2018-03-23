<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
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
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	request.setCharacterEncoding("euc-kr");
	SinmungoUserManager sinmungoUserManager = new SinmungoUserManager();
	HashMap hash = sinmungoUserManager.getUserInfo(3);
	
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	
	ArrayList al = new ArrayList();
	int count = 0;
	int seq = 0;

	boolean isMaster = false;
	boolean isUser = false;

	if(session.getAttribute("SINMUNGO_STATUS_NO") != null){
		if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("3")){
			isMaster = true;
		}else if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("2")){
			isUser = true;
		} 
	}
	
%>        

     
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contentsLayer">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->

<script type="text/javascript">
<!--
	if(!<%=isMaster %>){
		alert("접근 권한이 없습니다.");
		location.href = "/ombudsman/main.jsp";
	}
	
	function onSubmit(){

		if(document.getElementById("old_user_pwd").value == ""){
			alert("기존 비밀번호를 입력해 주세요.");
			document.getElementById("old_user_pwd").focus();
			return;
		}
		
		if(document.getElementById("user_pwd").value == ""){
			alert("새 비밀번호를 입력해 주세요.");
			document.getElementById("user_pwd").focus();
			return;
		}
		
		if(document.getElementById("user_pwd_check").value != document.getElementById("user_pwd").value){
			alert("새 비밀번호와 다시입력한 비밀번호가 일치하지 않습니다.");
			document.getElementById("user_pwd_check").focus();
			return;
		}
		
		if(document.getElementById("phone").value == ""){
			alert("전환번호를 입력해 주세요");
			document.getElementById("phone").focus();
			return;
		}
		
		if(confirm("비밀번호를 수정 하시겠습니까?")){
			document.getElementById("form01").action = "password_submit.jsp";
			document.getElementById("form01").submit();
		}
		
		
		
		
	}
	
	function goListPage(){
		document.getElementById("form01").action = "list.jsp";
		document.getElementById("form01").submit();
	}
	
	function onlyNumber(){ 
	    if((event.keyCode<48)||(event.keyCode>57)) 
	    event.returnValue=false; 
	} 
//-->
</script>
	<div id="rightarea">
		<div id="subcnts">			
		
			<!-- 디자인팀 수정요청[start] -->
			<div class="subTop04">
				<h2><img src="/images/customer/tit_customer.gif" alt="고객참여(Customer Participation)" /></h2>
				<p><img src="/images/customer/txt_customer.gif" alt="수많은 가능성을 확인한 오랜 시간들, 새로운 환경과 어려움에 도전하며 에너지 영토를 넓혀가고 있습니다." /></p>
			</div>
			<!-- 디자인팀 수정요청[end] -->
			
			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
				&gt; <span>고객참여</span>&gt; <span>인사청탁알선신문고</span><!-- &gt; <span class="locanow"></span>  -->
			</div>
			<!--// location: end //-->
			<div class="pagetle">
				<h3><img src="/images/customer/ttl_sub04_8_1.gif" alt="인사 청탁&bull;알선 신문고" /></h3>
			</div>
			<div id="boardsec">

<form action="password_submit.jsp" method="post" name="form01" id="form01">
	<input type="hidden" name="page" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page"))) %>">
	<input type="hidden" name="field" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))) %>">
	<input type="hidden" name="searchValue" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("searchValue"))) %>">
	<input type="hidden" name="type" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("type"))) %>">
			
				<table cellspacing="0" cellpadding="0" class="viewtype" summary="GREAT WAY 게시판의 상세정보를 입력합니다.">
					<caption>패스워드 수정</caption>
					<colgroup>
						<col width="300px" />
						<col width="auto" />
					</colgroup>
					<tr>
						<th colspan="2" scope="row" class="th1">
							※ 비밀번호 분실 시 보안상 비밀번호 찾기가 
							어려우니 다시 한번 확인 하시고 신중히 입력해 
							주세요
														
						</th>
					</tr>					
					<tr>
						<th scope="row" class="th1"><label for="subject">기존 비밀번호를 입력하세요</label></th>
						<td class="td1"><input type="password" value="" id="old_user_pwd" name="old_user_pwd" maxlength="200" class="input" style="width:80%;" /></td>
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="content">새 비밀번호를 입력하세요</label></th>
						<td class="cnts1"><input type="password" value="" id="user_pwd" name="user_pwd" maxlength="200" class="input" style="width:80%;" /></td>
					</tr>			
					<tr>
						<th scope="row" class="th1"><label for="content">새 비밀번호를 다시 한번 입력하세요</label></th>
						<td class="cnts1"><input type="password" value="" id="user_pwd_check" name="user_pwd_check" maxlength="200" class="input" style="width:80%;" /></td>
					</tr>	
					<tr>
						<th scope="row" class="th1"><label for="content">이메일</label></th>
						<td class="cnts1"><input type="text" value="<%=hash.get("EMAIL") %>" id="email" name="email" maxlength="200" class="input" style="width:80%;" ></td>
					</tr>
					<tr>
						<th scope="row" class="th1"><label for="content">전화번호( - 를 제외한 숫자만 입력해 주세요.)</label></th>
						<td class="cnts1"><input type="text" value="<%=hash.get("PHONE") %>" id="phone" name="phone" maxlength="200" class="input" style="width:80%;" onKeypress="onlyNumber();"></td>
					</tr>		
				</table>
</form>					
					<div class="boardbtm mtm10">
						<div class="btnsec">
							<a href="#content" onclick="onSubmit();return false;"><input type="image" src="/images/board/btn_ok.gif" alt="확인" /></a>
							<a href="#content" onclick="goListPage();return false;"><input type="image" src="/images/board/btn_cancel.gif" alt="취소" /></a>
							
						</div>
					</div>								
							
			</div>	
		</div>
	</div>
</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>