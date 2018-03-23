<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","06");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
	function popup_passwd() {
		window.open("","bform","width=305,height=205,top=0,left=0,scrollbars=no");
		document.bform.submit();
	}
</script>



	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<form name="bform" method="post" action="/sub04/pop_login.jsp" target="bform" onsubmit="do_search(this); return false;">
	<input type="hidden" name="bid" value="MINWON" />
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="callback" value="/sub04/sub04_5_6_list.jsp" />
	<input type="hidden" name="mode" value="list" />
</form>
	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->

		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_04.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>고객참여</span>
					&gt; <span class="locanow">불법하도급 신고</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/customer/ttl_sub04_5_6.gif" alt="불법하도급 신고" /></h3>
				</div>
				<div class="customer">
					<h4 class="mT0 pb10"><img src="../images/customer/img_sub04_5_6_01.gif" alt="한국석유공사 불법하도급 신고센터를 찾아주셔서 감사합니다. 저희 공사는 불법·불공정 하도급 행위에 대해 민원인의 어려움을  성심성의껏 해결하여 드리겠습니다." /></h4>
					<h4 class="mT10 pb10"><img src="../images/customer/img_sub04_5_6_02.gif" alt="불법하도급 신고" /></h4>
					<div class="declaration pb05">
						<ul >
						<li><strong>신고대상</strong><br />
							<ul>
								<li>- 우리공사에서 시행하는 모든 건설공사</li>
								<li>- 하도급 관련법령을 위반한 모든 불법 하도급행위와 관련된 개인 및 법인</li>
								<li> - 당해 공사 준공시점 이전까지 신고되는 경우에 한 함</li>
							</ul></li>
						<li><strong>신고방법 및 접수요건</strong><br />
							<ul>
								<li>- 신고자 명의는 개인(임직원 포함) 및 단체(기관, 팀) 등 모두 가능 </li>
							    <li>- 신고방법은 방문, 우편, 인터넷(불법하도급 신고센터) 신고에 한함</li>
							    <li class="pb10">- 불법 하도급 거래행위를 확인할 수 있는 근거자료(관련서류, 사진 등)을 제출하고<br />&nbsp;&nbsp; 신고자 및 피신고자의 실명, 주소, 연락처 등 인적사항 확인이 가능한 경우</li>
							 </ul></li>
						</ul>
					</div>
					<h4 class="pt10 pb10"><img src="../images/customer/img_sub04_5_6_03.gif" alt="포상급 지급 안내" /></h4>
					<div class="declaration pb05">
						<ul>
						<li><strong>지급신청 및 지급결정</strong><br />
							<ul>
								<li>- 신고자는 불법하도급 신고에 따른 행정기관의 처분이 확정되었음을 안 날로부터 1년 이내 또는<br />&nbsp;&nbsp; 법률관계가 확정된 날로부터 2년 이내에 감사담당부서에 포상금 신청 가능</li>
								<li>- 공사 포상위원회 심의를 거쳐 포상금 지급을 결정</li>
							</ul></li>
						<li><strong>포상금 지급 기준</strong><br />
							<ul>
								<li>
									<table class="chart2 mT10" summary="우포상급 지급 안내를 확인할 수 있습니다.">
										<caption>포상급 지급 안내</caption>
										<colgroup>
										<col width="150px">
										<col width="275px">
									</colgroup>
										<thead>
											<tr>
											<th scope="col" class="first">구  분</th>
											<th scope="col">내    용</th>
											</tr>
										</thead>
										<tbody>
										<tr>
											<td class="first">포상조건</td>
											<td class="tdleft2">국내외 석유개발 참여사</td>
										</tr>
										<tr>
											<td class="first">지급기준</td>
											<td class="tdleft2">
											ㅇ 행정기관의 처분결과에 따라 지급<br />
											  - 영업정지 :<br />
											  &nbsp;&nbsp;· 일괄,무면허업자,재하도급 : 250만원/월 이내<br />
											  &nbsp;&nbsp;· 허위통보,대금지급위반 : 200만원/월 이내<br />
											  - 과징금 : 부과금액의 20% 이내<br />
											  - 벌  금 : 부과금액의 100% 이내<br />
											  - 과태료, 시정조치 등 경미한 처분은 지급 제외
											</td>
										</tr>
										<tr>
											<td class="first">지급한도</td>
											<td class="tdleft2">최고 5백만원</td>
										</tr>
										</tbody>
										</table>
								</li>
							</ul></li>
							<li><strong>포상금 지급 제외</strong><br />
							<ul>
							   <li>- 신고내용이 사실이 아닌 것으로 판명되거나 증거부족 등으로 사실여부가 확인이 안 되는 경우</li>
							   <li>- 외부기관 또는 공사에서 이미 인지하여 조사개시 하였거나 완료된 경우</li>
							   <li>- 국정감사, 언론 등을 통해 공개되거나 의혹 등이 구체적으로 제기된 사실이 있었던 경우</li>
							   <li>- 신고자가 포상금 지급을 원하지 않는 경우</li>
							   <li>- 공사 임직원이 업무수행 과정에서 인지한 경우</li>
							   <li>- 포상 수혜를 목적으로 사전공모 등 부정,부당하게 신고한 경우</li>
							   <li>- 신고자가 자기 직무와 관련하여 신고한 경우</li>
							   <li>- 기타 포상위원회 심의 결과 포상이 적절하지 않다고 인정되는 경우</li>
							</ul></li>
						<li><strong>연락처 : 감사실 민원담당 이정훈 과장(☎ 052-216-2164 / 팩스 052-216-5950)</strong></li>
						</ul>
					</div>
					
				<div class="declaration">
						<ul>
							<li>한국석유공사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률과 개인정보보호법 등 개인정보 관련 법령을 준수하며,
