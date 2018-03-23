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
                   <h3><img src="../images/business/img_ttl_sub03_2_2_ankor02.gif" alt=" ANKOR 해상" /></h3>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_ankor.gif" alt="ANKOR 해상 광구도" /></div>

                    <p class="rtxt">[2016년 9월말 기준]</p>
					<table class="chart2" summary="미국 ANKOR 해상 광구 정보를 확인할 수 있습니다.">
					<caption>미국 ANKOR 해상 광구 정보</caption>
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
					<td class="first">생산사업</td>
					<td>Ankor</td>
					<td>석유공사</td>
					<td>2008.02.26</td>
					<td>100</td>
					<td>51</td>
					<td>삼성물산<br />한투운용컨소시움</td>
					</tr>
					</tbody>
					</table>

                    <p class="mT20">세계최대 유전지역 중 한곳인 미국 멕시코만에 위치해 있는 Ankor 해상유전은 Taylor Energy사로부터 08년 3월 인수하여 운영을 개시한 생산광구이다. '11년 멕시코만 Northstar 광구 및 텍사스주 Parallel 광구를 추가로 인수하여 미국 현지법인의 운영자회사(Ankor Energy)를 통해 MC21 外 다수의 육해상 유전을 운영하고 있다. 현재 일일 6.6천배럴(‘16.09월, 공사몫 기준)을 생산하고 있으며, 매장량은 32.5백만배럴(’16년 9월 공사몫 2P기준)이다.</p>



                </div>
				<!--//끝-->
		  </div>

		  <!-- new_officer -->
		<div class="new_officer" style="left:2%">
			<table summary="담당부서 및 연락처 관리일">
			<caption>담당부서 및 연락처 관리일</caption>
			<tbody>
			<tr>
				<td class="write_day"><strong>작성기준일 : </strong>2016-11-23</td>
				<td class="contact_team"><strong>담당부서 : </strong>생산사업2처 미주생산1팀</td>
				<td class="contact_user"><strong>담당자 : </strong>정구선</td>
				<td class="contact_tel"><strong>연락처 : </strong>052-216-3408</td>
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