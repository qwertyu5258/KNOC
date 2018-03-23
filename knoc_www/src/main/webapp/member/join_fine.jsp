<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%!
    String getSession(HttpSession session, String attrName)
    {
        return session.getAttribute(attrName) != null ? (String)session.getAttribute(attrName) : "";
    }
%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<%@include file="/include/comheader.jsp"%>


<%
	String virtualno = getSession(session, "virtualNo");
	String userid = getSession(session, "userid");
	String gpin_aq_service_site_user_confirm = getSession(session, "GPIN_AQ_SERVICE_SITE_USER_CONFIRM");
%>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

    <div id="contents">
    <%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
    
        <div id="rightarea">
            <div id="subcnts">
               <%@include file="/include/subtop_member.jsp"%>
                <!--// location: start //-->
                <div class="locadv">
					<a href="/" title="한국석유공사 메인페이지로 이동"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
                    &gt; <span>기타서비스</span>
                    &gt; <span>회원가입</span>
                    &gt; <span class="locanow">회원가입</span>
                </div>
                <!--// location: end //-->
            
				<!-- [2009-09-29 표준코딩에 의한 수정] 작성자:장정인 -->
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_join.gif" alt="회원가입" /></h3>
                </div>
                <div class="step"><img src="../images/member/tit_step02.gif" alt="04.가입완료-다양한 서비스를 이용해보세요" />
					<ul class="stepCon">
					<li class="mL0"><img src="../images/member/img_step01.gif" alt="STEP 01.약관동의" /></li>
					<li><img src="../images/member/img_step02.gif" alt="STEP 02.본인확인" /></li>
					<li><img src="../images/member/img_step03.gif" alt="STEP 03.상세정보입력" /></li>
					<li><img src="../images/member/img_step04on.gif" alt="STEP 04.가입완료(현재페이지)" /></li>
					</ul>
				</div>
				<p class="mT20"><img src="../images/member/join_fine.gif" alt="한국석유공사 회원이 되신 것을 진심으로 축하 드립니다." /></p>
				<div class="btnCen"><a href="/member/login.jsp" title="로그인 페이지로 이동합니다."><img src="../images/member/btn_fine_ok.gif" alt="로그인 페이지로 이동합니다." /></a></div>
                    <!-- end_선언문 -->
                </div>
            </div>
        </div>
    
        <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
    </div>
</div>
</body>
</html>