개인정보처리방침을 통하여 다음과 같이 개인정보를 수집하여 처리함을 알려드립니다.
<br /><br />
								<ul class="align_01">
									<li style="text-align:center;"><strong>- 다 음 -</strong></li>
									<li>
										<strong>1. 수집하는 개인정보 항목 </strong><br />&nbsp;&nbsp;&nbsp;&nbsp;공사는 다음과 같은 항목들을 수집하여 처리합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;- 필수항목 : 성명, 비밀번호<br />&nbsp;&nbsp;&nbsp;&nbsp;- 선택항목 : 전화번호, 이메일</li>
									<li><strong>2. 개인정보의 수집·이용 목적</strong><br />
									&nbsp;&nbsp;&nbsp;&nbsp;-불법하도급 신고 게시판 운영</li>
									<!-- <li>※ 견학 관련 문의<br />
										본사 : 홍보팀 <span class="ce45108_b">(☎ 031-380-2158)</span><br />
										지사 : 각 지사 ("<a href="/sub01/sub01_5.jsp" title="조직 및 인원 페이지로 이동"><span class="ce45108_b">공사소개 > 조직 및 인원 > 연락처</span></a>" 참조)
									</li>
									-->

									<li><strong>3. 개인정보의 보유 및 이용기간</strong><br />
									&nbsp;&nbsp;&nbsp;&nbsp;-보유 기간 : 게시물 삭제 요청시까지 또는 게시글 등록 후 3년 경과시(자동파기)<br />
									&nbsp;&nbsp;&nbsp;&nbsp;-보유 근거 : 정보주체의 동의 및 공사 사규(개인정보 내부관리기준 제3장 개인정보 처리)
									</li>

								</ul>
							</li>

						</ul>
					</div>
					
					<div class="customer2">

						&nbsp;&nbsp;&nbsp;<BR />
						<div class="pt25" align="center">
						<table style="width:600px">
						<tr>
							<td style="padding-left:50px;text-align:center;"><a href="/sub04/sub04_5_6_list.jsp?page=1&amp;mode=write&amp;bid=MINWON&amp;rtype=IL"><img src="../images/customer/btn_06.gif" alt="불법하도급 신고" /></a>&nbsp;<a href="#contents" onclick="popup_passwd(); return false;" title="새창"><img src="../images/customer/btn_04.gif" alt="처리결과조회" /></a></td>
							<td width="148"><a href="http://www.acrc.go.kr/acrc/board.do?command=searchDetail&menuId=0502" target="_blank"><img src="../images/customer/btn_030.gif" alt="국민권익위원회 부패신고상담 홈페이지로 이동 (새창)" /></a></td>
	
						</tr>
						</table>
						</div>
					</div>
			</div>

			<!-- new_officer -->
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"></td>
					<td class="contact_team"><strong>담당부서 : </strong>감사실 비축감사팀</td>
					<td class="contact_user"><strong>담당자 : </strong>이정훈</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2164</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->


		</div>
	</div>

	 </div>
    
        <!--// footer: start //-->
		<%@include file="/include/comfooter.jsp"%>
		<!--// footer: end //-->
    </div>
    
</body>
</html>