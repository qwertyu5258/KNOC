<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","06");
	application.setAttribute("gNavMenuDepth4","07");
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
			<%@include file="/include/subtop_02.jsp"%>
			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="HOME" /></a> &gt; 
				<span>열린경영</span> &gt; <span>경영공시</span> &gt; <span>기타정보</span> &gt; <span class="locanow">연간 출연 및 증여</span>
			</div>
			<!--// location: end //-->
			<!--[2009-09-21 수정] :: 작성자: 장정인 -->
			<div class="pagetle">
				<h3><img src="/images/management/ttl_sub02_2_6.gif" alt="기타정보" /></h3>
			</div>
			<!--시작-->
			<div class="officer">
				<h4><img src="/images/management/sub02_2_2_5ta1.gif" alt="연간 출연 및 증여" border="0"/></h4>
				<h5>출연내역</h5>
				<span>(단위 : 백만원)</span>
				<!--표-->
				<table class="chart2" summary="한국석유공사 출연내역에 대한 표로 출연일, 피출연기관, 관계, 출연금액, 출연 목적물, 출연사유에 대한 정보를 제공합니다.">
					<caption>
					한국석유공사 출연내역
					</caption>
					<col width="10%" />
					<col width="22%" />
					<col width="14%" />
					<col width="12%" />
					<col width="12%" />
					<col width="*" />
					<thead>
						<tr>
							<th scope="col" class="first">출연일</th>
							<th scope="col">피출연기관</th>
							<th scope="col">관계</th>
							<th scope="col">출연금액</th>
							<th scope="col">출연 목적물</th>
							<th scope="col">출연사유</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="first">2015.05.20</td>
							<td>에너지경제연구원</td>
							<td>-</td>
							<td>500</td>
							<td>현금</td>
							<td>국내 석유산업 경쟁력 강화방안에<br />대한 공동연구 및 협력체계 구축</td>
						</tr>
						<tr>
							<td class="first">2015.03.30</td>
							<td>해외자원개발진흥재단</td>
							<td>-</td>
							<td>1,300</td>
							<td>현금</td>
							<td>자원개발특성화대학 지원</td>
						</tr>
						<tr>
							<td class="first">2014.12.31</td>
							<td>중소기업청</td>
							<td>투자기업</td>
							<td>238</td>
							<td>현금</td>
							<td>중소기업 연구개발 자금 지원</td>
						</tr>
						<tr>
							<td class="first">2014.10.10</td>
							<td>중소기업청</td>
							<td>투자기업</td>
							<td>93</td>
							<td>현금</td>
							<td>중소기업 연구개발 자금 지원</td>
						</tr>
						<tr>
							<td class="first">2014.09.29</td>
							<td>중소기업청</td>
							<td>투자기업</td>
							<td>95</td>
							<td>현금</td>
							<td>중소기업 연구개발 자금 지원</td>
						</tr>
						<tr>
							<td class="first">2014.03.10</td>
							<td>에너지경제연구원</td>
							<td>협력기관</td>
							<td>500</td>
							<td>현금</td>
							<td>국내 석유산업 경쟁력 강화방안에<br />대한 공동연구 및 협력체계 구축</td>
						</tr>
						<tr>
							<td class="first">2013.04.01</td>
							<td>해외자원개발진흥재단</td>
							<td>회원</td>
							<td>4,000</td>
							<td>현금</td>
							<td>자원개발특성화대학 지원</td>
						</tr>
						<tr>
							<td class="first">2012.05.25</td>
							<td>2013 대구세계에너지<br />총회 조직위원회</td>
							<td>집행위원사</td>
							<td>400</td>
							<td>현금</td>
							<td>2013년 대구 세계에너지 총회 개최</td>
						</tr>
						<tr>
							<td class="first">2012.03.16</td>
							<td>해외자원개발진흥재단</td>
							<td>회원</td>
							<td>3,000</td>
							<td>현금</td>
							<td>자원개발특성화대학 지원</td>
						</tr>
						<tr>
							<td class="first">2011.06.02</td>
							<td>해외자원개발진흥재단</td>
							<td>회원</td>
							<td>3,000</td>
							<td>현금</td>
							<td>자원개발특성화대학 지원</td>
						</tr>
						<tr>
							<td class="first">2011.04.22</td>
							<td>2013 대구세계에너지<br />총회 조직위원회</td>
							<td>집행위원사</td>
							<td>300</td>
							<td>현금</td>
							<td>2013년 대구 세계에너지 총회 개최</td>
						</tr>
						<tr>
							<td class="first">2010.07.14</td>
							<td>해외자원개발진흥재단</td>
							<td>-</td>
							<td>3,000</td>
							<td>현금</td>
							<td>자원개발특성화대학 지원</td>
						</tr>
						
					</tbody>
				</table>
				<!--//표-->
				<h5>증여내역</h5>
				<span>(단위 : 백만원)</span>
				<!--표-->
				<table class="chart2" summary="한국석유공사 증여내역에 대한 표로 증여일, 수증인, 관계, 증여금액, 출연목적물, 출연사유에 대한 정보를 제공합니다.">
					<caption>
					한국석유공사 증여내역
					</caption>
					<col width="*" />
					<col width="*" />
					<col width="*" />
					<col width="*" />
					<col width="*" />
					<col width="*" />
					<thead>
						<tr>
							<th scope="col" class="first">증여일</th>
							<th scope="col">수증인</th>
							<th scope="col">관계</th>
							<th scope="col">증여금액</th>
							<th scope="col">출연 목적물</th>
							<th scope="col">출연사유</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="first">2015.12.31</td>
							<td>취약계층 등</td>
							<td>-</td>
							<td>940</td>
							<td>현금 등</td>
							<td>사회공헌 기부</td>
						</tr>
						<tr>
							<td class="first">2014.12.31</td>
							<td>취약계층 등</td>
							<td>-</td>
							<td>1,245</td>
							<td>현금 등</td>
							<td>사회공헌 기부</td>
						</tr>
						<tr>
							<td class="first">2013.12.31</td>
							<td>취약계층 등</td>
							<td>-</td>
							<td>2,087</td>
							<td>현금 등</td>
							<td>사회공헌 기부</td>
						</tr>
						<tr>
							<td class="first">2012.12.31</td>
							<td>취약계층 등</td>
							<td>-</td>
							<td>1,465</td>
							<td>현금 등</td>
							<td>사회공헌 기부</td>
						</tr>
						<tr>
							<td class="first">2011.12.31</td>
							<td>취약계층 등</td>
							<td>-</td>
							<td>1,493</td>
							<td>현금 등</td>
							<td>사회공헌 기부</td>
						</tr>
						<tr>
							<td class="first">2010.12.31</td>
							<td>취약계층 등</td>
							<td>-</td>
							<td>1,476</td>
							<td>현금 등</td>
							<td>사회공헌 기부</td>
						</tr>
					</tbody>
				</table>
				<!--//표-->
				<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;"> * 공시기준 : ‘15년 12월말 기준 </p>
			</div>
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2015-12-31</td>
							<td class="contact_team"><strong>담당부서 : </strong>총무관리처 상생지원팀</td>
							<td class="contact_user"><strong>담당자 : </strong>조용원</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2626</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="infoCheck">
				<%@include file="/include/satisfy_link.jsp"%>
			</div>
			<!--//끝-->
		</div>
	</div>
</div>
<%@include file="/include/comfooter.jsp"%>
<!--// footer: start //-->
<!--// footer: end //-->
</div>
</body></html>