<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","07");
	application.setAttribute("gNavMenuDepth2","04");
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
				<%@include file="/include/subtop_07.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>어린이</span>
                    &gt; <span>석유놀이터</span>
                    &gt; <span class="locanow">석유놀이방</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/child/ttl_sub07_4_2.gif" alt="석유놀이방" /></h3>
				</div>
				<!--시작-->
				<div id="substar">
					<ul class="tab">
                    <li><a href="sub07_4_2.jsp"><img src="/images/child/tab_sub07_4_2_1r.gif" alt="색칠하기"/></a></li>
					<li><a href="sub07_4_2_1.jsp"><img src="/images/child/tab_sub07_4_2_2.gif" alt="석유퍼즐"/></a></li>
					<li><a href="sub07_4_2_2.jsp"><img src="/images/child/tab_sub07_4_2_3.gif" alt="석유영상실"/></a></li>
					</ul>
					<!--게시판-->
					<table cellspacing="0" cellpadding="0" border="0" class="viewtype_noline mT10" summary="색칠하기 놀이를 즐길 수 있습니다.">
					<caption>색칠하기 놀이방</caption>
					<colgroup>
					<col width="160px" />
					<col width="520px" />
					</colgroup>
					<tbody>
                        <tr>
							<th scope="row" class="vTop" rowspan="3">
							<div class="imgbg"><img src="/upload/neoboard/PETRO/img02_color02.jpg" alt="한국석유공사 건물 이미지" /></div></th>
							<td style="vertical-align:top"><div class="padd10">한국석유공사 건물을 새단장 해주세요</div></td>
						</tr>
						<tr>
							<td>한국석유공사는 전략자원 석유의 안정적인 공급을 보장하기 위해 1979년에 설립되어 석유자원의 탐사 및 개발, 비축과 유통을 담당하여 왔습니다. </td>
						</tr>
						<tr>
							<td class="textri">
							<div class="textri"><a href="/upload/neoboard/PETRO/coloring01.zip" title="한국석유공사 건물 이미지 저장하기"><img src="/images/child/btn_dataok.gif" alt="한국석유공사 건물 이미지 저장하기" /></a>&nbsp;<a href="#" title="한국석유공사 건물 이미지 인쇄하기(새창)" onclick="window.open('/upload/neoboard/PETRO/coloring_print.html','ocookie','scrollbars=yes,menubar=no,width=632,height=600')"><img src="/images/child/btn_print.gif" alt="한국석유공사 건물 이미지 인쇄하기(새창)" /></a></div></td>
						</tr>
						<tr>
							<th scope="row"  class="vTop" rowspan="3">
							<div class="imgbg"><img src="/upload/neoboard/PETRO/img02_color01.jpg" alt="페트로핀과 바다 여행 이미지" /></div></th>
							<td style="vertical-align:top"><div class="padd10">페트로핀과 바다 여행을 떠나세요.</div></td>
						</tr>
						<tr>
							<td>우리나라 대륙붕에서 최초로 가스가 발견된 6-1광구의 돌고래 구조 이미지를 형상화 해서 태어난 페트로핀! 이제 페트로핀과 바다로 여행을 떠나보세요.  </td>
						</tr>
						<tr>
							<td class="textri">
								<div class="textri"><a href="/upload/neoboard/PETRO/coloring02.zip" title="페트로핀과 바다 여행 이미지 저장하기"><img src="/images/child/btn_dataok.gif" alt="페트로핀과 바다 여행 이미지 저장하기" /></a>&nbsp;<a href="#" title="페트로핀과 바다 여행 이미지 인쇄하기(새창)" onclick="window.open('/upload/neoboard/PETRO/coloring_print2.html','ocookie','scrollbars=yes,menubar=no,width=632,height=600')"><img src="/images/child/btn_print.gif" alt="페트로핀과 바다 여행 이미지 인쇄하기(새창)" /></a></div></td>
						</tr>
						</tbody>
					</table>
                </div>
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>