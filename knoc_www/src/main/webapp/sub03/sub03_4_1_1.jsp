<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","04");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","01");
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
				<%@include file="/include/subtop_03.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>사업소개</span>
                    &gt; <span>석유비축 유통구조개선</span>
                    &gt; <span>석유비축사업의개요</span>
                    &gt; <span class="locanow">목적 및 필요성</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/new_sub/ttl_sub03_4_1_01.gif" alt="석유비축사업의개요" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
				
					<div class="oil_tab">
						<ul>
							<li><a href="/sub03/sub03_4_1_1.jsp"><img src="/images/new_sub/oil_tab01_on.gif" alt="목적및필요성" /></a></li>
							<li><a href="/sub03/sub03_4_1_2.jsp"><img src="/images/new_sub/oil_tab02.gif" alt="추진현황및향후계획" /></a></li>
						</ul>
					</div>
					<div style="clear:both ; height:20px ;"></div>
					
					<h5 class="mT0">석유비축사업의 개요</h5>
					<div><img src="../images/business/imgin1_sub03_4_1_1.gif" alt="에너지안보 차원에서 석유비축 적극 추진"/>
						<ul class="blindtext">
							<li>
								<dl>
									<dt>위기대응능력 취약</dt>
									<dd>- 비축능력 취약 국가안보 위협</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>석유위기 가능성 상존</dt>
									<dd>- 공급 및 수송기반 취약 전량 수입 의존</dd>
								</dl>
							 </li>
							<li>
								<dl>
									<dt>석유의존형 산업구조</dt>
									<dd>- 공급중단시 경제마비 중요 전략자원</dd>
								</dl>
							</li>
						</ul>
					</div>
					<h5>목적 및 필요성</h5>
					<p>우리나라는 세계 5위의 석유 순수입국, 세계 8위의 석유 소비국임에도 높은 중동 의존도, 낮은 자주개발원유 확보율 등으로 석유위기 대응능력이 주요 석유수입국들과 비교하여 낮은 실정입니다. 실제로 지난 1970년대에 있었던 두 차례의 오일쇼크는 국가경제와 국민생활에 엄청난 충격을 주었습니다.</p> 
					<p>이러한 석유위기에 대비하여 정부는 '79년 한국석유공사를 설립,' 80년부터 국내 석유수급 및 가격안정과 국가 경제발전을 위하여 정부석유비축사업을 공식 추진하게 되었습니다.</p>
				</div>
				<!--//끝-->
			</div>
			
			<!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
					<td class="contact_team"><strong>담당부서 : </strong>석유비축처 비축관리팀</td>
					<td class="contact_user"><strong>담당자 : </strong>김현정</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-5005</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>