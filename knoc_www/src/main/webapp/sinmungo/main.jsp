<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.util.*"%>
<jsp:useBean id="etc" class="com.neoboard.util.EtcUtil" scope="page" />    
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	String gubn = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("gubn")));	
	
%>
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
	//<![CDATA[
	function submit_chk() {

		if(document.getElementById("user_id").value == ""){
			alert("아이디를 입력해 주세요");
			return false;
		}

		if(document.getElementById("user_pwd").value == ""){
			alert("패스워드를 입력해 주세요");
			return false;
		}
	}
	//]]>
</script>

	<!--// subtopNavi: start //-->
	<%@include file="/include/subtopnavi_new.jsp"%>
	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->

		<div id="rightarea">
			<div id="subcnts">

				<!--// location: start //-->
				<!-- 디자인팀 수정요청[start] -->
				<%@include file="/include/subtop_04.jsp"%>
				<!-- 디자인팀 수정요청[end] -->

				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>고객참여</span>&gt; <span>청탁등록</span><!-- &gt; <span class="locanow"></span>  -->
				</div>
				<div class="pagetle">
					<h3><img src="/images/customer/ttl_sub04_8_1.gif" alt="청탁등록" /></h3>
				</div>
				<div id="substar">

					<div class="sinLogin">
						<fieldset>
						<legend>로그인</legend>
						<form name="log_in" action="login.jsp" method="post" onsubmit="return submit_chk();">
						<input type="hidden" name="gubn" value="<%=gubn%>" />
							<div class="loginBox">

								<p class="blindtext">한국석유공사 홈페이지를 방문해 주셔서 감사합니다.</p>

								<div><label for="id"><img src="../images/member/img_login_id.gif" alt="아이디" /></label><input type="text" id="user_id" name="user_id" maxlength="20" /></div>

								<div><label for="passwd"><img src="../images/member/img_login_pw.gif" alt="비밀번호"/></label><input type="password" id="user_pwd" name="user_pwd" maxlength="32" /></div>

							</div>
							<div class="loginbtn"><input type="image" src="../images/member/btn_submit.gif" alt="확인"/></div>

						</form>

						</fieldset>
					</div>

				</div>
				<!--//끝-->
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

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>