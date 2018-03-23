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

				<!-- [2009-09-24 수정] ::  -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_2_2.gif" alt="석유개발현황도" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                	<%@include file="sub03_2_2_map.jsp"%>

                   <h4><img src="../images/business/img_ttl_sub03_2_2_peru_8.gif" alt="페루8" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_peru_8.gif" alt="페루8 광구도" /></div>

                   <p class="rtxt">[2016년 9월말 기준]</p>

				   <table summary="페루8 에 대한 표로 구분, 광구명, 운영권자, 한국측지분(%(퍼센트)), 한국측기업 공사, 국내참여기업에 대한 정보를 제공합니다." class="chart2">
					<caption>페루8 에 대한 정보</caption>
					<colgroup>
					<col width="16%">
					<col width="20%">
					<col width="16%">
					<col width="16%">
					<col width="16%">
					<col width="16%">
					</colgroup>
					<thead>
					<tr>
						<th class="first" scope="col">구분</th>
						<th scope="col">광구명</th>
						<th scope="col">운영권자</th>
						<th scope="col">한국측지분<br />(%(퍼센트))</th>
						<th scope="col">한국측기업공사</th>
						<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td class="first">생산</td>
						<td>페루 8</td>
						<td>Pluspetrol</td>
						<td>40%</td>
						<td>20%</td>
						<td>SK이노베이션 ,<br />대우인터네셔널</td>
					</tr>
					</tbody>
					</table>

                    <ul class="mT20">
                    	<li>광구위치 : 페루 북부 육상 아마존 밀림지역 Maranon 분지</li>
                        <li>광구면적 : 1,823㎢</li>
                        <li>참 여 사 : Pluspetrol 60%(운영권사, 아르헨티나), 석유공사 20%, 대우인터네셔널 11⅔%, SK 이노베이션 8⅓%</li>
                        <li>계약기간 : 1996년 7월 ~ 2024년 5월 (광권계약)</li>
                        <li>유전생산개시 : 1974년</li>
                        <li>공사 사업참여 후 누적생산량 : 132.5백만배럴 (2016년 9월말)</li>
                        <li>일평균 생산량 : 약 6.8천배럴/일 생산 (2016년 9월 초)</li>
                    </ul>
                </div>
				<!--//끝-->
		  </div>

		  <!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-12-05</td>
					<td class="contact_team"><strong>담당부서 : </strong>생산사업2처 미주생산3팀</td>
					<td class="contact_user"><strong>담당자 : </strong>김광선</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-3442</td>
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