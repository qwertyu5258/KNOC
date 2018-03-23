<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","07");
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
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>상생경영</span>
					&gt; <span class="locanow">중소기업 상생협력</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_6_1_100.gif"  alt="중소기업상생협력"></h3>
				</div>
				<!--시작-->			
				<div class="moralsNews">
					<div id="six">
						<h4>
					<img src="/images/management/sub02_100_tt001.gif" alt="석유개발분야" /></h4>
						<ul class="newsBox">
							<li>석유개발사업의 특성상 외국 업체에 의존적인 시장구조를 탈피하기 위한 일환으로 국내 중소기업 참여를 유도
								<p>- 시추자재(케이싱, 특수시멘트, 화학제품 등)분야 및 E&P분야(생산시설 건설, 시추선건조, 시추작업 등)에서 국내 중소기업<br /> &nbsp;&nbsp; 제품활용을 통한 사업 협력가능성 모색
								</p>
								
							</li>
						</ul>

						<h4>
					<img src="/images/management/sub02_100_tt002.gif" alt="석유개발분야" /></h4>
						<ul class="newsBox">
							<li>공사 석유비축기지 운영 소요 외자재를 국산제품으로 대체하는 국산화 사업 확대 시행

								<p>- 공사 여수비축기지 원유펌프 국산화사례 등 신규발굴사례의 전파 등을 통해 전 비축기지에 국산화 사업 확대하여 향후 정부의<br /> &nbsp;&nbsp;구매조건부 신제품 개발사업과 연계 추진									
								</p>

								<p>- 교체빈도 부족 등 시장성 미흡으로 인해 참여에 소극적이었던 구매조건부 신제품 개발사업 분야를 중소기업청과 연계하여 추진<br /> &nbsp;&nbsp;하며, 관련 사업 성공시 판로개척 등과 같은 다양한 인센티브를 부여하여 중소기업의 적극적인 참여를 유도
									
								</p>
								
							</li>
						</ul>

						<h4>
					<img src="/images/management/sub02_100_tt003.gif" alt="성과공유제 사업" /></h4>
						<ul class="newsBox">
							<li>공사 비축기지 경비용역 등 10개 서비스(용역)부문에 도입 시행하고 있는 현행 성과공유제를 중소기업과의 성과공유가 가능한 분야를 엄선하여 대상사업을 확대

								<p>- 보다 적극적인 성과창출(비용절감, 시스템 개선 등)유도							
								</p>

								
								
							</li>
						</ul>


						<h4>
					<img src="/images/management/sub02_100_tt004.gif" alt="공공구매제도 활성화" /></h4>
						<ul class="newsBox">
							<li>중소기업 수주기회 및 판로확대를 통한 관련 제품구매 활성화

								<p>- 중소기업자간 경쟁제도 활성화, 중소기업 기술개발제품 우선구매 확대, 분리발주 대상 품목의 분리발주 철저 등 중소기업청과 <br /> &nbsp;&nbsp;연계하여 사업추진							
								</p>

								
								
							</li>
						</ul>
					</div>

                </div>
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 수정일">
				<caption>담당부서 및 연락처 수정일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>총무관리처 동반성장팀</td>
						<td><strong>연락처 : </strong>031-380-2061</td>
						<td><strong>수정일 : </strong>2015-09-30</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //--><!--// footer: end //-->
</div>
</body>
</html>