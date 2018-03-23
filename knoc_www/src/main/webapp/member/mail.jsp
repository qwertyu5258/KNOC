<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>    
<%@include file="/include/comheader.jsp"%>

  <!--// subtopNavi: start //-->
  <%@include file="/include/subtopnavi_new.jsp"%>

    <div id="contents">
        <%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
        <div id="rightarea">
            <div id="subcnts">
               <%@include file="/include/subtop_member.jsp"%>
                <!--// location: start //-->
                <div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">이메일주소무단수집거부</span></div>
        <!--// location: end //-->
            
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_mail.gif" alt="이메일주소무단수집거부" /></h3>
                </div>
                <div class="customer">
					<div class="declaration2">
						<p class="stxt"><strong>한국석유공사는 정보통신망법 제50조의 2항, 제50조의 7항 등에 의거하여, 한국석유공사가 운영, 관리하는 웹페이지 상에서</strong></p>
						<ol>
						<li>1. 이메일 주소 수집 프로그램이나 그 밖의 기술적 장치 등을 이용하여 이메일 주소를 무단으로 수집하는 행위를 거부합니다.</li>
						<li>2. 한국석유공사의 동의 없이 영리 목적의 광고성 정보를 게시하는 행위를 거부합니다.</li>
						<li><p align="right" class="pr15"><strong>[게시일 : 2009년 9월 18일]</strong></p></li>
						</ol>
					</div>
				</div>
				
				<!-- new_officer -->
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
						<td class="contact_team"><strong>담당부서 : </strong>안전환경처 정보보안팀</td>
						<td class="contact_user"><strong>담당자 : </strong>이신권</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2963</td>
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