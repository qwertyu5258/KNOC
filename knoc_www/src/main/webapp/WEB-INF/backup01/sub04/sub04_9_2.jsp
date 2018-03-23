<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>

<% 

    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

	' Page Navigator section

	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/

	application.setAttribute("gNavMenuDepth1","05");

	application.setAttribute("gNavMenuDepth2","13");

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

				<%@include file="/include/subtop_05.jsp"%>

				<!--// location: start //-->

				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>정보마당</span> 
					&gt; <span>사전정보공개</span> 
					&gt; <span class="locanow">행정정보공표</span>
				</div>

				<!--// location: end //-->

				

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->

				<div class="pagetle">

					<h3 class="tleimg"><img src="/images/information/ttl_sub04_9_2.gif" alt="행정정보공표" /></h3>

				</div>

				<div class="information">

					<table  class="chart2" summary="행정정보공표를 확인할 수 있습니다.">

					<caption>행정정보공표</caption>
					

					<col width="150px" />

					<col width="300px" />

					<col width="70px" />

					<col width="70px" />

					<col width="70px" />

					<thead>

					<tr>

					<th scope="col" class="first">구분</th>

					<th scope="col">세부업무</th>

					<th scope="col">공개주기</th>

					<th scope="col">공개시기</th>

					<th scope="col">공개방법</th>
					</tr>
					</thead>
					<tbody>
					<tr>
                      <th rowspan="3" class="first" scope="row">주요업무계획</th>
					  <td class="tdleft"><strong>경영목표</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>운영계획</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>국회업무보고</strong></td>
					  <td>수시</td>
					  <td>수시</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <th rowspan="3" class="first" scope="row">주요사업추진 관련정보</th>
					  <td class="tdleft"><strong>주요사업 현황<BR />
				      (석유개발, 석유비축, 시추선)</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>이사회 회의록</strong></td>
					  <td>수시</td>
					  <td>수시</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>출자회사 현황</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <th rowspan="6" class="first" scope="row">재무정보</th>
					  <td class="tdleft"><strong>재무제표/외부회계감사보고서</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>자본금 및 주주현황</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>신용등급 및 신뢰도</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>장·단기 차입금현황</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>사채원부</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>주요재무비율</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <th rowspan="3" class="first" scope="row">예산집행 관련정보</th>
					  <td class="tdleft"><strong>기관장 업무추진비</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>사업비계획</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>경영부담을 초래할 수 있는 위험요소</strong></td>
					  <td>수시</td>
					  <td>수시</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <th rowspan="7" class="first" scope="row">각종 평가결과 및<br />통계자료</th>
					  <td class="tdleft"><strong>국회 지적사항</strong></td>
					  <td>수시</td>
					  <td>수시</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>감사원 지적사항</strong></td>
					  <td>수시</td>
					  <td>수시</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>내부감사결과</strong></td>
					  <td>수시</td>
					  <td>수시</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>조직 및 인원현황</strong></td>
					  <td>분기1회</td>
					  <td>매분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>경영실적평가결과</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>고객만족도 조사결과</strong></td>
					  <td>연1회</td>
					  <td>1/4분기</td>
					  <td>인터넷</td>
					  </tr>
					<tr>
                      <td class="tdleft"><strong>고객헌장 서비스표준 이행실적</strong></td>
					  <td>분기1회</td>
					  <td>매분기</td>
					  <td>인터넷</td>
					  </tr>

					<tr>

					<th rowspan="2" class="first" scope="row">기타행정 안내정보</th>

					<td class="tdleft"><strong>정관 및 관련법령</strong></td>

					<td>수시</td>

					<td>수시</td>

					<td>인터넷</td>
					</tr>

					<tr>
					  <td class="tdleft"><strong>입찰정보</strong></td>

					<td>수시</td>

					<td>수시</td>

					<td>인터넷</td>
					</tr>
					</tbody>
					</table>

			  </div>

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
						<td><strong>담당부서 : </strong>총무관리처 총무팀</td>
						<td><strong>연락처 : </strong>031-380-2308</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
				</table>
			</div> <!--new_officer end -->

		</div>

	</div>

	

  <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</div>

</body>

</html>