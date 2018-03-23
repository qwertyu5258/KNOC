<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","08");
	application.setAttribute("gNavMenuDepth2","06");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>            
<%@include file="/include/sub08_auth.jsp"%>   
<%@include file="/include/comheader.jsp"%>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_08.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>이사회
</span>
					&gt; <span>이사회연락처
/<span>
                    &gt; <span class="locanow">공사 전화번호부</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-29 표준코딩에 의한 수정] 작성자:장정인-->
				<div class="pagetle">
					<h3><img src="/images/directors/ttl_sub08_6_3.gif" alt="공사 전화번호부" /></h3>
				</div>
				<!--시작-->
				<div  class="director3">
					<p class="mB5">한국석유공사에 관하여 궁금한 사항이 있으시면 아래의 분야별 상담부서로 문의하여 주십시오.
성심 성의껏 도와드리겠습니다.</p>
                	<table class="chart2" summary="한국석유공사 분야별 상담부서 및 연락처를 확인할 수 있습니다.">
						<caption>한국석유공사 분야별 상담부서 및 연락처</caption>
							<colgroup><col width="220px" /><col width="320px" /><col width="160px" /></colgroup>
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					<th scope="col">담당부서</th>
					<th scope="col">연락처</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<th scope="row">해외석유개발사업 운영</th>
					<td>생산운영처 생산계획팀</td>
					<td>031) 380-2533~9</td>
					</tr>
					<tr>
					<th scope="row">신규사업 참여</th>
					<td>신규사업1처 신규사업계획팀</td>
					<td>031) 380-2262~8</td>
					</tr>
					<tr>
					<th scope="row">국내대륙붕탐사</th>
					<td>탐사사업처 국내팀</td>
					<td>031) 380-2502~9</td>
					</tr>
					<tr>
					<th scope="row">석유개발기술</th>
					<td>석유기술연구원</td>
					<td>031) 380-2582~6</td>
					</tr>
					<tr>
					<th scope="row">동해 가스전사업</th>
					<td>생산운영처 생산운영2팀</td>
					<td>031) 380-2661~9</td>
					</tr>
					<tr>
					<th scope="row">시추선 사업(두성호)</th>
					<td>시추선사업처 시추선사업팀</td>
					<td>031) 380-2622~8</td>
					</tr>
					<tr>
					<th scope="row">석유비축관리</th>
					<td>석유비축처 비축관리팀</td>
					<td>031) 380-2702~9</td>
					</tr>
					<tr>
					<th scope="row">공동비축사업</th>
					<td>석유사업처 물류사업팀</td>
					<td>031) 380-2253~8</td>
					</tr>
					<tr>
					<th scope="row">비축유거래</th>
					<td>석유사업처 석유트레이딩팀</td>
					<td>031) 380-2732~6</td>
					</tr>
					<tr>
					<th scope="row">비축기지 건설사업</th>
					<td>비축시설처 토목팀</td>
					<td>031) 380-2822~9</td>
					</tr>
					<tr>
					<th scope="row">계약,입찰</th>
					<td>경영지원처 계약자산팀</td>
					<td>031) 380-2362~5</td>
					</tr>
					<tr>
					<th scope="row">채용문의</th>
					<td>기획조정실 인사팀</td>
					<td>031) 380-2312~9</td>
					</tr>
					<tr>
					<th scope="row">유가문의</th>
					<td>석유정보센터 정보사업팀</td>
					<td>031) 380-2787</td>
					</tr>
					<tr>
					<th scope="row">국내석유산업</th>
					<td>석유정보센터 국내석유동향팀</td>
					<td>031) 380-2762~8</td>
					</tr>
					<tr>
					<th scope="row">해외석유산업</th>
					<td>석유정보센터 해외석유동향팀</td>
					<td>031) 380-2752~9</td>
					</tr>
					<tr>
					<th scope="row">홍보자료, 언론보도자료</th>
					<td>홍보실</td>
					<td>031) 380-2152~9</td>
					</tr>
					<tr>
					<th scope="row">경영현황</th>
					<td>기획조정실 기획관리팀</td>
					<td>031) 380-2163~4</td>
					</tr>
					<tr>
					<th scope="row">재무현황</th>
					<td>재무처 회계세무팀</td>
					<td>031) 380-2354~7</td>
					</tr>
					<tr>
					<th scope="row">지사/사무소</th>
					<td>울산지사<br />거제지사<br />여수지사<br />서산지사<br />평택지사<br />구리지사<br />용인지사<br />곡성지사<br />동해지사<br />가스전관리사무소
					</td>
					<td>052) 238-3235~7<br />055) 681-0075~7<br />061) 688-8700<br />041) 660-4114<br />031) 683-4041~4<br />02) 452-9995~6<br />031) 329-4900<br />061)360-2114<br />033) 520-7800<br />052) 240-4700</td>
					</tr>
					</tbody>
					</table>
				</div>
				 <!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>