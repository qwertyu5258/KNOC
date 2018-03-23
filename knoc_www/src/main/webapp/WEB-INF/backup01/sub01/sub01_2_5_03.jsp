<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","13");
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
                    &gt; <span>CI</span>
                    &gt; <span class="locanow">CI 활용</span>
				</div>
				<!--// location: end //-->
<script type="text/javascript" src="/ebook/kor/common.js"></script>
<script type="text/javascript" src="/ebook/eng/common.js"></script>				
				
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_2_5_03.gif" alt="CIP" /></h3>
				</div>
								
				<div class="cip">
					
					<!-- div class="cip_tab">
						<ul>
							<li><a href="/sub01/sub01_2_5.jsp"><img src="/images/cip/cip_tab01.gif" alt="identifier" /></a></li>
							<li><a href="/sub01/sub01_2_5_01.jsp"><img src="/images/cip/cip_tab02.gif" alt="signature" /></a></li>
							<li><a href="/sub01/sub01_2_5_02.jsp"><img src="/images/cip/cip_tab03.gif" alt="basic elements" /></a></li>
							<li><a href="/sub01/sub01_2_5_03.jsp"><img src="/images/cip/cip_tab04_on.gif" alt="application system" /></a></li>
						</ul>
						<div class="dummy"></div>						
						<p class="ebook_kor"><a href="#kor" onclick="ecatalog('/ebook/kor/','','4','yes');"><img src="/images/cip/btn_ebook_kor.gif" alt="e-book국문" /></a></p>
						<p class="ebook_eng"><a href="#eng" onclick="ecatalog('/ebook/eng/','','5','yes');"><img src="/images/cip/btn_ebook_en.gif" alt="e-book영문" /></a></p>
					</div--><!-- cip_tab end -->
					
					<div class="cip_down">
						<a href="/cip_down/identifier/Utilizing.zip"><img src="/images/cip/btn_wm_dw.gif" alt="활용파일다운로드" /></a> 
					</div>
					
					<div class="application_system">
						
						<h5>application system</h5>
						<dl class="app_04">
							<dt>4. stationery</dt>
							<dd>4-01 명함</dd>
							<dd>4-02 명함_계열사용</dd>
							<dd>4-03 소봉투 A</dd>
							<dd>4-04 소봉투 B</dd>
							<dd>4-05 중봉투_고급형</dd>
							<dd>4-06 중봉투_일반형 A</dd>
							<dd>4-07 중봉투_일반형 B</dd>
							<dd>4-08 대봉투_고급형</dd>
							<dd>4-09 대봉투_일반형 A</dd>
							<dd>4-10 대봉투_일반형 B</dd>
							<dd>4-11 레터헤드 A</dd>
							<dd>4-12 레터헤드 B</dd>
							<dd>4-13 레터헤드 C</dd>
							<dd>4-14 팩스커버</dd>
							<dd>4-15 기안지</dd>
							<dd>4-16 보도자료</dd>
							<dd>4-17 공고지</dd>
							<dd>4-18 재직증명서</dd>
							<dd>4-19 인사기록카드</dd>
							<dd>4-20 메모지_대</dd>
							<dd>4-21 메모지_중 &middot; 소</dd>
							<dd>4-22 문서보관서류철</dd>
							<dd>4-23 파일커버</dd>
							<dd>4-24 바인더</dd>
							<dd>4-25 결재판</dd>
							<dd>4-26 노트</dd>
							<dd>4-27 업무수첩 &amp; 포켓수첩</dd>
							<dd>4-28 이메일 서명</dd>
							<dd>4-29 파워포인트 포맷 A,B</dd>
							<dd>4-30 파워포인트 포맷 C,D,E</dd>
							<dd>4-31 초청장</dd>
							<dd>4-32 연말연시카드</dd>
							<dd>4-33 달력</dd>
						</dl>
						
						<dl class="app_05">
							<dt>5. general affairs</dt>
							<dd>5-01 사기</dd>
							<dd>5-02 노조기</dd>
							<dd>5-03 배지</dd>
							<dd>5-04 명찰 &amp; 명패</dd>
							<dd>5-05 사원증</dd>
							<dd>5-06 방문증</dd>
							<dd>5-07 주차증</dd>
							<dd>5-08 스티커</dd>
							<dd>5-09 상장</dd>
							<dd>5-10 장표류 케이스</dd>
							<dd>5-11 감사패 &amp; 공로패</dd>
						</dl>
						
						<dl class="app_06">
							<dt>6. public relations</dt>
							<dd>6-01 연구보고서 표지포맷</dd>
							<dd>6-02 뉴스레터 &amp; 정기간행물 표지포맷</dd>
							<dd>6-03 리플렛 &amp; 브로슈어 표지포맷</dd>
							<dd>6-04 신문광고</dd>
							<dd>6-05 잡지광고</dd>
							<dd>6-06 포스터</dd>
							<dd>6-07 프레스킷</dd>
							<dd>6-08 쇼핑백</dd>
							<dd>6-09 포장지</dd>
							<dd>6-10 포장박스</dd>
							<dd>6-11 포장끈 &amp; 테이프</dd>
							<dd>6-12 종이컵</dd>
							<dd>6-13 배너</dd>
							<dd>6-14 현수막</dd>
							<dd>6-15 DVD 포맷 &amp; 케이스</dd>
							<dd>6-16 홈페이지 &amp; 모바일 홈페이지 메인화면</dd>
							<dd>6-17 웹진 &amp; 오피넷 &amp; 인트라넷 메인화면</dd>
							<dd>6-18 앱 아이콘 &amp; 웹 배너 &amp; 팝업</dd>
						</dl>
						
						<dl class="app_07">
							<dt>7. uniform</dt>
							<dd>7-01 티셔츠</dd>
							<dd>7-02 근무복</dd>
							<dd>7-03 안내원 &amp; 경비원복</dd>
							<dd>7-04 운동복</dd>
							<dd>7-05 모자 &amp; 안전모</dd>
						</dl>
						
						<dl class="app_08">
							<dt>8. vehicles</dt>
							<dd>8-01 버스</dd>
							<dd>8-02 소형버스</dd>
							<dd>8-03 승합차</dd>
							<dd>8-04 승용차</dd>
							<dd>8-05 트럭</dd>
							<dd>8-06 소방차</dd>
						</dl>
						
						<dl class="app_09">
							<dt>9. signage</dt>
							<dd>9-01 채널사인</dd>
							<dd>9-02 캐노피사인</dd>
							<dd>9-03 론사인</dd>
							<dd>9-04 지주사인</dd>
							<dd>9-05 도로유도사인</dd>
							<dd>9-06 종합안내사인</dd>
							<dd>9-07 층별안내사인</dd>
							<dd>9-08 부서사인</dd>
							<dd>9-09 안내사인</dd>
							<dd>9-10 게시판</dd>
							<dd>9-11 이미지월</dd>
							<dd>9-12 안내데스크</dd>
							<dd>9-13 공공사인</dd>
							<dd>9-14 픽토그램</dd>
							<dd>9-15 윈도우그래픽</dd>
							<dd>9-16 연단사인</dd>
							<dd>9-17 비축탱크 &amp; 매설배관판 사인</dd>
							<dd>9-18 플랫폼 사인</dd>
						</dl>
						
						<dl class="app_10">
							<dt>10. character</dt>
							<dd>10-01 캐릭터 기본형</dd>
							<dd>10-02 캐릭터 응용형</dd>
						</dl>
						
					</div><!-- application_system end -->
					
				</div><!-- cip end -->
				
				<div style="clear:both ;"></div>
				
			</div>
			
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
			</div>
			<!-- new_officer end -->
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>

</body>
</html>