<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth5","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<%@include file="/include/comheader.jsp"%>


<!--// subtopNavi: start //-->
<%@include file="/include/subtopnavi_new.jsp"%>
	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
			  <%@include file="/include/subtop_03.jsp"%>
			  <!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>사업소개</span>
                    &gt; <span>에특회계
</span>
                    &gt; <span class="locanow">세출</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_7_4.gif" alt="세출" /></h3>
				</div>
				<!--시작-->
                 <div class="business2">
                	<h5 class="mT0">구분</h5>
                    <ul>
					<li>투자계정과 융자계정으로 구분하여, 에너지 및 자원관련 사업에 보조, 출자, 융자, 유관기관 출연 등에 사용</li>
					</ul>
                    <h5>세출의 주요항목</h5>
                    <table  class="chart1" summary="세출의 주요항목을 투자계정, 융자 및 유가 완충계정별로 확인할 수 있습니다.">
					<caption>세출의 주요항목</caption>
					<col width="33%" />
					<col width="33%" />
					<col width="34%" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					<th scope="col">세출</th>
					<th scope="col">사업내역</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<th scope="row" class="first">투자계정</th>
					<td>- 에너지및자원정책<br />- 에너지안전관리<br />
					- 국내외 자원개발<br />
					- 에너지 수급안정<br />
					- 산업융합원천기술확보<br />
					- 신시장 창출<br />
					- 인프라 조성<br />
					- 내부거래지출</td>
					<td>- 에너지이용합리화, 에너지자원기술개발, 기후변화협약 대응 등<br />
					- 가스안전관리사업<br />
					- 국내외유전개발, 광물자원개발, 신재생에너지개발사업 등<br />
					- 석유비축, 가스안전공급, 석탄수급안정사업 등<br />
					- 신재생에너지 융합 원천기술 개발<br />
					- 글로벌 전문 기술에너지<br />
					- 에너지 인력 양성, 에너지 자원정책 연구<br />
					- 융자계정전출금</td>
					</tr> 
					<tr>
					<th scope="row" class="first">융자계정</th>
					<td>- 석유공사융자<br />
					- 광물자원공사융자<br />
					- 광해관리공단융자<br />
					- 에너지관리공단융자<br />
					- 가스안전공사융자<br />
					- 공자기금 원리금상환</td>
					<td>- 유전개발, 도시가스공급배관건설 등<br />
					- 해외자원개발 등<br />
					- 대체산업창원지원<br />
					- 에너지이용합리화<br />
					- 가스안전관리 신재생에너지 보급<br />
					- 차입금 및 예수금 원리금상환<br />
					- 투자계정전출금			
					</td>
					</tr> 
					</tbody>
					</table>
                    
                    <h5>세출형태별</h5>
                    <ul>
					<li><strong>민간에 대한 보조금 집행절차</strong>
                    <div><img src="../images/business/imgin1_sub03_7_4.gif" alt="민간에 대한 보조금 집행절차" />
						<div class="blindtext">
							<p>보조사업 예산제시(지식경제부&rarr;보조사업자)</p>
							<p>보조사업 계획수립후 보조금 교부신청(보조사업자&rarr;지식경제부) &rarr; 보조사업 추진상황 보고 (보조사업자&rarr;지식경제부)</p>
							<div>
								<p>보조금 교부 결정 및 통지 (지식경제부&rarr;보조사업자) &rarr; 보조사업 추진상황 보고 (보조사업자&rarr;지식경제부)</p>
								<p>개산급 교부신청 (보조사업자&rarr;지식경제부) &rarr; 보조사업 추진상황 보고 (보조사업자&rarr;지식경제부) <br/>
								&rarr; 개산급/정산급 지급요청 (지식경제부&rarr;석유공사) &rarr; 보조금 지급 (석유공사 &rarr; 보조사업자)</p>
								<p>보조사업 실적보고 (보조사업자&rarr;지식경제부) &rarr; 개산급/정산급 지급요청 (지식경제부&rarr;석유공사) &rarr; 보조금 지급 (석유공사 &rarr; 보조사업자)</p>
								<p>↓</p>
								<p>보조사업교부결정 변경 및 취소(지식경제부, 보조사업자) &rarr; 개산급/정산급 지급요청 (지식경제부&rarr;석유공사) &rarr; 보조금 지급 (석유공사 &rarr; 보조사업자)</p>
							</div>
							<p>↓</p>
							<p>보조금 교부확정 (정산)및 통지 (지식경제부&rarr;보조사업자) &rarr; 개산급/정산급 지급요청 (지식경제부&rarr;석유공사) &rarr; 보조금 지급 (석유공사 &rarr; 보조사업자)</p>	
						</div>
					</div></li>
                    <li class="mT10"><strong>융자 및 대출업무</strong>
                    <div><img src="../images/business/imgin2_sub03_7_4.gif" alt="융자 및 대출업무" />
						<div class="blindtext">
							<p>융자, 대출</p>
							<p>지식경제부 ← 융자이자율 및 융자기간 협의 &rarr; 기획재정부</p>
							<ul>
							<li>석유공사 - 금융기관 &rarr; 실수요자 or<br/>
							석유공사 &rarr; 실수요자</li>
							<li>광물자원공사 &rarr; 실수요자</li>
							<li>석공 &rarr; 실수요자</li>
							<li>에관공 - 금융기관 &rarr; 실수요자 or<br/>
							에관공  &rarr; 실수요자</li>
							<li>가스안전공사 - 금융기관 &rarr; 실수요자</li>
							<li>광해관리공단 - 금융기관 &rarr; 실수요자</li>
							</ul>
							<p>융자약정체결 (지식경제부 &rarr; 융자대상기관) , 대출약정체결 (융자대상기관 &rarr; 금융기관 &rarr; 실수요자)</p>	
						</div>
					</div></li>
                    </ul>
                    <h5>세출실적 및 계획(자금사용)</h5>
                    <p class="rtxt mT0">[단위 : 억원]</p>
                    <table class="chart3" summary="세출실적 및 계획을 연도별로 확인할 수 있습니다.">
					
					<caption>연도별 세출실적 및 계획</caption>
					<col width="10px" />
					<col width="110px" />
					<col width="35px" />
					<col width="35px" />
					<col width="35px" />
					<col width="35px" />
					<col width="35px" />
					<col width="35px" />
					<col width="35px" />
					<col width="35px" />
					<col width="35px" />
					<col width="35px" />
					<col width="35px" />
					<thead>
					<tr>
					<th scope="col" colspan="2" class="first">구분</th>
					<th scope="col">'01실적</th>
					<th scope="col">'02실적</th>
					<th scope="col">'03실적</th>
					<th scope="col">'04실적</th>
					<th scope="col">'05실적</th>
					<th scope="col">'06실적</th>
					<th scope="col">'07실적</th>
					<th scope="col">'08실적</th>
					<th scope="col">'09실적</th>
					<th scope="col">'10실적</th>
					<th scope="col">'11계획</th>
					</tr>
					</thead>
					<tfoot>
						<tr class="tdpink">
						<th scope="row" class="first sum" colspan="2"><strong>합 계</strong></th>
						<td class="sum"><strong>23,086</strong></td>
						<td class="sum"><strong>22,309</strong></td>
						<td class="sum"><strong>23,572</strong></td>
						<td class="sum"><strong>22,140</strong></td>
						<td class="sum"><strong>25,383</strong></td>
						<td class="sum"><strong>30,074</strong></td>
						<td class="sum"><strong>38,062</strong></td>
						<td class="sum"><strong>55,343</strong></td>
						<td class="sum"><strong>36,902</strong></td>
						<td class="sum"><strong>43,820</strong></td>
						<td class="sum"><strong>41,032</strong></td>
						</tr>
					</tfoot>
					<tbody>
					<tr>
					<th scope="rowgroup" rowspan="12" class="first bright">투 자 계 정</th>
					<th scope="row" class="tdleft">에너지및자원정책</th>
					<td>1,003</td>
					<td>1,030</td>
					<td>1,285</td>
					<td>1,166</td>
					<td>1,396</td>
					<td>1,909</td>
					<td>2,887</td>
					<td>2,882</td>
					<td>2,901</td>
					<td>3,622</td>
					<td>1,253</td>
					</tr> 
					<tr>
					<th scope="row" class="tdleft">에너지안전관리</th>
					<td>342</td>
					<td>333</td>
					<td>346</td>
					<td>339</td>
					<td>381</td>
					<td>403</td>
					<td>396</td>
					<td>336</td>
					<td>247</td>
					<td>206</td>
					<td>410</td>
					</tr> 
					<tr>
					<th scope="row" class="tdleft">국내외자원개발</th>
					<td>695</td>
					<td>665</td>
					<td>1,109</td>
					<td>1,892</td>
					<td>2,730</td>
					<td>3,325</td>
					<td>5,649</td>
					<td>15,244</td>
					<td>8,323</td>
					<td>15,787</td>
					<td>11,428</td>
					</tr> 
					<tr>
					<th scope="row" class="tdleft">에너지수급안정</th>
					<td>8,522</td>
					<td>7,692</td>
					<td>8,007</td>
					<td>7,058</td>
					<td>7,147</td>
					<td>8,834</td>
					<td>9,680</td>
					<td>18,932</td>
					<td>7,951</td>
					<td>7,768</td>
					<td>4,936</td>
					</tr>
					
					<tr>
					<th scope="row" class="tdleft">산업융합원천기술학부</th>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>2,553</td>
					</tr>
					
					<tr>
					<th scope="row" class="tdleft">신시장창출</th>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>195</td>
					</tr>
					
					<tr>
					<th scope="row" class="tdleft">인프라조성</th>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>459</td>
					</tr>
					
					<tr>
					<th scope="row" class="tdleft">예비비</th>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>1,015</td>
					</tr>
					
					<tr>
					<th scope="row" class="tdleft">계정간거래</th>
					<td>1,520</td>
					<td>1,000</td>
					<td>1,319</td>
					<td>-</td>
					<td>1,533</td>
					<td>1,583</td>
					<td>2,786</td>
					<td>2,164</td>
					<td>1,617</td>
					<td>31</td>
					<td>-</td>
					</tr>
					<tr>
					<th scope="row" class="tdleft">타부처</th>
					<td>391</td>
					<td>1,242</td>
					<td>1,550</td>
					<td>2,633</td>
					<td>3,418</td>
					<td>3,690</td>
					<td>4,427</td>
					<td>3,022</td>
					<td>3,392</td>
					<td>3,094</td>
					<td>3,826</td>
					</tr>
					<tr>
					<th scope="row" class="tdleft">출연기관지원</th>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>902</td>
					<td>1,493</td>
					<td>1,694</td>
					<td>1,737</td>

					</tr>
					<tr class="tdblue">
					<th scope="row" class="tdleft"><strong>소 계</strong></th>
					<td><strong>12,473</strong></td>
					<td><strong>11,962</strong></td>
					<td><strong>13,617</strong></td>
					<td><strong>13,088</strong></td>
					<td><strong>16,605</strong></td>
					<td><strong>19,745</strong></td>
					<td><strong>25,825</strong></td>
					<td><strong>43,482</strong></td>
					<td><strong>25,924</strong></td>
					<td><strong>32,203</strong></td>
					<td><strong>27,812</strong></td>

					</tr>
					<tr>
					<th scope="rowgroup" rowspan="9" class="first bright">융 자 계 정</th>
					<th scope="row" class="tdleft">한국광물자원공사</th>
					<td>725</td>
					<td>665</td>
					<td>720</td>
					<td>600</td>
					<td>500</td>
					<td>505</td>
					<td>684</td>
					<td>684</td>
					<td>684</td>
					<td>684</td>
					<td>684</td>

					</tr> 
					<tr>
					<th scope="row" class="tdleft">한국광해관리공단</th>
					<td>200</td>
					<td>160</td>
					<td>120</td>
					<td>96</td>
					<td>45</td>
					<td>100</td>
					<td>50</td>
					<td>50</td>
					<td>50</td>
					<td>47</td>
					<td>43</td>

					</tr> 
					<tr>
					<th scope="row" class="tdleft">에너지관리공단</th>
					<td>4,153</td>
					<td>5,222</td>
					<td>5,150</td>
					<td>5,198</td>
					<td>5,752</td>
					<td>6,920</td>
					<td>6,536</td>
					<td>7,000</td>
					<td>6,250</td>
					<td>5,831</td>
					<td>6,936</td>

					</tr> 
					<tr>
					<th scope="row" class="tdleft">한국가스안전공사</th>
					<td>479</td>
					<td>429</td>
					<td>410</td>
					<td>380</td>
					<td>380</td>
					<td>390</td>
					<td>364</td>
					<td>301</td>
					<td>230</td>
					<td>260</td>
					<td>384</td>

					</tr>
					<tr>
					<th scope="row" class="tdleft">한국석유공사</th>
					<td>4,956</td>
					<td>3,791</td>
					<td>3,355</td>
					<td>2,778</td>
					<td>2,101</td>
					<td>2,395</td>
					<td>3,736</td>
					<td>3,826</td>
					<td>3,764</td>
					<td>2,909</td>
					<td>2,957</td>

					</tr>
					<tr>
					<th scope="row" class="tdleft">유가완충/공자기금이자상환</th>
					<td>100</td>
					<td>80</td>
					<td>200</td>
					<td>-</td>
					<td>-</td>
					<td>19</td>
					<td>867</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>

					</tr>

					<tr>
					<th scope="row" class="tdleft">계정간거래</th>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>1,796</td>
					<td>2,049</td>

					</tr>
					<tr>
					<th scope="row" class="tdleft">타부처</th>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>90</td>
					<td>167</td>

					</tr>
					<tr class="tdblue">
					<th scope="row" class="tdleft"><strong>소 계</strong></th>
					<td><strong>10,613</strong></td>
					<td><strong>10,347</strong></td>
					<td><strong>9,955</strong></td>
					<td><strong>9,052</strong></td>
					<td><strong>8,778</strong></td>
					<td><strong>10,329</strong></td>
					<td><strong>12,237</strong></td>
					<td><strong>11,861</strong></td>
					<td><strong>10,978</strong></td>
					<td><strong>11,617</strong></td>
					<td><strong>13,220</strong></td>

					</tr>					
					<tr>
					<th scope="rowgroup" class="first bright" rowspan="2">참 고</th>
					<th scope="row" class="tdleft">석유비축사업</th>
					<td>3,664</td>
					<td>2,750</td>
					<td>2,945</td>
					<td>2,266</td>
					<td>2,145</td>
					<td>3,444</td>
					<td>3,999</td>
					<td>2,730</td>
					<td>2,252</td>
					<td>2,252</td>
					<td>1,250</td>

					</tr> 
					<tr>
					<th scope="row" class="tdleft">유전개발사업</th>
					<td>1,499</td>
					<td>1,815</td>
					<td>2,638</td>
					<td>2,558</td>
					<td>2,605</td>
					<td>3,833</td>
					<td>7,126</td>
					<td>13,231</td>
					<td>5,094</td>
					<td>1,2556</td>
					<td>7,100</td>
					</tr>
					</tbody>
					</table>
                </div>
				<!--//끝-->
		  </div>
		  
		  <div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>경영지원처 에특회계팀</td>
						<td><strong>연락처 : </strong>031-380-2402</td>
						<td><strong>관리일 : </strong>2015-09-30</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
		  
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>