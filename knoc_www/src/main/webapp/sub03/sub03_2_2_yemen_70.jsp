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

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_2_2.gif" alt="석유개발현황도" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                	<%@include file="sub03_2_2_map.jsp"%>

                   <h4><img src="../images/business/img_ttl_sub03_2_2_yemen_70.gif" alt="예멘 70" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_yemen_70.gif" alt="예멘 70 광구도" /></div>

                   <p class="rtxt">[2016년 10월말 기준]</p>
					<table class="chart2" summary="예멘 70 광구 정보를 확인할 수 있습니다.">

					<caption>예멘 70 광구 정보</caption>
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

					<th scope="col">광구명</th>

					<th scope="col">운영권자</th>

					<th scope="col">지경부 신고일</th>

					<th scope="col">한국측지분<br />(%(퍼센트))</th>

					<th scope="col">공사지분</th>

					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">탐사사업</td>
					<td>예멘70</td>
					<td>TOTAL(프)</td>
					<td>2005.6월</td>
					<td>25.65</td>
					<td>12.35</td>
					<td>삼성물산, 대성산업</td>
					</tr>
					</tbody>
					</table>

                    <p class="mT20">예멘 70광구는 예멘 중부 육상 지역에 위치한 광구로 한국석유공사가 2005년 4월 예멘 정부와 생산물분배계약을 체결하여 광권을 취득하였다. 광구 면적은 약 1,367km²이고 예멘 4광구와 인접하고 있다. 이후 한국 측 지분 양도를 통해 현재 프랑스 대표 석유회사인 Total사가 50.1125%의 지분을 가지고 광구를 운영하고 있으며, 오스트리아 OMV사가 19.2375%, 예멘 YGCOG가 5%, 한국 참여기업으로 한국석유공사가 12.35%, 삼성물산이 7.6%, 대성산업이 5.7%의 지분을 보유하고 있다. 2008년 8월부터 2009년 2월까지 첫 탐사공을 시추하였다.</p>
                </div>
				<!--//끝-->
		  </div>

		  <!-- new_officer -->
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-11-23</td>
					<td class="contact_team"><strong>담당부서 : </strong>탐사사업처 미주유아탐사팀</td>
					<td class="contact_user"><strong>담당자 : </strong>이혜연</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-3170</td>
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