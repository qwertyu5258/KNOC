<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");

	application.setAttribute("gNavMenuDepth2","08");

	application.setAttribute("gNavMenuDepth3","01");

	application.setAttribute("gNavMenuDepth4","01");
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
				<%@include file="/include/subtop_07.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>어린이</span>
                    &gt; <span>석유이야기</span>
                    &gt; <span class="locanow">한국석유공사</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/child/ttl_sub07_1_1_1.gif" alt="한국석유공사" /></h3>
				</div>
				<!--시작-->
				<div class="child">
					<div>
					<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
                		<ul class="tab">
                    	<li><a href="sub05_8_1_1_1.jsp"><img src="/images/child/tab_sub07_1_1_1_1r.gif" alt="인사말"/></a></li>
						<li><a href="sub05_8_1_1.jsp"><img src="/images/child/tab_sub07_1_1_1_2.gif" alt="석유공사는"/></a></li>
						<li><a href="sub05_8_1_1_2.jsp"><img src="/images/child/tab_sub07_1_1_1_3.gif" alt="페트로핀"/></a></li>
						</ul>
						<div class="tabCon">
							<div><img src="/images/child/sub07_1_1_1_te1.gif" alt="" /></div>
							<div class="conRight">
								<p><img src="/images/child/sub07_1_1_1_img1.gif" alt="어린이 여러분, 안녕하세요" /></p>
								<p><br />한국석유공사 어린이 사이트’에 오신 것을 환영합니다.
									석유는 우리나라 경제와 산업에 꼭 필요한 중요한 자원입니다. 한국석유공사는 석유자원을 아무런 차질 없이 공급하기 위해 국내와 해외에서 석유자원을 개발하는 일과 위기상황에 대비하여 석유를 저장하는 일, 석유에 관한 각종 정보를 제공하는 일들을 하고 있는 국내유일의 석유전문기업입니다.<br />
									또한 지난 2004년 7월부터는 우리나라 동해 앞바다에서 많은 양의 천연가스와 품질이 좋은 원유를 생산함으로써 우리나라를 산유국의 대열에 들어서게 했습니다. 뿐만 아니라 베트남, 리비아, 인도네시아 등 해외 여러 곳에서도 많은 양의 원유를 우리의 기술로 개발하여 생산하고 있습니다.<br /><br />
									한국석유공사는 앞으로도 기술과 역량을 갈고 닦아 더 넓은 세계에서 더 많은 석유 자원을 개발하여, 세계적인 석유전문기업으로 성장할 수 있도록 최선을 다할 것입니다.
									어린이 여러분들께서도 세계를 향해 힘차게 나아갈 수 있도록 항상 열심히 노력하시기 바라며, 이 곳 ‘한국석유공사 어린이 사이트’에서 즐겁고 유익한 시간 보내시기 바랍니다.<br /><br />
									감사합니다.</p>
							</div>
						</div>
					</div>
				</div>
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>비서실 홍보팀</td>
						<td><strong>연락처 : </strong>031-380-2153</td>
						<td><strong>관리일 : </strong>2015-09-30</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>