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

                   <h4><img src="../images/business/img_ttl_sub03_2_2_altius.gif" alt="카자흐스탄 - Altius" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_altius.gif" alt="카자흐스탄 - Altius 광구도" /></div>

                    <p class="rtxt">[2016년 9월말 기준]</p>
					<table class="chart2" summary="카자흐스탄 - Altius 광구 정보를 확인할 수 있습니다.">
					<caption>카자흐스탄 - Altius 광구 정보</caption>
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
					<th scope="col">한국측지분</th>
					<th scope="col">한국측지분<br />공사</th>
					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">생산</td>
					<td>
						Akzhar,<br />Besbolek,<br />Karataikyz,<br />Alimbai
					</td>
					<td>한국석유공사</td>
					<td>'11.3</td>
					<td>95%</td>
					<td>95%</td>
					<td>-</td>
					</tr>
					</tbody>
					</table>

                    <p class="mT20">공사는 '11. 3월, 카자흐스탄에 3개의 생산광구(Akzhar, Besbolek, Karataikyz) 및 1개의 개발광구(Alimbai)를 보유한 캐나다 소재 Altius Holding Inc.사를 매입하는 계약을 완결하였다. 2014년 1월Alimbai 광구가 생산광구로 전환되었고, 2016년 현재 Altius사가 보유한 4개광구로부터 현재 일일 약 6.9배럴의 원유를 생산하고 있다.</p>
                </div>
				<!--//끝-->
		  </div>

		  <!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-11-30</td>
					<td class="contact_team"><strong>담당부서 : </strong>생산사업1처 중동CIS생산팀</td>
					<td class="contact_user"><strong>담당자 : </strong>윤경원</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-3348</td>
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