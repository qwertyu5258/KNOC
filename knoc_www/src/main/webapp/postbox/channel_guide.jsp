<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/postbox/_channel_inc.jsp"%>

<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>   

    

<%@include file="/include/comheader.jsp"%>

	<!--// subtopNavi: start //-->
	<%@include file="/include/subtopnavi_new.jsp"%>
	<script type="text/javascript" src="/share/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/include/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript">
	var $j =jQuery.noConflict();
	$j(function(){
		$j(document).ready(function() {
		
			$j(".gubn").on("click",function(e){
				if($j(this).attr("href") == "channel_write.jsp"){// 의견제출하기
					document.bform.gubn.value = "write";
					document.bform.submit();
				}
				if($j(this).attr("href") == "channel_list.jsp"){// 의견조회하기
					document.bform.gubn.value = "list";
					document.bform.submit();
				}				
				e.preventDefault();
			});
		
		});
	});
	</script>
	
	<form name="bform" method="post" action="/postbox/channel_login.jsp"  onsubmit="do_search(this); return false;">
	<input type="hidden" name="gubn" value="" />
	</form>
	
	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_04.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>고객참여</span>
                    &gt; <span class="locanow">e청렴엽서함</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub04_5_4.gif" alt="e_POST" /></h3>
				</div>
				<!--시작-->
			  <div id="substar">
              	<p class="img_center"><img src="../images/info/img_great_knoc_03.gif" alt="Great Way는 사내직원들의 경영진에 대한 자유로운 의견게진을 지원하여 창의적인 기업문화를 구축하기 위하여 운영되는 곳입니다. 공사직원들만 이용하여 주시고, 공사와 관련하여 상담신청, 공사관련 제안, 민원 및 신고사항 등이 있으신 외부고객께서는 메인 메뉴의 고객참여 → 고객의 소리를 이용하여 주시기바랍니다." /></p>
                <p class="img_center pt05"><a class="gubn" href="channel_write.jsp"><img src="../images/info/btn_write.gif" alt="의견 제출하기" /></a> <a class="gubn" href="channel_list.jsp"><img src="../images/info/btn_list.gif" alt="의견 조회하기" /></a></p>
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
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>
 