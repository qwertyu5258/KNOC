<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
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
                <%@include file="/include/subtop_04.jsp"%>
                <!--// location: start //-->
                <div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
                    &gt; <span>고객참여</span>
                    &gt; <span>고객헌장</span>
                    &gt; <span class="locanow">서비스이행표준</span>
                </div>
                <!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
                <div class="pagetle">
                    <h3><img src="/images/customer/ttl_sub04_1_2.gif" alt="서비스이행표준" /></h3>
                </div>
                <div class="customer">
					<h4 class="mT0"><img src="../images/customer/img_ttl_sub04_1_2_01.gif" alt="서비스 이행표준 요약" />
						<a href="sub04_1_2_1.jsp" class="mL5" ><img src="../images/customer/btn_01.gif" alt="서비스 이행표준 전문보기"/></a>
					</h4>
					<!-- star_ -->
					<table class="chart2 mT10" summary="서비스 이행표준 요약 내용을 분야별로 확인할 수 있습니다.">
						<caption>
						서비스 이행표준 요약 내용
						</caption>
						<col width="100px" />
						<col width="150px" />
						<col width="420px" />
						<thead>
							<tr>
								<th scope="col" colspan="2" class="first">분야</th>
								<th scope="col">서비스 이행표준 요약</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="rowgroup" rowspan="6" class="first bright">핵심서비스</th>
								<th scope="row">국내외 석유개발 서비스</th>
								<td class="tdleft">1. 해외유망광구 투자정보의 수집, 분석하고 고객에게 정기적으로 제공하고, 참여를 원하는 고객과 상호 협의하여 계약을 체결하고 지속적 관련 정보 제공<br />
									- 사업 설명회, 컨소시엄 회의 등은 5근무일전 안내<br />
									- 운영권자, 컨소시엄 대표인 경우 제공 약속한 사업정보의 정기적 제공<br />
									2. 기술, 경험을 공유하기 위한 세미나, 강습회 실시, 교육프로그램 개방 운영<br />
									3. 공사가 개발, 생산한 석유(가스)를 고객에게 공급<br />
									4. 정기적인 회의 등을 통한 고객의견 수렴 및 서비스 개선에 반영</td>
							</tr>
							<tr>
								<th scope="row">해양시추 서비스</th>
								<td class="tdleft">1. 시추선 용선정보안내 및 계약체결과정 안내<br />
									2. 국제수준의 선급을 유지하고, 안전점검의 정기적 실시<br />
									3. 용선 계약이 종결된 후, 자체 고객만족도 조사를 통해 고객의 의견을 수렴하여 서비스 개선에 반영</td>
							</tr>
							<tr>
								<th scope="row">비축유 및 비축시설<br />
									대여 서비스</th>
								<td class="tdleft">1. 관련 법률 및 신청절차 등의 안내, 요금 인상 시 1개월 유예기간 및 사전홍보<br />
									2. 원유도입선 도착 지연 등으로 비축유 대여를 고객이 요청시 타당성 검토 후 계약 체결, 비축유 출하 요청일로부터 5일 이내 개시<br />
									3. 비축시설 대여를 고객이 요청시 타당성 검토 후 적기 대여<br />
									- 고객협조 : 계약 후 입출하 요청 시 2근무일 이전까지 작업요청사항 제출<br />
									4. 시설(장비) 설치/관리와 편리한 이용위한 시설사용 가능일 등을 상세히 안내<br />
									5. 워크숍(년1회) 등을 통한 고객의견 수렴 및 고객서비스 개선에 반영</td>
							</tr>
							<tr>
								<th scope="row">석유정보 서비스</th>
								<td class="tdleft">1. 정보서비스의 정시 제공 : 주간석유뉴스 등<br />
									2. 에너지관련 다양한 정보 제공<br />
									3. 석유정보 범위/가격/이용매체 선택권 확대, 고객요청은 3근무일내 답변<br />
									4. 고객센터 운영 및 고객방문 등을 통한 고객의견수렴 및 서비스 개선에 반영</td>
							</tr>
							<tr>
								<th scope="row">에너지관련사업자금 지원</th>
								<td class="tdleft">1. 에너지관련사업자금 지원<br />
									2. 정부에서 융자승인한 사업에 대해 고객이 대출을 신청한 경우 30일내 자금 지원<br />
									3. 환급 사유 발생시 신속한 확인 후 4근무일내 환급<br />
									4. 고객설명회 및 고객방문 등을 실시하여 고객의견 수렴 및 서비스 개선에 반영</td>
							</tr>
							<tr>
								<th scope="row">알뜰주유소 운영지원</th>
								<td class="tdleft">1. 홈페이지를 통하여 관련 제도, 알뜰주유소 전환신청 절차, 계약 방법 등을 상세하게 안내<br />
									2. 알뜰주유소 사업을 개시한 지 만 2년이 도래하는 사업자에 대하여 알뜰주유소 평가 등을 통하여 탱크청소 및 재도색 지원을 1회 실시<br />
									3. 자영알뜰주유소 협회 등 고객과이 간담회를 연 1회 이상 정기적으로 추진 </td>
							</tr>
							<tr>
								<th scope="row" colspan="2" class="first">고객응대 서비스 표준</th>
								<td class="tdleft">1. 고객을 대하는 우리의 자세<br />
									2. 고객참여 및 의견제시 보장 : 홈페이지 통한 고객 요청사항은 3근무일내 처리<br />
									3. 고객헌장 서비스 이행표준과 이행실적은 홈페이지에 게시<br />
									4. 해피메일, 전화 등을 통한 고객요구(불평) 조사, 고객만족도조사는 년 1회 실시</td>
							</tr>
							<tr>
								<th scope="row" colspan="2" class="first">잘못된 서비스에 대한 시정 및 보상</th>
								<td class="tdleft">1. 불친절이나 잘못된 업무처리의 경우 연락받은 즉시 사과드리고, 잘못 시정<br />
									2. 처리 후에 전화(서면)을 통한 처리결과 확인 후, 고객이 불만족하실 경우 다시 시정<br />
									3. 업무처리과실로 공사 2회 방문시 20,000원 상품권 지급, 고객불편 신고시 확인후 5,000원 상품권 지급<br />
									4. 불만(건의)사항 연락처 고객서비스 담당자 조정근 (전화 052-216-2229, 052-216-2232, junggeun.cho@knoc.co.kr, hyoungin.ju@knoc.co.kr ) 석유공사 홈페이지 <a href="http://www.knoc.co.kr/sub04/sub04_2.jsp" target="_black">고객상담실</a></td>
							</tr>
						</tbody>
					</table>
					<!-- end_ -->
				</div>

                <!-- new_officer -->
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-09-22</td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
						<td class="contact_user"><strong>담당자 : </strong>조정근</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2229</td>
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