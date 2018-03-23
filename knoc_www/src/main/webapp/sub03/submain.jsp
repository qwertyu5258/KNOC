<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","00");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<%@include file="/include/comheader.jsp"%>


	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
    <div id="smcontents" style="padding-top:15px;">
        <!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
        <div id="rightarea" class="mgn_top">        	
			<div id="smainvisual">
				<img src="/images/new_sub/business_info.gif" alt="사업소개(Business Info) 보다 드넓은 세상으로 이끄는 변화를 통해 대한민국의 에너지를 만듭니다." />
			</div>	
           
			<div id="smcnts_3">
				<div class="submain_02">
					
					<ul>
            			<li><a href="sub03_1_1.jsp"><img src="/images/submain/sub02_01.gif" alt="국내대륙붕사업 바로가기" /></a></li>
            			<li><a href="sub03_7_1.jsp"><img src="/images/submain/sub02_02.gif" alt="에특회계 바로가기" /></a></li>
            			<li><a href="sub03_2_1.jsp"><img src="/images/submain/sub02_03.gif" alt="해외사업 바로가기" /></a></li>
            			<li><a href="sub03_3_1.jsp"><img src="/images/submain/sub02_04.gif" alt="건설사업 바로가기" /></a></li>
            			<li><a href="sub03_5_1.jsp"><img src="/images/submain/sub02_05.gif" alt="시추선사업 바로가기" /></a></li>
            			<li><a href="sub03_4_1_1.jsp"><img src="/images/submain/sub02_06.gif" alt="석유비축사업 바로가기" /></a></li>
            		</ul>
				<span class="submain02_07"><a href="sub03_6_1.jsp"><img src="/images/submain/sub02_07.gif" alt="석유정보 바로가기" /></a></span>
				</div>
				<!-- 
                <div class="subMain">
					<div class="busiBox01">	
						<ul>
						<li class="busiMain06">
							<h3 class="mB5"><img src="/images/business/main_tit_06.gif" alt="석유정보"/></h3>
							<a href="sub03_6_1.jsp"><img src="/images/common/btn_go.gif" alt="석유정보 페이지로 이동"/></a>
						</li>
						<li class="busiMain07">
							<h3 class="mB5"><img src="/images/business/main_tit_07.gif" alt="에특회계"/></h3>
							<a href="sub03_7_1.jsp"><img src="/images/common/btn_go.gif" alt="에특회계 페이지로 이동"/></a>
						</li>
						</ul>
					</div>
					<div class="busiBox02">
						<div class="busiMain01">
							<h3><img src="/images/business/main_tit_01.gif" alt="대륙붕사업"/></h3>
							<p class="mT10"><img src="/images/business/main_txt_01.gif" alt="양질의 천연가스 층을 발견하여 국민의 영원인 산유국의 꿈을 실천하였습니다."/></p>
							<p class="mT10"><a href="sub03_1_1.jsp"><img src="/images/common/btn_main_go.gif" alt="대륙붕사업 페이지로 이동" /></a></p>
						</div>
						<div class="busiMain02">
							<h3><img src="/images/business/main_tit_02.gif" alt="해외사업"/></h3>
							<p class="mT10"><img src="/images/business/main_txt_02.gif" alt="석유수급의 안정을 보장하기 위해 해외 유전발전에 적극적으로 참여하고 있는 석유공사" /></p>
							<p class="mT10"><a href="sub03_2_1.jsp"><img src="/images/common/btn_main_go.gif" alt="해외사업 페이지로 이동" /></a></p>
						</div>
						<div class="busiMain03">
							<h3><img src="/images/business/main_tit_03.gif" alt="시추선사업"/></h3>
							<p class="mT10"><img src="/images/business/main_txt_03.gif" alt="안전조업 능력과 운영의 우수성을 인정받고 있습니다." /></p>						
							<p class="mT10"><a href="sub03_5_1.jsp"><img src="/images/common/btn_main_go.gif" alt="시추선사업 페이지로 이동" /></a></p>
						</div>
					</div>
					<div class="busiBox03">
						<div class="busiMain04">
							<h3><img src="/images/business/main_tit_04.gif" alt="건설사업"/></h3>
							<p class="mT10"><img src="/images/business/main_txt_04.gif" alt="안전하고 친환경적인 유류저장 시설을 건설 하고 있습니다."/></p>
							<p class="mT10"><a href="sub03_3_1.jsp"><img src="/images/common/btn_main_go.gif" alt="건설사업 페이지로 이동" /></a></p>
						</div>
						<div class="busiMain05">
							<h3><img src="/images/business/main_tit_05.gif" alt="석유비축사업"/></h3>
							<p class="mT10"><img src="/images/business/main_txt_05.gif" alt="국가경제안정을 위해 반드시 필요한 투자! 그것은 바로 석유비축입니다."/></p>
							<p class="mT10"><a href="sub03_4_1_1.jsp"><img src="/images/common/btn_main_go.gif" alt="석유비축사업 페이지로 이동" /></a></p>
						</div>
					</div>
				</div>
				-->
            </div>
        </div>
     </div> 
    <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>

