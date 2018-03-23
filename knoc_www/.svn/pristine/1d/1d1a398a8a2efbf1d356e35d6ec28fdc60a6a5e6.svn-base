<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
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
				<div class="pagetle">
				<h3><img src="/images/omb/ttl_sub04_8_10.gif" alt="청렴 옴부즈맨 신고센터" /></h3> 
                </div>
				<div id="substar">
					
					<div class="comLogin">
						<fieldset>
						<legend>로그인</legend>
						<form name="log_in" action="login.jsp" method="post" onsubmit="return submit_chk();">              	
							
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
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>