<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","01");
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
					&gt; <span>정보마당</span> &gt; <span class="locanow">관련사이트</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/ttl_sub05_7_1.gif" alt="관련사이트" /></h3>
				</div>
				
				<div class="information">
				
					<ul class="tab">
	                   	<li><a href="sub05_7_1.jsp"><img src="/images/information/site_tab01.gif" alt="관련 공공기관 및 국내대학"/></a></li>
						<li><a href="sub05_7_1_1.jsp"><img src="/images/information/site_tab02.gif" alt="국내석유회사, 단체"/></a></li>
						<li><a href="sub05_7_1_2.jsp"><img src="/images/information/site_tab03on.gif" alt="해외석유회사, 단체"/></a></li>
					</ul>
					<div style="clear:both ; height:30px ;"></div>
				
                	<div class="link mT0">
                    	<h5>해외 주요석유회사</h5>
						<ul>
							<li> <a href="http://www.adnoc.com" target="_blank" title="ADNOC(UAE) 홈페이지로 이동(새창)">ADNOC(UAE)</a></li>
							<li> <a href="http://www.bpamoco.com" target="_blank" title="BP Amoco(영국) 홈페이지로 이동(새창)">BP Amoco(영국)</a></li>
							<li> <a href="http://www.chevron.com" target="_blank" title="Chevron Texaco(미국) 홈페이지로 이동(새창)">Chevron Texaco(미국)</a></li>
							<li> <a href="http://www.conoco.com" target="_blank" title="Conoco Phillips(미국) 홈페이지로 이동(새창)">Conoco Phillips(미국)</a></li>
							<li> <a href="http://www.egpc.com.eg" target="_blank" title="EGPC(이집트) 홈페이지로 이동(새창)">EGPC(이집트)</a></li>
							<li> <a href="http://www.eni.it" target="_blank" title="ENI(이태리) 홈페이지로 이동(새창)">ENI(이태리)</a></li>
							<li> <a href="http://www.exxon.mobil.com/corporate/" target="_blank" title="Exxon-Mobil(미국) 홈페이지로 이동(새창)">Exxon-Mobil(미국)</a></li>
							<li> <a href="http://www.gazprom.ru/" target="_blank" title="Gazprom(러시아) 홈페이지로 이동(새창)">Gazprom(러시아)</a></li>
							<li> <a href="http://www.kpc.com.kw/" target="_blank" title="KPC(쿠웨이트) 홈페이지로 이동(새창)">KPC(쿠웨이트)</a></li>
							<li> <a href="http://www.lukoil.com/" target="_blank" title="LUKOIL(러시아) 홈페이지로 이동(새창)">LUKOIL(러시아)</a></li>
							<li> <a href="http://www.marathon.com/" target="_blank" title="Marathon(미국) 홈페이지로 이동(새창)">Marathon(미국)</a></li>
							<li> <a href="http://www.ongcindia.com/default.asp" target="_blank" title="ONGC(인도) 홈페이지로 이동(새창)">ONGC(인도)</a></li>
							<li> <a href="http://www.pdv.com/" target="_blank" title="PDV(베네수엘라) 홈페이지로 이동(새창)">PDV(베네수엘라)</a></li>
							<li> <a href="http://www.pemex.com/" target="_blank" title="PEMEX(멕시코) 홈페이지로 이동(새창)">PEMEX(멕시코)</a></li>
							<li> <a href="http://www.pertamina.com/" target="_blank" title="Pertamina(인도네시아) 홈페이지로 이동(새창)">Pertamina(인도네시아)</a></li>
							<li> <a href="http://www.petrochina.com.cn/" target="_blank" title="PetroChina(중국 홈페이지로 이동(새창)">PetroChina(중국)</a></li>
							<li> <a href="http://www.petronas.com.my/" target="_blank" title="PETRONAS(말레이시아) 홈페이지로 이동(새창)">PETRONAS(말레이시아)</a></li>
							<li> <a href="http://www.shell.com/" target="_blank" title="R/D Shell(영국/네델란드) 홈페이지로 이동(새창)">R/D Shell(영국/네델란드)</a></li>
							<li> <a href="http://www.repsol.es/" target="_blank" title="Repsol-YPF(스페인) 홈페이지로 이동(새창)">Repsol-YPF(스페인)</a></li>
							<li> <a href="http://www.saudiaramco.com/" target="_blank" title="Saudi Aramco(사우디) 홈페이지로 이동(새창)">Saudi Aramco(사우디)</a></li>
							<li> <a href="http://www.sinopec.com.cn/" target="_blank" title="SINOPEC(중국) 홈페이지로 이동(새창)">SINOPEC(중국)</a></li>
							<li> <a href="http://www.statoil.com/" target="_blank" title="Statoil(노르웨이) 홈페이지로 이동(새창)">Statoil(노르웨이)</a></li>
							<li> <a href="http://www.surgutneftegas.ru/" target="_blank" title="Surgutneftegaz(러시아) 홈페이지로 이동(새창)">Surgutneftegaz(러시아)</a></li>
							<li> <a href="http://www.tnk.ru/" target="_blank" title="Tyumen Oil(러시아) 홈페이지로 이동(새창)">Tyumen Oil(러시아)</a></li>
							<li> <a href="http://www.totalfinaelf.com/" target="_blank" title="TotalFinaElf(프랑스) 홈페이지로 이동(새창)">TotalFinaElf(프랑스)</a></li>
						</ul>
                    </div>
					<div class="information">
					<div class="link mT0">
						<h5>해외 유관사이트</h5>
						<ul>
							<li> <a href="http://www.petroleum-economist.com/" target="_blank" title="Petroleum Economist 홈페이지로 이동(새창)">Petroleum Economist</a></li>
							<li> <a href="http://www.woodmac.com/" target="_blank" title="Wood Mackenzie Consultants 홈페이지로 이동(새창)">Wood Mackenzie Consultants</a></li>
							<li> <a href="http://www.ieds.com/" target="_blank" title="IHS Energs 홈페이지로 이동(새창)">IHS Energs</a></li>
							<li> <a href="http://www.piwpubs.com/" target="_blank" title="PIW PUBLICATIONS 홈페이지로 이동(새창)">PIW PUBLICATIONS</a></li>
							<li> <a href="http://www.bloomberg.com/energy/" target="_blank" title="Bloomberg Energy 홈페이지로 이동(새창)">Bloomberg Energy</a></li>
							<li> <a href="http://www.platts.com/" target="_blank" title="Platt's 홈페이지로 이동(새창)">Platt's</a></li>
							<li> <a href="http://www.iea.org/" target="_blank" title="International Energy Agency 홈페이지로 이동(새창)">International Energy Agency</a></li>
							<li> <a href="http://www.eia.doe.gov/" target="_blank" title="Energy Information Administration 홈페이지로 이동(새창)">Energy Information Administration</a></li>
						</ul>
                    </div>


					
                    <div style="clear:both;"></div>
                </div>
            </div>
            
            <div class="new_officer" style="margin-left:0 ;">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>경영조정실 홍보팀</td>
						<td><strong>연락처 : </strong>052-216-2229</td>
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