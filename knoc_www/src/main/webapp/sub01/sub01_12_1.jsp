<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","10");
	application.setAttribute("gNavMenuDepth3","03");
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
					&gt; <span>기업문화</span>
                    &gt; <span class="locanow">핵심가치</span>

				</div>
				<!--// location: end //-->
				
				<!-- [2009-10-25 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub12_01.gif" alt="핵심가치 " /></h3>
				</div>
				<!--시작-->				
				<div class="business2">
				  <h4><img src="/images/info/sub01_12_1.gif" alt="핵심가치" /></h4>
					<h5 style="font-weight:normal;" ><strong>핵심가치(Core Values)란?</strong><br/>공사 구성원이 갖추어야 할 사고와 행동의 기준이 되는 핵심적인 가치관입니다.</h5>
					<p><img src="/images/info/sub01_12_img01.gif" style="width:760px; height:311px; margin:20px 0;" 
					alt="도전(Challenge)-실패를 두려워하지 않고 변화와 혁신을 주도하여 미래의 가치를 창출합니다.
					공헌(Contribution)-협업을 통해 상생 발전에 기여하고 사회적 책임을 완수하겠다는 의지입니다.
					전문가정신(Professionalism)-무한경쟁시대에서 글로벌 경쟁력을 갖춘 전문성과 기술력을 배양하여 글로벌 최고가 되겠다는 의지입니다.
					배려(Respect)-열린 마음으로 고객을 존중하고 내부고객 및 국민의 소리에 귀를 기울이는 소통을 하겠다는 의지입니다.
					"/></p>				
						
				</div>	 
				<!--//끝-->
			
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
						<td class="contact_user"><strong>담당자 : </strong>고유나</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2228</td>
					</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer end -->
			
		</div>
	</div>
	
	</div>
	
	<!--// footer: start //-->
	<%@include file="/include/comfooter.jsp"%>
	<!--// footer: end //-->
	
	</div>
			
</body>
</html>