<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","03");
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
					&gt; <span>정보마당</span> &gt; <span>관련사이트</span> &gt; <span class="locanow">국내유관사이트</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/ttl_sub05_7_3.gif" alt="국내유관사이트" /></h3>
				</div>
				<div class="information">
					<div class="link">
						<ul>
						<li> <a href="http://www.kpc.or.kr" target="_blank" title="한국생산성본부 홈페이지로 이동(새창)">한국생산성본부</a></li>
						<li> <a href="http://www.korcham.net" target="_blank" title="대한상공회의소 홈페이지로 이동(새창)">대한상공회의소</a></li>
						<li> <a href="http://www.kdi.re.kr" target="_blank" title="한국개발연구원 홈페이지로 이동(새창)">한국개발연구원</a></li>
						<li> <a href="http://www.deri.co.kr" target="_blank" title="대신경제연구 홈페이지로 이동(새창)">대신경제연구</a></li>
						<li> <a href="http://www.hri.co.kr" target="_blank" title="현대경제연구원 홈페이지로 이동(새창)">현대경제연구원</a></li>
						<li> <a href="http://www.kca.go.kr" target="_blank" title="한국소비자보호원 홈페이지로 이동(새창)">한국소비자보호원</a></li>
						<li> <a href="http://www.iin.co.kr" target="_blank" title="산업정보망 홈페이지로 이동(새창)">산업정보망</a></li>
						<li> <a href="http://www.fki.or.kr" target="_blank" title="전국경제인연합회 홈페이지로 이동(새창)">전국경제인연합회</a></li>
						<li> <a href="http://www.kita.net" target="_blank" title="한국무역협회 홈페이지로 이동(새창)">한국무역협회</a></li>
						<li> <a href="http://www.kiet.re.kr" target="_blank" title="한국산업연구원 홈페이지로 이동(새창)">한국산업연구원</a></li>
						<li> <a href="http://www.lgeri.com" target="_blank" title="LG경제연구원 홈페이지로 이동(새창)">LG경제연구원</a></li>
						<li> <a href="http://www.kiep.go.kr" target="_blank" title="대외경제정책연구원 홈페이지로 이동(새창)">대외경제정책연구원</a></li>
						<li> <a href="http://www.innonet.net" target="_blank" title="기업서비스정보망(Inno-NET) 홈페이지로 이동(새창)">기업서비스정보망(Inno-NET)</a></li>
						<li> <a href="http://www.ksa.or.kr" target="_blank" title="한국표준협회 홈페이지로 이동(새창)">한국표준협회</a></li>
						<li> <a href="http://www.seri.org" target="_blank" title="삼성경제연구소 홈페이지로 이동(새창)">삼성경제연구소</a></li>
						<li> <a href="http://www.kma.or.kr" target="_blank" title="한국능률협회 홈페이지로 이동(새창)">한국능률협회</a></li>
						<li> <a href="http://www.kordi.re.kr" target="_blank" title="한국해양연구원 홈페이지로 이동(새창)">한국해양연구원</a></li>
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