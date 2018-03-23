<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","04");
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
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개 </span>
                    &gt; <span class="locanow">회사연혁</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_4.gif" alt="회사연혁" /></h3>
				</div>
				<!--시작-->				
				<div class="introduction">
						<ul class="tab">
							<li><a href="sub01_4.jsp"><img src="/images/management/sub02_2_1_1_1.gif" alt="2000년대 연혁" border="0"  id="premier_button1"/></a></li>
							<li><a href="sub01_4_1.jsp"><img src="/images/management/sub02_2_1_1_2.gif" alt="1990년대 연혁" border="0"   id="premier_button2"/></a></li>
							<li><a href="sub01_4_2.jsp"><img src="/images/management/sub02_2_1_1_3.gif" alt="1980년대 이전 연혁" border="0"   id="premier_button3"/></a></li>
							<li><a href="sub01_4_3.jsp"><img src="/images/management/sub02_2_1_1_4r.gif" alt="석유공사30년사" border="0"   id="premier_button4"/></a></li>
						</ul>

					<h4 class="pt20"><img src="/images/info/sub01_6_ta1.gif" alt="KNOC의 어제" /></h4>
					<div class="pt20">
						<div><img src="/images/info/img_sub01_6_1.gif" alt="KNOC의 어제" /></div>
						<ul class="history">
							<li><strong>한국석유공사의 태동</strong>
								<p>제1차 석유파동 이후 우리나라 에너지 분야에 관한 정책을 종합적이고 체계적으로 추진하기 위한 부처의
									설립이 필요하다는 의견이 각처에서 제기되었고, 이에 따라 에너지를 둘러싼 국제여건의 변화에 효율적으로
									대처하고 국제에너지 수급의 총괄과 자원외교 를 담당할 독립부처로 동력자원부가 1월 신설되었습니다.
									이어 1978년 8월, 동력자원부의 주장에 따라 경제장관회의에서 석유자원의 탐사 및 개발에 관한 사업과 원유
									비축 사업을 수행할 전담기구로서 석유공사의 전신인 한국석유개발공사를 1979년에 설립하도록 의결하였습니다.
									그리고 마침내 1979년 2월 27일, 한국석유개발공사 사무국의 고문이었던 김동조 전 외무부장관이 동력자원부
									장관의 제청 및 대통령의 임명으로 한국석유개발공사 초대사장에 취임하고, 1979년 3월 3일 설림등기가 이뤄짐에
									따라 정부투자기관으로서 한국석유개발공사가 공식적으로 태동하게 됐습니다.</p>
							</li>
							<li><strong>한국석유공사의 발전</strong>
								<p>이렇게 설립된 한국석유공사(설립 당시는 석유개발공사)는 설립 이후 국내외 석유산업에 대한 동향 파악과 정부의
								정책지원 기관으로서 석유자원의 안정적인 공급을 위하여 석유비축, 국내외 석유탐사 및 개발로 활동영역을 확장
								하는데 전력을 기울였습니다. 아울러 민간부문에 대한 자금, 기술, 인력 등 자원활동을 수행함으로써 우리나라
								석유산업 발전을 선도했습니다.
								석유공사가 발전을 계속함에 따라 임직원도 크게 증가하였습니다. 설립 당시에는 사장, 감사 및 4인의 상임이사
								등의 임원과 3실, 7부, 1개 비축관리사무소, 20개 과의 기구 아래 125명의 인원이 전부였지만 이후 석유공사의
								사업이 확장되면서 기구조직과 인원수도 지속적으로 증가하여 현재 4본부, 1원, 1센터, 20처,실, 23사무소 및 지사
								(국내10, 해외13)에 총 1,195명의 임직원이 근무하고 있습니다.</p>
							</li>
						</ul>
					</div>

					<h4 class="pt20"><img src="/images/info/sub01_6_ta12.gif" alt="KNOC의 오늘" /></h4>
					<div class="pt20">
						<div><img src="/images/info/img_sub01_6_2.gif" alt="KNOC의 오늘" /></div>
						<ul class="history">
							<li><strong>한국석유공사의 사업</strong>
								<p>-국내대륙붕 사업 : 산유국의 꿈을 이뤄낸 동해-1가스전은 한국석유공사의 오랜 노력과 기술의 산물입니다. </p>
								<p>-해외석유 개발사업 : 한국석유공사는 불굴의 도전과 창조정신을 바탕으로 세계 초일류 에너지기업으로 도약하고 있습니다.</p>
								<p>-시추선 사업 : 한국석유공사의 시추선사업은 최첨단 시추선인 두성호와 뛰어난 기술인력을 바탕으로 고유가시대에 경쟁력 있는 사업부문으로 성장했습니다.</p>
								<p>-석유비축사업 : 석유비축사업은 석유를 안정적으로 공급하고 위기 시 능동적으로 대응하기 위한 에너지 안보의 초석입니다. </p>
								<p>-비축기지 건설사업 : 한국석유공사는 환경과 인간을 최우선으로 생각하는 친환경적 기지건설에 앞장서고 있습니다. </p>
								<p>-연구개발사업 : 한국석유공사는 2006년 2월 국내 유일의 석유개발 전문기업 부설연구소인 석유개발연구원을 설립하여 세계적 국영석유회사로 발전하기 위해 지속적으로 노력을 하고 있으며 전통 석유뿐만 아니라 비 전통에너지 기술개발을 위해 해외 우수 석유기업 및 학계, 연구기관과의 공동연구로 기술력 제고 및 연구역량을 높이고 신규사업 확장을 위한 기반을 마련해 나가고 있습니다. </p>
								<p>-석유정보서비스 : 높은 석유의존도를 가진 우리나라는 국내외 석유정보를 수집, 분석하고 연구하여 정부기관이나 민간 석유업계에 적시에 제공함으로써 석유정책 수립 및 기업의 의사결정을 지원하고 있습니다.</p>
							</li>
							<li><strong>한국석유공사의 기업이념</strong>
								<p><span>한국석유공사는 진취적인 도전정신과 창조적 사고를 바탕으로 에너지 강국을 선도하는 일류 에너지기업으로 도약하고 있습니다.</span></p>
								<p>기업문화 : 기업문화는 한국석유공사의 전략적 자산이지만 중요한 경쟁 원천입니다. <br/>
									인재경영 : 좋은 인재는 좋은 기업을 만드는 무한 에너지입니다. <br/>
									윤리경영 : 깨끗하고 투명한 기업,기본과 원칙이 바로 선 기업이 되겠습니다. <br/>
									환경경영 : 인간을 소중히 여기고 환경을 지켜가는 기업, 한국석유공사입니다. <br/>
									사회공헌 : 나눔을 실천하며 사회적 책임과 사명을 다하는 한국석유공사가 되겠습니다. </p>
							</li>
						</ul>
					</div>

					<h4 class="pt20"><img src="/images/info/sub01_6_ta13.gif" alt="KNOC의 내일" /></h4>
					<div class="pt20">
						<div style="margin-bottom:30px;"><img src="/images/info/img_sub01_6_3.gif" alt="KNOC의 내일" /></div>
						<ul class="history">
							<li><strong>한국석유공사의 비전</strong>
								<p>한국석유공사는 더 나은 내일을 위해 끊임없이 도전하겠습니다.</p>
							</li>
							<li><strong>한국석유공사의 약속</strong>
								<p>한국석유공사의 미래는 대한민국 에너지의 미래입니다. 국민 여러분의 진심 어린 질책과 격려를 자양분으로 하여 한국석유공사는 모두가 꿈꾸는 미래를 현실로 만들어 나가겠습니다.</p>
								<div class="btnSet"><a href="/filedown.jsp?fileno=2
&amp;filepath=/upload/data/sub01/" title="다운로드"><img src="/images/info/sub01_6_btn.gif" alt="한국석유공사 30년사" border="0"/></a></div>
							</li>
						</ul>
					</div>
				</div>				
				<!--//끝-->
			</div>
	
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 기획관리팀</td>
						<td class="contact_user"><strong>담당자 : </strong>황자영</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2208</td>
					</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer end -->
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>