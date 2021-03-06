<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","09");
	application.setAttribute("gNavMenuDepth4","23");
//	application.setAttribute("gNavMenuDepth3","03");
//	application.setAttribute("gNavMenuDepth4","05");	
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
					&gt; <span>주요사업 및 경영성과</span>
                    &gt; <span class="locanow">사채원부</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-10-23 수정] :: 작성자: 장정인 -->
				<!--[2017-01-13 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_3_new.gif" alt="주요사업 및 경영성과" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
                	<h4><img src="/images/management/sub02_2_2_12_ta1.gif" alt="사채원부"/></h4>
					<!--표-->
					<table class="chart2" summary="한국석유공사 사채원부를 확인할 수 있습니다.">
						<caption>한국석유공사 사채원부</caption>
						<colgroup>
						<col width="180px" />
						<col width="130px" />
						<col width="130px" />
						<col width="130px" />
						<col width="130px" />
						</colgroup>
						<thead>
							<tr>
                                <th scope="col" class="first">구분</th>
								<th scope="col">발행일</th>
								<th scope="col">만기일</th>
								<th scope="col">금액</th>
								<th scope="col">이자율</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td class="first">'11 1차 사모사채</td>
								<td>'11.2.8</td>
								<td>'21.2.8</td>
								<td>HKD500,000,000</td>
								<td>4.380%</td>
							</tr>
							<!--tr>
								<td class="first">'11 2차 사모사채</td>
								<td>'11.2.15</td>
								<td>'16.2.15</td>
								<td>HKD780,000,000</td>
								<td>3.40%</td>
							</tr>
							<tr>
								<td class="first">'11 3차 사모사채</td>
								<td>'11.2.16</td>
								<td>'16.2.16</td>
								<td>SGD100,000,000</td>
								<td>3.15%</td>
							</tr-->
							<tr>
								<td class="first">'11 5차 사모사채</td>
								<td>'11.3.4</td>
								<td>'21.3.4</td>
								<td>HKD390,000,000</td>
								<td>4.500%</td>
							</tr>
							<!-- tr>
								<td class="first">'11 CHF 채권 </td>
								<td>'11.5.12</td>
								<td>'16.5.12</td>
								<td>CHF325,000,000</td>
								<td>2.635%</td>
							</tr>
							<tr>
								<td class="first">'11 7차 사모사채</td>
								<td>'11.5.25</td>
								<td>'16.5.25</td>
								<td>EUR100,000,000</td>
								<td>3.95%</td>
							</tr-->
							<!-- tr>
								<td class="first">'11 국제채</td>
								<td>'11.10.27</td>
								<td>'16.10.27</td>
								<td>USD1,000,000,000</td>
								<td>4.00%</td>
							</tr-->
							<!--tr>
								<td class="first">'11 8차 사모사채</td>
								<td>'11.12.22</td>
								<td>'16.12.22</td>
								<td>HKD637,000,000</td>
								<td>3.20%</td>
							</tr>
							<tr>
								<td class="first">'11 1차 원화공모채</td>
								<td>'11.12.26</td>
								<td>'16.12.26</td>
								<td>KRW90,000,000,000</td>
								<td>3.89%</td>
							</tr-->							
							<tr>
								<td class="first">'12 1차 사모사채</td>
								<td>'12.2.10</td>
								<td>'22.2.10</td>
								<td>HKD390,000,000</td>
								<td>3.950%</td>
							</tr>
							<tr>
								<td class="first">'12 CHF 채권</td>
								<td>'12.3.8</td>
								<td>'17.3.8</td>
								<td>CHF300,000,000</td>
								<td>1.875%</td>
							</tr>
							<tr>
								<td class="first">'12 2차 사모사채</td>
								<td>'12.3.28</td>
								<td>'22.3.28</td>
								<td>EUR50,000,000</td>
								<td>4.000%</td>
							</tr>
							<tr>
								<td class="first">'12 국제채</td>
								<td>'12.4.3</td>
								<td>'17.4.3</td>
								<td>USD1,000,000,000</td>
								<td>3.125%</td>
							</tr>
							<tr>
								<td class="first">'13 1차 사모사채</td>
								<td>'13.1.22</td>
								<td>'18.1.22</td>
								<td>HKD400,000,000</td>
								<td>1.800%</td>
							</tr>
							<tr>
								<td class="first">'13 2차 사모사채</td>
								<td>'13.1.22</td>
								<td>'23.1.24</td>
								<td>HKD400,000,000</td>
								<td>2.850%</td>
							</tr>	
							<tr>
								<td class="first">'13 3차 사모사채</td>
								<td>'13.1.29</td>
								<td>'18.1.29</td>
								<td>USD70,000,000</td>
								<td>1.973%</td>
							</tr>
							<tr>
								<td class="first">'13 4차 사모사채</td>
								<td>'13.2.4</td>
								<td>'23.2.4</td>
								<td>EUR37,000,000</td>
								<td>2.400%</td>
							</tr>
							<tr>
								<td class="first">'13 1차 해외FRN</td>
								<td>'13.6.7</td>
								<td>'18.6.7</td>
								<td>USD200,000,000</td>
								<td>3M Libor+0.80%</td>
							</tr>		
							<tr>
								<td class="first">'13 2차 해외FRN</td>
								<td>'13.6.7</td>
								<td>'18.6.7</td>
								<td>USD300,000,000</td>
								<td>3M Libor+1.00%</td>
							</tr>
							<tr>
								<td class="first">'12 5차 사모사채</td>
								<td>'13.6.24</td>
								<td>'25.6.24</td>
								<td>EUR60,000,000</td>
								<td>3.000%</td>
							</tr>		
							<tr>
								<td class="first">'12 6차 사모사채</td>
								<td>'13.7.3</td>
								<td>'23.7.3</td>
								<td>EUR50,000,000</td>
								<td>3.090%</td>
							</tr>		
							<tr>
								<td class="first">'12 7차 사모사채</td>
								<td>'13.7.3</td>
								<td>'18.7.3</td>
								<td>AUD55,000,000</td>
								<td>AUD 3M BBSW + 1.50%</td>
							</tr>
							<tr>
							  <td class="first">'13 3차 해외FRN</td>
							  <td>'13.7.18</td>
							  <td>'18.7.18</td>
							  <td>USD330,000,000</td>
							  <td>3M Libor+1.20%</td>
						  </tr>
							<tr>
							  <td class="first">'13 CHF채권</td>
							  <td>'13.7.29</td>
							  <td>'18.11.29</td>
							  <td>CHF240,000,000</td>
							  <td>1.625%</td>
						  </tr>				
							<tr>
							  <td class="first">'14 1차 국제채(1)</td>
							  <td>'14.1.23</td>
							  <td>'19.1.23</td>
							  <td>USD500,000,000</td>
							  <td>2.750%</td>
						  </tr>
							<tr>
							  <td class="first">'14 1차 국제채(2)</td>
							  <td>'14.1.23</td>
							  <td>'24.1.23</td>
							  <td>USD500,000,000</td>
							  <td>4.000%</td>
						  </tr>	
						  <tr>
							  <td class="first">'14 2차 국제채(1)</td>
							  <td>'14.7.10</td>
							  <td>'19.1.23</td>
							  <td>USD250,000,000</td>
							  <td>2.750%</td>
						  </tr>
						  <tr>
							  <td class="first">'14 2차 국제채(2)</td>
							  <td>'14.7.10</td>
							  <td>'24.7.10</td>
							  <td>USD550,000,000</td>
							  <td>3.250%</td>
						  </tr>
						  
						  <tr>
							  <td class="first">'14 AUD 채권(1)</td>
							  <td>'14.10.8</td>
							  <td>'19.10.8</td>
							  <td>AUD225,000,000</td>
							  <td>AUD 3M BBSW + 1.08%</td>
						  </tr>
						  <tr>
							  <td class="first">'14 AUD 채권(2)</td>
							  <td>'14.10.8</td>
							  <td>'19.10.8</td>
							  <td>AUD125,000,000</td>
							  <td>4.250%</td>
						  </tr>

						   <tr>
							  <td class="first">'14년 1차 해외FRN</td>
							  <td>'14.11.12</td>
							  <td>'17.11.10</td>
							  <td>USD 100,000,000</td>
							  <td>3M Libor+0.35%</td>
						  </tr>
						   <tr>
							  <td class="first">'15년 1차 사모사채</td>
							  <td>'15.01.16</td>
							  <td>'18.01.16</td>
							  <td>USD 50,000,000</td>
							  <td>3M Libor+0.60%</td>
						  </tr>
						   <tr>
							  <td class="first">'15년 2차 사모사채</td>
							  <td>'15.01.21</td>
							  <td>'27.01.21</td>
							  <td>USD 50,000,000</td>
							  <td>3.100%</td>
						  </tr>
						   <tr>
							  <td class="first">'15년 3차 사모사채</td>
							  <td>'15.01.21</td>
							  <td>'27.01.21</td>
							  <td>USD 70,000,000</td>
							  <td>3.100%</td>
						  </tr>
						   <tr>
							  <td class="first">'15년 4차 사모사채</td>
							  <td>'15.01.28</td>
							  <td>'20.01.28</td>
							  <td>USD 50,000,000</td>
							  <td>2.393%</td>
						  </tr>
						   <tr>
							  <td class="first">'15년 5차 사모사채</td>
							  <td>'15.01.29</td>
							  <td>'20.01.29</td>
							  <td>HKD 310,000,000</td>
							  <td>2.180%</td>
						  </tr>

						  <tr>
							  <td class="first">'15 1차 국내FRN</td>
							  <td>'15.02.02</td>
							  <td>'18.02.02</td>
							  <td>USD250,000,000</td>
							  <td>3M Libor+0.70%</td>
						  </tr>
						  <tr>
							  <td class="first">'15 1차 원화채권</td>
							  <td>'15.03.16</td>
							  <td>'20.03.16</td>
							  <td>KRW100,000,000,000</td>
							  <td>2.110%</td>
						  </tr>
						  <tr>
							  <td class="first">'15 6차 사모사채</td>
							  <td>'15.03.19</td>
							  <td>'25.03.19</td>
							  <td>USD90,000,000</td>
							  <td>2.990%</td>
						  </tr>
						  <tr>
							  <td class="first">'15 7차 사모사채</td>
							  <td>'15.03.19</td>
							  <td>'30.03.19</td>
							  <td>USD85,000,000</td>
							  <td>3.210%</td>
						  </tr>
						  <tr>
							  <td class="first">'15 2차 원화채권</td>
							  <td>'15.04.23</td>
							  <td>'20.04.23</td>
							  <td>KRW50,000,000,000</td>
							  <td>1.990%</td>
						  </tr>
						  <tr>
							  <td class="first">'15 8차 사모사채</td>
							  <td>'15.04.29</td>
							  <td>'25.04.29</td>
							  <td>USD65,000,000</td>
							  <td>2.818%</td>
						  </tr>
						  <tr>
							  <td class="first">'15 9차 사모사채</td>
							  <td>'15.04.29</td>
							  <td>'30.04.29</td>
							  <td>USD60,000,000</td>
							  <td>3.020%</td>
						  </tr>
						  <tr>
							  <td class="first">'15 3차 원화채권</td>
							  <td>'15.08.26</td>
							  <td>'20.08.26</td>
							  <td>KRW150,000,000,000</td>
							  <td>2.030%</td>
						  </tr>

						  <tr>
								<td class="first">'15 1차 국제채(1)</td>
								<td>'15.10.01</td>
								<td>'25.10.01</td>
								<td>USD600,000,000</td>
								<td>3.250%</td>
							</tr>

							<tr>
								<td class="first">'15 10차 사모사채</td>
								<td>'15.11.10</td>
								<td>'30.11.10</td>
								<td>USD100,000,000</td>
								<td>3.220%</td>
							</tr>
							
							<tr>
								<td class="first">'16년 AUD채권</td>
								<td>'16.02.05</td>
								<td>'19.02.05</td>
								<td>AUD325,000,000</td>
								<td>AUD 3M BBSW + 1.28%</td>
							</tr>
							
							<tr>
								<td class="first">'16 1차 국제채(1)</td>
								<td>'16.04.14</td>
								<td>'21.04.14</td>
								<td>USD500,000,000</td>
								<td>2.125%</td>
							</tr>
							
							<tr>
								<td class="first">'16 1차 국제채(2)</td>
								<td>'16.04.14</td>
								<td>'26.04.14</td>
								<td>USD500,000,000</td>
								<td>2.625%</td>
							</tr>
							
							<tr>
								<td class="first">'16 2차 국제채(1)</td>
								<td>'16.10.24</td>
								<td>'21.10.24</td>
								<td>USD350,000,000</td>
								<td>2.000%</td>
							</tr>
							
							<tr>
								<td class="first">'16 2차 국제채(2)</td>
								<td>'16.10.24</td>
								<td>'26.10.24</td>
								<td>USD650,000,000</td>
								<td>2.500%</td>
							</tr>


						</tbody>
					</table>
					<!--//표-->
				</div>
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-12-31 </td>
							<td class="contact_team"><strong>담당부서 : </strong>재무처 자금팀</td>
							<td class="contact_user"><strong>담당자 : </strong>도희철</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2425</td>
						</tr>
					</tbody>
					</table>
				</div><!-- new_officer end -->						
				<!--div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div-->					  
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>