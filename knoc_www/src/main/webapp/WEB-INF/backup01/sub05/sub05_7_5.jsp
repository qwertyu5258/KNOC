<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","05");
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
					&gt; <span>정보마당</span> &gt; <span>관련사이트</span> &gt; <span class="locanow">해외유관사이트</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/ttl_sub05_7_5.gif" alt="해외유관사이트" /></h3>
				</div>
				<div class="information">
					<div class="link mT0">
						<ul>
						<li> <a href="http://lcweb2.loc.gov/frd/cs/cshome.html" target="_blank" title="Country Studies 홈페이지로 이동(새창)">Country Studies</a></li>
						<li> <a href="http://www.petroleum-economist.com/" target="_blank" title="Petroleum Economist 홈페이지로 이동(새창)">Petroleum Economist</a></li>
						<li> <a href="http://www.woodmac.com/" target="_blank" title="Wood Mackenzie Consultants 홈페이지로 이동(새창)">Wood Mackenzie Consultants</a></li>
						<li> <a href="http://www.llplimited.com/" target="_blank" title="Lloyd's List 홈페이지로 이동(새창)">Lloyd's List</a></li>
						<li> <a href="http://www.ieds.com/" target="_blank" title="IHS Energs 홈페이지로 이동(새창)">IHS Energs</a></li>
						<li> <a href="http://www.piwpubs.com/" target="_blank" title="PIW PUBLICATIONS 홈페이지로 이동(새창)">PIW PUBLICATIONS</a></li>
						<li> <a href="http://www.bloomberg.com/energy/" target="_blank" title="Bloomberg Energy 홈페이지로 이동(새창)">Bloomberg Energy</a></li>
						<li> <a href="http://www.marketwatch.com/" target="_blank" title="News Alert 홈페이지로 이동(새창)">News Alert</a></li>
						<li> <a href="http://www.petroconsultants.com/" target="_blank" title="Petroconsultants 홈페이지로 이동(새창)">Petroconsultants</a></li>
						<li> <a href="http://www.platts.com/" target="_blank" title="Platt's 홈페이지로 이동(새창)">Platt's</a></li>
						<li> <a href="http://www.interfax-news.com/" target="_blank" title="Interfax News Agency 홈페이지로 이동(새창)">Interfax News Agency</a></li>
						<li> <a href="http://www.newspage.com/" target="_blank" title="Newspage 홈페이지로 이동(새창)">Newspage</a></li>
						</ul>
                    </div>
				</div>
			</div>
		</div>
	</div>
	
  <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>