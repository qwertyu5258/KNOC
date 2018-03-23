<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","02");
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
	<input type="hidden" name="bid" value="SANGDAM" />
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="callback" value="/sub04/sub04_2_list.jsp" />
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
					&gt; <span>고객참여</span> &gt; <span class="locanow">고객상담실</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/customer/ttl_sub04_2.gif" alt="고객상담실" /></h3>
				</div>
				<div class="customer1">
					<h4 class="mT0 pb10"><img src="../images/customer/img_sub04_2_01.gif" alt="고객상담실은 한국석유공사에 관한 문의·불편사항 상담 및 친절직원 칭찬을 위한 공간입니다. 고객님이 요청하신 상담내용은 최대한 신속히 성심성의껏 해결해 드리도록 하겠습니다." /></h4>
					<div class="declaration">
						<ul>
							<li>게시물을 올리시기 전에 먼저 <a href="/sub04/sub04_4_1.jsp" title="FAQ 페이지로 이동"><span class="ce45108_b">FAQ</span></a>에 해당 내용이 있는지 확인해 주시면 감사하겠습니다.</li>
							<li>다음 사항은 지정된 경로를 이용하시면 보다 효율적으로 답변을 받아보실 수 있습니다.<br />
								<ul>
									<li>※ 국내/국제 유가 및 석유시장 관련 문의 : 석유정보망 Petronet 웹사이트 <a href="http://www.petronet.co.kr/index.jsp" target="_blank" title="석유정보망 홈페이지로 이동(새창)"><span class="ce45108_b">(www.petronet.co.kr)</span></a></li>
									<li>※ 채용, 석유개발 장학금, 인턴 등 채용 관련 문의 : 인사팀 e-mail <a href="mailto:insa@knoc.co.kr"><span class="ce45108_b" title="메일보내기(새창)">(insa@knoc.co.kr)</span></a></li>
									<!-- <li>※ 견학 관련 문의<br />본사 : 홍보팀 <span class="ce45108_b">(☎ 031-380-2158)</span><br />지사 : 각 지사 ("<a href="/sub01/sub01_5.jsp" title="조직 및 인원 페이지로 이동"><span class="ce45108_b">공사소개 > 조직 및 인원 > 연락처</span></a>" 참조)
									</li> -->
									<li>※ 견학 관련 문의 : 각 지사 ("공사소개 > 조직도 및 주요업무" 참조)</li>
								</ul>
							</li>
							<li>다음 사항은 한국석유공사와 관계가 없사오니 해당 기업 또는 기관에 문의해 주시기 바랍니다.<br />
								<ul>
									<li>※ 휘발유, 경유 등 제품유의 제조, 성상 및 유통에 관한 문의<br />
									정유사 (SK에너지, GS칼텍스, S-Oil, 현대오일뱅크 등)</li>
									<li>※ 유사석유제품의 신고 및 처리에 관한 문의<br />
									한국석유관리원<span class="ce45108_b">(</span><a href="http://www.kpetro.or.kr/" target="_blank" title="한국석유관리원 홈페이지로 이동(새창)"><span class="ce45108_b">www.kpetro.or.kr</span></a><span class="ce45108_b">, ☎ 1588-5166)</span>
										<br /><br />
										<!--<strong>※ 주의사항 : 게시글 작성 시 글 내용에 개인정보가 포함될 수 있으니 주의하시기 바랍니다.<br /></strong>-->
									</li>
								</ul>
							</li>
						</ul>
					</div>

					<div class="customer2">
					<div class="declaration">
						<ul>
							<li>한국석유공사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률과 개인정보보호법 등 개인정보 관련 법령을 준수하며, 개인정보처리방침을 통하여 다음과 같이 개인정보를 수집하여 처리함을 알려드립니다.<br /><br />
								<ul class="align_01">
									<li style="text-align:center;"><strong>- 다 음 -</strong></li>
									<li>
										<strong>1. 수집하는 개인정보 항목 </strong><br />&nbsp;&nbsp;&nbsp;&nbsp;공사는 다음과 같은 항목들을 수집하여 처리합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;- 필수항목 : 성명, 비밀번호<br />&nbsp;&nbsp;&nbsp;&nbsp;- 선택항목 : 전화번호, 이메일</li>
									<li><strong>2. 개인정보의 수집·이용 목적</strong><br />
									&nbsp;&nbsp;&nbsp;&nbsp;-고객상담 게시판 운영</li>
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
					
					<div class="pt25" align="center">
						<a href="/sub04/sub04_2_list.jsp?page=1&amp;mode=write&amp;bid=SANGDAM" title="고객상담"><img src="../images/customer/btn_08.gif" alt="고객상담" /></a> <a href="#contents" onclick="popup_passwd(); return false;" title="새창"><img src="../images/customer/btn_04.gif" alt="처리결과확인" /></a>
					</div>

					<!-- new_officer -->
					<div class="new_officer">
						<table summary="담당부서 및 연락처 관리일">
						<caption>담당부서 및 연락처 관리일</caption>
						<tbody>
						<tr>
							<td class="write_day"></td>
							<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
							<td class="contact_user"><strong>담당자 : </strong>주형인</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2232</td>
						</tr>
						</tbody>
						</table>
					</div>
					<!-- new_officer -->

				</div>

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