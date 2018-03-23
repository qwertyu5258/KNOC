<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@include file="/include/comheader.jsp"%>


  <%@include file="/include/subtopnavi_new.jsp"%>
  <!--// subtopNavi: start //-->

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
                    &gt; <span>해외사업</span>
                    &gt; <span class="locanow">석유개발현황도</span>
				</div>
				<!--// location: end //-->

				<!-- [2010-01-20 수정] :: 작성자: 이신권 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_2_2.gif" alt="석유개발현황도" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                	<%@include file="sub03_2_2_map.jsp"%>

                   <h4><img src="../images/business/img_ttl_sub03_2_2_harvest.gif" alt="캐나다-harvest" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_harvest_2016.jpg" alt="캐나다-harvest 광구도" /></div>

                    <p class="rtxt">[2016년 9월말 기준]</p>
					<table class="chart2" summary="캐나다-harvest 광구 정보를 확인할 수 있습니다.">
					<caption>캐나다-harvest 광구 정보</caption>
					<col width="60px" />
					<col width="60px" />
					<col width="70px" />
					<col width="70px" />
					<col width="50px" />
					<col width="50px" />
					<col width="60px" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					<th scope="col">사업명</th>
					<th scope="col">운영권자</th>
					<th scope="col">지경부 신고일</th>
					<th scope="col">한국측지분<br />(%(퍼센트))</th>
					<th scope="col">한국측지분<br />공사</th>
					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">생산</td>
					<td>캐나다 Harvest Operations Corp.</td>
					<td>한국석유공사</td>
					<td>'09.12</td>
					<td>100</td>
					<td>100</td>
					<td>-</td>
					</tr>
					</tbody>
					</table>

                    <p class="mT20">공사는 2009년 12월 22일 매장량 약 2억 배럴 규모의 석유가스 생산광구 및 오일샌드 자산을 보유한 캐나다 Harvest사를 미화 39.5억불(40.7억 캐나다불)에 인수하였으며, 이후 2011년 2월에 캐나다 Hunt사 자산 인수(5억 캐나다불) 및 공사의 BlackGold 자산이전 등을 통하여 매장량 규모를 4.5억 배럴(15년말 기준)로 증가시켰다.</p>
                    <p>캐나다 주요 석유기업의 하나로 캘거리에 본사를 두고 있는 Harvest사는 캐나다 중서부 앨버타, 브리티쉬 콜롬비아 지역에 위치한 상류자산으로부터 3.3만배럴/일 규모의 석유가스를 생산 중(’16.9월)이다.</p>
                </div>
				<!--//끝-->
		  </div>

		  <!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-12-22</td>
					<td class="contact_team"><strong>담당부서 : </strong>생산사업2처 미주생산2팀</td>
					<td class="contact_user"><strong>담당자 : </strong>이병용</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-3425</td>
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