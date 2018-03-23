<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","06");
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
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>열린경영</span>
                    &gt; <span>윤리경영</span>
					&gt; <span>윤리경영소개</span>
                    &gt; <span class="locanow">CEO메세지</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_1_1_1.gif" alt="CEO메세지" /></h3>
				</div>
				<!--시작-->
				<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
				<div class="greeting">
					<div><img src="/images/management/sub02_1_1_1_te1.gif" alt="" /></div>
					<div class="conRight"  style="margin-bottom: 40px;">
						<p>
							한국석유공사는 ‘에너지 그 이상의 가치를 실현’하기 위해 각 분야에서 열과 성의를 다해 오고 있습니다.<br /><br />
							에너지 자원 확보를 위한 국가 간의 경쟁이 그 어느 때보다 치열한 상황 속에서도 한국석유공사는 공기업으로서 국가경제 발전에 이바지하는 한편 우리 이웃과 함께 발전하고, 국제적으로도 신뢰받는 기업으로 성장하고자 끊임없는 노력을 기울이고 있습니다.<br /><br />
							이제 윤리경영과 기업의 사회적 책임 이행은 시대적 요청이자 모든 기업의 책무가 되었으며, 기업의 지속경영을 위한 중요한 기업 경영활동의 하나로 자리매김 하고 있습니다.<br /><br />
							이에 한국석유공사는 글로벌 선진기업에 걸맞는 정당한 수익성 확보와 윤리 리스크의 체계적인 관리 필요성을 인식하고 ‘글로벌 최고 수준의 윤리경영 실천’을 추진하고 있습니다. 이를 위해 윤리헌장 및 행동강령 등 제도를 정착해 나가는 한편, 교육과 평가를 통해 전 임직원이 윤리경영에 자발적으로 참여할 수 있는 기업 문화를 조성해  오고 있습니다. 이러한 노력들은 한국석유공사의 임직원이 윤리적 판단기준과 합리적인 절차를 통하여 업무를 수행하는 원동력이자 공사의 사회적 책임 이행을 위한 기반이 되고 있습니다.<br /><br />
							이에 만족하지 않고, 앞으로 한국석유공사는 글로벌 최고수준의 윤리경영 실천을 향해 계속 매진해 나갈 것입니다.<br /><br />
							윤리경영을 선도하며 ‘에너지 그 이상의 가치를 실현하는 기업’으로 성장 발전해 가는 한국석유공사에 끊임없는 관심과 성원을 부탁드립니다.<br /><br />
						</p>
						<p class="mT20">감사합니다.</p>
					</div>
                 </div>
				<!--//끝-->
			</div>
			
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
							<td class="contact_team"><strong>담당부서 : </strong>감사실 청렴경영감사팀</td>
							<td class="contact_user"><strong>담당자 : </strong>이유경</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2126</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>