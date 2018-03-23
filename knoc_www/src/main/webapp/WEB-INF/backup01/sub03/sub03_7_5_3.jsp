<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","05");
	application.setAttribute("gNavMenuDepth4","00");
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
			  <%@include file="/include/subtop_03.jsp"%>
			  <!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>사업소개</span>
                   	&gt; <span>에특회계</span>
                  	&gt; <span class="locanow">사업융자, 보조지원안내</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
				<h3><img src="/images/business/ttl_sub03_7_5.gif" alt="사업융자, 보조지원안내" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
					<div>
						<ul class="tab">
						<li><a href="sub03_7_5.jsp"><img src="/images/business/ab_sub03_7_5_1.gif" alt="석유일반 사업자금대출" /></a></li>
						<li><a href="sub03_7_5_1.jsp"><img src="/images/business/ab_sub03_7_5_2.gif" alt="석유개발 사업자금대출" /></a></li>
<!--
						<li><a href="sub03_7_5_2.jsp"><img src="/images/business/ab_sub03_7_5_3.gif" alt="해외석유 개발조사보조" /></a></li>
-->						
						<li><a href="sub03_7_5_3.jsp"><img src="/images/business/ab_sub03_7_5_4r.gif" alt="원유도입선다변화 지원" /></a></li>
						</ul>
						<h5>사업개요</h5>
	          				<p>원유도입의 중동의 존도를 낮추고 원유도입선 다변화를 통한 공급원의 안정적 확보를 위해 중동운송비 보다 추가로 소요된 다변화 대상지역의 운송비를 보전</p>
						<h5>지원대상 및 지원기준</h5>
	          				<p>지원대상 : 다변화 대상지역(미주, 아프리카, 구주)의 산유국 정부 또는 국영 석유회사, 석유 메이저 또는 트레이딩 회사와 장기계약을 체결하고 원유를 도입하는 국내석유정제업자</p>
	          				<p>지원기준 : 원유도입 추가운송비 산출기준과 추가운송비 지원한도를 비교하여 추가운송비 지원한도(80%) 범위내에서 보전</p>
						<h5>지원방법</h5>
	          				<p>석유 수입부 과금에서 차감</p>
	          				<div><img src="../images/business/imgin1_sub03_7_5_4.gif" alt="원유도입선 다변화 지원금 지원방법" />
								<p class="blindtext">다변화 원유 수입업자 →[차감신청] [차감된 납부고지서 교부]← 한국석유공사 →[차감신청승인 요청] [차감승인]← 지식경제부</p>
							</div>
						<h5>지원현황</h5>
	          				<p>- 원유도입선 다변화 지원금은 85년 최고 772억원이 지원된 이후 감소하다가, 90년 걸프사태이후 다시 증액지원되었으나 95년 이후 지원금액이 점차 축소<br />- 원유도입선 다변화제도를 시행하기 전인 80년 당시 중동의존도는 99% 수준이었으나, 원유도입선 다변화제도 시행 이후 85년도에는 57% 수준까지 크게 축소되었고, 최근에는 지원규모 축소로 인해 2009년 약 82%의 중동 의존도를 보이고 있음.</p>
							<p>▼ 최근 5년간 지원실적 및 중동의존도 추이</p>
							 <!--테이블-->
                            <table class="chart2" summary="원유도입선 다변화 지원금 연도별 지원실적을 확인할 수 있습니다.">
							<caption>원유도입선 다변화 지원금 연도별 지원실적</caption>
							<col width="80px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<col width="31px" />
							<thead>
							<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">1999</th>
							<th scope="col">2000</th>
							<th scope="col">2001</th>
							<th scope="col">2002</th>
							<th scope="col">2003</th>
							<th scope="col">2004</th>
							<th scope="col">2005</th>
							<th scope="col">2006</th>
							<th scope="col">2007</th>
							<th scope="col">2008</th>
							<th scope="col">2009</th>
							<th scope="col">2010</th>
							</tr>
							</thead>
							<tbody>
							<tr>
							<th scope="row" class="first">지원금액(백만원)</th>
							<td>4,716</td>
							<td>4,530</td>
							<td>4,818</td>
							<td>4,818</td>
							<td>441</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							</tr>
							<tr>
							<th scope="row" class="first">지원비율(신청액 대비,%)</th>
							<td>68.8</td>
							<td>84.7</td>
							<td>66.3</td>
							<td>66.1</td>
							<td>100</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							</tr>
							<tr>
							<th scope="row" class="first">중동 의존도(%)</th>
							<td>72.3</td>
							<td>76.9</td>
							<td>77.0</td>
							<td>73.5</td>
							<td>79.5</td>
							<td>78.1</td>
							<td>81.8</td>
							<td>82.2</td>
							<td>80.7</td>
							<td>86.3</td>
							<td>84.5</td>
							<td>81.8</td>
							
							</tr>
							</tbody>
							</table>
	            			<!--테이블-->
							<p>※ 2004년 이후 지원실적 없음</p>
						<h5>관련규정</h5>
	          				<p>산업자원부 고시 제 2004-53호(2004.05.11) "원유도입선 다변화를 촉진하기 석유 수입부 과금에 관한 고시"</p>
	          				<p>※ 자세한 사항은 한국석유공사 경영지원처 에특회계팀(전화 : 031-380-2408)으로 문의하시기 바랍니다.</p>
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
						<td><strong>담당부서 : </strong>총무관리처 에특회계팀</td>
						<td><strong>연락처 : </strong>031-380-2402</td>
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