<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","08");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>       
<%@include file="/include/sub08_auth.jsp"%> 
<%@include file="/include/comheader.jsp"%>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_08.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>이사회</span>
                    &gt; <span>이사회소개</span>
                    &gt; <span>이사회구성 및 기능</span>
                    &gt; <span class="locanow">이사회구성</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-29 표준코딩에 의한 수정] 작성자:장정인-->
				<div class="pagetle">
					<h3><img src="/images/directors/ttl_sub08_1_1.gif" alt="이사회구성 및 기능" /></h3>
				</div>
				<div class="director">
					<h4 class="mT0"><img src="../images/directors/1-1-1title.gif" alt="정원 및 임기" /></h4>
					<h5>정원 : 13명</h5>
					<ul>
					<li>사장을 포함한 상임이사의 수는 이사정수의 1/2 미만으로 함</li>
					<li>상임이사 : 6명, 비상임이사 : 7명</li>
					</ul>
					<h5> 임기</h5>
					<ul>
					<li>2007년 4월 1일부로 시행된 "공공기관의 운영에 관한 법률" 에 따라 사장의 임기는 3년, 기타 임원의 임기는 2년이며<br />1년 단위로연임 가능</li>
					</ul>
					<h4><img src="../images/directors/1-1-2title.gif" alt="임명절차" /></h4>
                	<div>
					<table  class="chart1" summary="임명절차를 확인할 수 있습니다.">
					<caption>임명절차</caption>
					<col width="60px" />
					<col width="100px" />
					<col width="540px" />	
					<thead>
					<tr>
					<th scope="col" class="first" colspan="2">구분</th>
					<th scope="col">임명절차</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<th scope="row" class="first" colspan="2">사장</th>
					<td>임원추천위원회 추천→공공기관운영위원회 심의→지경부장관제청→대통령 임명</td>
					</tr>
					<tr>
					<th scope="row" class="first" colspan="2">상임감사위원</th>
					<td>임원추천위원회 추천→공공기관운영위원회 심의→기획재정부장관제청→대통령 임명 </td>
					</tr>
					<tr>
					<th scope="rowgroup" class="first" rowspan="2">이사</th>
					<th scope="row" class="first3">상임이사</th>
					<td>사장 임명</td>
					</tr>
					<tr>
					<th scope="row" class="first3">비상임이사</th>
					<td>임원추천위원회 추천→공공기관운영위원회 심의→기획재정부장관임명 </td>
					</tr>
					</tbody>
					</table>
					</div>
					<h4><img src="../images/directors/1-1-3title.gif" alt="임원현황" /></h4>
					<h5>상임이사</h5>
					<div>
				
					<!--표-->
					<table  class="chart2" summary="한국석유공사 상임이사 현황을 직위, 성명, 생년월일, 임기, 학력, 주요경력별로 확인할 수 있습니다.">
						<caption>상임이사 현황</caption>
                    
						<colgroup>						
							<col width="100px" />
							<col width="60px" />
							<col width="60px" />
							<col width="80px" />
							<col width="170px" />
							<col width="240px" />
                   	
						</colgroup>	
						<thead>
							<tr>
								<th scope="col" class="first">직위</th>
								<th scope="col">성명</th>
								<th scope="col">생년월일</th>
								<th scope="col">임기</th>
								<th scope="col">학력</th>
								<th scope="col" class="alice">주요경력</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="first">理  事<br/>(상임)</td>
								<td class="tdcen">서문규<br/>(徐文奎)</td>
								<td>53.01.17</td>
								<td>2012.08.17 ~ 2015.08.16</td>
								<td  class="tdleft">- 보성고
								<br/>- 고려대 (불어불문학)</td>
								<td class="tdleft"><strong>사장</strong><BR />前) 한국석유공사 부사장 <br/>前) 한국석유공사 관리본부장
								</td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(상임)</td>
								<td>류갑영<br/> (柳甲永)</td>
								<td>53.12.24</td>
								<td>2013.01.12 ~ 2015.01.11</td>
								<td class="tdleft">- 부산상고
								  <br/>- 고려대 행정학과
								  <br/>- 밴더빌트대학원<br/><span>(경제학 석사)</span>
								</td>
								  <td class="tdleft"><strong>상임감사위원</strong><BR />前) 한국가스연맹 사무총장<br/>前) 총리실 규제개혁조정관실 총괄국장<br/>前) 총리실 경제조정관실 서기관
								</td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(상임)</td>
								<td>임홍근<br/>(林洪根) </td>
								<td>55.12.22</td>
								<td>2012.09.01 ~ 2013.08.31</td>
								<td class="tdleft">- 중앙고<br/>
								- 고려대 (지질학과)<br/>
								</td>
								<td class="tdleft"><strong>부사장</strong><BR />前) 대륙붕탐사처장<br/>前) 탐사사업처장<br/>前) 캐나다사무소장<br/>前) 신규탐사본부장
								</td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(상임)</td>
								<td>송병진<br/>(宋炳鎭)</td>
								<td>58.03.03 </td>
								<td>2012.11.01 ~ 2014.10.31</td>
								<td class="tdleft">- 안계종합고 <br/>- 영남대 (행정학과)<br/>- 경북대 경영대학원<br/><span>(경영학 석사)</span></td>
								<td class="tdleft"><strong>전략기획본부장</strong><BR />前) 신규사업처장<br/>前) E&P계획처장<br/>前) 기획조정실장 </td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(상임)</td>
								<td>김중현<br/>(金重賢)</td>
								<td>56.12.25</td>
								<td>2012.11.19 ~ 2014.11.18</td>
								<td class="tdleft" >- 휘문고<br/>- 국민대 (토목공학)<br/>- 연세대 산업대학원<br/><span>(토목공학 석사)</span></td>
								<td class="tdleft"><strong>경영관리본부장</strong><BR />前) 건설기술처장<br/>前) 건설처장<br/>前) 해외개발지원단장<br/>前) 비축시설처장</td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(상임) </td>
								<td>박재익<br/>(朴在翼)</td>
								<td>55.04.03</td>
								<td>2011.09.14 ~ 2013.09.13</td>
								<td class="tdleft">- 대구고 <br/>- 서울대 (중어중문학) <br/>- 고려대 국제대학원<br/><span>중어중문학(석사수료)</span></td>
								<td class="tdleft"><strong>비축사업본부장</strong><BR />前) 석유정보센터장<br/>前) 석유사업처장<br/>前) 곡성지사장</td>
							</tr>
							
							

						
						
						
						</tbody>
					</table>
					<!--//표-->
					</div>
					<h5>비상임이사</h5>
					<div>
					<table class="chart2" summary="한국석유공사 비상임이사 현황을 성명, 출생지, 생년월일, 임기, 학력, 주용경력별로 확인할 수 있습니다.">
						<caption>비상임이사 현황</caption>
						<colgroup>	
					
							<col width="100px" />
							<col width="60px" />
							<col width="60px" />
							<col width="80px" />
							<col width="170px" />
							<col width="240px" />
						</colgroup>	
					
						<thead>
							<tr>
								<th scope="col" class="first">직위</th>
								<th scope="col">성명</th>
								<th scope="col">생년월일</th>
								<th scope="col">임기</th>
								<th scope="col">학력</th>
								<th scope="col" class="alice">주요경력</th>
							</tr>
						</thead>
						<tbody>

						<tr>
								<td class="first">理  事<br/>(이사회의장)</td>
							   <td>김인철<br/>(金仁哲)</td>
								<td>48.10.22</td>
								<td>2011.10.24 ~ 2013.10.23</td>
								<td class="tdleft">- 배재고<br/>- 성균관대 (경제학) <br/>- 미국켄트주립대학원(경제학석사) <br/>- 미국시카고대학원
                                (국제경제학 박사) <br/></td>
								<td class="tdleft"><strong>성균관대학교 경제학과 교수</strong> <br/>前)인천발전연구원 원장<br/>前) KDI 선임연구위원<br /></td>
	                       	</tr>
														<tr>
								<td class="first">理  事<br/>(비상임)</td>
								<td>강선장<br/>(姜善章)<br/></td>
								<td>47.01.15</td>
								<td>2011.06.16 ~ 2013.06.15</td>
								<td class="tdleft">- 선인고 <br/>- 용인대 (태권도학)<br />- 한양대 교육대학원 <br /><span>(교육학석사)</span><br />- 한국체육대학원 <br /><span>(체육학박사)</span></td>
								<td class="tdleft">前) 경기도의회 문화,예결위 의원<br/>前) 한나라당 중앙위 선대위 전문<br />前) 체육위원회 위원장<br />前) 강원랜드 하이원 상임고문</td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(비상임)</td>
								<td>박주헌<br/>(朴周憲)<br/></td>
								<td>61.05.30</td>
								<td>2011.06.16 ~ 2013.06.15</td>
								<td class="tdleft">- 숭문고 <br/>- 연세대 (경제학)<br />- 연세대 대학원 <br /><span>(경제학석사)</span><br /> - 美위스콘신-메디슨대 <br /><span>대학원 (경제학박사)</span></td>
								<td class="tdleft"><strong>동덕여자대학교 경제학과 교수</strong><br />동덕여자대학교 기획처 처장<br />한국자원경제학회 편집위원<br />한국응용경제학회 편집간사<br /></td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(비상임)</td>
								<td>신호철<br/>(申豪澈)</td>
								<td>42.02.03</td>
								<td>2011.08.18 ~ 2013.08.17</td>
								<td class="tdleft">- 휘문고<br/>- 서울대 (행정학) <br/>- 서울대 행정대학원 (행정학석사)</td>
								<td class="tdleft"><strong>법무법인 아태 상임고문</strong> <br/>前) 한보에너지(주) 대표이사<br/>前) (주)온세통신 감사<br />前) 한국석유공사 런던/인도네시아 지사장/해외사업처장/석유사업처장</td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(비상임)</td>
								<td>정동락<br/>(鄭東洛)<br/></td>
								<td>46.01.13</td>
								<td>2011.10.24 ~ 2013.10.23</td>
								<td class="tdleft">- 배재고 <br/>- 고려대 (법학)<br /></td>
								<td class="tdleft">前)한국수력원자력 사장<br />민주평통 자문회의 자문위원<br />한국전력공사 비상임이사</td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(비상임)</td>
								<td>김재현<br/>(金在鉉)</td>
								<td>47.11.11</td>
								<td>2012.01.03 ~ 2014.01.02</td>
								<td class="tdleft">- 광주고<br/>- 서울대 (경제학) <br/>- 미국하버드케네디대학원(행정학석사) </td>
								<td class="tdleft">前) 산업자원부 섬유생활국장 <br/>前) 산업자원부 무역위원회 상임위원<br/>前) 산업자원부 기획관리실 실장<br/>前) 산업자원부 무역투자실 실장<br/>前) 생산성본부 회장<br/>前) 상사중재원 원장</td>
							</tr>
							<tr>
								<td class="first">理  事<br/>(비상임)</td>
								<td>윤종규<br/>(尹鍾奎)<br/></td>
								<td>48.05.22</td>
								<td>2012.08.13 ~ 2014.08.12</td>
								<td class="tdleft">- 공주고 <br/>- 성균관대 (신문방송학)</td>
								<td class="tdleft"><strong>연합뉴스TV 보도국 전문위원</strong><br/>前) 한중DCM 감사<br/>한국중공업 홍보실 이사<br/>동아일보 편집국 기자  </td>
							</tr>
						
						
						
						</tbody>
					</table>
					</div>
				<!-- new_officer -->
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 기획관리팀</td>
						<td class="contact_user"><strong>담당자 : </strong>이상영</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2209</td>
					</tr>
					</tbody>
					</table>
				</div>
				<!-- new_officer -->	
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>