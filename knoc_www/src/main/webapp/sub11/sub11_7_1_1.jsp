<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","11");

	application.setAttribute("gNavMenuDepth2","07");

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
				<%@include file="/include/subtop_11.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사이버홍보실</span>	
					&gt; <span>어린이</span>
                    &gt; <span>석유상식</span>
                    &gt; <span class="locanow">석유역사</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/child/ttl_sub07_2_3.gif" alt="석유역사" /></h3>
				</div>
				<!--시작-->
				<div class="child2">
					<div>
					<!--	<ul class="tab">
                    	<li><a href="sub05_8_2_3.jsp"><img src="/images/child/tab_sub07_2_3_1_1r.gif" alt="석유100년"/></a></li>
						<li><a href="sub05_8_2_3_1.jsp"><img src="/images/child/tab_sub07_2_3_1_2.gif" alt="석유의종류"/></a></li>
						<li><a href="sub05_8_2_3_2.jsp"><img src="/images/child/tab_sub07_2_3_1_3.gif" alt="석유바로알기"/></a></li>
						</ul>
						
							<h4 class="mT0"><img src="/images/child/tab_sub07_2_2_1_1.gif" alt="석유의용도" /></h4>   tab 숨기기-->
							
							
							
							<div class="tabCon">   
							<p class="exp"><strong>우리나라에 석유가 들어와 사용된 지도 100년이 되었습니다.</strong><br/> </p>
								
								<p >19세기말에 유입된 석유는 1백년의 세월을 거치면서 우리생활에 많은 변화를 일으켰는데요.
								 특히 전적으로 수입에 의존한 국내석유산업은 시작부터 외국석유기업의 지배를 받아온바 있습니다.
								  그러나 1960년대 정유사들이 등장하면서 국내석유산업은 본격적으로 태동하기 시작했는데요.
								   이후 한 시대는 보호와 규제 속에서 그리고 이제는 치열한 시장경쟁의 원리 속에서 변화와 발전을 거듭해오고 있습니다. </p>
							<div class="oilUse">
								<div>
									<p><strong>1) 구한말~해방 전 (~1945년)</strong></p>
									<br />
									<ul>
									<li class="pT20">
										
										<strong >1880년대 : </strong>매천야록 등 자료에 의하면 우리나라에 석유가 처음 들어온 것은 이 때로 추측됩니다. 구한 말에는 주로 미국,러시아에서 석유를 수입했는데 우리나라에 처음 진출한 석유회사는 미국 스탠다드 석유회사입니다. 
									</li>
									<li>
										<strong>1910년대 : </strong>한일 합방 후 본격적인 외국계 석유회사가 등장했습니다.이때 등장한 외국계 석유회사는 미국 스탠다드 오일,텍사코 오일, 영국 쉘사 등의 3개 석유회사이며, 한국 최초의 주유소인 역전주유소(서울역 앞 소재)가 탄생했습니다.
										
									</li>
									<li>
										<strong>1920년대 : </strong>차량, 선박, 공장 등에서 석유가 에너지로 사용되기 시작했습니다.
									</li>
									<li>
										<strong>1930년대 :</strong>1935년 조선석유주식회사가 설립되어 원산에 최초의 정유공장이 세워졌습니다.또 석유류에도 상표가 붙기 시작했는데요. 텍사코의 유일한 대리점인 제일사가 솔표라는 상품의 석유를 판매했고, 영국의 쉘이 서울에 붉은 조개표란 상표로 종로주유소를 세웠습니다.
									</li>
									</ul>
								</div>
							</div>

							<div class="oilUse">
								<div>
									<p><strong>2) 해방 후~1970년대</strong></p>
									<br />
									<ul>
									<li class="pT20">
										
										<strong >1940년대 : </strong>해방 후 미군정은 석유배급 대행회사인 PDA에 군용제품을 일반인에게 판매했습니다. 
									</li>
									<li>
										<strong>1950년대 : </strong>6.25 이후 스탠다트, 칼텍스 등 3개사가 철수하고 대한석유 정제회사가 직접 판매를 담당했습니다.또 정부는 경유사용을 유도하기 위해 휘발유 물품세를 60%에서 100%로 인상하게 되어 휘발유 소비량이 감소하기 시작했습니다.
										
									</li>
									<li>
										<strong>1960년대 : </strong>대한석유공사법 시행령이 공포되면서 대한석유공사(현 SK의 모태) 가 설립되었습니다.1968년에는 휘발유 세금이 100%에서 200%로 인상되기도 했으며, 1969년 2월에는 석유제품 가격고시제가 실시됐습니다.
									</li>
									<li>
										<strong>1970년대 :</strong>1972년 석유사업법이 공포되었습니다. 대리점 주유소가 난립하는 등 과당 경쟁상황이 벌어지자 정부에서 석유사업법을 시행, 신규대리점과 주유소 허가를 잠정 중지시켰습니다. 1973년과 1979년에는 석유파동이 발발하기도 했습니다.
									</li>
									</ul>
								</div>
							</div>
						
						
							<div class="oilUse">
								<div>
									<p><strong>3)1980년대</strong></p>
									<br />
									<ul>
									<li class="pT20">
										
										<strong >1981년</strong> 정부는 정부, 정유사가 신규로 직접 주유소를 소유, 경영할 수 없도록 하는 것을 주요 골자로 하는 3.14 조정명령을 내렸습니다. 이후 대리점과 주유소가 급격히 증가하여 주유소당 판매물량이 1983년과 1984년의 경우 1981년보다 오히려 감소한바 있습니다. 또 각 시도의 주유소 허가기준이 마련, 기존 주유소와 직선거리 1~3km 이상 거리제한을 두고 주유소 허가제가 실시되면서 주유소 수의 증가추이가 둔화된바 있습니다. 
									</li>
									</ul>
								</div>
							</div>
														
								<div class="oilUse">
								<div>
									<p><strong>4)1990년대</strong></p>
									<br />
									<ul>
									<li class="pT20">
										
										<strong >1992년 </strong>에는 주유소 상표표시제가 실시되면서 강남구에는 무폴 주유소가, 또한 셀프 서비스와 자동판매 주유시가 첫 등장했습니다.
										1995년에는 주유소간 거리제한제도가 전면 폐지되면서 신규주유소 건설 붐이 일어 주유소 수가 급증하기도 했습니다. 1998년 IMF 이후에는 가격경쟁이 지속, 주유소마다 경비절감을 최고의 목표로 삼고 셀프주유소가 확산되기 시작했습니다. 
									</li>
									</ul>
								</div>
							</div>
							
							
							


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