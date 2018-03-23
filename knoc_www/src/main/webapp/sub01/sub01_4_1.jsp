<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","04");
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
                    &gt; <span class="locanow">회사연혁</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_4.gif" alt="회사연혁" /></h3>
				</div>
				<!--시작-->
				<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
				<div class="great2">
					<div>
						<ul class="tab">
							<li><a href="sub01_4.jsp"><img src="/images/management/sub02_2_1_1_1.gif" alt="2000년대 연혁" border="0"  id="premier_button1"/></a></li>
							<li><a href="sub01_4_1.jsp"><img src="/images/management/sub02_2_1_1_2r.gif" alt="1990년대 연혁" border="0"   id="premier_button2"/></a></li>
							<li><a href="sub01_4_2.jsp"><img src="/images/management/sub02_2_1_1_3.gif" alt="1980년대 이전 연혁" border="0"   id="premier_button3"/></a></li>
							<li><a href="sub01_4_3.jsp"><img src="/images/management/sub02_2_1_1_4.gif" alt="석유공사30년사" border="0"   id="premier_button4"/></a></li>

						</ul>
						<div>
							<div><img src="/images/info/sub01_4_img2.gif" alt="history 1990's" /></div>
							<ul>
								<li>
									<span>1999. 05</span>
									<p>곡성지사 설치</p>
								</li>
								<li>
									<span>1999. 01</span>
									<p>한국석유공사로 명칭변경</p>
								</li>
								<li>
									<span>1998. 09</span>
									<p>여수지사 설치</p>
								</li>
								<li>
									<span>1998. 07</span>
									<p>동해-1 가스전 발견</p>
								</li>
								<li>
									<span>1998. 05</span>
									<p>용인지사 설치</p>
								</li>
								<li>
									<span>1997. 10</span>
									<p>인도네시아 현지법인 KSL설립</p>
								</li>
								<li>
									<span>1997. 01</span>
									<p>페루사무소 개소</p>
								</li>
								<li>
									<span>1996. 02</span>
									<p>영국 현지법인 KCCL 설립</p>
								</li>
								<li>
									<span>1995. 07</span>
									<p>석유개발센터 준공</p>
								</li>
								<li>
									<span>1994. 12</span>
									<p>출자회사 한국송유관(주)매각 및 (주)대한송유관공사 출자</p>
								</li>
								<li>
									<span>1994. 10</span>
									<p>출자회사 한국석유시추(주) 통합</p>
								</li>
								<li>
									<span>1992. 10</span>
									<p>베트남사무소 개소</p>
								</li>
							</ul>
						</div>
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