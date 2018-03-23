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

					<h4><img src="../images/business/img_ttl_sub03_2_2_vietnam_15_1.gif" alt="베트남 15-1" /></h4>
                    <div class="mT10"><img src="../images/business/img_sub03_2_2_vietnam.gif" alt="베트남 15-1 광구도" /></div>

					<p class="rtxt"> [2016년 9월말 기준]</p>
					<table class="chart2" summary="베트남 15-1 광구 정보를 확인할 수 있습니다.">
					<caption>베트남 15-1 광구 정보</caption>
					<col width="50px" />
					<col width="120px" />
					<col width="80px" />
					<col width="60px" />
					<col width="60px" />
					<col width="120px" />
					<col width="60px" />
					<thead>
					<tr>
					<th scope="col" class="first">광구명</th>
					<th scope="col">계약형태</th>
					<th scope="col">광구면적</th>
					<th scope="col">참여지분</th>
					<th scope="col">운영권자</th>
					<th scope="col">생산량 2016년<br />평균(boed)</th>
					<th scope="col">구분</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">15-1</td>
					<td>생산물분배계약(PSC)</td>
					<td>800㎢<br />(평방킬로미터)</td>
					<td>14.25%<br />(퍼센트)</td>
					<td>CLJOC</td>
					<td>69,666</td>
					<td>생산광구</td>
					</tr>
					</tbody>
					</table>

					<style type="text/css">
					div.business2 div.area1 { position:relative; margin:0; padding:10px 0 20px; text-align:left; }
					div.business2 div.area1 > dl { width:auto; padding-right:410px; }
					div.business2 div.area1 > p.img { position:absolute; top:43px; right:0; }

					div.business2 div.area2 { position:relative; min-height:410px; *min-height:400px; margin:0; padding:10px 0; text-align:left; }
					div.business2 div.area2 > p.img { position:absolute; top:10px; right:0; }
					div.business2 div.area2 ul.vaitnam2 { padding-right:410px; }
					div.business2 div.area2 ul.vaitnam2 li { position: relative; width:298px; margin:0; padding-top:7px; clear:both; background:none; }
					div.business2 div.area2 ul.vaitnam2 strong { position: absolute; left:0; padding-left:9px; top:7px; vertical-align: top; color: #e33c1b;  background: url("/images/directors/icon02.gif") 0 6px no-repeat ; }
					div.business2 div.area2 ul.vaitnam2 p { margin: 0; padding-left: 72px; }
					</style>

                   <div class="area1">
							<dl class="country">
								<dt><strong>Block 15-1(History)</strong></dt>
								<dd>흑사자 구조(Sutu Den Field)에서의 2000년 10월 최초로 성공적인 탐사 이후로, 금사자구조에서 2001년 10월, 백사자 구조에서 2003년 11월, 그리고 갈사자 구조에서 2005년 9월에 계속적으로 성공적인 발견이 이루어졌다.<br/>
									현재 흑사자, 금사자 및 백사자 유전에서 61개의 생산정을 통해 하루 약 81천 배럴의 원유 및 가스가 생산되고 있으며, 해상 생산시설은 Central Processing Platform(CPP), Wellhead platform (WHP-A~G), 부유식원유생산저장시설(FPSO) 및 파이프라인 등으로 구성되어 있다. 각 구조에서 생산된 원유는 CPP 및 FPSO에서 최초 처리 과정을 거친 후 저장된다. FPSO는 2008년 리스를 통해 사용되었다가 2008년 Modec사로부터 구매되어 사용되고 있으며, 1백만배럴의 원유저장능력을 갖추고 있다. </dd>
							</dl>
							<p class="img"><img src="../images/business/img_sub03_2_2_1.gif" alt="Block 15-1 광구 탐사 장면" /></p>
						</div>

						<div class="area2">
							<ul class="vaitnam2">
							<li><strong>Sep. 1998</strong>
								<p>15-1 광구 탐사권 취득</p>
							</li>
							<li><strong>Oct. 2000</strong>
								<p>흑사자 구조(Sutu Den) 석유발견</p>
							</li>
							<li><strong>Aug. 2001</strong>
								<p>흑사자 구조(Sutu Den) 상업성 선언</p>
							</li>
							<li><strong>Oct. 2001</strong>
								<p>금사자 구조(Sutu Vang) 석유발견</p>
							</li>
							<li><strong>Oct. 2003</strong>
								<p>흑사자 구조 생산개시</p>
							</li>
							<li><strong>Nov. 2003</strong>
								<p>백사자 구조(Sutu Trang) 석유발견</p>
							</li>
							<li><strong>Sep. 2005</strong>
								<p>갈색사자 구조(Sutu Nau) 석유발견</p>
							</li>
							<li><strong>Oct. 2008</strong>
								<p>금사자 구조 생산개시</p>
							</li>
							<li><strong>Apr. 2010</strong>
								<p>흑사자북동부 구조(SDNE) 생산 개시</p>
							</li>
							<li><strong>Sep. 2012</strong>
								<p>백사자 구조 생산개시</p>
							</li>
							<li><strong>Oct. 2013</strong>
								<p>금사자 북동부구조(SVNE) 생산개시</p>
							</li>
							<li><strong>Sep. 2014</strong>
								<p>갈사자(SN) 및 금사자 남서부(SVSW)<br />생산개시</p>
							</li>
						</ul>
						<p class="img"><img src="../images/business/img_sub03_2_2_2_new.gif" alt="광구 개발도" /></p>
					</div>

					<dl class="country" style="text-align:left;">
						<dt><strong>Block 15-1(사업개요)</strong></dt>

						<dd>2003년 10월 생산 개시된 흑사자 구조에서는 현재 37개의 생산정을 통해 하루 약 19천 배럴의 원유 및 가스가 생산되고 있으며, 흑사자 구조의 해상 생산시설은 Wellhead Platform(WHP-A)과 부유식원유생산저장시설(FPSO) 그리고 2.4Km(킬로미터)에 이르는 파이프라인으로 구성되어 있다. 흑사자 구조에서 생산된 원유는 FPSO에서 최초 처리 과정 후 저장된다. FPSO는 2008년 리스를 통해 사용되었다가 2008년 Modec사로부터 구매하여 사용하고 있으며, 1백만 배럴의 원유저장능력을 갖추고 있다.</dd>

						<dd>2008년 10월 생산이 개시된 금사자 구조에서는 14개의 생산정을 통해 하루 약 12천배럴의 원유 및 가스가 생산되고 있으며 금사자의 해상 시설물은 CPP(Central Processing Platform),WHP-D로 이루어져 있고 생산된 원유는 CPP를 거쳐서 FPSO에 저장된다.</dd>

						<dd>2012년 9월 백사자 개발이 완료되어 장기생산시험(LTPTP) 중이며, 하루 약 40MMscf의 가스와 6천배럴의 초경질원유가 생산 중이다. 갈사자구조는 2014년 9월에 생산 개시하여 7개의 생산정을 통해 하루 37천배럴의 원유 및 가스를 생산하고 있으며, 생산된 원유 및 가스는 파이프라인을 통해 금사자 CPP로 이동 후 처리된다. 흑사자, 금사자, 백사자, 갈사자 구조에서 2023년까지 생산이 지속되어, 궁극가채생산량이 645백만배럴에 이를 것으로 기대되고 있다.</dd>
					</dl>

                    <table class="chart4" summary="베트남 15-1 총매장량, 일일생산량, 생산기간 정보를 확인할 수 있습니다.">
					<caption>베트남 15-1 광구 정보</caption>
					<tr>
					<th>궁극가채매장량(전체분)</th>
					<td>645 MMboe</td>
					</tr>
<!-- 					<tr>
					<th>일일생산량</th>
					<td>84Mbbl/day</td>
					</tr>
 -->
					<tr>
					<th>생산기간</th>
					<td class="table_bottom">20년, 2003~2023</td>
					</tr>
					</table>
                    <dl class="country" style="text-align:left;">
                    <dt><strong>Block 11-2 &amp; 15-1의미와 전망</strong></dt>
					<dd>베트남11-2광구 사업은 한국석유공사 최초의 해외운영광구 사업으로서 RD/RDT field에서의 성공적인 생산은 공사 뿐만 아니라, 한국의 석유개발산업의 기념비적인 성과로 평가되고 있다.  공사의 인력이 탐사 단계부터 모든 개발, 생산 단계에서 주요한 역할을 수행하였다. 시추부터 가스 매장량의 추정, 사업진행과 관련된 모든 협상 과정과 해상 생산시설물의 설계와 건설 등 모든 단계와 분야에서 공사의 자체 인력이 국내 업체와 국내 기술을 활용하여 사업을 진행하였다는 점에서 의미있는 성취로서 평가되고 있다.</dd>
					<dd>베트남15-1광구 사업도 한국석유공사의 큰 성과로서 15-1광구 탐사부터 개발, 생산 등 모든 사업단계에서 주도적으로 참여하였다.</dd>
					<dd>공사의 베트남 광구 사업은 해외광구개발 사업에서 상당한 양의 원유과 가스를 공사가 주도적이고 진취적으로 진행한 사례로서 국가의 에너지 확보라는 사명을 훌륭하게 수행했다는 점에서 매우 의미있는 성과이다.</dd>
					<dd>한국석유공사는 해외광구사업을 통해 석유개발 상류사업(탐사, 개발, 생산, 판매)분야에서 다양한 경험과 기술을 축적하였으며, 이렇게 축적된 역량을 바탕으로 세계 원유 확보 경쟁에서 더욱 높은 성취를 통해 국가 에너지 자립을 선도할 것입니다.</dd>
                    </dl>
                </div>
				<!--//끝-->
		  </div>

		  <!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-11-23</td>
					<td class="contact_team"><strong>담당부서 : </strong>생산사업1처 아시아생산팀</td>
					<td class="contact_user"><strong>담당자 : </strong>이보미</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-3313</td>
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