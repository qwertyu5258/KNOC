<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","07");
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
				<%@include file="/include/subtop_05.jsp"%>
				<!--// location: start //-->
				<div class="locadv">					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>정보마당</span> &gt; <span>관련사이트</span> &gt; <span class="locanow">해외석유회사, 단체</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/ttl_sub05_7_4.gif" alt="해외석유회사, 단체" /></h3>
				</div>
				<div class="information">
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
							<li> <a href="http://www.nioc.org/" target="_blank" title="NIOC(이란) 홈페이지로 이동(새창)">NIOC(이란)</a></li>
							<li> <a href="http://www.ongcindia.com/default.asp" target="_blank" title="ONGC(인도) 홈페이지로 이동(새창)">ONGC(인도)</a></li>
							<li> <a href="http://www.pdv.com/" target="_blank" title="PDV(베네수엘라) 홈페이지로 이동(새창)">PDV(베네수엘라)</a></li>
							<li> <a href="http://www.pemex.com/" title="PEMEX(멕시코) 홈페이지로 이동(새창)">PEMEX(멕시코)</a></li>
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
							<li> <a href="http://www.yukos.com/" target="_blank" title="Yukos(러시아) 홈페이지로 이동(새창)">Yukos(러시아)</a></li>
							<li> <a href="http://www.totalfinaelf.com/" target="_blank" title="TotalFinaElf(프랑스) 홈페이지로 이동(새창)">TotalFinaElf(프랑스)</a></li>
							</ul>
                    </div>
                    <div class="link2">
                    	<h5>해외 주요석유관련 단체</h5>
							<ul>
							<li> <a href="http://www.energy.gov/" target="_blank" title="미국 에너지부(Department of Energy) 홈페이지로 이동(새창)">미국 에너지부(Department of Energy)</a></li>
							<li> <a href="http://www.aga.org/" target="_blank" title="미국가스협회(American Gas Association) 홈페이지로 이동(새창)">미국가스협회(American Gas Association)</a></li>
							<li> <a href="http://www.dti.gov.uk/energy/" target="_blank" title="영국 DTI Energy Division 홈페이지로 이동(새창)">영국 DTI Energy Division</a></li>
							<li> <a href="http://www.petroleum.co.uk/" target="_blank" title="영국석유협회 홈페이지로 이동(새창)">영국석유협회</a></li>
							<li> <a href="http://www.paj.gr.jp/" target="_blank" title="일본석유연맹 홈페이지로 이동(새창)">일본석유연맹</a></li>
							<li> <a href="http://oil-info.ieej.or.jp/" target="_blank" title="일본석유정보센터 홈페이지로 이동(새창)">일본석유정보센터</a></li>
							<li> <a href="http://www.aip.com.au/" target="_blank" title="호주 석유협회 홈페이지로 이동(새창)">호주 석유협회</a></li>
							<li> <a href="http://api-ec.api.org/newsplashpage/index.cfm" target="_blank" title="API(American Petroleum Institute) 홈페이지로 이동(새창)">API(American Petroleum Institute)</a></li>
							<li> <a href="http://www.utexas.edu/" target="_blank" title="Texas주립대(BEG(Bureau of Economics Geology)) 홈페이지로 이동(새창)">Texas주립대(BEG(Bureau of Economics Geology))</a></li>
							<li> <a href="http://www.eia.doe.gov/" target="_blank" title="EIA(Energy Information Administration) 홈페이지로 이동(새창)">EIA(Energy Information Administration)</a></li>
							<li> <a href="http://www.cera.com/home/" target="_blank" title="Cambridge Energy Research Associates 홈페이지로 이동(새창)">Cambridge Energy Research Associates</a></li>
							<li> <a href="http://www.mms.gov/" target="_blank" title="MMS(Minerals Management Service) 홈페이지로 이동(새창)">MMS(Minerals Management Service)</a></li>
							<li> <a href="http://www.iadc.org/" target="_blank" title="IADC(International Association of Drilling Contractors) 홈페이지로 이동(새창)">IADC(International Association of Drilling Contractors)</a></li>
							<li> <a href="http://www.usgs.gov/" target="_blank" title="US Geological Survey 홈페이지로 이동(새창)">US Geological Survey</a></li>
							<li> <a href="http://www.iaee.org/" target="_blank" title="IAEE(International Association for Energy Economics) 홈페이지로 이동(새창)">IAEE(International Association for Energy Economics)</a></li>
							<li> <a href="http://www.world-petroleum.org/" target="_blank" title="WPC(World Petroleum Congress) 홈페이지로 이동(새창)">WPC(World Petroleum Congress)</a></li>
							<li> <a href="http://www.iea.org/" target="_blank" title="IEA(International Energy Agency) 홈페이지로 이동(새창)">IEA(International Energy Agency)</a></li>
							<li> <a href="http://www.spe.org/" target="_blank" title="SPE(Society of Petroleum Engineers) 홈페이지로 이동(새창)">SPE(Society of Petroleum Engineers)</a></li>
							<li> <a href="http://www.worldenergy.org/default.asp" target="_blank" title="WEC(World Energy Council) 홈페이지로 이동(새창)">WEC(World Energy Council)</a></li>
							<li> <a href="http://www.opec.org/" target="_blank" title="OPEC(Organization of the Petroleum Exporting Countries) 홈페이지로 이동(새창)">OPEC(Organization of the Petroleum Exporting Countries)</a></li>
							</ul>
                    </div>
                    <div style="clear:both;"></div>
				</div>
			</div>
		</div>
	</div>
	
  <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>