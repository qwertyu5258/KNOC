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
	application.setAttribute("gNavMenuDepth4","10");
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
                    &gt; <span class="locanow">임원연봉</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_4.gif" alt="인적자원현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_4_3.gif" alt="임원연봉"/></h4>
					<p class="ctxt"><strong>연도별 임원연봉</strong></p>
					<div class="offtxt3">
						<h5>기관장</h5>
						<p>(단위 : 천원)</p>
					</div>
					<!--표-->
					<table class="chart3" summary="한국석유공사 기관장에 대한 연도별 연봉현황을 확인할 수 있습니다.">
						<caption>한국석유공사 기관장 연봉현황</caption>
						<colgroup>
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						</colgroup>
						<thead>
						<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">2011년 결산</th>
							<th scope="col">2012년 결산</th>
							<th scope="col">2013년 결산</th>
							<th scope="col">2014년 결산</th>
							<th scope="col">2015년 결산</th>
                            <th scope="col">2016년 예산</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="first">기본급</td>
							<td>101,309</td>
							<td>104,936</td>
							<td>107,969</td>
							<td>107,969</td>
							<td>114,055</td>
                            <td>116,929</td>
						</tr>
						<tr>
							<td class="first">고정수당</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">실적수당</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">급여성<br />복리후생비</td>
							<td>572</td>
							<td>2,205</td>
							<td>4,665</td>
							<td>715</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">경영평가<br />성과급</td>
							<td>115,380</td>
							<td>81,048</td>
							<td>0</td>
							<td>38,869</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">기타성과<br />상여금</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>32,391</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">합계</td>
							<td>217,261</td>
							<td>188,189</td>
							<td>112,634</td>
							<td>179,944</td>
							<td>114,055</td>
                            <td>116,929</td>
						</tr>
						<tr>
							<td class="first">비고</td>
							<td>연봉제</td>
							<td>연봉제</td>
							<td>연봉제</td>
							<td>연봉제</td>
							<td>연봉제</td>
                            <td>연봉제</td>
						</tr>
						</tbody>
					</table>
					<!--//표-->
					<div class="offtxt3">
						<h5>상임감사</h5>
						<p>(단위 : 천원)</p>
					</div>
					<!--표-->
					<table class="chart3" summary="한국석유공사 상임감사에 대한 연도별 연봉현황을 확인할 수 있습니다.">
						<caption>
						한국석유공사 상임감사 연봉현황
						</caption>
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col  />
						<thead>
						<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">2011년 결산</th>
							<th scope="col">2012년 결산</th>
							<th scope="col">2013년 결산</th>
							<th scope="col">2014년 결산</th>
							<th scope="col">2015년 결산</th>
                            <th scope="col">2016년 예산</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="first">기본급</td>
							<td>81,048</td>
							<td>83,949</td>
							<td>86,375</td>
							<td>86,375</td>
							<td>91,244</td>
                            <td>93,543</td>
						</tr>
						<tr>
							<td class="first">고정수당</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">실적수당</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">급여성<br />복리후생비</td>
							<td>2,119</td>
							<td>580</td>
							<td>2,057</td>
							<td>707</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">경영평가<br />성과급</td>
							<td>30,768</td>
							<td>32,419</td>
							<td>0</td>
							<td>22,673</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">기타성과<br />상여금</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>25,913</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">합계</td>
							<td>113,935</td>
							<td>116,948</td>
							<td>88,432</td>
							<td>135,668</td>
							<td>91,244</td>
                            <td>93,543</td>
						</tr>
						<tr>
							<td class="first">비고</td>
							<td>연봉제</td>
							<td>연봉제</td>
							<td>연봉제</td>
							<td>연봉제</td>
							<td>연봉제</td>
                            <td>연봉제</td>
						</tr>
						</tbody>
					</table>
					<!--//표-->

					<div class="offtxt3">
						<h5>상임이사</h5>
						<p>(단위 : 천원)</p>
					</div>
					<!--표-->
					<table class="chart3" summary="한국석유공사 상임이사에 대한 연도별 연봉현황을 확인할 수 있습니다.">
						<caption>
						한국석유공사 상임이사연봉현황
						</caption>
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col  />
						<thead>
						<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">2011년 결산</th>
							<th scope="col">2012년 결산</th>
							<th scope="col">2013년 결산</th>
							<th scope="col">2014년 결산</th>
							<th scope="col">2015년 결산</th>
                            <th scope="col">2016년 예산</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="first">기본급</td>
							<td>99,273</td>
							<td>102,827</td>
							<td>105,759</td>
							<td>86,375</td>
							<td>91,244</td>
                            <td>93,543</td>
						</tr>
						<tr>
							<td class="first">고정수당</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">실적수당</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">급여성<br />복리후생비</td>
							<td>2,957</td>
							<td>2,998</td>
							<td>5,673</td>
							<td>3,360</td>
							<td>2,025</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">경영평가<br />성과급</td>
							<td>63,289</td>
							<td>6,746</td>
							<td>0</td>
							<td>26,344</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">기타성과<br />상여금</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>25,913</td>
							<td>0</td>
                            <td>0</td>
						</tr>
						<tr>
							<td class="first">합계</td>
							<td>165,519</td>
							<td>112,571</td>
							<td>111,432</td>
							<td>141,992</td>
							<td>93,269</td>
                            <td>93,543</td>
						</tr>
						<tr>
							<td class="first">비고</td>
							<td>연봉제</td>
							<td>연봉제</td>
							<td>연봉제</td>
							<td>연봉제</td>
							<td>연봉제</td>
                            <td>연봉제</td>
						</tr>
						</tbody>
					</table>



					<div class="offtxt3">
						<h5>비상임이사</h5>
						<p>(단위 : 천원)</p>
					</div>
					<!--표-->
					<table class="chart3" summary="한국석유공사 비상임이사에 대한 연도별 연봉현황을 확인할 수 있습니다.">
						<caption>
						한국석유공사 비상임이사연봉현황
						</caption>
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col width="80px" />
						<col  />
						<thead>
						<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">2011년 결산</th>
							<th scope="col">2012년 결산</th>
							<th scope="col">2013년 결산</th>
							<th scope="col">2014년 결산</th>
							<th scope="col">2015년 결산</th>
							<th scope="col">2016년 예산</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="first">월정액</td>
							<td>30,000</td>
							<td>30,000</td>
							<td>30,000</td>
							<td>30,000</td>
							<td>30,000</td>
							<td>30,000</td>
						</tr>
						<tr>
							<td class="first">회의참석수당</td>
							<td>8,286</td>
							<td>8,214</td>
							<td>9,700</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
						<tr>
							<td class="first">기타</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>						
						<tr>
							<td class="first">합계</td>
							<td>38,268</td>
							<td>38,214</td>
							<td>39,700</td>
							<td>30,000</td>
							<td>30,000</td>
							<td>30,000</td>
						</tr>
						</tbody>
					</table>

					
					<!--//표-->
					<!-- p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">
					공시기준 : ‘13년 결산기준 및 당해연도는 예산기준 <br />
					- 1년 만근 기준으로 작성<br />
					- 경영평가 상여금은 기획재정부 경영평가 결과에 따라 지급하며, 2013년 평가 전으로 2014년 성과급은 0으로 기입</p -->
					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">
					* 경영평가 성과급의 경우 당해연도 예산은 경영평가 결과 미확정으로 0으로 기재<br />
					※ 임원의 연중 퇴임, 취임 등으로 재직기간이 1년 미만인 경우, 1년을 기준으로 지급가능한 금액으로 환산 (재직기간이 중복되는 경우, 근무기간이 긴 임원 기준)</p>

					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">ㅇ 기본급(기본연봉)<br />
					 - 연봉제인 경우 : 연봉액<br />
					 - 연봉제가 아닌 경우 : 직급 및 호봉에 따라 차등 지급되는 기본 급여액</p>

					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">ㅇ 고정수당<br />
					 - 고정수당 : 실적과 무관하게 지급되는 수당<br />
					 (예시) 자격, 특수지근무, 특수업무, 가족, 해외근무수당 등</p>

					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">ㅇ 실적수당<br />
					- 실적수당 : 실적에 따라 차등 지급되는 수당<br />
					(예시) 시간외 근무, 야간근로, 휴일근무, 연차수당 등</p>

					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">ㅇ 급여성 복리후생비<br />
					- ‘인건비’에 속하지 않는 항목으로서 명칭 여하에 불구하고 개인이 자유롭게 처분할 수 있는 복리후생비적 성격의 비용<br />
					(예시) 자가운전보조금, 장기근속격려금, 건강진단비<br />
					(단, 실제 건강진단여부와 관련없이 금전으로 지급하는 경우) 등</p>

					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">ㅇ 경영평가성과급<br />
					- 공공기관의 운영에관한 법률 제48조의 경영실적평가 결과에따라 지급되는 성과급</p>

					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">ㅇ 기타 성과상여금<br />
					- 포상금, 생산장려금 등 실적에 따라 차등 지급되는 모든 성과상여금에서 경영평가성과급을 제외한 금액</p>
				</div>
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-03-31</td>
							<td class="contact_team"><strong>담당부서 : </strong>인재경영처 복지후생팀</td>
							<td class="contact_user"><strong>담당자 : </strong>장민호</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2769</td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="new_officer" style="margin-top:5px ;">
					
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-03-31</td>
							<td class="contact_team"><strong>담당부서 : </strong>기획조정처 기획관리팀</td>
							<td class="contact_user"><strong>담당자 : </strong>이상영</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2209</td>
						</tr>
					</tbody>
					</table>
				</div><!-- new_officer end -->				
				<div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div>
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>