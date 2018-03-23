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
					&gt; <span>인적자원현황</span>
                    &gt; <span class="locanow">복리후생현황 </span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_4.gif" alt="인적자원현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_4_5.gif" alt="복리후생현황"/></h4>


        			<div class="offtxt3">
						<h5>2013년도 예산상 복리후생비 사용현황</h5>
         
					</div>


					<!--표-->
					<table class="chart2" summary="2012년도 한국석유공사 예산상 복리후생비 관련 내용을 확인할 수 있습니다.">
					
					<caption>한국석유공사 예산상 복리후생비</caption>
					<col width="150px" />
					<col width="350px" />
					<col width="200px" />
					<thead>
					<tr>
						<th scope="col" class="first">구분</th>
						<th scope="col">내역</th>
	                    <th scope="col">금액</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td class="first" rowspan="7">급여성</td>
						<td>학자금</td>
						<td>322,562</td>
					</tr>
					<tr>
						<td>정년퇴직기념품</td>
						<td>116,782</td>
					</tr>
					<tr>
					  <td>명절휴가기념품</td>
					  <td>645,070</td>
					  </tr>
					<tr>
						<td>보훈자녀격려금</td>
						<td>18,600</td>
					</tr>
					<tr>
						<td>자가운전보조비</td>
						<td>103,288</td>
					</tr>
					<tr>
						<td >장기근속기념품</td>
						<td>436,500</td>
					</tr>
					<tr>
						<td >학습문화활동비</td>
						<td>2,658,992 </td>
					</tr>
					<tr>
						<td class="first" rowspan="9">비급여성</td>
						<td>의료비</td>
						<td>367,242</td>
					</tr>
					
					<tr>
						<td>문화여가비</td>
						<td>97,623</td>
					</tr>
					<tr>
						<td>단체상해보험</td>
						<td>248,751 </td>
					</tr>
					<tr>
						<td>배우자생일기념품</td>
						<td>182,498</td>
					</tr>                    
					<tr>
						<td>서클보조비</td>
						<td>126,755 </td>
					</tr>
					<tr>
					  <td>야식대</td>
					  <td>30,417</td>
					  </tr>
					<tr>
					  <td>어린이집 운영비</td>
					  <td>215,147</td>
					  </tr>
					<tr>
					  <td>자녀진학축하기념품</td>
					  <td>18,620</td>
					  </tr>
					<tr>
						<td>정년퇴직 위로휴가</td>
						<td>41,000</td>
					</tr>   
                    <tr>
                    	<td class="first" rowspan="2">융자</td>
                        <td>학자금</td>
                        <td>221,500</td>
                    </tr>   
                    <tr>
                    	<td>주택취득 및 임차자금</td>
                        <td>29,039,815</td>
                    </tr>           
    				</tbody>
	                 </table>
					
					<!--//표-->

        			<div class="offtxt3">
						<h5>2013년도 사내근로복지기금 조성현황</h5>
						<p>(단위 : 천원)</p>
					</div>


					<!--표-->
					<table class="chart2" summary="2012년도 한국석유공사 사내근로복지기금 조성현황 관련 내용을 확인할 수 있습니다.">
					
					<caption>한국석유공사 사내근로복지기금 조성현황</caption>
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />											
					<thead>
					<tr>
						<th scope="col" rowspan="2" class="first">전년도말<br/>기금잔액</th>
						<th scope="col" rowspan="2" >전연도<br/>세전 <br/>순이익(A)</th>
	                    <th scope="col" rowspan="2" >출연액(B)</th>
	                    <th scope="col" rowspan="2" >수익금</th>
	                    <th scope="col" rowspan="2" >수혜자 수(C)</th>
	                    <th scope="col" colspan="3">사용액</th>
	                    <th scope="col" rowspan="2" >당해<br/>연도말<br/>기금잔액(D)</th>
	                    <th scope="col" rowspan="2" >출연비율(B/A)</th>
	                    <th scope="col" rowspan="2" >1인당<br/> 출연액<br/>(B/C)</th>
	                    <th scope="col" rowspan="2" >1인당<br/> 누적<br/>잔액<br/>(D/C)</th>
					</tr>
					<tr>
						<th >용도사업<br/>(무상<br/>지원)</th>
						<th >대부사업<br/>(융자)</th>
						<th >기타<br/>(기금<br/> 운용비등)</th>
					</tr>
					
					
					</thead>
					<tbody>
					<tr>
						<td class="first" >23,630,993</td>
						<td>212,582,950</td>
						<td>4,251,000</td>
						<td>690,887</td>
						<td>1,362</td>
					  <td>3,845,169</td>
						<td>3,350,000</td>
						<td>87</td>
					  <td>24,727,624</td>
						<td>2%</td>
						<td>3,121</td>
						<td>18,155</td>
					</tr>
                    </tbody>
     				</table>
					<!--//표-->


					<p class="rtxt">&nbsp;</p>		

        			<div class="offtxt3">
   						<h5>2013년도 사내근로복지기금 사용현황</h5>
						<p>(단위 : 천원)</p>
					</div>


     				<!--표-->
					<table class="chart2" summary="2011년도 한국석유공사 사내근로복지기금 사용현황 관련 내용을 확인할 수 있습니다.">
					
					<caption>한국석유공사 사내근로복지기금 사용현황</caption>
					<col width="150px" />
					<col width="300px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<thead>
					<tr>
						<th scope="col" rowspan="2" class="first">구분</th>
						<th scope="col" rowspan="2">상세내역</th>
	                    <th scope="col" rowspan="2">금액</th>
	                    <th scope="col" rowspan="2">수혜인원(명)</th>
	                    <th scope="col" colspan="4">조건</th>
					</tr>
					<tr>
						<th scope="col">대상</th>
						<th scope="col">금리(%)</th>
	                    <th scope="col">최대지원한도</th>
	                    <th scope="col">상환조건</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td class="first" rowspan="6">무상지급</td>
						<td>선택적 복리비</td>
						<td>1,897,021</td>
						<td>1,297</td>
						<td>공사<br/>재직직원</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td >기념품</td>
						<td>1,520,230</td>
						<td>1,312</td>
						<td>공사<br/> 재직직원</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td >기금운영비 등</td>
						<td>5,332</td>
						<td>1,328</td>
						<td>공사<br/> 재직직원</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>				
					</tr>
					<tr>
						<td >경조비</td>
						<td>182,900</td>
						<td>262</td>
						<td>공사<br/> 재직직원</td>
						<td>&nbsp;</td>
						<td>10,000<br />(본인사망시)</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>콘도이용료</td>
						<td>133,923</td>
						<td>492</td>
						<td>공사<br/> 재직직원</td>
						<td>&nbsp;</td>
						<td>실비</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>부모의료보상비</td>
						<td>105,850</td>
						<td>129</td>
						<td>공사<br/> 재직직원</td>
						<td>&nbsp;</td>
						<td>1,000</td>
						<td>&nbsp;</td>
					</tr>
					<tr class="tdgray">
						<td class="first" colspan="2">합계</td>
						<td>3,845,256 </td>
						<td>4,820</td>
						<td>공사<br /> 재직직원</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>							
					</tr>

			        <tr>
						<td class="first" rowspan="2">유상지급</td>
						<td>생활안정자금 대부</td>
						<td>3,200,000</td>
						<td>145</td>
						<td>2년이상<br/>재직중인<br/>직원</td>
						<td>3%</td>
						<td>40,000</td>					
						<td>100개월<br/>분할상환</td>	
					</tr>
					<tr>
						<td>주택취득자금 대부</td>
						<td>150,000</td>
						<td>6</td>
						<td>1년이상<br/>재직중인<br/>직원</td>
						<td>2%</td>
						<td>25,000</td>					
						<td>5년거치<br/>20년 분할상환 또는 25년  만기일시상환</td>	
						
					</tr>
					<tr class="tdgray"> 
					<td class="first" colspan="2">합계</td>
						<td>3,350,000</td>	
						<td>151</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>	
						<td>&nbsp;</td>	
						<td>&nbsp;</td>
					</tr>

    				</tbody>
					</table>
					<!--//표-->
						
					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">
					* 공시기준 : ‘13년 결산기준 	
					 </p>
                  
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
							<td><strong>담당부서 : </strong>인재경영처 복지후생팀</td>
							<td><strong>연락처 : </strong>052-216-2767</td>
							<td><strong>관리일 : </strong>2015-09-30</td>
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