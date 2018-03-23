<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","07");
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
	<input type="hidden" name="callback" value="/sub04/sub04_5_7_list.jsp" />
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
					&gt; <span class="locanow">공익신고</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/customer/ttl_sub04_5_7.gif" alt="공익 신고" /></h3>
				</div>
				<div class="customer">
					<h4 class="mT0 pb10"><img src="../images/customer/img_sub04_5_7_01.gif" alt="한국석유공사(감사실)의 사이버 민원실을 찾아 주셔서 감사합니다. 저희 공사의 직무와 관련하여 행정처리에 대한 이의신청이나 부당하거나 억울한 사항에 대한 진정 등 민원인의 어려움을 성심성의껏 해결하여 드리겠습니다." /></h4>
					<h4 class="mT10 pb10"><img src="../images/customer/img_sub04_5_7_02.gif" alt="공익침해행위" /></h4>
					<div class="declaration pb05">
						<ul>
						<li>국민의 건강과 안전, 환경, 소비자의 이익 및 공정한 경쟁을 침해하는 행위로서 「공익신고자 보호법」 별표에 규정된 법률*의 벌칙이나,
						  인·허가의 취소처분, 정지처분 등 행정처분의 대상이 되는 행위<br />
						 <ul>
						 	<li> *「시설물의 안전관리에 관한 특별법」, 「식품위생법」, 「자연환경보전법」, 「의료법」등 180개<br /> 법률이 이에 해당되며
						   		공사가 조사기관으로서 기능하는 법률은 「석유 및 석유대체연료 사업법」임
						   	</li>
						  </ul>
						</li>
						</ul>
					</div>
					<h4 class="mT20 pb10"><img src="../images/customer/img_sub04_5_7_03.gif" alt="공익침해행위 예시" /></h4>
					<div class="declaration pb05">
						<ul>
							<li><strong>건강분야</strong>: 불량식품 제조·유통 등</li>
							<li><strong>환경분야 </strong>: 폐기물 불법 매립 등</li>
							<li><strong>안전분야  </strong>: 가짜 냉매가스 판매 등</li>
							<li><strong>소비자이익분야</strong> : 의약품 리베이트 등</li>
						</ul>
					</div>
					<h4 class="mT20 pb10"><img src="../images/customer/img_sub04_5_7_04.gif" alt="공익신고" /></h4>
					<div class="declaration pb05">
						<ul>
							<li>익침해행위가 발생 또는 발생할 우려가 있다는 사실을 신고하는 행위</li>
						</ul>
					</div>

					<h4 class="mT20 pb10"><img src="../images/customer/img_sub04_5_7_04.gif" alt="공익신고 접수기관" /></h4>
					<div class="declaration pb05">
						<ul>
							<li>국민권익위원회, 수사기관, 국회의원</li>
							<li>공익침해행위를 하는 사람이나 기관·단체·기업 등의 대표자 또는 사용자</li>
							<li> 공익침해행위에 대한 지도·감독·규제 또는 조사 등의 권한을 가진 행정기관이나 감독기관</li>
							<li> 공익침해행위와 관련된 법률에 따라 설치된 공사·공단 등 공공단체</li>
							<li> 공익침해행위와 관련된 법률에 따라 설치된 공사·공단 등 공공단체</li>
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
									&nbsp;&nbsp;&nbsp;&nbsp;-공익신고 게시판 운영</li>
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
							<td style="padding-left:50px;text-align:center;"><a href="/sub04/sub04_5_7_list.jsp?page=1&amp;mode=write&amp;bid=MINWON&amp;rtype=PU"><img src="../images/customer/btn_07.gif" alt="불법하도급 신고" /></a>&nbsp;<a href="#contents" onclick="popup_passwd(); return false;" title="새창"><img src="../images/customer/btn_04.gif" alt="처리결과조회" /></a></td>
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