<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","04");
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
				<%@include file="/include/subtop_03.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사업소개</span>
                    &gt; <span>해외사업</span>
                    &gt; <span class="locanow">해외자회사현황</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_2_4.gif" alt="해외자회사현황" /></h3>
				</div>
				<!--시작-->
				<div class="business4">

                	<!-- <h4 class="mT0"><img src="../images/business/img_ttl_sub03_2_1_01.gif" alt="사업개요" /></h4> -->
                    <div class="mainTab">
					<dl class="ml10">
						<dt onclick="show_img_sub('img_tab',1,'tab_menu')" class="on"><img src="/images/business/n_tit1_.gif" name="tab_menu" alt="ANKOR Energy in the Gulf of Mexico" /></dt>
						<dd id="img_tab1" style="display:block;">
							<h4><img src="../images/business/img_ttl_sub03_2_4_01.gif" alt="ANKOR Energy in the Gulf of Mexico" /></h4>
							<ul>
								<li><img src="/images/business/ankor.jpg" style="width:680px ;" alt="미국 ankor 광구사진" /></li>
								<li>
									2008년 한국석유공사는 기존의 탐사광구 확보 위주의 전략을 생산광구 매입 및 석유개발기업 인수 전략으로 변경,
									3월에 미 Taylor사(ANKOR Energy사로 개명)를 인수하였습니다. 한국석유공사의 첫 M&amp;A 사례이기도 한 미국 ANKOR사는 인수 2년 만에
									생산량 47% 증가, 미국 광물관리청으로부터 안전환경대상 수상 등의 성과를 거두며 현지 미국 언론으로부터 멕시코 만에서 가장 활발한
									생산 기업 6위에 선정되기도 했습니다.
								</li>
								<li>
									<ul class="com_info">
										<li>회사정보</li>
										<li>주소 : 1615 Poydras Street # 1100, New Orleans, LA 70112-1281</li>
										<li>전화번호 : (504) 596-3700</li>
									</ul>
								</li>
							</ul>

							<!-- new_officer -->
							<div class="new_officer" style="left:2%">
								<table summary="담당부서 및 연락처 관리일">
								<caption>담당부서 및 연락처 관리일</caption>
								<tbody>
								<tr>
									<td class="write_day"><strong>작성기준일 : </strong>2016-05-18</td>
									<td class="contact_team"><strong>담당부서 : </strong>생산사업2처 미주생산1팀</td>
									<td class="contact_user"><strong>담당자 : </strong>정구선</td>
									<td class="contact_tel"><strong>연락처 : </strong>052-216-3408</td>
								</tr>
								</tbody>
								</table>
							</div>
							<!-- new_officer -->
						</dd>
					</dl>


					<dl>
						<dt onclick="show_img_sub('img_tab',2,'tab_menu')"><img src="/images/business/n_tit2.gif" name="tab_menu" alt="SAVIA-Peru in Peru" /></dt>
						<dd id="img_tab2">
							<h4><img src="../images/business/img_ttl_sub03_2_4_02.gif" alt="SAVIA-Peru in Peru" /></h4>
							<ul>
								<li><img src="/images/business/savia.jpg" alt="페루 savia 광구사진" /></li>
								<li>
									2009년 2월 페루 Petro-Tech사를 콜롬비아 국영회사인 Ecopetrol과 공동 인수하며 일일 생산량 12천 배럴, E&amp;P 전문인력 688명을 확보하고, 2010년 1월에 SAVIA-Peru로 사명을 변경하였습니다.<br />
									페루 해상광구의 약 75%에 해당하는 11개 광구(생산1, 탐사10)를 운영 중이며, 향후 활발한 탐사 및 개발활동을 추진하여 일산 5만 배럴 이상을 생산할 계획입니다.
								</li>
								<li>
									<ul class="com_info">
										<li>회사정보</li>
										<li>주소 : Av. Rivera, Navarrete 501, Piso 11, San Isidro, Lima-Peru </li>
										<li>전화번호: (51) 1-513-7500</li>
										<li>홈페이지 : <a href="http://www.saviaperu.com/en/index.php">http://www.saviaperu.com/en/index.php</a></li>
									</ul>
								</li>
							</ul>

							<!-- new_officer -->
							<div class="new_officer" style="left:2%">
								<table summary="담당부서 및 연락처 관리일">
								<caption>담당부서 및 연락처 관리일</caption>
								<tbody>
								<tr>
									<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
									<td class="contact_team"><strong>담당부서 : </strong>생산사업2처 미주생산3팀</td>
									<td class="contact_user"><strong>담당자 : </strong>김광선</td>
									<td class="contact_tel"><strong>연락처 : </strong>052-216-3442</td>
								</tr>
								</tbody>
								</table>
							</div>
							<!-- new_officer -->
						</dd>
					</dl>


					<dl>
						<dt onclick="show_img_sub('img_tab',3,'tab_menu')"><img src="/images/business/n_tit3.gif" name="tab_menu" alt="Harvest Operations Corp. in Canada" /></dt>
						<dd id="img_tab3">
							<h4><img src="../images/business/img_ttl_sub03_2_4_03.gif" alt="Harvest Operations Corp. in Canada" /></h4>
							<ul>
								<li><img src="/images/business/harvest.jpg" alt="캐나다 harvest 광구사진" /></li>
								<li>
									2009년 캐나다 최대 에너지기업인 하베스트 사의 지분 100%를 M&amp;A 하였습니다.
									1억 8천 4백만 배럴(2P)를 보유한 하베스트 사를 성공적으로 인수함으로 국가 석유&bull;가스 자주개발률을 1.8%포인트 높이는 데 기여했습니다.
									특히 2011년에는  HUNT 사 자산인수로 인해 매장량은 약 1억 9천 9백만 배럴에서 2억 4천 9백만 배럴로 5천만 배럴 가량 증가하였고,
									일일 생산량도 5만 배럴에서 6만 배럴에 이르렀습니다.
								</li>
								<li>
									<ul class="com_info">
										<li>회사정보</li>
										<li>주소 : 2100, 330 - 5th Ave. SW, Calgary, AB T2P 0L4, Canada</li>
										<li>전화번호 : (403) 265-1178</li>
										<li>홈페이지 : <a href="http://www.harvestenergy.ca/">http://www.harvestenergy.ca/</a></li>
									</ul>
								</li>
							</ul>

							<!-- new_officer -->
							<div class="new_officer" style="left:2%">
								<table summary="담당부서 및 연락처 관리일">
								<caption>담당부서 및 연락처 관리일</caption>
								<tbody>
								<tr>
									<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
									<td class="contact_team"><strong>담당부서 : </strong>생산사업2처 미주생산2팀</td>
									<td class="contact_user"><strong>담당자 : </strong>이병용</td>
									<td class="contact_tel"><strong>연락처 : </strong>052-216-3425</td>
								</tr>
								</tbody>
								</table>
							</div>
							<!-- new_officer -->
						</dd>
					</dl>
					<dl>
						<dt onclick="show_img_sub('img_tab',4,'tab_menu')"><img src="/images/business/n_tit4.gif" name="tab_menu" alt="Dana Petroleum in the UK" /></dt>
						<dd id="img_tab4" >
							<h4><img src="../images/business/img_ttl_sub03_2_4_04.gif" alt="Dana Petroleum in the UK" /></h4>
							<ul>
								<li><img src="/images/business/dana.jpg" alt="영국 dana 광구사진" /></li>
								<li>
									2010년 영국의 Dana사를 적대적 M&A하였습니다. 이는 국내 기업이 적대적 M&A 형태로 해외 기업 인수에 성공한 첫 사례입니다. Dana사는 영국, 네덜란드를 비롯해 8개국에 탐사, 개발, 생산 광구를 가지고 있는 기업으로 총 매장량은 약 119백만 배럴, 일일 생산량은 46천 배럴 입니다. Dana사 인수를 통해 한국석유공사는 해외석유개발사업의 핵심거점을 현재의 미주, 구소련 지역에서 북해, 아프리카까지 확대할 수 있는 기회를 마련하게 되었으며 현재 석유개발 사업을 활발히 진행하고 있습니다.<br /> (2015년 1월말 기준)

								</li>
								<li>
									<ul class="com_info">
										<li>회사정보</li>
										<li>주소 : King’s Close, 62 Huntly Street.  Aberdeen, AB10 1UR, United Kingdom </li>
										<li>전화번호 : (44) 0-1224-616000</li>
										<li>홈페이지 : <a href="http://www.dana-petroleum.com/ ">http://www.dana-petroleum.com/ </a></li>
									</ul>
								</li>
							</ul>

							<!-- new_officer -->
							<div class="new_officer" style="left:2%">
								<table summary="담당부서 및 연락처 관리일">
								<caption>담당부서 및 연락처 관리일</caption>
								<tbody>
								<tr>
									<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
									<td class="contact_team"><strong>담당부서 : </strong>생산사업1처 유럽생산팀</td>
									<td class="contact_user"><strong>담당자 : </strong>오진훈</td>
									<td class="contact_tel"><strong>연락처 : </strong>052-216-3364</td>
								</tr>
								</tbody>
								</table>
							</div>
							<!-- new_officer -->
						</dd>

					</dl>
				</div>
					<div style="clear:both; margin-top: 30px;"></div>

				</div>
				<!--//끝-->
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</html>