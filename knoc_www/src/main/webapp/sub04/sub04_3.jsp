<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","03");
	application.setAttribute("gNavMenuDepth3","01");
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
	<input type="hidden" name="bid" value="SUGEST" />
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="callback" value="/sub04/sub04_3_list.jsp" />
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
					&gt; <span class="locanow">고객/국민제안</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/customer/ttl_sub04_3.gif" alt="고객/국민제안" /></h3>
				</div>
				<div class="customer">
					<h4 class="mT0 pb10"><img src="../images/customer/img_sub04_3_01.gif" alt="고객/국민제안은 고객/국민 여러분이 공사에 대해 바라는 바와 공사 발전은 위한 아이디어 및 공사와 관련된 각종 볍규, 제도, 절차의 개선 의견을 게시할 수 있는 공간입니다." /></h4>
					<div class="declaration pb05">
						<ul>
						<li>문의 사항 및 불편사항은 <a href="/sub04/sub04_2.jsp" title="고객상담실 페이지로 이동"><span class="ce45108_b">[고객상담실]</span></a>을 이용하여 주시고, 이의신청 및 진정사항은 <a href="/sub04/sub04_5.jsp" title="민원(부조리)사항 페이지로 이동"><span class="ce45108_b">[민원(부조리)사항]</span></a>을 이용하여 주시기 바랍니다.</li>
						<li>공사의 내부 심의를 거쳐 우수 제안으로 채택된 경우에는 공사의 규정에 따라 소정의 포상금을 지급 하오니 고객/국민 여러분의 기탄없는 의견과 아이디어 제출을 부탁드립니다.</li>
						<li><strong>담당자 : 정재현 (052-216-2316)</strong></li>
						</ul>
					</div>

					<div class="customer2">



							<div class="declaration">
								<ul>
								<li><strong>제안자격 :</strong> 고객/전 국민</li>
								<li>
									<strong>제안대상 :</strong> 공사발전을 위한 아이디어, 개선 제안<br />
									<ul>
										<li>- 국내외 석유자원 개발 및 석유개발 기술 관련 개선의견</li>
										<li>- 석유비축, 비축기지 건설 및 관리, 비축자산 활용 관련 개선의견</li>
										<li>- 석유정보 수집, 분석 및 제공 프로세스 개선</li>
										<li>- 기타 경영개선 및 공사의 고객만족도 제고를 위한 아이디어와 개선의견</li>
										<li>- 일반적으로 알려졌거나 사용되고 있는 사항, 사회통념상 적용이 불가능하다고 판단되는 사항</li>
										<li>- 이미 특허권, 실용신안권 등 지적재산권 취득한 것</li>
									</ul>
								</li>
								</ul>
							</div>
							<h4 class="pt25"><img src="../images/customer/img_sub04_3_02.gif" alt="제안 처리절차" /></h4>
							<div class="pt05" align="center"><img src="../images/customer/img_sub04_3_03.gif" alt="" />
								<p class="blindtext">
									제안등록(고객/국민) → 고객/국민제안 내용검토[심의대상] → 제안심사위원회 부의 → 제안심의 채택등급 결정 → 결과확정통보 포상금지급(분기)(제안심사위원회)
								</p>
								<p class="blindtext">
									제안등록(고객/국민) → 고객/국민제안 내용검토[기각대상] → 기각통보
								</p>
							</div>
							<h4 class="pt25"><img src="../images/customer/img_sub04_3_04.gif" alt="포상금" /></h4>
							<table class="chart2 mT10" summary="등급별로 포상금을 확인할 수 있습니다.">
							<caption>등급별 포상금</caption>
								<thead>
									<tr>
										<th scope="col" class="first">등급</th>
										<th scope="col">1등급</th>
										<th scope="col">2등급</th>
										<th scope="col">3등급</th>
										<th scope="col">4등급</th>
										<th scope="col">5등급</th>
										<th scope="col">6등급</th>
										<th scope="col">7등급</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first">금액</td>
										<td>150만원</td>
										<td>100만원</td>
										<td>70만원</td>
										<td>35만원</td>
										<td>20만원</td>
										<td>15만원</td>
										<td>7만원</td>
									</tr>
								</tbody>
							</table>
							<div class="declaration">
								<ul>
								<li>제안으로 채택되지 않았지만 좋은 아이디어로 인정되는 경우 장려금을 지급하며, </li>
								<li>제안참여 노력이 인정되는 경우 제안참여상 수여</li>
								<li><strong>장려금 : 10만원 이내, 제안참여상 : 1만원 이내 도서 상품권 또는 문화상품권 지급</strong></li>
								</ul>
							</div>																																																							  
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
									&nbsp;&nbsp;&nbsp;&nbsp;-국민제안 게시판 운영</li>
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

							<div class="pt30" align="center"><a href="/sub04/sub04_3_list.jsp?page=1&amp;mode=write&amp;bid=SUGEST" title="제안하기"><img src="../images/customer/btn_write.gif" alt="제안하기" /></a> <a href="#contents" onclick="popup_passwd(); return false;" title="제안목록"><img src="../images/customer/btn_04.gif" alt="처리결과확인" /></a></div>

					<!-- new_officer -->
					<div class="new_officer">
						<table summary="담당부서 및 연락처 관리일">
						<caption>담당부서 및 연락처 관리일</caption>
						<tbody>
						<tr>
							<td class="write_day"></td>
							<td class="contact_team"><strong>담당부서 : </strong>예산투자처 예산팀</td>
							<td class="contact_user"><strong>담당자 : </strong>정재현</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2316</td>
						</tr>
						</tbody>
						</table>
					</div>
					<!-- new_officer -->



			</div>

		</div>
	</div>
	
</div>

	

<!--// footer: start //-->
<%@include file="/include/comfooter.jsp"%>
<!--// footer: end //-->

</div>

</body>
</html>