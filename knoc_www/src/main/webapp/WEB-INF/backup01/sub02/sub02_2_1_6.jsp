<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","06");
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
					&gt; <span>일반현황</span>
					&gt; <span class="locanow">투자 및 출자현황</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_1.gif" alt="일반현황" /></h3>
				</div>
				<!--시작-->
				<div class="general">
					<h4><img src="/images/management/sub02_2_1_2_ta3.gif" alt="투자 및 출자현황" border="0"/></h4>
                    
                    <!-- 01 -->					
					<p class="rtxt">(단위 : 백만원)</p>

					<table summary="투자 및 출자현황에 대한 표로 법인명, 관계, 투자 및 출자 금액, 장부가액, 취득금액, 출자현태에 대한 정보를 제공합니다." class="chart2">
						<caption>투자 및 출자현황에 대한 표</caption>
						<colgroup>
						<col width="51%" />
						<col width="10%" />
						<col width="13%" />
						<col width="13%" />
						<col width="13%" />
						</colgroup>
						<thead>
						<tr>
							<th class="first" scope="col" rowspan="2">법인명</th>
							<th scope="col" rowspan="2">관계</th>
							<th scope="col" colspan="2">투자 및 출자금액</th>
							<th scope="col" rowspan="2">출자형태</th>
						</tr>
						<tr>
							<th scope="col">장부가액</th>
							<th scope="col">취득금액</th>
						</tr>						
						</thead>
						<tbody>
						<tr>
							<td class="first">ANKOR E &amp; P Holdings Corp.</td>
							<td>자회사<br></td>
							<td class="tdright">420,748</td>
							<td class="tdright">420,748</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">Dana Petroleum plc</td>
							<td>자회사<br></td>
							<td class="tdright">1,261,852</td>
							<td class="tdright">4,172,987</td>
							<td>현금출자,<br />현물출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Eagleford Corp.</td>
							<td>자회사<br></td>
							<td class="tdright">1,592,891</td>
							<td class="tdright">1,592,891</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">Harvest Operations Corp.</td>
							<td>자회사<br></td>
							<td class="tdright">330,945</td>
							<td class="tdright">4,342,196</td>
							<td>현금출자,<br />현물출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Kaz B.V.</td>
							<td>자회사<br></td>
							<td class="tdright">1,028,646</td>
							<td class="tdright">1,028,646</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Exploracao e Producao de Petro do Brasil Ltda</td>
							<td>자회사<br></td>
							<td class="tdright">1</td>
							<td class="tdright">1</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC NEMONE</td>
							<td>자회사<br></td>
							<td class="tdright">-</td>
							<td class="tdright">-</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC NEMTWO</td>
							<td>자회사<br></td>
							<td class="tdright">-</td>
							<td class="tdright">-</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Sumatra Ltd.</td>
							<td>자회사<br></td>
							<td class="tdright">-</td>
							<td class="tdright">-</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Yemen Ltd.</td>
							<td>자회사<br></td>
							<td class="tdright">-</td>
							<td class="tdright">-</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Trading Singapore Pte. Ltd.</td>
							<td>자회사<br></td>
							<td class="tdright">273</td>
							<td class="tdright">273</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Trading Corporation</td>
							<td>자회사</td>
							<td class="tdright">1,172</td>
							<td class="tdright">1,172</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">Kernhem B.V.</td>
							<td>출자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">11,975</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">Oilhub Korea Yeosu Co., Ltd.</td>
							<td>출자회사</td>
							<td class="tdright">39,016</td>
							<td class="tdright">39,622</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">ADA Oil LLP</td>
							<td>출자회사</td>
							<td class="tdright">2,012</td>
							<td class="tdright">20,569</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">Parallel Petroleum LLC</td>
							<td>출자회사</td>
							<td class="tdright">25,316</td>
							<td class="tdright">44,965</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Inam Ltd</td>
							<td>출자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">-</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Kamchatka Petroleum Ltd.</td>
							<td>자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">1</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KC karpovsky B.V.</td>
							<td>출자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">11</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Bazian Ltd.</td>
							<td>자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">-</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Nigerian West Oil Company Ltd.</td>
							<td>자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">70</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Nigerian East Oil Company Ltd.</td>
							<td>자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">70</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Aral Ltd.</td>
							<td>자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">-</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">Korea kamchatka Co. Ltd</td>
							<td>자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">7,965</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KC kazakh B.V</td>
							<td>출자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">265</td>
							<td>현금출자</td>
						</tr>						
						<tr>
							<td class="first">Offshore International Group</td>
							<td>자회사</td>
							<td class="tdright">419,099</td>
							<td class="tdright">748,015</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Ferghana Ltd.</td>
							<td>자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">1</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KNOC Ferghana2 Ltd.</td>
							<td>자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">-</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">KADOC Ltd.</td>
							<td>자회사</td>
							<td class="tdright">-</td>
							<td class="tdright">1</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">Korea Oil Terminal Co., Ltd.</td>
							<td>자회사</td>
							<td class="tdright">3,190</td>
							<td class="tdright">3,190</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">Deep Basin Partnership</td>
							<td>자회사</td>
							<td class="tdright">42,375</td>
							<td class="tdright">156,829</td>
							<td>현물출자</td>
						</tr>
						<tr>
							<td class="first">HKMS Partnership</td>
							<td>자회사</td>
							<td class="tdright">58,310</td>
							<td class="tdright">68,012</td>
							<td>현물출자</td>
						</tr>
						<tr>
							<td class="first">Yemen LNG Company Ltd</td>
							<td>출자회사</td>
							<td class="tdright">96,049</td>
							<td class="tdright">-</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">PETRO ONADO S.A.</td>
							<td>출자회사</td>
							<td class="tdright">19,230</td>
							<td class="tdright">19,230</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">한국마이크로닉㈜</td>
							<td>출자회사</td>
							<td class="tdright">897</td>
							<td class="tdright">897</td>
							<td>현금출자</td>
						</tr>
						<tr>
							<td class="first">EP Energy Corp</td>
							<td>출자회사</td>
							<td class="tdright">160,554</td>
							<td class="tdright">526,802</td>
							<td>현금출자,<br />현물출자</td>
						</tr>
						<tr>
							<td class="first">Faroe Petroleum plc</td>
							<td>출자회사</td>
							<td class="tdright">45,257</td>
							<td class="tdright">150,811</td>
							<td>현금출자</td>
						</tr>
						</tbody>
					</table>

					<p class="mT20" style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ;  color:#777 ;">※ '14년말 기준<br />※ 상세한 ‘투자 및 출자현황’은 ALIO 공공기관 경영정보 공개시스템을 참고바랍니다. <a href="http://www.alio.go.kr/pop/popup.do?p=pub_all&seq=C0214&yyyy=2015&quar=1#toc-31901
" target="_blank"><img src="/images/management/btn_alio_link.gif" alt="바로가기" style="vertical-align:middle;" /></a></p>
				</div>
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
						<tbody>
							<tr>
								<td class="write_day"><strong>작성기준일 : </strong>2016-05-24</td>
								<td class="contact_team"><strong>담당부서 : </strong>E&P총괄처 E&P총괄팀</td>
								<td class="contact_user"><strong>담당자 : </strong>주수현</td>
								<td class="contact_tel"><strong>연락처 : </strong>052-216-3217</td>
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