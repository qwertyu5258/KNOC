<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>           
<%@include file="/include/comheader.jsp"%>


  <%@include file="/include/subtopnavi_new.jsp"%>
  <!--// subtopNavi: start //-->

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
                    &gt; <span>해외사업</span>
                    &gt; <span class="locanow">석유개발현황도</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_2_2.gif" alt="석유개발현황도" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                	<%@include file="sub03_2_2_map.jsp"%>
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_cpo_2.gif" alt="콜롬비아 CPO-2" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_cpe_7.gif" alt="콜롬비아 CPO-2 광구도" /></div>
                    
                    <p class="rtxt">[2014년 12월말 기준]</p>
					<table class="chart2" summary="콜롬비아 CPO-2 광구 정보를 확인할 수 있습니다.">
					<caption>콜롬비아 CPO-2 광구 정보</caption>
					<col width="60px" />
					<col width="60px" />
					<col width="70px" />
					<col width="70px" />
					<col width="50px" />
					<col width="50px" />
					<col width="60px" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					
					<th scope="col">광구명</th>
					
					<th scope="col">운영권자</th>
					
					<th scope="col">지경부 신고일</th>
					
					<th scope="col">한국측지분<br />(%(퍼센트))</th>
					
					<th scope="col">한국측지분<br />공사</th>					
					
					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">탐사사업</td>
					<td>콜롬비아<br />CPO-2</td>
					<td>Pluspetrol<br />(아르헨)</td>
					<td>'09.01</td>
					<td>30</td>
					<td>30</td>
					<td>-</td>
					</tr>
					</tbody>
					</table>
                        
                    <p class="mT20">CPO-2는 안데스 조산운동으로 인하여 생성된 분지 중 하나인 콜롬비아 야노스 분지의 서쪽에 위치하고 있다. 광구의 면적은 701.54㎢이며, 공사의 참여 지분은 30%이다.</p>
					<p class="mT5">공사는 Pluspetrol사의 제안으로 2008년 광구 입찰에 공동으로 참여하여, 콜롬비아석유청(ANH)으로부터 CPO-2, CPO-3 광구를 분양받아 E&amp;P계약을 체결(2008년 12월)함으로써 각 30% 지분을 획득하였다.</p>
					<p class="mT5">E&amp;P계약에 규정된 의무탐사량 이행 및 탄화수소 발견을 위해, 2010년 2차원 탄성파탐사 및 2011년 3차원 탄성파탐사 자료취득 및 2012년 탐사시추 2공을 완료하였다.</p>
					<p class="mT5">2012년 6월 탐사2기에 진입하였으며, 2013년초 탐사시추 1공을 시추하였으나, 공사 평가 결과 유망성 부족으로 인해 2014년 사업 철수를 결정하였고 현재 철수절차를 진행 중이다.</p>
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
						<td><strong>담당부서 : </strong>탐사사업처 미주유아탐사팀</td>
						<td><strong>연락처 : </strong>052-216-3170</td>
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