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
						<li><a href="sub02_1_3_1.jsp" title="시스템체계" ><img src="/images/management/tab_sub02_1_3_1_1.gif" alt="시스템체계" /></a></li>
						<li><a href="sub02_1_3_1_1.jsp" title="신고보상제도" ><img src="/images/management/tab_sub02_1_3_1_2.gif" alt="신고보상제도" /></a></li>
						<li><a href="sub02_1_3_1_2.jsp" title="청렴계약제" ><img src="/images/management/tab_sub02_1_3_1_3r.gif" alt="청렴계약제" /></a></li>
						<li><a href="sub02_1_3_1_3.jsp" title="임원직무청렴계약제" ><img src="/images/management/tab_sub02_1_3_1_4.gif" alt="임원직무청렴계약제" /></a></li>
						</ul>
						<h4><img src="/images/management/sub02_1_3_1_ta3.gif" alt="청렴계약제" /></h4>
						<div class="sysBox3">
							<div><img src="/images/management/sub02_1_3_1_img3_1.gif" class="vMid" alt="입찰, 계약 및 이행과정에서의 담합, 뇌물제공 등의 관행을 근절하여 부패로 인한 계약과정의 비용이 높아지는 것을 방지하기 위해 입찰 참여업체와 행정기관 양 당사자가 모두가 입찰, 낙찰, 계약이행 과정 에서 부패행위를 하지 않겠다는 약속을 하고 이행하는 것" />
							</div>
							<ul>
							<li><strong>- 주요내용</strong>
								<p>상호간 뇌물을 제공하고 받지 않겠다는 서약서를 교환, 입찰과정의 정보 공개, 청렴계약 위반업체 제재(입찰참가자격 제한 및 계약해지 등), 위반임직원 문책</p>
							</li>
							<li><strong>- 단계별 청렴계약 절차</strong>
								<table width="690" class="chart1" summary="단계별 청렴계약 절차를 확인할 수 있습니다.">
								<caption>단계별 청렴계약 절차</caption>
								
								<col width="120px" />
								<col width="580px" />
								<thead>
								<tr>
								<th scope="col" class="first">구분</th>
								<th scope="col">내용</th>
								</tr>
								</thead>
								<tbody>
								<tr>
								<td class="first">입찰공고 시</td>
								<td>공고문에 청렴계약제 시행을 안내하거나 입찰특별유의서로 안내</td>
								</tr>
								<tr>
								<td class="first">입찰등록 시</td>
								<td>청렴계약이행 서약서를 제출한 업체만 입찰참가자격 부여</td>
								</tr>
								<tr>
								<td class="first">계약서 작성 시</td>
								<td>업체로부터 청렴계약이행 서약서를 제출받고, 청렴계약이행을 계약조건으로 계약서에 포함시켜 체결</td>
								</tr>
								<tr>
								<td class="first">계약이행 시</td>
								<td>청렴계약 위반 시 입찰참가자격 제한 및 계약해지, 위반임직원 문책</td>
								</tr>
								</tbody>
								</table>
							</li>

							
							</ul>
						</div>
					</div>

				</div>
				
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day">&nbsp;</td>
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