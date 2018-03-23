<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*" %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	Kcookie.setCookie(response , "okurl","/member/join.jsp" );
	
%>     
<%@include file="/include/comheader.jsp"%>

<script type="text/javascript" language="javascript">
//<![CDATA[
//<!--
	function testAuth() {
	    wWidth = 360;
	    wHight = 120;
	    
	    wX = (window.screen.width - wWidth) / 2;
	    wY = (window.screen.height - wHight) / 2;
	    
	    var w = window.open("/GPIN/Sample-AuthRequest.jsp", "gPinLoginWin", "directories=no,toolbar=no,left="+wX+",top="+wY+",width="+wWidth+",height="+wHight);
	}
//-->
//]]>
</script>
<body>
<div id="wrap">
	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

    <div id="contents">
    <%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
    
        <div id="rightarea">
            <div id="subcnts">
               <%@include file="/include/subtop_member.jsp"%>
                <!--// location: start //-->
                <div class="locadv">
                    <a href="/"><img src="/images/common/loca_home.gif" alt="HOME" /></a>
                    &gt; <span>기타서비스
</span>
                    &gt; <span>회원가입
</span>
                    &gt; <span class="locanow">회원가입</span>
                </div>
                <!--// location: end //-->
            
                <!-- [2009-09-29 표준코딩에 의한 수정] 작성자:장정인 -->
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_join.gif" alt="회원가입" /></h3>
                </div>
                <div class="members3">
					<div class="step"><img src="../images/member/tit_step02.gif" alt="02.실명인증-다양한 서비스를 이용해보세요" />
						<ul class="stepCon">
						<li class="mL0"><img src="../images/member/img_step01.gif" alt="STEP 01.약관동의" /></li>
						<li><img src="../images/member/img_step02on.gif" alt="STEP 02.실명인증(현재페이지)" /></li>
						<li><img src="../images/member/img_step03.gif" alt="STEP 03.상세정보입력" /></li>
						<li><img src="../images/member/img_step04.gif" alt="STEP 04.가입완료" /></li>
						</ul>
					</div>
                	<!-- star_선언문 -->
					<h4><img src="/images/member/join_title2.gif" alt="실명인증" /></h4>
					<div>
						<ul>
						<li><img src="/images/member/join_txt01.gif" alt="홈페이지에 대한 원활한 서비스와" />
							<span class="blindtext"> 온라인상의 익명사용자로 인한 피해를 방지하기 위하여 실명인증 서비스를 실시하고 있습니다. 고객님이 입력하신 성명과 주민등록번호는 저장되지 않고 실명확인 절차를 위해서만 이용됨을 알려드립니다. </span></li>
						<li><img src="/images/member/join_txt02.gif" alt="한국석유공사는" />
							<span class="blindtext">개인정보보호를 위해 최선의 노력을 기울이고 있습니다. </span></li>
						<li><img src="/images/member/join_txt03.gif" alt="고객님의 개인정보는" />
							<span class="blindtext">동의 없이 공개되지 않으며, 개인정보보호정책에 의해 보호받고 있습니다.</span></li>
						</ul>
					</div>
					<div class="btnCen"><a href="#" onclick="testAuth();" onkeypress="testAuth();"><img src="/images/member/btn_pre_name.gif" alt="실명확인" border="0" /></a></a></div>
					<p>실명확인은 인터넷상의 개인별변호를 의미하며, 대면확인이 어려운 인터넷에서 주민등록번호를 사용하지 않고도 본인임을 확인할 수 있는 수단입니다.</p>
                    <!-- end_선언문 -->
                </div>
            </div>
        </div>
    
        <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
    </div>
</div>
</body>
</html>