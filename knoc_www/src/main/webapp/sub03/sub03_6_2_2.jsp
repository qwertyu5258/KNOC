<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","06");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","02");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@include file="/include/comheader.jsp"%>


<!--// subtopNavi: start //-->
<%@include file="/include/subtopnavi_new.jsp"%>
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
                    &gt; <span>석유정보</span>
                    &gt; <span>Petronet</span>
                    &gt; <span class="locanow">Petronet 회원안내</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_6_2_2.gif" alt="Petronet 회원안내" /></h3>
				</div>
				<!--시작-->
				<div class="business3">
					<h5 class="mT0">회원안내</h5>
                    <p>우리 공사에서는 국내외 석유산업에 관한 정보를 기반으로 간행물을 발간하고 있으며, 석유정보를 DB화하여 인터넷으로 서비스하는 Petronet<a href="http://www.petronet.co.kr" target="_blank">(www.petronet.co.kr)</a>을 운영하고 있습니다.</p>
					<p class="sTit">회원구분</p>
                    <div class="w680">
                        <table class="chart2" summary="페트로넷 회원구분을 확인할 수 있습니다.">
						<caption>페트로넷 회원구분</caption>
						<col width="100px" />
						<col width="100px" />
						<col width="430px" />
						<thead>
						<tr>
						<th scope="col" class="first" colspan="2">회원구분</th>
						<th scope="col">상세내용</th>
						</tr>
						</thead>
						<tbody>
						<tr>
						<th scope="rowgroup" rowspan="2" class="bright">Petronet 회원</th>
						<th scope="row">무료</th>
						<td class="tdleft">- Petronet에서 제공하는 무료정보만 이용 가능<br /> - 별도의 회원가입절차 없음<br />- Petronet 서비스 중 일반서비스 해당</td>
						</tr>
						<tr>
						<th scope="row">유료</th>
						<td class="tdleft">- Petronet 에서 제공하는 모든 정보 이용 가능<br />
						- 이용기간은 회원신청 접수시점에서 1년/2년 선택 가능<br />
						- 연회비는 하단 가격표 참조<br />- Petronet 서비스 중 프리미엄서비스에 해당</td>
						</tr>
						<tr>
						<th scope="row" class="bright">간행물회원</th>
						<th scope="row">유료</th>
						<td class="tdleft">- 한국석유공사에서 발간되는 간행물을 E-Mail 또는 책자로 제공<br />
						- 이용기간은 회원신청 접수시점에서 1년<br />
						- 연회비는 하단 가격표 참조</td>
						</tr>
						</tbody>
						</table>
                    </div>

                    <p class="sTit">유료회원 서비스 이용료</p>
                    <div class="w680">
						<table class="chart2" summary="페트로넷 회원별 서비스 이용료를 확인할 수 있습니다.">
						<caption>페트로넷 회원별 서비스 이용료</caption>
						<col width="100px" />
						<col width="310px" />
						<col width="80px" />
						<col width="120px" />
						<thead>
						<tr>
						<th scope="col" class="first">회원구분</th>
						<th scope="col">제공정보</th>
						<th scope="col">매체</th>

						<th scope="col">가격</th>
						</tr>
						</thead>
						<tbody>
						<tr>
						<th scope="row">Petronet 회원</th>
						<td class="tdleft2">- 국내 , 외 석유정보(DB)</td>
						<td>인터넷</td>
						<td class="tdright"><strong>(1년)</strong> 220,000원<br/> <strong>(2년)</strong> 396,000원</td>
						</tr>
						<tr>
						<th scope="row" rowspan="3">간행물 회원<br /> <strong>(1년)</strong></th>
						<td class="tdleft">-월간석유수급통계<br />※ 통계속보 E-mail 제공</td>
						<td>E-mail<br />책자</td>
						<td class="tdright">250,000원</td>
						</tr>
						<tr>
						<td class="tdleft">- KMOS(월간석유수급통계 영문판)<br />&amp; KON(월간석유뉴스 영문판)<br /> ※ 통계속보 E-mail 제공</td>
						<td>E-mail<br />책자</td>
						<td class="tdright">3,000,000원</td>
						</tr>
						<tr>
						<td class="tdleft">KON(월간석유뉴스 영문판)</td>
						<td>E-mail</td>
						<td class="tdright">660,000원</td>
						</tr>
						<tr>
						<th scope="row">단행본 회원</th>
						<td class="tdleft">- 석유류 수급통계 연보</td>
						<td>책자</td>
						<td colspan="3">시가</td>
						</tr>
						</tbody>
						</table>
						<p>* 인터넷<a href="http://www.petronet.co.kr" target="_blank">(www.petronet.co.kr)</a>을 통해서도 해당 정보를 보실 수 있습니다.<br />* 상기 가격은 부가세 포함가격입니다.</p>
                    </div>

					<dl>
					<dt>유료회원 가입방법</dt>
					<dd>
						<p>인터넷을 통한 가입</p>
						<ul>
						<li>Petronet 홈페이지<a href="http://www.petronet.co.kr" target="_blank">(www.petronet.co.kr)</a> 초기화면에서 유료회원가입 클릭</li>
						<li>유료회원(Petronet 또는 간행물회원) 가입 클릭</li>
						<li>이용약관 승인</li>
						<li>신청양식 작성</li>
						<li>회비 납부 후 전자세금계산서 발송 </li>
						</ul>
						<p>기타 가입방법</p>
						<ul>
						<li>팩스 · 이메일 · 우편을 통해 가입신청서 제출</li>
						<li>회비 납부 후 전자세금계산서 발송</li>
						</ul>
					</dd>
					</dl>

					<dl>
					<dt>문의 및 가입신청</dt>
					<dd>
						<ul>
						<li>전화 : 052-216-2506</li>
						<li>FAX : 052-216-5911</li>
						<li>E-mail : info-service@knoc.co.kr</li>
						</ul>
					</dd>
					</dl>
				</div>
				<!--//끝-->
			</div>

			<!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-04-29</td>
					<td class="contact_team"><strong>담당부서 : </strong>석유정보센터 정보기획팀</td>
					<td class="contact_user"><strong>담당자 : </strong>정보원</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2505</td>
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