<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","15");
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
			<!-- contents -->
            <div id="subcnts">
                <%@include file="/include/subtop_05.jsp"%>
                <div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a> &gt; <span>정보공개</span> &gt; <span>정보공개제도</span> &gt; <span class="locanow">정보공개처리절차</span>
                </div>				
                <div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/n_img_sub5/ttl_sub05_1_2.gif" alt="정보공개 처리절차" /></h3>
				</div>
                <div class="information">
					<!--star_정보공개처리절차-->
                    <h4 class="mT0"><img src="../images/information/img_ttl_sub05_4_1_03.gif" alt="정보공개처리절차" /></h4>
					<dl>
						<dt>정보공개업무 처리절차</dt>
						<dd class="nobul"><img src="../images/information/img_sub05_4_1_01.gif" class="pt05" alt="정보공개업무 처리절차" />
							<ol class="blindtext">
								<li><strong>청구서 제출</strong>(청구인)</li>
								<li><strong>청구서 접수 </strong>(윤리경영팀)</li>
								<li><strong>청구서 이송</strong>(처리부서 또는 소관기관) → [제 3자의 의견청취]</li>
								<li>[제 3자의 비공개요청 (공개청구사실 통지 받은날부터 3일이내)]  → <strong>정보공개여부 결정</strong>(청구일부터 10일 이내) → [정보공개심의회의 심의]</li>
								<li><strong>정보공개·비공개결정통지</strong>(공개·비공개 결정시 지체없이)</li>
								<li><strong>제3자의 이의 신청</strong>(공개통지 받은날부터 7일이내)</li>
								<li><strong>청구인의 이의신청</strong>(공개여부결정통지일 또는 비공개결정간주일부터 30일이내)</li>
								<li><strong>이의신청 결정</strong>(이의신청일부터 7일이내)</li>
								<li><strong>이의 신청 결정 결과통지</strong>(이의신청결정 즉시)</li>
								<li><strong>청구인 확인</strong>(신분증명서 등)</li>
								<li><strong>수수료징수</strong></li>
								<li><strong>공개실시</strong>(공개결정일부터 10일이내)</li>
							</ol>
						</dd>
					</dl>
					<dl>
						<dt>청구 및 접수</dt>
						<dd>청구인은 청구하고자 하는 정보를 보유ㆍ관리하고 있는 공공기관에『정보공개청구서』를 제출합니다.
							<div class="infoBox">							
								<dl>
									<dt>※ 청구서 기재사항</dt>
									<dd>청구인의 이름ㆍ주민등록번호ㆍ주소(법인인 경우 당해 법인명 및 대표자의 이름, 외국인의 경우 여권<br/>외국인의 등록번호) 및 연락처(전화번호ㆍ전자우편주소 등)</dd>
									<dd>청구하는 정보의 내용</dd>
									<dd>사용목적(학술연구, 사업관련, 행정감시, 쟁송관련, 재산관련 등)</dd>
									<dd>공개방법(열람, 시청, 사본ㆍ출력물, 복제물, 인화물 등)</dd>
								</dl>
							</div>
						</dd>
						<dd class="mT10">청구방법 : 직접출석, 우편, 모사전송, 정보통신</dd>
						<dd>공공기관이 정보공개청구서를 접수한 때에는「정보공개처리대장」에 기록하고 청구인에게 접수증을 교부합니다.</dd>
						<dd>정보공개청구서를 접수한 주관부서는 이를 담당부서 또는 소관기관에 이송합니다.</dd>
					</dl>
					<dl>
						<dt>공개여부결정</dt>
						<dd>공공기관(담당부서)은 청구를 받은 날로부터 “10일 이내”(부득이한 경우 10일 연장 가능)에 공개여부를 결정합니다.</dd>
						<dd>제3자의 의견청취
							<p>- 공개대상정보가 제3자와 관련이 있는 경우 공개청구된 청구사실을 제3자에게「지체없이」통지하고, 필요시 제3자의<br/>
							<span class="mL10">의견을 청취하여야 합니다.</span></p>
						</dd>
						<dd>정보생산기관의 의견청취
							<p>- 공개청구된 정보가 다른 공공기관이 생산한 정보일 때에는 당해 정보를 생산한 공공기관의 의견을 들어 공개여부를<br/>
							<span class="mL10">결정합니다.</span></p>
						</dd>
						<dd>정보공개청구서를 접수한 주관부서는 이를 담당부서 또는 소관기관에 이송합니다.</dd>
						<dd>3자의 비공개 요청
							<p>- 공개 청구된 사실을 통지받은 제3자는 의견이 있을 경우 통지받은 날로부터 "3일이내"에 당해 공공기관에 공개하지 아니할<br/>
							<span class="mL10">것을 요청할 수 있습니다.</span></p>
						</dd>
						<dd>정보공개심의회의 심의
							<p>- 공공기관은 정보공개 여부를 심의하기 위하여 정보공개심의회를 설치·운영합니다.<br/>
							<span class="mL10">- 정보공개심의회 심의사항은 다음과 같습니다.</span></p>
							<p class="mL20">1. 공공기관의 장이 단독으로 공개청구된 정보의 공개여부를 결정하기 곤란한 사항</p>
							<p class="mL20">2. 이의신청한 사항</p>
							<p class="mL20">3. 기타 정보공개제도의 운영에 관한 사항</p>
						</dd>
					</dl>

					<dl>
						<dt>공개여부결정의 통지</dt>
						<dd>공공기관이 공개청구된 정보에 대한 공개여부를 결정 할 때에는「지체없이」「서면」「전자우편」 등으로 통지합니다.</dd>
						<dd>공개결정시의 통지
							<p>- 공개일시·공개장소, 공개방법, 수수료의 금액 및 납부방법 등을 명시하여 공개를 결정한 날로부터 “10일이내”에 공개되도록<br/>
							<span class="mL10">통지하여야 합니다.</span></p>
						</dd>
						<dd>비공개 결정시의 통지
							<p>- 공공기관은 정보의 비공개 결정을 한 때에는 그 내용을 청구인에게 「지체없이」「서면」으로 통지합니다. 이 경우<br/>
							<span class="mL10">비공개사유·불복방법 및 불복절차를 명시하여야 합니다.</span></p>
						</dd>					
					</dl>
					<dl>
						<dt>공개실시</dt>
						<dd><strong>공개원칙</strong>
							<p>공공기관이 정보의 공개를 결정한 경우에는 청구인에게 통지한 공개일시·공개장소에서 원본으로 공개함이 원칙입니다. 다만, <br/>
							청구인 본인 또는 그 대리인을 직접 확인할 필요가 없는 경우에는 청구인의 요청에 의하여 우편으로 송부할 수 있습니다.</p>
						</dd>					
						<dd class="mT10"><strong>공개방법</strong>
							<div class="infoBox">							
								<ul>
									<li>문서, 대장, 도면, 카드류 : 열람 또는 사본의 교부</li>
									<li>녹음테이프, 녹화테이프, 슬라이드 : 시청 또는 복제물의 교부</li>
									<li>영화필름 : 시청</li>
									<li>마이크로필름 : 열람 또는 사본·복제물의 교부</li>
									<li>사진 : 열람 또는 사본의 교부</li>
									<li>사진필름 : 열람 또는 인화물·복제물의 교부</li>
									<li>컴퓨터 처리정보 : 매체의 열람·시청 또는 사본(출력물)·복제물의 교부</li>
								</ul>
							</div>
							<p class="mT5">청구방법 : 직접출석, 우편, 모사전송, 정보통신</p>
							<p>공공기관이 정보공개청구서를 접수한 때에는「정보공개처리대장」에 기록하고 청구인에게 접수증을 교부합니다.</p>
							<p>정보공개청구서를 접수한 주관부서는 이를 담당부서 또는 소관기관에 이송합니다.</p>
						</dd>					
						<dd class="mT10"><strong>공개종류</strong>
							<div class="infoBox">							
								<ul>
									<li>사본공개<br/>
									정보공개를 원본으로 하는 것이 원칙이나, 정보를 공개함에 있어 정보의 원본이 오손되거나 파손될 우려가 있는<br/>경우에는 사본으로 공개가 가능합니다.</li>
									<li>부분공개<br/>
									비공개 정보와 공개정보가 혼합되어 분리 가능한 경우, 공개취지에 부합되는 때에는 부분공개가 가능합니다.</li>
									<li>즉시공개<br/>
									공개여부결정절차 없이 즉시 또는 구술로 처리가 가능한 정보는 별도의 절차 없이 즉시 공개합니다.</li>
								</ul>
							</div>						
						</dd>
						<dd class="mT10"><strong>공개 시 확인</strong>
							<p>정보를 공개할 때에는 청구인 본인 또는 그 대리인임을 다음과 같은 서류로 확인합니다.</p>
							<div class="infoBox">							
								<ul>
									<li>청구인 본인에게 공개시<br/>
									청구인의 신원을 확인할 수있는 신분증명서(주민등록증 등)</li>
									<li>청구인의 법정대리인에게 공개시<br/>
									법정대리인임을 증명할 수 있는 서류와 대리인의 신원을 확인할 수 있는 신분증명</li>
									<li>청구인의 임의대리인에게 공개시<br/>
									정보공개위임장과 청구인 및 수임인의 신원을 확인할 수 있는 신분증명서</li>
								</ul>
							</div>
							<p class="mT5">※ 정보공개장소에 오실 때에는 정보(공개·부분공개·비공개) 결정통지서와 위의 해당 증명서를 지참하여야 합니다.</p>
						</dd>
					</dl>
                    <!--edn_정보공개처리절차-->
				</div>
            </div>
			<!-- //contents -->
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
						<td class="contact_team"><strong>담당부서 : </strong>총무관리처 상생지원팀</td>
						<td class="contact_user"><strong>담당자 : </strong>차정민</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2607</td>
					</tr>
				</tbody>
				</table>
			</div>
		</div>
    </div>
	<!--// footer: start //-->
	<%@include file="/include/comfooter.jsp"%>
	<!--// footer: end //-->
</div>
</body>
</html>