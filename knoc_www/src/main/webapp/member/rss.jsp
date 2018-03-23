<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","05");
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
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">RSS서비스</span></div>
        <!--// location: end //-->
            
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_rss.gif" alt="RSS서비스" /></h3>
                </div>
                <div id="boardsec">
               	  <h4><img src="../images/member/img_rss_01.gif" alt="한국석유공사는 국민여러분의 편의를 위하여, 직접 한국석유공사에 접속하지 않더라도, 관심정보의 업데이트를 확인하고 새로운 소식들을 확인할 수 있는 RSS서비스를 제공하고 있습니다." /></h4>
				  <h5 class="pt25"><img src="../images/member/img_rss_02.gif" alt="제안처리절차" /></h5>
				  <div class="pt10"><img src="../images/member/img_rss_03.gif" alt="한국석유공사 홈페이지 RSS서비스 이용방법" />
					<ol class="blindtext">
						<li>01.RSS리더기를 다운로드 하여 설치를 합니다.</li>
						<li>02.아래의 한국석유공사에서 제공하는 목록 중 필요한 RSS 주소를 복사합니다.</li>
						<li>03.복사된 주소를 RSS리더에 추가합니다.</li>
						<li>04.추가하신 관심 컨텐츠들의 업데이트 정보들을 확인하실 수 있습니다.</li>
					</ol>
				  </div>
				  <h5 class="pt25 pb10"><img src="../images/member/img_rss_04.gif" alt="한국석유공사 제공 RSS주소목록" /></h5>
				  <table class="chart4" summary="한국석유공사 제공 RSS 주소목록을 확인할 수 있습니다.">
				  
				  <caption>한국석유공사 제공 RSS 주소목록</caption>
					<tbody>
					<tr>
					<th scope="row" class="table_right">보도자료</th>
					<td align="left">http://www.knoc.co.kr/sub05/sub05_2.jsp</td>
					</tr>
					<tr>
					<th scope="row" class="table_right">기술동향</th>
					<td class="table_bottom" align="left">http://www.knoc.co.kr/sub06/sub06_4_1.jsp?grp=SOIL</td>
					</tr>
					</tbody>
					</table>
              </div>
            </div>
      </div>
    
        <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
    </div>
</div>
</body>
</html>