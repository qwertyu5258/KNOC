<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>

<% 

    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

	' Page Navigator section

	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/

	application.setAttribute("gNavMenuDepth1","05");

	application.setAttribute("gNavMenuDepth2","14");

	application.setAttribute("gNavMenuDepth3","00");

	application.setAttribute("gNavMenuDepth4","00");

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

				<%@include file="/include/subtop_05.jsp"%>

				<!--// location: start //-->

				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>정보마당</span> 
					&gt; <span class="locanow">공공데이터</span>
				</div>

				<!--// location: end //-->

				

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->

				<div class="pagetle">

					<h3 class="tleimg"><img src="/images/information/ttl_sub05_10.gif" alt="공공데이터 " /></h3>

				</div>

				<div class="information" style="margin-top:-10px; ">
					
					<h4><img src="../images/information/img_ttl_sub05_10_1_1.gif" alt="공공데이터포털" /></h4>
					 <p style="float:right; margin-top:-25px; margin-right:15px; "><a href="https://www.data.go.kr/" target="_blank"><img src="../images/information/img_btn_sub05_10_1_1.gif" alt="공공데이터포털 바로가기"/></a></p>
					<dl class="list">
						<dt><span>공공데이터포털은 공공데이터의 개방을 통한 국민중심 서비스 정부3.0을 구현하려는 비전입니다.</span></dt>
						<dt><span>공공데이터포털은 국가가 보유하고 있는 다양한 공공정보를 국민에 개방하여 이를 편리하고 손쉽게 활용할 수 있도록 지원하고, 
						더 나아가 많은 자원들이 개방될 수 있도록 계획을 추진하여 국가와 국민의 동반 성장을 추구합니다.</span></dt>
					</dl>
					
					<h4 class="mT20"><img src="../images/information/img_ttl_sub05_10_1_2.gif" alt="공공데이터포털에서 받을 수 있는 서비스" /></h4>
					<table summary="공공데이터포털에서 받을 수 있는 서비스" class="chart2 mT20">
                	<caption>공공데이터포털에서 받을 수 있는 서비스 내용</caption>
                	<tbody>
                		<tr>
                			<td class="first  mL10">
                				<dl class="list mL10">
									<dt>DATA 및 OPEN API 공유자원의 검색 및 활용신청</dt>
									<dt>공공백서<span> : 정부부처 및 산하기관에서 발행하는 백서 모음</span></dt>
									<dt>한눈에 보이는 공공정보의 개방현황<span> : 지역별, 분류체계별, 제공기관별, 활용방법별로 제공</span></dt>
									<dt>공공정보 제공신청 및 중계신청<span> : 개방 가능한 공공정보를 제공기관에 제공 신청 또는 제공기관이 공공데이터포털에 중계신청</span></dt>
									<dt>전문컨설팅, 1:1상담<span> : 사용자들의 문의사항에 대해 전문적이고 빠른 답변 제공</span></dt>
									<dt>개발자LAB<span> : 개발자들을 위한 공간으로 개발가이드 및 활용사례 제공</span></dt>
								</dl>
							</td>	
                		</tr>
                		</tbody>
                		</table>
					<h4 class="mT30"><img src="../images/information/img_ttl_sub05_10_1_3.gif" alt="한국석유공사 공공데이터 활용사례" /></h4>
					<table summary="한국석유공사 공공데이터 활용사례" class="chart2 mT20">
                	<caption>한국석유공사 공공데이터 활용사례 내용</caption>
                	<tbody>
                		<tr>
                			<th class="first" scope="row"><strong>오피넷(Opinet)</strong>
                			<p class="mT5 mR20"><a href="https://www.opinet.co.kr/index.do?cmd=main" target="_blank"><img src="../images/information/img_btn_sub05_10_1_2.gif" alt="오피넷 바로가기"/></a></p></th>
                			<td class="tdleft">
	               				<dl class="list mL10">
									<dt>신속하고 정확한 유가정보서비스<br /><span>- 담당부서 : 석유정보센터 유가서비스팀 (연락처 : 052-216-2573)</span></dt>
								</dl> 
							</td>	
                		</tr>
                		<tr>
                			<th><strong>페트로넷(Petronet)</strong>
                			<p class="mT5 mR20"><a href="http://www.petronet.co.kr/v3/index.jsp" target="_blank"><img src="../images/information/img_btn_sub05_10_1_3.gif" alt="페트로넷 바로가기"/></a></p></th>
                			<td class="tdleft">
	               				<dl class="list mL10">
									<dt>국내외 석유관련 정보DB<br /><span>- 담당부서 : 석유정보센터 정보기획팀 (연락처 : 052-216-2504)</span></dt>
								</dl> 
							</td>	
                		</tr>                		
                		</tbody>
                		</table>
                		
					<h4 class="mT30"><img src="../images/information/img_ttl_sub05_10_1_4.gif" alt="한국석유공사 공공데이터 제공 책임관 및 담당자" /></h4>              
                   <table summary="한국석유공사 공공데이터 제공 책임관 및 담당자" class="chart2 mT20">
                	<caption>한국석유공사 공공데이터 제공 책임관 및 담당자 내용</caption>
                	<thead>
                		<tr>
	                		<th class="first">구분</th>
	                		<th>소속</th>
	                		<th>직위</th>
	                		<th>성명</th>
	                		<th>연락처</th>
	                	</tr>	
                	</thead>
                	<tbody>
                		<tr>
                			<td class="first">공공데이터제공책임관</td>	
                			<td>전략기획실</td>	
                			<td>실장</td>
                			<td>이준범</td>
                			<td>052-216-2300</td>	
                		</tr>
                 		<tr>
                			<td class="first">공공데이터제공실무담당자</td>	
                			<td>전략기획실 경영혁신팀</td>	
                			<td>팀장</td>
                			<td>최영호</td>
                			<td>052-216-2331</td>	
                		</tr>   
                  		<tr>
                			<td class="first">공공데이터제공실무담당자</td>	
                			<td>전략기획실 경역혁신팀</td>	
                			<td>과장</td>
                			<td>한승완</td>
                			<td>052-216-2332</td>	
                		</tr>                 		            		
                	</tbody>
                	</table>	
                </div>

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
						<td><strong>담당부서 : </strong>전략기획실 경영혁신팀</td>
						<td><strong>연락처 : </strong>052-216-2332 </td>
						<td><strong>관리일 : </strong>2015-09-30</td>
					</tr>
				</tbody>
				</table>
			</div> <!--new_officer end -->

		</div>

	</div>

	

  <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</div>

</body>

</html>