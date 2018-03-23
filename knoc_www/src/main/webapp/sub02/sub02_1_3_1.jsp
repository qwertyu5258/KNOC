<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>        
<%@include file="/include/comheader.jsp"%>


	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>열린경영</span>
                    &gt; <span>윤리경영</span>
					&gt; <span>윤리경영제도</span>
                    &gt; <span class="locanow">윤리경영시스템</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_1_3_1.gif" alt="윤리경영시스템" /></h3>
				</div>
				<!--시작-->				
				<div class="manageSys">
					<div>
						<ul class="tab">
							<li><a href="sub02_1_3_1.jsp" title="시스템체계" ><img src="/images/management/tab_sub02_1_3_1_1r.gif" alt="시스템체계" /></a></li>
							<li><a href="sub02_1_3_1_1.jsp" title="신고보상제도" ><img src="/images/management/tab_sub02_1_3_1_2.gif" alt="신고보상제도" /></a></li>
							<li><a href="sub02_1_3_1_2.jsp" title="청렴계약제" ><img src="/images/management/tab_sub02_1_3_1_3.gif" alt="청렴계약제" /></a></li>
							<li><a href="sub02_1_3_1_3.jsp" title="임원직무청렴계약제" ><img src="/images/management/tab_sub02_1_3_1_4.gif" alt="임원직무청렴계약제" /></a></li>
						</ul>
						<h4><img src="/images/management/sub02_1_3_1_ta1.gif" alt="시스템체계" /></h4>
						<div class="sysBox">
							<h5><img src="/images/management/h5_manageSys02_20100222.gif" alt="윤리경영 제도구축(Design &amp; Planning)" /></h5>
							<div>

								<ul>

<!--								<li><img src="/images/management/txt_manageSys0201.gif" alt="CEO서신전파 - 최고경영자의 윤리경영 추진의지 표명" />
								</li>
-->

								<li><img src="/images/management/txt_manageSys0202.gif" alt="윤리규범 - 윤리헌장, 행동강령 제정으로 기준마련" />
								</li>
								<li><img src="/images/management/txt_manageSys0203.gif" alt="윤리경영 추진 기구/조직 - 윤리경영위원회, 윤리경영 담당부서 감사, 담당부서, 사회공헌 담당부서" />
								</li>
								</ul>
							
							
							</div>
							<div class="arrow"><img src="/images/management/arrow_manageSys_down.gif" alt="" /></div>
						</div>

						<div class="sysBox">
							<h5><img src="/images/management/h5_manageSys01_20100222.gif" alt="윤리경영 교육 및 실천(Education &amp; Reinforcement)" /></h5>

							<div>
							
							
								<ul>
								<li><img src="/images/management/txt_manageSys0101.gif" alt="교육훈련 프로그램 - On,Off-line 강의 및 워크샵" />
								</li>
<!--
								<li><img src="/images/management/txt_manageSys0102.gif" alt="CSR프로그램 - Matching Grant 제도 도입으로 CSR펀드 토대 마련" />
								</li>
-->								
								<li><img src="/images/management/txt_manageSys0103.gif" alt="내부통제 프로그램 - 신고보상제도,청렴계약제,임원직무청렴계약제 실시" />
								</li>
								</ul>
							
							
							</div>
							<div class="arrow"><img src="/images/management/arrow_manageSys_down.gif" alt="" /></div>
						</div>

						<div class="sysBox">
							<h5><img src="/images/management/h5_manageSys03.gif" alt="윤리경영 활동 모니터(Monitoring)" /></h5>
							<div>
								<ul>
								<li><img src="/images/management/txt_manageSys0301.gif" alt="윤리활동 커뮤니케이션 시스템 - 윤리활동 상담센터 「윤리,행동강령 무엇이든 물어보세요!」" />
								</li>
								<li><img src="/images/management/txt_manageSys0302.gif" alt="윤리수준 측정 프로그램 - 윤리수준 자체진단, 협력업체 윤리수준 진단" />
								</li>									
								</ul>
							</div>
							<div class="arrow"><img src="/images/management/arrow_manageSys_down.gif" alt="" /></div>
						</div>

						<div class="sysBox">
							<h5><img src="/images/management/h5_manageSys04.gif" alt="윤리경영 평가 및 개선(Improvment)" /></h5>
							<div>
								<ul>
								<li><img src="/images/management/txt_manageSys0401.gif" alt="윤리경영 실천 평가제도 - ‘윤리성’인사평가 반영" />
								</li>
								<li><img src="/images/management/txt_manageSys0402.gif" alt="윤리경영 활동 포상제도 - 임직원 윤리대상 선정" />
								</li>
								<li><img src="/images/management/txt_manageSys0403.gif" alt="개선과제 발굴 시스템 - 직원, 협력업체, 국민의견을 듣는 윤리경영 한마디를 통한 지속적인 개선과제 관리" />
								</li>	
								</ul>
							</div>
						</div>
						<div class="Cboth"></div>
					</div>

				</div>
				
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
							<td class="contact_team"><strong>담당부서 : </strong>감사실 청렴경영감사팀</td>
							<td class="contact_user"><strong>담당자 : </strong>이유경</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2126</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>