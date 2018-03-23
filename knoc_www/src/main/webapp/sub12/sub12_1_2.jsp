<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","12");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","02");
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
				<%@include file="/include/subtop_12.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>인재개발센터</span>
                    &gt; <span>센터소개</span>
                    &gt; <span class="locanow">미션/비전</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-10-25 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/tit_sub12_1_2.gif" alt="미션/비전 " /></h3>
				</div>
				<!--시작-->
				<div class="business2">

						<h4><img src="/images/info/sub12_2_1.gif" alt="미션(Mission)" /></h4>
						<p>석유가스인재개발센터(KPA)는</p>
					<ul class="arrow_img02" >
						<li>연구 및 실무 중심의 차별화된 교육과정을 바탕으로,</li>
						<li>국내 석유산업을 이끌어갈 인재의 품격을 높이고,</li>
						<li>나아가 국가 에너지 품격을 높이기 위해 존재합니다.</li>
					</ul>
					<h4><img src="/images/info/sub12_2_2.gif" alt="비전(Vision)" /></h4>
					<p><img src="/images/info/sub12_01_img01.gif" alt="국내 최고의 독창적인 실무 콘텐츠 중심의 석유개발 인력양성기관" /></p>
					<h4><img src="/images/info/sub12_2_3.gif" alt="가치(Value)" /></h4>
					<p><br/><br/><img src="/images/info/sub12_01_img02.gif" alt="전문가정신(Professionalism),독창성(Originality),독창성(Originality)" /></p>
				</div>
				<div style="height:50px; clear:both;"></div>
				<!--//끝-->


				<!-- new_officer -->
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
						<td class="contact_team"><strong>담당부서 : </strong>인재경영처 인재육성팀</td>
						<td class="contact_user"><strong>담당자 : </strong>백승목</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2742</td>
					</tr>
					</tbody>
					</table>
				</div>
				<!-- new_officer -->

		</div>
	</div>

	</div>
    
        <!--// footer: start //-->
		<%@include file="/include/comfooter.jsp"%>
		<!--// footer: end //-->
    </div>
</body>
</html>