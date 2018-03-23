<%@page import="com.neoboard.session.UserSession"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
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
	
	if(session.getAttribute("SINMUNGO_STATUS_NO") == null){ 
		UserSession userSession = (UserSession)session.getAttribute("USERSESSION");
		if(userSession != null && userSession.getUserVirtualno() != null && userSession.getUserVirtualno().length() > 0){
			session.setAttribute("SINMUNGO_STATUS_NO", "2");
		}
	}
	
%>   

 
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contentsLayer">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
<script type="text/javascript">
<!--
function submitfn(){
	document.getElementById("joinform").action = "form.jsp";
	document.getElementById("joinform").submit();
}

function goListPage(){
	location.href = "list.jsp";
}

//-->
</script>
	<div id="rightarea">
		<div id="subcnts">	
			<!-- 디자인팀 수정요청[start] -->
			<%@include file="/include/subtop_04.jsp"%>
			<!-- 디자인팀 수정요청[end] -->
			
			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
				&gt; <span>고객참여</span>&gt; <span class="locanow">청렴 옴부즈만 신고센터</span>
			</div>
			<!--// location: end //-->

			<div class="pagetle">
				<h3><img src="/images/omb/ttl_sub04_8_10.gif" alt="청렴 옴부즈만 신고센터" /></h3> 
			</div>
			
			<div class="ombchoice">
			
				<p><img src="/images/omb/omb_txt.gif" alt="3명의 옴부즈만 중 신고유형에 해당하는 한 명을 선택하여 작성하기 버튼을 클릭해 주세요." /></p>
				<form action="form.jsp" method="post" name="joinform" id="joinform">
					
					<div class="ombcho">
					
					<ul class="omb_ph01">
						<li class="omb_input"><input type="radio" id="obm_type1" name="obm_type" value="obm1" checked="checked" /> <label for="obm_type1">임직원 부패·비위사건 관련<br />신고사안</label></li>
						<li><img src="/images/omb/omb_photo07.jpg" alt="편호범 사진" /></li>
						<li><strong>편호범 옴부즈만</strong></li>
						<li>
							<ul class="omb_list02">
								<li>수원대 교수</li>
								<li>한국원가공학회 회장</li>
								<li>딜로이트안진회계법인 부회장</li>
								<li>감사원 감사위원</li>
							</ul>
						</li>
					</ul>
					<ul class="omb_ph02">
						<li class="omb_input"><input type="radio" id="obm_type2" name="obm_type" value="obm2"> <label for="obm_type2" />계약관련 신고사안<br />
						(불공정 행위 등)</label></li>
						<li><img src="/images/omb/omb_photo08.jpg" alt="손양훈 사진" /></li>
						<li><strong>손양훈 옴부즈만</strong></li>
						<li>
							<ul class="omb_list02">
								<li>인천대 교수</li>
								<li>한국자원경제학회장</li>
								<li>에너지경제연구원 원장</li>
								<li>국민경제자문회의 창조경제 분과 위원</li>
							</ul>
						</li>
					</ul>
					<ul class="omb_ph03">
						<li class="omb_input"><input type="radio" id="obm_type3" name="obm_type" value="obm3"> <label for="obm_type3" />고객서비스 관련 신고사안<br />(업무관련불만·불편사항 등)
</label></li>
						<li><img src="/images/omb/omb_photo09.jpg" alt="이택희 사진" /></li>
						<li><strong>이택희 옴부즈만</strong></li>
						<li>
							<ul class="omb_list02">
								<li>중앙디자인웍스 대표</li>
								<li>중앙일보 심의실 실장</li>
								<li>중앙일보 편집국 편집디자인에디터</li>
								<li>중앙일보 편집국 편집부 기자</li>
							</ul>
						</li>						 
					</ul>
					
					</div><!-- ombcho end -->
					
					<div class="omb_btn">
						<ul>
							<li><a href="#submit" onclick="submitfn();"><img src="/images/omb/btn_omb_write.gif" alt="작성하기" /></a></li>
							<li><a href="#boardsec" onclick="goListPage(); return false;"><img src="/images/omb/btn_omb_search.gif" alt="처리결과 조회" /></a></li>
							<!-- <input type="button" id="submit" name="submit" value="작성하기" onclick="javascript:submitfn();" /> -->
						</ul>
					</div>		
				
				</form>
			</div><!-- ombchoice end -->
			
			</div>	
		</div>
	</div>

	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>

