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
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
%>   

 
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contentsLayer">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
<script type="text/javascript">
<!--

function goPage(){
	location.href = "form.jsp";
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
				&gt; <span>고객참여</span>&gt; <span>인사청탁알선신문고</span><!-- &gt; <span class="locanow"></span>  -->
			</div>
			<!--// location: end //-->
			<div class="pagetle">
				<h3><img src="/images/customer/ttl_sub04_8_1.gif" alt="인사 청탁&bull;알선 신문고" /></h3>
			</div>
			<div class="customer">
			<h4 class="mT0 pb10"><img src="../images/customer/sinmungo_01_tit.gif" alt="'안내문 인사청탁,알선 신문고'는 인사 청탁,알선행위 관련 직원들의 자유로운 의견개진을 지원하여 조직 내 인사 불공정행위를 예방하기 위하여 운영되는 곳입니다." /></h4>	
			<div class="declaration" >						
				<ul>
					<li> 공사 직원들만 이용하여 주시고, 공사와 관련하여 상담신청, 공사관련 제안, 민원 및 신고사항 등이 있으신 외부고객께서는 고객상담실, 고객/국민제안, 고객민원/신고를 이용하여 주시기 바랍니다. </li>
					<li> 개인 인사이동희망 등 인사상담은 사내포털 e-HR 메뉴의 인사관리 시스템을 이용해주시기 바랍니다. </li>
					<li> ‘인사 청탁·알선 신문고’에 제출된 의견은 무기명·비공개로 인사팀장만 확인 가능하며, 제출자의 신원은 확인되지 않습니다. </li>
				</ul>						
			</div>
				
			<div class="btnsec" style="text-align: center; margin-top: 20px">
				<a href="#boardsec" onclick="goPage(); return false;"><img src="/images/member/btn_write.gif" alt="글게시하기" ></a>
				<a href="#boardsec" onclick="goListPage(); return false;"><img src="/images/member/btn_myarticle.gif" alt="내가쓴글보기" ></a>								
			</div>
			</div>	
		</div>
	</div>
</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>

