<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>             
<%@include file="/include/comheader.jsp"%>


	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
                    &gt; <span>CEO</span>
                    &gt; <span class="locanow">CEO인사말씀</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-20 수정 ] 작성자:장정인-->
				<div class="pagetle">
					<h3><img src="/images/info/tit_sub01_1_1.gif" alt="CEO인사말씀" /></h3>
				</div>
				<!--시작-->				
				<div class="ceo">
					<div class="ceo_greeting">
						<div class="ceo_greeting">
	                	<img src="/images/info/global_knoc.gif" alt="에너지 그 이상의 가치를 실현하는 기업  Creating Value Beyond Energy 한국석유공사 홈페이지를 방문해 주신 국민 여러분께 감사드립니다." />
                        <img src="/images/info/ceo_2014.gif" alt="ceo인사말씀" longdesc="/longdesc/ceo_greeting.html" class="mt40"/>
                    	</div><!-- ceo_greeting end -->
					</div>
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
						<td class="contact_team"><strong>담당부서 : </strong>비서팀 </td>
						<td class="contact_user"><strong>담당자 : </strong>최서윤</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2033</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
			
			
		</div>
	</div>
	
	</div>
	
	<!--// footer: start //--> 
	<%@include file="/include/comfooter.jsp"%>
	<!--// footer: end //-->
	
	</div>

</body>
</html>