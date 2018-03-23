<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
	//<![CDATA[
	function submit_chk() {

		if(document.getElementById("user_id").value == ""){
			alert("아이디를 입력해 주세요");
			return false;
		}

		if(document.getElementById("user_pwd").value == ""){
			alert("패스워드를 입력해 주세요");
			return false;
		}
	}
	//]]>
</script>

	<!--// subtopNavi: start //-->
	<%@include file="/include/subtopnavi_new.jsp"%>
	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->

		<div id="rightarea">
			<div id="subcnts">

				<!--// location: start //-->
				<!-- 디자인팀 수정요청[start] -->
				<%@include file="/include/subtop_04.jsp"%>
				<!-- 디자인팀 수정요청[end] -->

				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>고객참여</span>&gt; <span class="locanow">청렴 옴부즈만 신고센터</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
				<h3><img src="/images/omb/ttl_sub04_8_10.gif" alt="청렴 옴부즈만 신고센터" /></h3>
                </div>


					<div class="customer">
					<div class="declaration pb05">
						<ul>
							<li><strong>청렴옴부즈만 신고센터 소개</strong><br />
								<ul>
									<li>- 한국석유공사「청렴옴부즈만」신고센터를 찾아 주셔서 감사합니다.</li>
									<li>- 한국석유공사는 독립성을 갖춘 외부인을 청렴옴부즈만으로 위촉하여 경영의 책임성·투명성을 제고하기 위해 노력하고 있습니다.</li>
									<li>- 청렴옴부즈만 신고센터는 공사 임직원 비위행위, 계약관련 불공정 행위, 업무관련 불만·불편사항에 대해 민원인이 직접「청렴옴부즈만」에게 신고하기 위해 마련된 곳입니다.</li>
								</ul>
							</li>

							<li><strong>신고대상</strong><br />
								<ul>
									<li>- 임직원 부패·비위사건, 계약관련 불공정 행위, 업무관련 불만·불편사항 등</li>
								</ul>
							</li>

							<li><strong>신고방법</strong><br />
								<ul>
									<li>- 공사홈페이지 ‘청렴옴부즈만 신고센터’를 이용하시면 됩니다.</li>
									<li>- 신고사안은 비공개 처리되며, 신고인의 신분은 철저히 보안을 유지하여 드립니다.</li>
								</ul>
							</li>
							<li class="clear_st"><strong>※ 청렴옴부즈만 소개</strong><br />
								<table summary="청렴옴부즈만 소개에 대한 표로 옴부즈만, 소속/경력 등에 대한 정보를 제공합니다." class="chart2 mT10">
								<caption>청렴옴부즈만 소개</caption>
								<colgroup>
								<col width="150px">
								<col width="275px">
								</colgroup>
								<thead>
								<tr>
									<th class="first" scope="col">옴부즈만</th>
									<th scope="col">소속/경력</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td class="first"><img src="/images/management/img_obm_1.jpg"  border="0" alt="편호범 옴부즈만" /></td>
									<td class="tdleft2">
										<ul class="st_n1">
											<li>- <strong>소속</strong><br />
												<ul>
													<li> · 수원대학교 교수</li>
												</ul>
											</li>
											<li>- <strong>경력</strong><br />
												<ul>
													<li> · 現)한국원가공학회 회장</li>
													<li> · 前)딜로이트안진회계법인 부회장</li>
													<li> · 前)감사원 감사위원</li>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first"><img src="/images/management/img_obm_2.jpg"  border="0" alt="손양훈 옴부즈만" /></td>
									<td class="tdleft2">
										<ul class="st_n1">
											<li>- <strong>소속</strong><br />
												<ul>
													<li> · 인천대학교 교수</li>
												</ul>
											</li>
											<li>- <strong>경력</strong><br />
												<ul>
													<li> · 現)한국자원경제학회장</li>
													<li> · 前)에너지경제연구원 원장</li>
													<li> · 前)국민경제자문회의 창조경제분과 위원</li>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first"><img src="/images/management/img_obm_3.jpg"  border="0" alt="이택희 옴부즈만" /></td>
									<td class="tdleft2">
										<ul class="st_n1">
											<li>- <strong>소속</strong><br />
												<ul>
													<li> · 중앙디자인웍스 대표</li>
												</ul>
											</li>
											<li>- <strong>경력</strong><br />
												<ul>
													<li> · 現)중앙디자인웍스 대표</li>
													<li> · 前)중앙일보 심의실 실장</li>
													<li> · 前)중앙일보 편집국 편집디자인에디터</li>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
								</tbody>
								</table>
							</li>

							<li class="clear_st tx_cen btn_area"><span ><a href="frontControl.jsp" ><img src="/images/management/btn_ombudsman2.gif"  border="0" alt="청렴옴부지만 신고센터에 신고하기" /></a></span></li>
						</ul>

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
					<td class="contact_team"><strong>담당부서 : </strong>감사실 청렴경영감사팀</td>
					<td class="contact_user"><strong>담당자 : </strong>황민철</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2124</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->

				</div>
				<!--//끝-->
			</div>


	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>