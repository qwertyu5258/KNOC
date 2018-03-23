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
<script type="text/javascript" src="/share/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/include/js/jquery.easing.1.3.js"></script>	
<div id="contents">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->

	<script type="text/javascript">
	var $j =jQuery.noConflict();
	$j(function(){
		$j(document).ready(function() {
		
			$j(".gubn").on("click",function(e){
				if($j(this).attr("href") == "form.jsp"){// 글 게시하기
					document.bform.gubn.value = "form";
					document.bform.submit();
				}
				if($j(this).attr("href") == "list.jsp"){// 내가 쓴 글보기
					document.bform.gubn.value = "list";
					document.bform.submit();
				}				
				e.preventDefault();
			});
		
		});
	});
	</script>

<form name="bform" method="post" action="/sinmungo/main.jsp"  onsubmit="do_search(this); return false;">
	<input type="hidden" name="gubn" value="" />
</form>

	<div id="rightarea">
		<div id="subcnts">	
			<!-- 디자인팀 수정요청[start] -->
			<%@include file="/include/subtop_04.jsp"%>
			<!-- 디자인팀 수정요청[end] -->
			
			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
				&gt; <span>고객참여</span>&gt; <span>청탁등록</span><!-- &gt; <span class="locanow"></span>  -->
			</div>
			<!--// location: end //-->
			<div class="pagetle">
				<h3><img src="/images/customer/ttl_sub04_8_1.gif" alt="인사 청탁&bull;알선 신문고" /></h3>
			</div>
			<div class="customer">
			<h4 class="mT0 pb10"><img src="../images/customer/sinmungo_01_tit.gif" alt="'안내문 인사청탁,알선 신문고'는 인사 청탁,알선행위 관련 직원들의 자유로운 의견개진을 지원하여 조직 내 인사 불공정행위를 예방하기 위하여 운영되는 곳입니다." /></h4>
			<h4 class="mT0 pb10"><img src="../images/customer/sinmungo_02_tit.gif" alt="'청탁을 받는 임직원은 청탁등록을 이유로 청탁을 거부할 수 있는 명   분을 갖게 되고, 청탁내용을 등록한 경우에는 청탁거부로 간주하여 업무수행 과정에서의 공정성을 기본적으로 인정하고 청탁 관련 문제 발생시 징계면제 등 선의의 임직원을 보호하는데 그 목적이 있습니다.
" /></h4>
<h4 class="mT0 pb10"><img src="../images/customer/sinmungo_03_tit.gif" alt="'청탁을 받는 임직원은 청탁등록을 이유로 청탁을 거부할 수 있는 명   분을 갖게 되고, 청탁내용을 등록한 경우에는 청탁거부로 간주하여 업무수행 과정에서의 공정성을 기본적으로 인정하고 청탁 관련 문제 발생시 징계면제 등 선의의 임직원을 보호하는데 그 목적이 있습니다.
" /></h4>
<h5 class="mT0 pb10"><img src="../images/customer/sinmungo_03_1_tit.gif" alt="'청탁을 받는 임직원은 청탁등록을 이유로 청탁을 거부할 수 있는 명   분을 갖게 되고, 청탁내용을 등록한 경우에는 청탁거부로 간주하여 업무수행 과정에서의 공정성을 기본적으로 인정하고 청탁 관련 문제 발생시 징계면제 등 선의의 임직원을 보호하는데 그 목적이 있습니다.
" /></h5>	
			<div class="declaration" >						
				<ul>
					<li> 통상적인 행정절차를 벗어난 신속한 업무처리 요청 </li>
					<li> 상벌, 승진 등 각종 인사에 있어서 우대·특혜 요청 </li>
					<li> 상급 감독기관으로부터의 특별한 업무처리 요청 등 </li>
					<li> 일반 민원인과는 다르게 과도한 편의·특혜 제공 등 우대 요청</li>
					<li> 단속·점검 등 관리·감독권 행사를 소홀히 하도록 요청 </li>
					<li> 각종 시정명령을 약화시키도록 요청</li>
				</ul>						
			</div>
			
			<h5 class="mT0 pb10 pt20"><img src="../images/customer/sinmungo_03_2_tit.gif" alt="'청탁을 받는 임직원은 청탁등록을 이유로 청탁을 거부할 수 있는 명   분을 갖게 되고, 청탁내용을 등록한 경우에는 청탁거부로 간주하여 업무수행 과정에서의 공정성을 기본적으로 인정하고 청탁 관련 문제 발생시 징계면제 등 선의의 임직원을 보호하는데 그 목적이 있습니다.
" /></h5>
<h5 class="mT0 pb10"><img src="../images/customer/sinmungo_03_3_tit.gif" alt="'청탁을 받는 임직원은 청탁등록을 이유로 청탁을 거부할 수 있는 명   분을 갖게 되고, 청탁내용을 등록한 경우에는 청탁거부로 간주하여 업무수행 과정에서의 공정성을 기본적으로 인정하고 청탁 관련 문제 발생시 징계면제 등 선의의 임직원을 보호하는데 그 목적이 있습니다.
" /></h5>
<h4 class="mT0 pb10"><img src="../images/customer/sinmungo_04_tit.gif" alt="'청탁을 받는 임직원은 청탁등록을 이유로 청탁을 거부할 수 있는 명   분을 갖게 되고, 청탁내용을 등록한 경우에는 청탁거부로 간주하여 업무수행 과정에서의 공정성을 기본적으로 인정하고 청탁 관련 문제 발생시 징계면제 등 선의의 임직원을 보호하는데 그 목적이 있습니다.
" /></h4>
				
			<div class="btnsec" style="text-align: center; margin-top: 20px">
				<a class="gubn" href="form.jsp"><img src="/images/member/btn_write.gif" alt="글게시하기" ></a>
				<a class="gubn" href="list.jsp"><img src="/images/member/btn_myarticle.gif" alt="내가쓴글보기" ></a>								
			</div>
			</div>	
			
			<!-- new_officer -->
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"></td>
					<td class="contact_team"><strong>담당부서 : </strong>감사실 청렴경영감사팀</td>
					<td class="contact_user"><strong>담당자 : </strong>황민철</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2124</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->
		</div>
	</div>
</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>

