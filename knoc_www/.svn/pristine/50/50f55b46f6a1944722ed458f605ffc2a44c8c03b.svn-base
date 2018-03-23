<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>             
<%@include file="/include/comheader.jsp"%>


	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
	
<script type="text/javascript">
//<![CDATA[
           
	function openCorpInfo(p_n){
		
		var obj;
		var cultureIdArr = ["corpInfo01", "corpInfo02", "corpInfo03", "corpInfo04", "corpInfo05"];
		var currentShow = false;
		
		for(var i=0; i<cultureIdArr.length; i++){
			obj = document.getElementById(cultureIdArr[i]);
			if(p_n == (i+1) && obj.style.display == "block") currentShow = true;
			obj.style.display="none";
		}
		
		if(!currentShow){
			obj = document.getElementById(cultureIdArr[p_n-1]);
			obj.style.display="block";
		}
	}
	
//]]>
</script>
	
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
					&gt; <span>공사소개</span>
					&gt; <span class="locanow">기업문화</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-10-25 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_2.gif" alt="기업문화" /></h3>
				</div>
				
				
				<!--시작-->
				<div class="culture2">
                	<div>
						<img src="../images/info/img_sub01_2.gif" alt="기업문화 체계도" border="0" usemap="#Map" />
					
					<map name="Map" id="Map">					
						<area shape="rect" coords="139,30,209,63"  alt="사명" href="javascript:openCorpInfo(1);" />
						<area shape="rect" coords="260,96,328,129"  alt="비전" href="javascript:openCorpInfo(2);" />
						<area shape="rect" coords="225,224,295,257"  alt="핵심가치" href="javascript:openCorpInfo(3);" />
						<area shape="rect" coords="58,224,127,256"  alt="경원원칙" href="javascript:openCorpInfo(4);" />
						<area shape="rect" coords="22,97,91,128"  alt="일괄처리방식" href="javascript:openCorpInfo(5);" />
					</map>
		
				</div>
					<p class="blindtext">기업문화 - 사명, 비전, 핵심가치, 경영원칙, 일처리 방식</p>
					
					
					<h4 class="infoTit">기업문화 전체 체계도 동영상</h4>
						<div class="embed">
							<object id="MediaPlayer" type="video/x-ms-wmv" data="/upload/data/sub01/Corporate_culture.wmv" width="350" height="300" title="동영상">기업문화 전체 체계도 동영상
							<param name="Filename" value="/upload/data/sub01/Corporate_culture.wmv" />
							<param name="AutoStart" value="0" />
							<param name="AutoSize" value="0" />
							<param name="AnimationAtStart" value="0" />
							<param name="DisplaySize" value="0" />
							<param name="EnableContextMenu" value="false" />
							<param name="EnablePositionControls" value="-1" />
							<param name="EnableFullScreenControls" value="0" />
							<param name="Mute" value="0" />
							<param name="stretchToFit"  value="0" />
							<param name="ShowCaptioning" value="0" />
							<param name="ShowControls" value="1" />
							<param name="ShowAudioControls" value="1" />
							<param name="ShowDisplay" value="0" />
							<param name="ShowGotoBar" value="0" />
							<param name="ShowPositionControls" value="-1" />
							<param name="ShowStatusBar" value="1" />
							<param name="ShowTracker" value="-1" />
							<param name="Volume" value="100" />
							<param name="SendMouseClickEvents" value="-1" />
							</object>
						</div>
						
					<div class="embed_down">
						<dl>
							<dt>미디어 형식별 동영상과 대본</dt>
							<dd><a href="/upload/data/sub01/Corporate_culture.wmv"  title="다운로드">- 윈도우 미디어용 다운로드(26.6MB)</a></dd>
							<dd><a href="/upload/data/sub01/Corporate_culture_text.doc"  title="다운로드">- 대본 다운로드(39KB)</a></dd>
						</dl>
						<dl class="mT20">
							<dt>동영상 플레이어 다운로드</dt>
							<dd><a href="https://www.microsoft.com/korea/windows/windowsmedia/" class="blank" title="윈도우 미디어 플레이어 다운로드">- 윈도우 미디어 플레이어</a></dd>
						</dl>
					</div>
				</div>
			</div>
			
			<div id="corpInfo01" class="vision01">
				<p class="vis_01"><img src="/images/info/abus_vn01.gif" alt="사명" /> </p>
				<h4><img src="/images/info/img_vision01.gif" alt="사명" /></h4>
				<div><img src="/images/info/arrow_visiton.gif" alt="" /></div>		
				<div class="vistxt">
					<div><img src="/images/info/txt_vision01.gif" alt="석유의 안정적 공급을 통해 국민에게 희망과 편안함을 제공" /></div>
						<p>사명이란 공사의 설립목적이자 추구하는 궁극적인 가치입니다. 우리나라는 과거 1·2차 석유파동을 겪으면서 에너지의 불안정한 공급이 국민의 생활과 국가경제발전을 위협한다는 것을 인식하게 되었습니다. 따라서, 안정적인 석유공급과 전략적 비축이라는 당면과제를 해결하기 위해 국가적으로나 국민적으로 에너지 전문기업이 절실하게 요구되었습니다.<br /><br />
						그러나 안정적인 석유공급을 통해 석유위기를 방어하고 그 피해를 최소화하는 임무 수행은 영리를 목적으로 하는 민간 기업에 의해 수행될 수 없는 국가적 책임사업이었습니다. 이러한 취지와 배경속에 1979년, ‘석유의 안정적 공급을 통해 국민에게 희망과 편안함을 제공’한다는 사명으로 정부투자 기관인 한국석유공사가 탄생하였습니다. 우리의 사명에서는 ‘석유를 통해’라는 막연한 표현 보다는 ‘석유의 안정적 공급을 통해’라는 구체적이고 직접적인 표현을 사용하여 공사의 사명을 표명하였습니다. 또한 '국민에게 희망과 편안함을 제공’하는 것을 궁극적인 목표로 하여 우리 공사가 나아가야 할 방향을 확고하게 선언함으로써 우리 공사의 설립목적과 존립의지를 결연하게 보여주고 있습니다. 
						</p>
					</div>						
				</div>
			</div> <!-- 사명 end-->
			
			
			
			<div id="corpInfo02" class="vision02">
				<p class="vis_01"><img src="/images/info/abus_vn02.gif" alt="비전" /> </p>
				<h4><img src="/images/info/img_vision02.gif" alt="비전" /></h4>
				<div><img src="/images/info/arrow_visiton.gif" alt="" /></div>		
				<div class="vistxt">
						<div><img src="/images/info/txt_vision02.gif" alt="석유의 안정적 공급을 통해 국민에게 희망과 편안함을 제공" /></div>
							<ul>
								<li>한국석유공사의 설립근거가 대한민국 정부와 국민임을 명심하고 정부와 국민을<br/>섬김으로써 나오는 무한한 신뢰와 사랑을 바탕으로 공사가 발전하고 지속성장 할 수 있다는 의지를 표현함</li>
								<li>한국석유공사의 대형화는 국민의 지지가 없다면 결코 이룰 수 없는 사명이기에 공사<br/>대형화의 기본원칙을 국민의 지지와 사랑으로 삼고자 하며 이를 위해 최선을 다할 것임</li>
								<li>한국석유공사는 목표 달성과 새로운 기회를 창출할 수 있는 경쟁역량과 규모를 갖추어<br/>메이저 석유회사와의 경쟁을 통해 세계적인 회사로 발전하고 성장할 것임</li>
								<li>한국석유공사는 공기업으로서 에너지의 안정적 공급을 통해 정부와 국민에게 봉사하고<br/>대한민국과 국민의 발전과 번영에 기여하겠다는 사명을 담고 있음</li>
							</ul>		
						</div>						
					</div><!-- 비전 end-->
					
					
					
			<div id="corpInfo03" class="culture001">
				<p class="vis_01"><img src="/images/info/abus_cr01.gif" alt="핵심가치" /> </p>
				<div class="cr"><img src="/images/info/imgin1_sub01_2_2.jpg" alt="4대 핵심가치 및 선언적 의미" />
						<dl class="blindtext">
							<dt>핵심가치 (Core Values)</dt>
							<dd>'최고가 되겠다는 의지' <em>전문가정신</em>(Professionalism)</dd>
							<dd>'이웃을 사랑하고자 하는 약속' <em>공헌</em> (Contribution)</dd>
							<dd>'남을 먼저 생각하는 마음' <em>배려</em> (Respect)</dd>
							<dd>'하면 된다는 신념' <em>도전</em> (Challenge)</dd>
						</dl>
					</div>
					<ul>
						<li>
							<img src="/images/info/imgin1_sub01_2_2_1.gif" alt="핵심가치(Core Values)란" />
							<p>공사 구성원이 갖추어야 할 사고와 행동의 기준이 되는 핵심적인 가치관입니다.</p>							
						</li>
					</ul>
					<ul class="pl20">
						<li>
							<img src="/images/directors/icon01.gif" alt="" /> <strong>도전 (Challenge) </strong>
							<p>실패를 두려워하지 않고 미래를 지향하는 석유공사인의 하면된다는 신념입니다.</p>							
						</li>
						<li>
							<img src="/images/directors/icon01.gif" alt="" /> <strong>공헌 (Contribution) </strong>
							<p>행복한 세상을 꿈꾸며 나눔을 실천하는 석유공사인의 이웃을 사랑하고자하는 약속입니다.</p>
						</li>
						<li>
							<img src="/images/directors/icon01.gif" alt="" /> <strong>전문가정신 (Professionalism) </strong>
							<p>무한경쟁시대를 살아가는 석유공사인의 최고가 되겠다는 의지입니다.</p>							
						</li>
						<li>
							<img src="/images/directors/icon01.gif" alt="" /> <strong>배려 (Respect) </strong>
							<p>선배를 존경하고 후배를 사랑하는 석유공사인의 남을 먼저 생각하는 마음입니다.</p>
						</li>
					</ul>	
				</div><!-- 핵심가치 end-->
					
			
			
				<div  id="corpInfo04" class="culture02">
					<h4><img src="/images/info/imgin1_sub01_2_3_1.gif" alt="경영원칙(Business Principles)" /></h4>
					<p class="pb30">공사경영의 지침이 되는 원칙이자 경영활동의 기본자세입니다.</p>					
					<div class="bp"><img src="/images/info/imgin1_sub01_2_3.gif" alt="7대 경영원칙(Business Principles)" />
						<ul class="blindtext">
						<li>- 변화와 혁신을 통한 <em>지속적인 성장</em></li>
						<li>- 성과를 중시하고 <em>가치를 창조</em></li>
						<li>- 자율성을 존중하고 <em>인재를 육성</em></li>
						<li>- 연구개발을 강화하고 <em>기술력을 확보</em></li>
						<li>- 일하기 좋은 <em>근무환경 조성</em></li>
						<li>- 기본과 원칙에 맞는 <em>투명한 경영</em></li>
						<li>- 사회구성원으로서 <em>사회적 책임을 다함</em></li>
						</ul>
					</div>
				</div>	<!-- 경원원칙 end-->				
			
			
			
			
				<div id="corpInfo05"  class="culture03">
					<p class="vis_01"><img src="/images/info/abus_cr03.gif" alt="일처리방식" /> </p>		
					<div class="cr02"><img src="/images/info/imgin1_sub01_2_4.gif" alt="핵심가치별 일처리방식" />
						<ul class="blindtext">
						<li><em>도전</em>(Challenge) - 사업계획, 사업운영, 전략기획</li>
						<li><em>전문가 정신</em>(Professionalism) - 연구개발, 인재확보, 사업지원</li>
						<li><em>배려</em>(Respect) - 평가보상, 의욕소통, 복리후생</li>
						<li><em>공헌</em>(Contribution) - 회계재무, 안전환경, 사회책임</li>
						</ul>
					</div>


					<ul>
						<li><img src="/images/directors/icon01.gif" alt="" /><strong> KNOC-Way란 </strong>경영활동에 필요한 일을 수행하는 기본철학이자 방법론입니다.</li>
					</ul>


					<ul class="knocway">
						<li><strong> 사업계획 </strong>- 신규사업을 발굴하여 사업타당성을 검토하고 사업운영에 필요한 준비를 하는 것입니다.</li>
						<li><strong> 사업운영 </strong>- 인적·물적자원을 투입하고 구성원의 역량을 결집하여 사업을 효율적으로 수행함으로써 사업목표를 달성하는 것입니다.</li>
						<li><strong> 사업지원 </strong>- 사업에 필요한 지원활동을 수행하고 경영위험 요인을 최소화 할수 있도록 경영환경을 안정적으로 관리하는 것입니다.</li>
						<li><strong> 연구개발 </strong>- 석유에너지관련 기술 및 정보를 연구하고 개발하여 선진기술력과 정보력을 확보하는 것입니다.</li>
						<li><strong> 전략기획 </strong>- 지속가능한 경쟁우위를 창출하도록 비젼을 제시하고 경영전략을 수립·시행하는 것입니다.</li>
						<li><strong> 인재확보 </strong>- 인적자원을 체계적으로 선발하여 능력에 맞게 적재적소에 배치히고 교육훈련을 통해 인적역량을 강화하는 것입니다.</li>
						<li><strong> 회계재무 </strong>- 재무정보를 이해관계자에게 제공하고, 자금을 적기에 조달하여 안정적이고 효율적으로 운용하는 것입니다.</li>
						<li><strong> 평가보상 </strong>- 조직 및 구성원의 성과를 공정하게 평가하고 보상하여 지속적인 성과향상을 유도하는 것입니다.</li>
						<li><strong> 의욕소통 </strong>- 구성원의 근무의욕을 고취하고 다양한 이해관계자와 원활히 소통하는 것입니다.</li>
						<li><strong> 복리후생 </strong>- 구성원에게 최적의 근무조건과 근무환경을 제공하여 구성원의 만족도를 제고하는 것입니다.</li>
						<li><strong> 안전환경 </strong>- 인명 및 시설물의 안전사고와 환경오염사고를 미연에 방지하고 사고발생 시 그 피해를 최소화하는 것입니다.</li>
						<li><strong> 사회책임 </strong>- 공사의 이해관계자와 상생관계를 구축하고 지역사회발전 및 공익에 기여함으로써 궁극적으로 인류행복을 이루는 것입니다.</li>
					</ul>
				</div>		<!-- 일처리방식 end-->		
			
			
			

			<div class="new_officer" style="margin-left:240px;" >
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>비서실 홍보팀</td>
						<td><strong>연락처 : </strong>031-380-2157</td>
						<td><strong>관리일 : </strong>2015-09-30</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
	
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>