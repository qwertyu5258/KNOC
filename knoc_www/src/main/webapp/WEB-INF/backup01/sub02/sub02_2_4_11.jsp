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
	application.setAttribute("gNavMenuDepth4","03");
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
                    &gt; <span class="locanow">인원현황</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_4.gif" alt="인적자원현황" /></h3>
				</div>
				<!--시작-->
                 <div class="officer">
		          <h4><img src="/images/management/sub02_2_4_11.gif" alt="임직원수"/></h4>
		          <!--표-->
                  <span>(단위 : 명)</span>
                  <table class="chart2" summary="연도별 인원 현황을 확인할 수 있습니다.">
                    <caption>
                      연도별 인원 현황
                    </caption>
                    <col width="11%" />
                    <col width="11%" />
                    <col width="11%" />
                    <col width="11%" />
                    <col width="11%" />
                    <col width="11%" />
                    <col width="11%" />
					<col width="11%" />
					<col width="*" />
                    <thead>
                      <tr>
                        <th scope="col" class="first" colspan="3">구분</th>
                        <th  scope="col">2011년</th>
                        <th  scope="col">2012년</th>
                        <th  scope="col">2013년</th>
                        <th  scope="col">2014년</th>
                        <th  scope="col">2015년</th>
                        <th  scope="col">2016년<br />1/4분기</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td rowspan="8" class="first" align="center"><strong>임원</strong></td>
						<td rowspan="2" align="center">기관장</td>
                        <td align="center">상임</td>
                        <td align="right" width="82">1</td>
                        <td align="right" width="82">1</td>
                        <td align="right" width="91">1</td>
                        <td align="right" width="91">1</td>
                        <td align="right" width="91">1</td>
                        <td align="right" width="91">1</td>
                      </tr>
                      <tr>
                        <td>비상임</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                      </tr>
                      <tr>
                        <td rowspan="2">이사</td>
                        <td>상임</td>
                        <td align="right" width="82">6</td>
                        <td align="right" width="82">6</td>
                        <td align="right" width="91">6</td>
                        <td align="right" width="91">6</td>
                        <td align="right" width="91">6</td>
                        <td align="right" width="91">6</td>
                      </tr>
                      <tr>
                        <td>비상임</td>
                        <td align="right" width="82">7</td>
                        <td align="right" width="82">7</td>
                        <td align="right" width="91">7</td>
                        <td align="right" width="91">7</td>
                        <td align="right" width="91">7</td>
                        <td align="right" width="91">7</td>
                      </tr>
                      <tr>
                        <td rowspan="2">감사</td>
                        <td>상임</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                      </tr>
                      <tr>
                        <td>비상임</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                      </tr>
                      <tr>
                        <td colspan="2">기타</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">0</td>
                      </tr>
                      <tr>
                        <td colspan="2">상임임원계(A)</td>
                        <td align="right" width="82">7</td>
                        <td align="right" width="82">7</td>
                        <td align="right" width="91">7</td>
                        <td align="right" width="91">7</td>
                        <td align="right" width="91">7</td>
                        <td align="right" width="91">7</td>
                      </tr>
                      <tr>
                        <td rowspan="4" class="first"><strong>정규직</strong></td>
						 <td colspan="2">정원(B)</td>
                        <td align="right" width="82">1,286</td>
                        <td align="right" width="82">1,342</td>
                        <td align="right" width="91">1,404</td>
                        <td align="right" width="91">1,466</td>
                        <td align="right" width="91">1,532</td>
                        <td align="right" width="91">1,532</td>
                      </tr>
                      <tr>
                        <td rowspan="3">현원</td>
                        <td>계</td>
                        <td width="82" align="right">1286.5</td>
                        <td width="82" align="right">1338.125</td>
                        <td width="91" align="right">1327.25</td>
                        <td width="91" align="right">1430.875</td>
                        <td width="91" align="right">1384.75</td>
                        <td width="91" align="right">1352.875</td>
                      </tr>
                      <tr>
                        <td>전일제</td>
                        <td width="82" align="right">1284</td>
                        <td width="82" align="right">1334</td>
                        <td width="91" align="right">1322</td>
                        <td width="91" align="right">1422</td>
                        <td width="91" align="right">1380</td>
                        <td width="91" align="right">1348</td>
                      </tr>
                      <tr>
                        <td>단시간</td>
                        <td width="82" align="right">2.5</td>
                        <td width="82" align="right">4.125</td>
                        <td width="91" align="right">5.25</td>
                        <td width="91" align="right">8.875</td>
                        <td width="91" align="right">4.75</td>
                        <td width="91" align="right">4.875</td>
                      </tr>
                      
                      
                      <tr>
                        <td rowspan="4" class="first"><strong>무기<br />계약직</strong></td>
						 <td colspan="2">정원(C)</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="82">0</td>
                        <td align="right" width="91">0</td>
                        <td align="right" width="91">22</td>
                        <td align="right" width="91">22</td>
                        <td align="right" width="91">46</td>
                      </tr>
                      <tr>
                        <td rowspan="3">현원</td>
                        <td>계</td>
                        <td width="82" align="right">19.5</td>
                        <td width="82" align="right">18.5</td>
                        <td width="91" align="right">19.5</td>
                        <td width="91" align="right">14</td>
                        <td width="91" align="right">14</td>
                        <td width="91" align="right">11</td>
                      </tr>
                      <tr>
                        <td>전일제</td>
                        <td width="82" align="right">17</td>
                        <td width="82" align="right">16</td>
                        <td width="91" align="right">17</td>
                        <td width="91" align="right">14</td>
                        <td width="91" align="right">14</td>
                        <td width="91" align="right">11</td>
                      </tr>
                      <tr>
                        <td>단시간</td>
                        <td width="82" align="right">2.5</td>
                        <td width="82" align="right">2.5</td>
                        <td width="91" align="right">2.5</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                      </tr>
                      
                      <tr>
                        <td rowspan="4" class="first"><strong>비정규직</strong></td>
						 <td rowspan="2">기간제</td>
                         <td>전일제</td>
                        <td align="right" width="82">11</td>
                        <td align="right" width="82">7</td>
                        <td align="right" width="91">6</td>
                        <td align="right" width="91">3</td>
                        <td align="right" width="91">35</td>
                        <td align="right" width="91">49</td>
                      </tr>
                      <tr>
                        <td>단시간</td>
                        <td width="82" align="right">0.5</td>
                        <td width="82" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                      </tr>
                      <tr>
                        <td colspan="2">기타</td>
                        <td width="82" align="right">0</td>
                        <td width="82" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                      </tr>
                      <tr>
                        <td colspan="2">비정규직 계</td>
                        <td width="82" align="right">11.5</td>
                        <td width="82" align="right">7</td>
                        <td width="91" align="right">6</td>
                        <td width="91" align="right">3</td>
                        <td width="91" align="right">35</td>
                        <td width="91" align="right">49</td>
                      </tr>
                     
                      
                      
                      
                      
                      <tr>
                        <td rowspan="4" class="first"><strong>소속외인력</strong></td>
                        <td colspan="2" class="first">파견</td>
                        <td width="82" align="right">53</td>
                        <td width="82" align="right">58</td>
                        <td width="91" align="right">61</td>
                        <td width="91" align="right">102</td>
                        <td width="91" align="right">93</td>
                        <td width="91" align="right">92</td>
                      </tr>
                      <tr>
                        <td colspan="2" class="first">용역</td>
                        <td width="82" align="right">403</td>
                        <td width="82" align="right">408</td>
                        <td width="91" align="right">408</td>
                        <td width="91" align="right">461</td>
                        <td width="91" align="right">419</td>
                        <td width="91" align="right">403</td>
                      </tr>
                      <tr>
                        <td colspan="2" class="first">사내하도급</td>
                        <td width="82" align="right">0</td>
                        <td width="82" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                        <td width="91" align="right">0</td>
                      </tr>
                      <tr>
                        <td colspan="2" class="first">소식외인력 계</td>
                        <td width="82" align="right">456</td>
                        <td width="82" align="right">466</td>
                        <td width="91" align="right">469</td>
                        <td width="91" align="right">563</td>
                        <td width="91" align="right">512</td>
                        <td width="91" align="right">495</td>
                      </tr>
                      <tr class="tdgray">
                        <td colspan="3" class="first"><strong>임직원 총계(A+B+C)</strong></td>
                        <td align="right">1,293</td>
                        <td align="right">1,349</td>
                        <td align="right">1,411</td>
                        <td align="right">1,495</td>
                        <td align="right">1,561</td>
                        <td align="right">1,585</td>
                      </tr>
                      <tr class="tdgray">
                        <td colspan="3" class="first"><strong>여성현원</strong></td>
                        <td align="right">213.5</td>
                        <td align="right">241.125</td>
                        <td align="right">237.75</td>
                        <td align="right">206.125</td>
                        <td align="right">255</td>
                        <td align="right">253.875</td>
                      </tr>
                      <tr class="tdgray">
                        <td rowspan="2" class="first"><strong>임금피크제<br />별도정원</strong></td>
                        <td colspan="2" class="first">정규직</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                      </tr>
                      <tr class="tdgray">
                        <td colspan="2" class="first">무기계약직</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                        <td align="right">0</td>
                      </tr>
                    </tbody>
                  </table>

                    <p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">
                   	* 알리오 기준과 동일(‘16년 3월말 기준)
                   </p>


		          <!--//표-->
                </div>
                
				<div class="officer">
					<h4><img src="/images/management/sub02_2_4_1.gif" alt="직급별인원수" /></h4>
					<!--표-->
					 <span>(단위 : 명)</span>
                    <table class="chart2" summary="직급별인원수를 확인할 수 있습니다.">
                      <caption>
                        직급별인원수 현황
                      </caption>
                      <colgroup>
                      <col width="80px" />
                      <col width="*" />
                      <col width="80px" />
                      <col width="80px" />
                      <col width="80px" />
                      </colgroup>
                      <thead>
                        <tr>
                          <th scope="col" rowspan="2" class="first">구분</th>
                           <th scope="col" rowspan="2"  >직제상 정원</th>
                          <th colspan="3" scope="col" >현원</th>
                        </tr>
                        <tr>
                          <th>현원 계</th>
                          <th>남성</th>
                          <th>여성</th>
                        </tr>
                      </thead>
                      <tbody>

                        <tr>
                          <td class="first">상임임원</td>
                          <td>7</td>
                          <td>6</td>
                          <td>6</td>
                          <td>0</td>
                        </tr>
                        <tr>
                          <td class="first">1급</td>
                          <td>36</td>
                          <td>22</td>
                          <td>22</td>
                          <td>0</td>
                        </tr>
                        <tr>
                          <td class="first">2급</td>
                          <td>83</td>
                          <td>73</td>
                          <td>71</td>
                          <td>2</td>
                        </tr>
                        <tr>
                          <td class="first">3급</td>
                          <td>167</td>
                          <td>768</td>
                          <td>164</td>
                          <td>4</td>
                        </tr>
                        <tr>
                          <td class="first">4급</td>
                          <td>431</td>
                          <td>427</td>
                          <td>371</td>
                          <td>56</td>
                        </tr>
                        <tr>
                          <td class="first">5급</td>
                          <td>424</td>
                          <td>441</td>
                          <td>335</td>
                          <td>106</td>
                        </tr>
                        <tr>
                          <td class="first">6급</td>
                          <td>181</td>
                          <td>161.875</td>
                          <td>106</td>
                          <td>55.875</td>
                        </tr>
                        <tr>
                          <td class="first">7급</td>
                          <td>210</td>
                          <td>37.75</td>
                          <td>21</td>
                          <td>16.75</td>
                        </tr>
                        <tr>
                          <td class="first">8급</td>
                          <td>-</td>
                          <td>22.25</td>
                          <td>19</td>
                          <td>3.25</td>
                        </tr>
                        <tr>
                          <td class="first">무기계약직</td>
                          <td>46</td>
                          <td>11</td>
                          <td>1</td>
                          <td>10</td>
                        </tr>
                        <tr>
                          <td class="first">총계</td>
                          <td>1,585</td>
                          <td>1,369.88</td>
                          <td>1,116</td>
                          <td>253.88</td>
                        </tr>
                      </tbody>
                    </table>
                      <p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">
                     * 알리오 기준과 동일(‘16년 3월말 기준)<br />
                     </p>
					 <br />

					 

				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-03-31</td>
						<td class="contact_team"><strong>담당부서 : </strong>인재경영처 인사팀</td>
						<td class="contact_user"><strong>담당자 : </strong>홍아람</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2714</td>
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