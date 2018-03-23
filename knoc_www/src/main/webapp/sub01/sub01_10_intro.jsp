<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","10");
	application.setAttribute("gNavMenuDepth3","00");
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
					&gt; <span>공사소개</span>
					&gt; <span>기업문화</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-10-25 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub10_00.gif" alt="기업문화" /></h3>
				</div>
				<!--시작-->				
				<div class="cul_intro">
					<p class="blindtext">아이콘 클릭시 자세한 내용을 볼 수 있습니다.</p>
                    <ul>
                    <li class="cul_link01"><a href="sub01_12_2.jsp"><span class="blindtext">일처리방식 - WORK - KNOC WAY</span></a></li>
                    <li class="cul_link02"><a href="sub01_10_1.jsp"><span class="blindtext">사명 - MISSION - 석유의 안정적 공급을 통해 국민에게 희망과 편안함을 제공</span></a></li>
                    <li class="cul_link03"><a href="sub01_11_1.jsp"><span class="blindtext">7대 경영원칙 - BUSINESS</span></a></li>
                    <li class="cul_link04"><a href="sub01_10_2.jsp"><span class="blindtext">비전 - VISION - 에너지, 그 이상의 가치를 실현하는 기업</span></a></li>
                    <li class="cul_link05"><a href="sub01_12_1.jsp"><span class="blindtext">핵심가치 - CORE VALUES</span></a></li>
                    </ul>
				</div>	 
				<!--//끝-->
			
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
						<td class="contact_user"><strong>담당자 : </strong>고유나</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2228</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
			
		</div>
	</div>
	</div>
	
	<!--// footer: start //--> 
	<%@include file="/include/comfooter.jsp"%>
	<!--// footer: end //-->
	
	</div>

</body>
</html>