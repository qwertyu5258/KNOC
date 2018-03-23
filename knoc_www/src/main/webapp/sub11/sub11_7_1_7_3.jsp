<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","11");

	application.setAttribute("gNavMenuDepth2","07");

	application.setAttribute("gNavMenuDepth3","01");

	application.setAttribute("gNavMenuDepth4","07");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<%@include file="/include/comheader.jsp"%>


<!--// subtopNavi: start //-->
<%@include file="/include/subtopnavi_new.jsp"%>
	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
			  <%@include file="/include/subtop_11.jsp"%>
			  <!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사이버홍보실</span>	
					&gt; <span>어린이</span>
                    &gt; <span>석유상식</span>
                    &gt; <span class="locanow">석유개발과정</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/child/ttl_sub11_7_1_7.gif" alt="석유개발과정" /></h3>
				</div>
				<!--시작-->
               <div class="business2">
					<div>
						<ul class="tab">
						<li><a href="sub11_7_1_7.jsp" title="개발순서" ><img src="/images/child/img_tab01.gif" alt="개발순서" /></a></li>
						<li><a href="sub11_7_1_7_1.jsp" title="탐사단계" ><img src="/images/child/img_tab02.gif" alt="탐사단계"/></a></li>
						<li><a href="sub11_7_1_7_2.jsp" title="개발단계" ><img src="/images/child/img_tab03.gif" alt="개발단계"/></a></li>
						<li><a href="sub11_7_1_7_3.jsp" title="생산단계" ><img src="/images/child/img_tab04_on.gif" alt="생산단계"/></a></li>
						</ul>
						<div class="mT20"><img src="../images/child/img_sub06_3_2_tab04_01.gif" alt="석유생산단계에서는 석유생산 예측 및 최적 생산을 위한 저류층 관리, 생산증진, 생산시설 유지관리 등의 작업 과정" /></div>
						<h5>저류층 관리(Reservoir Management)</h5>
						<p>생산 예측 : 생산정 및 저류층의 동향을 지속적으로 관찰/분석하여 장단기 생산량 예측<br />
						생산최적화 : 저류층 동향 및 생산 시스템을 종합적으로 분석하여 생산량 최적화(Optimization)</p>
						<h5>생산증진(Production Enhancement)</h5>
						<p>추가시추 : 생산정간 추가적인 시추를 통해 생산량 증진<br />
						수공법 : 생산정 인근의 수주입을 통한 원유 회수율 증대<br />
						화공법 : 주입유체의 화학적 성질을 이용한 원유 회수율 증대<br />
						인공채유법 : 공저펌프등을 이용하여 생산량 증대</p>
					</div>
				</div>
				<!--//끝-->
		  </div>
		
		  <!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"></td>
					<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
					<td class="contact_user"><strong>담당자 : </strong>조혜진</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2231</td>
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