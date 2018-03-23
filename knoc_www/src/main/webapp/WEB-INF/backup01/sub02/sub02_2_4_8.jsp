<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","08");
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
                    &gt; <span>경영공시</span>
					&gt; <span>인적자원현황</span>
                    &gt; <span class="locanow">노사관계 및 근로조건</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_4.gif" alt="인적자원현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_6_3_ta_3.gif" alt="노동조합 가입정보" /></h4>
					<h5>단일노조</h5>
					<!--표-->
					<table class="chart6" summary="노동조합 가입정보 단일노조에 대한 표로 노동조합 명칭, 노동조합 설립일, 위원장, 성명, 임기, 노동조합 가입범위, 가입대상인원, 조합원수, 정규직, 비정규직, 무기계약직, 교섭권 여부, 근로시간면제 현황, 시간한도, 풀타임, 파트타임, 전임자수, 유급, 무급, 상급단체, 총연합단체, 연합단체에 대한 정보를 제공합니다.">
						<caption>노동조합 가입정보 단일노조</caption>
						<colgroup>
						<col width="14%" />
						<col width="14%" />
						<col width="*" />
						</colgroup>
						<tbody>
						<tr>
							<th scope="row" colspan="2">노동조합 명칭</th>
							<td>한국석유공사 노동조합</td>
						</tr>
						<tr>
							<th scope="row" colspan="2">노동조합 설립일</th>
							<td>1988년 10월 18일</td>
						</tr>
						<tr>
							<th scope="col" rowspan="2">위원장</th>
							<th scope="col" class="line_l">성명</th>
							<td>ㅇㅇㅇ</td>
						</tr>
						<tr>
							<th scope="col" class="line_l">임기</th>
							<td>2015.10.18 ~ 2018.10.17</td>
						</tr>
						<tr>
							<th scope="row" colspan="2">노동조합 가입범위</th>
							<td class="al_l">단체협약 제4조(조합원의 범위) 제3항을 제외한 모든 직원<br />③ 공사 직원 중 다음 각 호의 어느 하나에 해당하는 자는 조합원이 될 수 없다.
								<ol>
									<li>1. 3급 또는 팀장 이상 직원</li>
									<li>2. 인사·노무·복지·법무·감사·회계 등에 종사하는 직원 중 조합에 통보한 직원</li>
									<li>3. 임원의 비서·운전직원</li>
									<li>4. 전문계약직원</li>
								</ol>
							</td>
						</tr>
						<tr>
							<th scope="row" colspan="2">가입대상인원</th>
							<td class="al_r">1,115 명</td>
						</tr>
						<tr>
							<th scope="col" rowspan="3">조합원수</th>
							<th scope="col" class="line_l">정규직</th>
							<td class="al_r">1,105 명</td>
						</tr>
						<tr>
							<th scope="col" class="line_l">비정규직</th>
							<td class="al_r">0 명</td>
						</tr>
						<tr>
							<th scope="col" class="line_l">무기계약직</th>
							<td class="al_r">10 명</td>
						</tr>
						<tr>
							<th scope="row" colspan="2">교섭권 여부</th>
							<td>있음 / 교섭대표노조</td>
						</tr>
						<tr>
							<th scope="col" rowspan="3">근로시간면제<br />현황</th>
							<th scope="col" class="line_l">시간한도</th>
							<td class="al_r">10,000 시간이내</td>
						</tr>
						<tr>
							<th scope="col" class="line_l">풀타임</th>
							<td class="al_r">5 명</td>
						</tr>
						<tr>
							<th scope="col" class="line_l">파트타임</th>
							<td class="al_r">0 명</td>
						</tr>
						<tr>
							<th scope="col" rowspan="2">전임자수</th>
							<th scope="col" class="line_l">유급</th>
							<td class="al_r">0 명</td>
						</tr>
						<tr>
							<th scope="col" class="line_l">무급</th>
							<td class="al_r">0 명</td>
						</tr>
						<tr>
							<th scope="col" rowspan="2">상급단체</th>
							<th scope="col" class="line_l">총연합단체</th>
							<td>한국노총</td>
						</tr>
						<tr>
							<th scope="col" class="line_l">연합단체</th>
							<td>전국공공산업노동조합연맹</td>
						</tr>
						</tbody>
					</table>
					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ; margin-bottom:20px; ">공시기준 :  ‘16년 3월말 기준 </p>
					<!--//표-->
					<h4><img src="/images/management/sub02_2_6_3_ta_2.gif" alt="노동조합협약정보"/></h4>
					
					<p>
					<a href="http://www.alio.go.kr/popSusi.do?apbaId=C0214&reportFormRootNo=21026" target="_blank" title="새창"><img src="/images/management/btn_labor_down1.gif" alt="단체협약" /></a>
					<a href="http://www.alio.go.kr/popSusi.do?apbaId=C0214&reportFormRootNo=21027" target="_blank" title="새창"><img src="/images/management/btn_labor_down2.gif" alt="임금협약 " /></a>
					<a href="http://www.alio.go.kr/popSusi.do?apbaId=C0214&reportFormRootNo=21028" target="_blank" title="새창"><img src="/images/management/btn_labor_down3.gif" alt="노사협의회 의결사항" /></a>
					</p>
					

					<!--<p class="mT10"><strong>신경영 창출 노사상생선언</strong> <a href="/filedown.jsp?fileno=10&amp;filepath=/upload/data/sub02/"><img src="/images/management/btn_download.gif" alt="신경영 창출 노사상생선언  다운로드"/></a></p>
					
					<p class="mT10"><strong>필수유지업무협정서(2008.2.29)</strong> <a href="/filedown.jsp?fileno=11&amp;filepath=/upload/data/sub02/"><img src="/images/management/btn_download.gif" alt="필수유지업무협정서(2008.2.29) 다운로드"/></a></p>
					
					<p class="mT10"><strong>노사협의회 합의사항(2013.12.23)</strong> <a href="/filedown.jsp?fileno=12&amp;filepath=/upload/data/sub02/"><img src="/images/management/btn_download.gif" alt="노사협의회 합의사항(2013.11.6) 다운로드"/></a>
					<p class="mT5" style="margin-left:3px;">- 직무급 합의서 (2013.12.23) <a href="/filedown.jsp?fileno=20&amp;filepath=/upload/data/sub02/"><img src="/images/management/btn_download.gif" alt="직무급 합의서(2013.12.23)다운로드"/></a>
					</p>
					<p class="mT5" style="margin-left:3px;">- 근로시간 면제한도 합의서(2013.11.29) <a href="/filedown.jsp?fileno=21&amp;filepath=/upload/data/sub02/"><img src="/images/management/btn_download.gif" alt="근로시간 면제한도 합의서(2013.11.29)다운로드"/></a></p>-->
					
					
					
					<h5 class="mT30">노사관계</h5>
					<!--표-->
					<table class="chart2" summary="한국석유공사 노사관계 관련 내용을 확인할 수 있습니다.">
					
					<caption>한국석유공사 노사관계</caption>
					<col width="150px" />
					<col width="550px" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					<th scope="col">내용</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">노조설립</td>
					<td>1988. 10. 18</td>
					</tr>
					<tr>
					<td class="first">노사분규</td>
					<td>없음</td>
					</tr>
					</tbody>
					</table>
					<!--//표-->
					<h5>근무시간 및 재해보상</h5>
					<!--표-->
					<table class="chart2" summary="한국석유공사 근무시간 및 재해보상 관련 내용을 확인할 수 있습니다.">
					
					<caption>한국석유공사 근무시간 및 재해보상</caption>
					<col width="150px" />
					<col width="550px" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					<th scope="col">내용</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">근무시간</td>
					<td>주 40시간</td>
					</tr>
					<tr>
					<td class="first">재해보상제도</td>
					<td>산업재해보상보험 가입</td>
					</tr>
					</tbody>
					</table>
					
					
					<!--//표-->
