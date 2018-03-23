<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
    <%
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
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contentsLayer">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->

<script type="text/javascript">
 
	if(!<%=isUser %>){
		alert("접근 권한이 없습니다.");
		location.href = "/ombudsman/main.jsp";
	}
</script>
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
			
			<div class="ombchoice">
			
				<p><img src="/images/omb/omb_txt.gif" alt="3명의 옴부즈맨 중 신고유형에 해당하는 한 명을 선택해서 작성하기 버튼을 클릭 해 주세요." /></p>
				<form action="form.jsp" method="post" name="joinform" id="joinform">
					
					<div class="ombcho">
					
					<ul class="omb_ph01">
						<li class="omb_input"><input type="radio" id="obm_type1" name="obm_type" value="obm1" checked="checked" /> <label for="obm_type1">부패 비위 신고사안</label></li>
						<li><img src="/images/omb/omb_photo01.jpg" alt="조생현 사진" /></li>
						<li><strong>조생현</strong></li>
						<li>(보령중보재단 상근이사)</li>
						<li>
							<ul class="omb_list02">
								<li>성균관대학교 약학대학 졸업</li>
								<li>해군소령 예편</li>
								<li>보령메디앙스(주) 대표이사</li>
								<li>현) 보령제약그룹 사회복지법인<br /> 보령중보재단 상근이사</li>
							</ul>
						</li>
					</ul>
					<ul class="omb_ph02">
						<li class="omb_input"><input type="radio" id="obm_type2" name="obm_type" value="obm2"> <label for="obm_type2" />계약관련 신고사안</label></li>
						<li><img src="/images/omb/omb_photo02.jpg" alt="목남희 사진" /></li>
						<li><strong>목남희</strong></li>
						<li>(단국대 교수)</li>
						<li>
							<ul class="omb_list02">
								<li>이화여자대학 정치외교학과 졸업</li>
								<li>회계정보학과(석사), 회계학과(박사)</li>
								<li>미국공인회계사</li>
								<li>Schering-Plough Korea 대표이사 </li>
								<li>현) 단국대학교 상경대 경영학부 교수</li>
							</ul>
						</li>
					</ul>
					<ul class="omb_ph03">
						<li class="omb_input"><input type="radio" id="obm_type3" name="obm_type" value="obm3"> <label for="obm_type3" />업무 물만/불편,<br /> &nbsp;&nbsp;고객서비스 관련</label></li>
						<li><img src="/images/omb/omb_photo03.jpg" alt="이상도 사진" /></li>
						<li><strong>이상도</strong></li>
						<li>(변호사)</li>
						<li>
							<ul class="omb_list02">
								<li>서울대학교 법과대학 졸업</li>
								<li>제22회 사법시험 합격</li>
								<li>법무부 보호국장</li>
								<li>서울서부지검 검사장 </li>
								<li>현) 법무법인 로고스 변호사</li>
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

