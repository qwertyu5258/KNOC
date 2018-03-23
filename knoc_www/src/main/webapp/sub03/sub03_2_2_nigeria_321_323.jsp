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

                   <h4><img src="../images/business/img_ttl_sub03_2_2_nigeria_321_323.gif" alt="나이지리아  OPL 321&323" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_nigeria.gif" alt="나이지리아  OPL 321&323 광구도" width="650px" /></div>

                   <p class="rtxt">[2016년 10월말 기준]</p>
					<table class="chart2" summary="나이지리아321 &323광구 정보를 확인할 수 있습니다.">
					<caption>나이지리아 OPL  321&323 광구 정보</caption>
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
					<th scope="col">한국측지분<br />공사</th>
					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">탐사사업</td>
					<td>나이지리아  <br />OPL 321 &amp; 323</td>
					<td>석유공사</td>
					<td>'06.03</td>
					<td>60</td>
					<td>43.875</td>
					<td>한전, 대우조선,<br />GT&R</td>
					</tr>
					</tbody>
					</table>

                    <p class="mT20">

					OPL321 및 OPL323 광구는 서아프리카 기네아만 해상에 위치하며, 수심 약 1,000~2,500m의 심해광구로, 광구 면적은 각각 약 1,166Km2(OPL321), 994Km2(OPL323)이다.
					동 광구 인근지역에는 나이지리아 내 대표적 성공 광구로 꼽히는 Bosi, Abo, Erha 등의 대형 유·가스전이 분포한다.
					2006년 3월, 나이지리아국영석유회사(NNPC)와의 생산물분배계약 체결 이후 현재 사업 진행 중이다.
					</p>

					<!-- p class="mT110">
					동 광구 사업참여는 추가적인 서아프리카지역 사업 진출의 교두보가 될 것으로 기대된다.
					</p-->
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