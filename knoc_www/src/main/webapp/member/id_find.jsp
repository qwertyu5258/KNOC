<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>       
<% request.setCharacterEncoding("euc-kr"); %> 
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
	function find_id(){
		frm = document.idform;
		if(frm.name.value == ""){
			alert("이름을 입력하세요");
			frm.name.focus();
			return false;
		} else if(frm.email.value == ""){
			alert("이메일 주소를 입력하세요");
			frm.email.focus();
			return false;
		} else {
			frm.submit();
		}
	}
</script>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
    <div id="contents">
        <%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
        <div id="rightarea">
            <div id="subcnts">
               <%@include file="/include/subtop_member.jsp"%>
                <!--// location: start //-->
                <div class="locadv">
					
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">아이디 찾기</span></div>				
            <!--// location: end //-->
			
				<!-- [2009-09-29 표준코딩에 의한 수정] 작성자:장정인 -->
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_id_find.gif" alt="아이디 찾기" /></h3>
                </div>
				
				<div class="members">
					<div class="memBox">
						<div class="loginTxt"><img src="../images/member/img_login_text.gif" alt="한국석유공사 홈페이지를 방문해주셔서 감사합니다." />
							<ul>
							<li><img src="../images/member/img_id_find_01.gif" alt="이름과 이메일을 입력하신 후 확인 버튼을 눌러주세요" /></li>
							<li><img src="../images/member/img_id_find_02.gif" alt="입력하신 이름과 이메일이 일치할 경우 아이디를 확인하실 수 있습니다." /></li>
							</ul>
						</div>
						<form name="idform" method="post" action="<%=etcutil.SSL_DOMAIN_URL %>/member/id_ok.jsp" onsubmit="find_id();return false;"> 
						<fieldset>
							<legend>아이디 찾기</legend>
							<div class="idSearch">
								<ul>
								<li><label for="name" class="mR20"><img src="../images/member/img_pw_find_name.gif" alt=" 이름" class="pt03" /></label> <input type="text" id="name" name="name" maxlength="20" value="" class="login" title="이름을 입력하세요" /></li>
								<li><label for="email" class="mR20"><img src="../images/member/img_id_find_email.gif" alt="이메일" class="pt03" /></label> <input type="text" id="email" name="email" maxlength="200" value="" class="login" title="이메일을 입력하세요" /></li>
								</ul>
								<div class="btn_id"><input type="image" src="../images/member/btn_submit.gif" alt="확인"/></div>
							</div>
						</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
    
        <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
    </div>
</div>
</body>
</html>