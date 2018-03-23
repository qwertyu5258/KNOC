<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>           
<%@include file="/include/comheader.jsp"%>


  <%@include file="/include/subtopnavi_new.jsp"%>
  <!--// subtopNavi: start //-->

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
                    &gt; <span>해외사업</span>
                    &gt; <span class="locanow">석유개발현황도</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_2_2.gif" alt="석유개발현황도" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                	<%@include file="sub03_2_2_map.jsp"%>
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_north_wales.gif" alt="영국캡틴" /></h4>
                        <dd class="pt10 pl20"><img src="../images/business/img_sub03_2_2_north_wales_01.gif" alt="영국캡틴 광구도" /></div>
                    
                   <p class="rtxt">[2010년 7월 현재]</p>
					<table class="chart2" summary="영국캡틴 광구 정보를 확인할 수 있습니다.">
					<caption>영국캡틴 광구 정보</caption>
					<col width="60px" />
					<col width="60px" />
					<col width="70px" />
					<col width="70px" />
					<col width="50px" />
					<col width="50px" />
					<col width="60px" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					<th scope="col">광구명</th>
					<th scope="col">운영권자</th>
					<th scope="col">지경부 신고일</th>
					<th scope="col">한국측지분<br />(%(퍼센트))</th>
					<th scope="col">한국측지분<br />공사</th>					
					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">생산사업</td>
					<td>영국 캡틴</td>
					<td>Chevron(al)</td>
					<td>'95.12</td>
					<td>15</td>
					<td>14.235</td>
					<td>SK에너지</td>
					</tr>
					</tbody>
					</table>
                        
                    <dl class="country">
					<dt><strong>영국 캡틴 광구</strong></dt>
					<dd>영국 캡틴 유전은 애버딘(Aberdeen) 북동쪽 약 145km(킬로미터) 지점에 있는 영국 북해 대륙붕 내 13/22a광구에 위치해 있으며, 수심 약 104m(미터), 면적 약 56.8㎢(평방킬로미터)이다.<br />캡틴 유전은 Chevron사와 The Korea Captain Company Limited (KCCL)이 공동으로 참여하고 있다.<br />한국석유공사와 SK에너지의 합작법인인 The Korea Captain Company Limited (KCCL)은 1996년에 Chevron-Texaco사로부터 캡틴유전 지분 15%(퍼센트)를 취득하였다.<br />캡틴 유전 운영권자는 Chevron Upstream Europe이며, 1997년 3월 6일 원유생산을 개시하여 2009년 5월말 기준 누적생산량이 223백만배럴에 달하며, 37개 생산정에서 일일생산량 약 43천배럴 수준으로 생산하고 있다.<br />주요 시설은 생산 플랫폼 2기(WPP(Welhead Protection Platform), BLP(Bridge Link Platform)), 파이프라인, FPSO(Floating Production, Storage and Offloading) 및 수송선이 있다.</dd>
					</dl>
                </div>
				<!--//끝-->
		  </div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>