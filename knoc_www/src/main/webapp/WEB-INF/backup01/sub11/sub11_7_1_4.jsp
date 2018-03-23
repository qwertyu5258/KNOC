<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","11");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","04");
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
				<%@include file="/include/subtop_11.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사이버홍보실</span>	
					&gt; <span>어린이</span>
                    &gt; <span>석유상식</span>
                    &gt; <span class="locanow">아껴요!석유!</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/child/ttl_sub07_2_3_a3.gif" alt="아껴요!석유!" /></h3>
				</div>
				<!--시작-->
				<div class="child">
					<div>
                    
						<div class="tabCon2">
							<h4 class="mT0"><img src="/images/child/tab_sub07_2_2_2_1.gif" alt="우리나라는 에너지 해외의존도가 매우 높습니다." /></h4>
							<ol>
								<li><strong>1. 냉장고 문의 여닫는 횟수를 줄입시다.</strong>
								<p>냉장고 문을 열면 냉기가 빠져나가고 내부전등도 켜져 전력소모량이 커집니다.<br/>
									절감효과 : - 월간 70원 - 연간 840원 - 전국 126억원</p></li>
								<li><strong>2. 가급적 선풍기를 사용합시다.</strong>
									<p>여름철 2∼4시 사이에는 에어컨 사용을 자제하고 선풍기를 이용합시다.<br/>
									절감효과 : - 월간 500원 - 연간 6,000원 - 전국 480억원</p></li>
								<li><strong>3. 선풍기 풍량은 한단계씩 낮추어 사용합시다.</strong>
									<p>선풍기는 강중약 조절에 따라 10W 정도의 전력소모가 차이 나므로 가능하면 약하게 사용하도록 합시다.<br/>
									절감효과(여름철 3개월) : - 월간 150원 - 연간 450원 - 전국 9억원</p></li>
								<li><strong>4. 에너지가 많이 든 온수물 사용을 줄입시다.</strong>
								<p>온수를 적정온도로 하고 가급적 샤워기를 이용합시다.<br/>
								절감효과 : - 월간 500원 - 연간 6,000원 - 전국 90억원</p></li>
								<li><strong>5. 수돗물을 아껴쓰고 재 이용합시다.</strong>
								<p>물을 틀어놓고 양치질, 면도를 하지 말고, 물 누수를 막읍시다.<br/>
								절감효과 : - 월간 788원 - 연간 9,456원 - 전국 709억원</p></li>
								<li><strong>6. TV는 필요한 시간만 시청합시다.</strong>
								<p>습관적으로 TV를 켜놓지 않도록 합시다.<br/>
								절감효과 : - 월간 230원 - 연간 2,800원 - 전국 67억원</p></li>
								<li><strong>7. 컴퓨터를 쓰지 않을 때는 꺼둡시다.</strong>
								<p>10분이상 사용하지 않을 때는 전원을 꺼두는 것이 좋습니다.<br/>
								절감효과 : - 월간 2,130원 - 연간 25,600원 - 전국 512억원</p></li>
							</ol>
						</div>					
					 </div>
				</div>
				<!--//끝-->
			</div>
			
			<div class="new_officer">
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
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>