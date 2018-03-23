<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","04");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@include file="/include/comheader.jsp"%>


<!--// subtopNavi: start //-->
<%@include file="/include/subtopnavi_new.jsp"%>
	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->

		<div id="rightarea">
			<div id="subcnts">
			  <%@include file="/include/subtop_03.jsp"%>
			  <!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사업소개</span>
                    &gt; <span>석유비축 및 유통구조개선사업</span>
                    &gt; <span>알뜰주유소</span>
                    &gt; <span class="locanow">알뜰주유소 소개</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_8_1_1.gif" alt="알뜰주유소 소개" /></h3>
				</div>
				<!--시작-->
                <div class="cont_2012">
                	<p><img src="/images/business/egs_img.jpg" alt="economical gas stations_알뜰주유소" /></p>
                	<dl>
					<dt style="height:75px; font-size:14px;line-height:1.5em">
					알뜰주유소는 2011년 12월 1호점을 시작으로 2016년 12월말 현재 총 1,168개까지 확대되었습니다.<br />
					향후에도 알뜰주유소 활성화를 지속적으로 추진하여 서민경제 안정에 기여할 것입니다.
					</dt>
					<dt>서민경제 안정을 위한 ‘알뜰주유소’ 성공적 도입·운영 </dt>
					<dd>
					한국석유공사는 국내 석유유통구조 개선사업을 통해 유가안정을 도모하고자 알뜰주유소 사업을 개시하였습니다. 2011년 10월 알뜰주유소 사업 전담조직인 유통사업추진전담반을 구성하고, 국내 정유사들의 참여 유도, 공사 저장시설 등 인프라 확보, 사업참여자에 대한 지원방안 수립 및 합리적 가격 책정방식 도입 등 철저한 준비단계를 거쳐 2011년 12월 알뜰주유소 1호점을 개소하였으며 2016년 12월말 현재 전체 주유소의 약 9.7%에 달하는 1,168개가 전국 각지에서 운영중입니다.
					</dd>
					<dt>국내 유가 및 물가 안정에 기여</dt>
					<dd>
					공사는 알뜰주유소 사업을 통해 기존의 정유4사 중심의 독과점구조였던 국내 석유시장이 보다 공정한 시장경쟁 체제로 변화하는 데 기여하고 있으며, 저가공급과 주변 주유소의 가격 인상폭 억제로 소비자들에게 혜택을 제공하고 있습니다. 유류 공동구매 및 공사의 여유 저장시설을 활용한 저가의 석유제품 확보로 알뜰주유소에 대한 저렴한 공급체계를 구축하는 한편, 서비스 위주 경쟁을 지양토록 함으로써 알뜰주유소는 가격 경쟁력을 갖춘 원가절감형 주유소라는 새로운 패러다임을 만들어가고 있습니다. 앞으로도 한국석유공사는 알뜰주유소 확대를 지속 추진하는 한편, 효율적인 관리 및 지원을 통해 공정경쟁 여건을 조성함으로써 신정부의 정책과제, "물가의 구조적 안정화"의 기반을 마련하겠습니다.
					</dd>
					</dl>
                </div><!-- cont_2012 end -->
				<!--//끝-->
		  </div>

		  <!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2017-01-03</td>
					<td class="contact_team"><strong>담당부서 : </strong>유통사업처 유통사업팀</td>
					<td class="contact_user"><strong>담당자 : </strong>이승용</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-5202</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->

		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>