<!--					
					<h5>사내근로복지기금 현황</h5>
					<span>(단위 : 백만원)</span>
										<table class="chart2" summary="한국석유공사 사내근로복지기금 현황을 연도별로 확인할 수 있습니다.">
					<caption>한국석유공사 사내근로복지기금 현황</caption>

					<col width="200px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<thead>
					<tr>
					<th scope="col" class="first">연도</th>
					<th scope="col">2004</th>
					<th scope="col">2005</th>
					<th scope="col">2006</th>
					<th scope="col">2007</th>
					<th scope="col">2008</th>
					</tr>
					
					</thead>
					
					<tbody>					
					<tr>
					<td class="first">금액</td>
					<td>6,279</td>
					<td>16,336</td>
					<td>13,200</td>
					<td>13,840</td>
					<td>8,800</td>
					</tr>
					</tbody>
					</table>
-->
					<!--//표-->
	

				
				<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">공시기준 : ‘16년 3월말 기준 </p>
				</div>
				
				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-05-10</td>
							<td class="contact_team"><strong>담당부서 : </strong>인재경영처 노무팀</td>
							<td class="contact_user"><strong>담당자 : </strong>홍성화</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2784</td>
						</tr>
					</tbody>
				</table>
				</div>				
				<div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div>				
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>