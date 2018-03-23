<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","08");
	application.setAttribute("gNavMenuDepth3","02");
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
	<input type="hidden" name="bid" value="CLEAR2" />
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="callback" value="/sub04/sub04_8_2_list.jsp" />
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
					&gt; <span>알뜰주유소</span>
					&gt; <span class="locanow">자유게시판</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3 class="tleimg" style="margin-top:-2px ;"><img src="/images/customer/04_8_2_tit.gif" alt="자유게시판" /></h3>
				</div>
				<div class="customer">
					<h4 class="mT0 pb10"><img src="../images/customer/04_8_2_txt.gif" alt="자유게시판은 알뜰주유소에 관한 문의·민원 및 개선의견을 위한 공간입니다. 자유게시판은 알뜰주유소에 관한 문의·민원 및 개선의견을 위한 공간입니다." /></h4>
					<div class="declaration">
						<ul>
						<!-- li>문의하시기 전 공지사항 또는 FAQ에 동일, 유사한 내용이 있는지 확인해 주시면 감사하겠습니다.</li>
						<li>입력된 자료는 비공개로 선택하실 수 있습니다.</li-->
						<li>공지사항 또는 자유게시판에 동일하거나 유사한 제목을 검색하시면 빠른 답변을 얻으실 수 있습니다.</li>
						<li>입력된 문의는 비공개로 선택하실 수 있습니다.</li>
						</ul>
					</div>
					<div class="customer2">
						<div class="declaration">
							<ul>
								<li>한국석유공사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률과 개인정보보호법 등 개인정보 관련법령을 준수하며, 개인정보처리방침을 통하여 다음과 같이 개인정보를 수집하여 처리함을 알려드립니다.<br />
									<br />
									<ul>
										<li style="text-align:center;"> <strong>- 다 음 -</strong> </li>
										<li> <strong>1. 수집하는 개인정보 항목</strong><br />
											&nbsp;
											&nbsp;
											&nbsp;
											&nbsp;
											공사는 다음과 같은 항목들을 수집하여 처리합니다.<br />
											&nbsp;
											&nbsp;
											&nbsp;
											&nbsp;
											-성명, 비밀번호, 전화번호, 이메일</li>
										<li><strong>2. 개인정보의 수집·이용 목적</strong> <br />
											&nbsp;
											&nbsp;
											&nbsp;
											&nbsp;
											-알뜰주유소 자유게시판 운영</li>
										<li><strong>3. 개인정보의 보유 및 이용기간</strong><br />
											&nbsp;
											&nbsp;
											&nbsp;
											&nbsp;
											-보유 기간 : 게시물 삭제 요청시까지 또는 게시글 등록 후 3년 경과시(자동파기)<br />
											&nbsp;
											&nbsp;
											&nbsp;
											&nbsp;
											-보유 근거 : 정보주체의 동의 및 공사 사규(개인정보 내부관리기준 제3장 개인정보 처리)</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="pt25" align="center">
						<a href="/sub04/sub04_8_2_list.jsp?page=1&amp;mode=write&amp;bid=CLEAR2"><img src="../images/customer/btn_10.gif" alt="문의제안하기" /></a> <a href="#contents" onclick="popup_passwd(); return false;" title="처리결과조회"><img src="../images/customer/btn_04.gif" alt="처리결과조회" /></a>						
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
					<td class="contact_team"><strong>담당부서 : </strong>유통사업처 유통사업팀</td>
					<td class="contact_user"><strong>담당자 : </strong>박종익</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-5202</td>
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