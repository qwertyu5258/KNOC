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
					<a href="/" title="한국석유공사 메인페이지로 이동"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
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
							<li><a href="sub01_4.jsp"><img src="/images/management/sub02_2_1_1_1r.gif" alt="2000년대 연혁" border="0"  id="premier_button1"/></a></li>
							<li><a href="sub01_4_1.jsp"><img src="/images/management/sub02_2_1_1_2.gif" alt="1990년대 연혁" border="0"   id="premier_button2"/></a></li>
							<li><a href="sub01_4_2.jsp"><img src="/images/management/sub02_2_1_1_3.gif" alt="1980년대 이전 연혁" border="0"   id="premier_button3"/></a></li>
							<li><a href="sub01_4_3.jsp"><img src="/images/management/sub02_2_1_1_4.gif" alt="석유공사30년사" border="0"   id="premier_button4"/></a></li>
						</ul>
						<div>
							<div><img src="/images/info/sub01_4_img1.gif" alt="history 2000's" /></div>
							
							<ul>
								 <li>
									<span>2014. 11</span>
									<p>신사옥 이전(울산광역시)</p>
								</li>
								 <li>
									<span>2014. 06</span>
									<p>시추선 두성호 건조 30주년</p>
								</li>
                                <li>
									<span>2014. 01</span>
									<p>동북아 오일허브 울산북항사업 합작법인 ‘코리아오일터미널’ 출범</p>
								</li>
                                <li>
									<span>2013. 06</span>
									<p>동북아오일허브 비전선포 및 여수저장시설 준공</p>
									<p style="position:relative; padding:10px 0 10px;"><img src="/images/management/sub07_1_1_1_1_4.gif" alt="동북아오일허브 비전선포 및 여수저장시설 준공 사진 입니다."/></p>
								</li>	
								<li>
									<span>2013. 03</span>
									<p>비전 선포식 (비 전 - 에너지 그 이상의 가치를 실현하는 기업)</p>
								</li>	
								<li>
									<span>2012. 07</span>
									<p>아부다비사무소 설립 및 KADOC Ltd(현지법인) 사업허가서 취득</p>
								</li>	
								<li>
									<span>2012. 06</span>
									<p>미국 EP Energy사 자산 인수</p>
								</li>	

							   <li>
								<span>2011. 04</span>
								<p>미국 Anadarko사 셰일오일자산 지분참여</p>
								</li>	

							   <li>
								<span>2011. 03</span>
								<p>카자흐스탄 Altius사 인수</p>
								</li>	

							   <li>
								<span> 2011. 02</span>
								<p>캐나다 Hunt사 인수</p>
								</li>	

							   <li>
								<span>2010. 09</span>
								<p>영국 Dana사 인수</p>
								</li>	

							   <li>
								<span>2009. 12</span>
								<p>카자흐스탄 Sumbe사 인수</p>
								</li>	
					

							   <li>
								<span>2009. 12</span>
								<p>캐나다 Harvest Energy사 인수</p>
								</li>							

							   <li>
								<span>2009. 02</span>
								<p>페루 Petro-Tech사 인수</p>
								</li>							
								<li>
									<span>2008. 12</span>
									<p>여수 추가비축기지 준공 </p>
								</li>
								<li>
									<span>2008. 06</span>
									<p>이라크 쿠르드 지방정부와 8개 광구 광권 계약 체결</p>
								</li>
								<li>
									<span>2008. 05</span>
									<p>미국 현지법인 ANKOR Energy 설립</p>
								</li>								
								<li>
									<span>2008. 01</span>
									<p>미국 멕시코만 생산광구 자산인수 </p>
								</li>
													<li>
									<span>2007. 09</span>
									<p>ERP 2단계 프로젝트 준공</p>
								</li>
								<li>
									<span>2007. 05</span>
									<p>캐나다 사무소 개소</p>
								</li>
								<li>
									<span>2006. 11</span>
									<p>유전개발펀드 출시</p>
								</li>
								<li>
									<span>2006. 11</span>
									<p>베트남 11-2광구 가스생산시설 준공식 개최</p>
								</li>
								<li>
									<span>2006. 11</span>
									<p>유전개발 1호 펀드 출시</p>
								</li>
								<li>
									<span>2005. 11</span>
									<p>ERP 1단계 프로젝트 준공</p>
								</li>
								<li>
									<span>2005. 10</span>
									<p>국제신용등급 획득(2010년 현재  S&amp;P:A,  Moody's:A1)</p>
								</li>
								<li>
									<span>2005. 10</span>
									<p>카자흐스탄 사무소 개소</p>
								</li>
								<li>
									<span>2005. 08</span>
									<p>서산 비축기지 지상탱크 준공</p>
								</li>
								<li>
									<span>2004. 11</span>
									<p>동해-1 가스전 준공식</p>
								</li>
								<li>
									<span>2004. 07</span>
									<p>동해-1 가스전 생산개시</p>
								</li>
								<li>
									<span>2003. 11</span>
									<p>베트남15-1 광구 원유생산 기념식</p>
								</li>
								<li>
									<span>2002. 03</span>
									<p>동해-1 가스생산시설 기공식</p>
								</li>
								<li>
									<span>2001. 08</span>
									<p>베트남 15-1광구 개발 선언</p>
								</li>
								<li>
									<span>2001. 08</span>
									<p>한국·베트남 석유개발 성공기념식 개최(2001. 08. 23)</p>
								</li>
								<li>
									<span>2000. 09</span>
									<p>베트남 15-1광구 대규모 석유 발견</p>
								</li>
								<li>
									<span>2000. 07 </span>
									<p>동해지사 설치</p>
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
						<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
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