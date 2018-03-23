<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","08");
	application.setAttribute("gNavMenuDepth4","16");
//	application.setAttribute("gNavMenuDepth3","04");
//	application.setAttribute("gNavMenuDepth4","07");
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
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a> &gt;
				<span>열린경영</span> &gt; <span>경영공시</span> &gt; <span>기관운영</span> &gt; <span class="locanow">인력개발현황</span>
			</div>
			<!--// location: end //-->
			<!--[2009-09-21 수정] :: 작성자: 장정인 -->
			<div class="pagetle">
				<h3><img src="/images/management/ttl_sub02_2_2_new.gif" alt="기관운영" /></h3>
			</div>
			<!--시작-->
			<div class="officer">
				<h4><img src="/images/management/sub02_2_4_8.gif" alt="인력개발현황"/></h4>
				<h5>정규직 자격증 보유 현황(‘16년 12월말 기준)</h5>
				<!--표-->
				<table class="chart2" summary="2016년 6월까지 한국석유공사 자격증 보유현황을 박자, 기술사, 변호사, 회계사, 세무사별로 확인할 수 있습니다.">
					<caption>자격증 보유현황</caption>
					<col width="120px" />
					<col width="116px" />
					<col width="116px" />
					<col width="116px" />
					<col width="116px" />
					<col width="116px" />
					<thead>
						<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">박사</th>
							<th scope="col">기술사</th>
							<th scope="col">변호사</th>
							<th scope="col">회계사</th>
							<th scope="col">세무사</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="first">인원</td>
							<td>54</td>
							<td>15</td>
							<td>10</td>
							<td>31</td>
							<td>7</td>
						</tr>
					</tbody>
				</table>
				</br>
				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-12-31</td>
							<td class="contact_team"><strong>담당부서 : </strong>인재경영처 인사팀</td>
							<td class="contact_user"><strong>담당자 : </strong>홍아람</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2714</td>
						</tr>
					</tbody>
				</table>
				</div>
				</br>
				<!--//표-->
				<h5 class="mT20">사내외 연수제도</h5>
				<dl class="mT20">
					<dt>경영역량 강화</dt>
					<dd>선진 경영능력 습득 및 경영리더 육성을 위한 경영 전문교육<br/>
						- 서울대, 국방대 등 주요대학 경영자과정 및 중간관리자과정 파견 교육<br/>
						- 계층별 경영능력 및 리더십 역량 향상을 위한 직급별 리더십 교육<br/>
					</dd>
				</dl>
				<dl>
					<dt>직무역량 강화</dt>
					<dd>선진기술 및 전문지식 습득을 위한 직무 전문교육<br/>
						- 국내외 사업 현장 및 자회사 파견 전문OJT<br/>
						- 해외선진기업 파견 OJT(장기)<br/>
						- 국내외 대학원 석사학위과정(석유공학, MBA 과정 등)<br/>
						- 해외 전문교육기관 단기 연수 및 초빙 In-House 교육</dd>
				</dl>
				<dl>
					<dt>글로벌역량 강화</dt>
					<dd>글로벌 인재육성을 위한 세계화 교육<br />
                    	- 전화외국어, 사내 어학교실 등 운영<br />
						- 해외주재원(부임자) 교육</dd>
				</dl>
			</div>
			<BR />
			</br>
			<BR />
			</br>

			<div class="new_officer">
			<table summary="담당부서 및 연락처 관리일">
			<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
						<td class="contact_team"><strong>담당부서 : </strong>인재경영처 인재육성팀</td>
						<td class="contact_user"><strong>담당자 : </strong>백승목</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2742</td>
					</tr>
				</tbody>
			</table>
			</div>
			<!-- div class="infoCheck">
				<%@include file="/include/satisfy_link.jsp"%>
			</div-->
			<!--//끝-->
		</div>
	</div>
</div>
<%@include file="/include/comfooter.jsp"%>
<!--// footer: start //-->
<!--// footer: end //-->
</div>
</body>
</html>