<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","09");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>             
<%@include file="/include/comheader.jsp"%>


	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

<script type="text/javascript">
//<![CDATA[
           
	function tabCtrl(tNo){
		$J("div.tab-grp").hide();
		if(tNo == 1){
			$J("div.tab-grp:first").show();
			$J("img.tab-img:first").attr("src", "/images/new_sub/tab1_on.gif");
			$J("img.tab-img:eq(1)").attr("src", "/images/new_sub/tab2_off.gif");
			
		}else if(tNo == 2){
			$J("div.tab-grp:eq(1)").show();
			$J("img.tab-img:first").attr("src", "/images/new_sub/tab1_off.gif");
			$J("img.tab-img:eq(1)").attr("src", "/images/new_sub/tab2_on.gif");
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
                    &gt; <span class="locanow">찾아오시는길</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_9.gif" alt="석유공사로 찾아오시는길" /></h3>
				</div>
				<!-- 
				<div style="height:24px; margin:40px 20px 0 20px;">					
					<ul class="tab">
						<li><a href="#" onclick="tabCtrl(1); return false;" title="조직도"><img class="tab-img" src="/images/new_sub/tab1_on.gif" alt="안양" /></a></li> 
						<li><a href="#" onclick="tabCtrl(2); return false;" title="각 부서 주요업무"><img class="tab-img" src="/images/new_sub/tab2_off.gif" alt="울산신사옥" /></a></li>
					</ul>				
				</div>
				-->
				<div class="map tab-grp" style="display:none;">
					<div>
						<img src="/images/directors/sub08_6-1.gif" alt="석유공사로 찾아오시는길(자세한 설명은 아래 글 참조)" />
					</div>

					<h4>지하철 이용시</h4>
					<p>4호선 평촌역 2번 출구 → 이마트사거리 → SK주유소 → 250M 직진 → 한국석유공사 (도보로 5분)</p>
					
					<h4>버스 이용시</h4>
					<ol>
						<li>
							<strong>① 시내버스 301번</strong><br /><p class="pl20 pt05">오산 → 수원역 → 범계사거리 → 안양교육청 하차 → 한국석유공사 (도보로 5분)</p>
						</li>
						<li>
							<strong>② 좌석버스 303번</strong><br />
							<p class="pl20 pt05">분당(오리역) → 서현역 → 인덕원 → 평촌도서관 하차 → 한국석유공사 (도보로 5분)</p>
						</li>
						<li>
							<strong>③ 좌석버스 1303번</strong><br />
							<p class="pl20 pt05">한국외대 → 죽전 → 분당(오리역) → 수내역 → 인더원 → 평촌도서관 하차 → 한국석유공사 (도보로 5분)</p>
						</li>
						<li>
							<strong>④ 좌석버스 333번</strong><br />
							<p class="pl20 pt05">성남 → 모란역 → 외곽순환고속도로 → 농수산물시장 → 안양시청 하차 → 한국석유공사 (도보로 10분)</p>
						</li>
						<li>
							<strong>⑤ 좌석버스 3330번</strong><br />
							<p class="pl20 pt05">분당 → 외곽순환고속도로 → 농수산물시장 → 안양시청 하차 → 한국석유공사 (도보로 10분)</p>
						</li>
						<li>
							<strong>⑥ 마을버스 5-1번</strong><br />
							<p class="pl20 pt05">안양역 → 범계역 → 한국석유공사</p>
						</li>
						<li>
							<strong>⑦ 마을버스 6-1번</strong><br />
							<p class="pl20 pt05">범계역 → 동안구청 → 한국석유공사</p>
						</li>
					</ol>					

					<h4>자가용 이용시</h4>
					<ol>
						<li>
							<strong>① 서울(강남) 방면에서 오실 때</strong><br /><p class="pl20 pt05">사당/양재 → 과천 → 정부종합청사 → 인덕원사거리 → 500m 직진 → 인덕원교에서 우회전 → 1,000m 직진 → 이마트 사거리 (SK주유소)에서 우회전 → 한국석유공사</p>
						</li>
						<li>
							<strong>② 서울에서 경수산업도로를 이용하여 오실 때</strong><br />
							<p class="pl20 pt05">시흥IC → 대림대학 → 비산사거리 → 범계역 사거리에서 좌회전 (* 시흥IC로부터 범계역 사거리 거리는 약 5,500m) → 1,600m 직진 (안양시청 경유) → 이마트 사거리 (SK주유소)에서 좌회전 → 한국석유공사</p>
						</li>
						<li>
							<strong>③ 경부고속도로를 이용하여 오실 때</strong><br />
							<p class="pl20 pt05">판교IC → (서울외곽순환고속도로) 학의IC → 평촌IC → 200m 직진 → 사거리 → 안양시청 이정표 방향으로 1,800m 직진 (한림대성심병원 경유) → 안양교육청에서 우회전 → 250m 직진 → 한국석유공사</p>
						</li>
						<li>
							<strong>④ 일산, 김포공항 방면에서 오실 때</strong><br />
							<p class="pl20 pt05">(서울외곽순환고속도로) 산본IC → 평촌IC → 11시 방향으로 500m 직진 → 사거리 →  안양시청 이정표 방향으로 1,800m 직진 (한림대성심병원 경유) → 안양교육청에서 우회전 → 250m 직진 → 한국석유공사</p>
						</li>
					</ol>
					<p class="address">주소 : 경기도 안양시 동안구 관평로 212번길 57 (우:431-711) TEL : 031) 380-2114 / FAX : 031) 387-9323</p>
				</div>
				
				<div class="map tab-grp" >
					<div>
						<img src="/images/new_sub/new_map.gif" alt="석유공사로 찾아오시는길(자세한 설명은 아래 글 참조)" />
					</div>
					
					<h4>KTX울산역 출발</h4>
					<ol>
						<li>
							<strong>리무진 버스</strong><br />
                            <p class="pl20 pt05">- 5005 : 한국석유공사 하차</p>
						</li>
						<li>
							<strong>자가용</strong><br />
							<p class="pl20 pt05">- 울산역 -> 북부순환도로 -> 울산교육청에서 좌회전 -> 동원로얄듀크 지나 우회전 후 직진</p>
						</li>
					</ol>					

					<h4>울산공항 출발</h4>
					<ol>
						<li>
							<strong>리무진 버스</strong><br />
                            <p class="pl20 pt05">- 5005 : 한국석유공사 하차</p>
						</li>
					</ol>	

					<h4>울산시내 출발</h4>
					<ol>
						<li>
							<strong>시내 버스</strong><br />
                            <p class="pl20 pt05">- 257, 431, 824, 827 : 한국석유공사 하차</p>
						</li>
					</ol>	

				
				
				
				<h4>주소</h4>
					<ol>
						<li>
							<strong>울산 중구 종가로 305 (우:44538) <br/>
							TEL : 052) 216 - 2114	<br/> FAX : 052) 216 - 5900</strong> <br />
                          
						</li>
					</ol>	

					<!--p class="address">주소 : 경기도 안양시 동안구 관평로 212번길 57 (우:431-711) TEL : 031) 380-2114 / FAX : 031) 387-9323</p-->
				</div>

			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀 </td>
						<td class="contact_user"><strong>담당자 : </strong>송수미</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2114</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
			
			
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>