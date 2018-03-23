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
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<% request.setCharacterEncoding("euc-kr"); %> 
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
	function find_pwd(){
		frm = document.idform;
		if(frm.name.value == ""){
			alert("이름을 입력하세요");
			frm.name.focus();
			return false;
		} else if(frm.id.value == ""){
			alert("아이디를 입력하세요");
			frm.id.focus();
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
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">비밀번호 찾기</span></div>
            <!--// location: end //-->
            
				<!-- [2009-09-29 표준코딩에 의한 수정] 작성자:장정인 -->
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_pw_find.gif" alt="비밀번호 찾기" /></h3>
                </div>
                <div class="members">
                	<div class="memBox">					
               			<div class="passTxt">
							<img src="../images/member/img_login_text.gif" alt="한국석유공사 홈페이지를 방문해주셔서 감사합니다." />
							<ul>
							<li><img src="../images/member/img_pw_find_01.gif" alt="이름, 아이디, 이메일을 입력하신 후 PW(비밀번호) 찾기 버튼을 눌러주세요." /></li>
							<li><img src="../images/member/img_pw_find_02.gif" alt="이름, 아이디, 이메일이 일치할 경우 등록된 휴대폰으로 비밀번호를 신규 발행하여 발송하여 드립니다." /></li>
							<li><img src="../images/member/img_pw_find_03.gif" alt="신규 발행된 비밀번호는 기억하기 쉬운 비밀번호로 변경 후 사용하여 주십시오." /></li>
							</ul>
						</div>
						<form name="idform" method="post" action="<%=etcutil.SSL_DOMAIN_URL %>/member/pw_ok.jsp" onsubmit="find_pwd();return false;">
							<fieldset>
							<legend>비밀번호 찾기</legend>
								<div class="passConfirm">
									<ul>
									<li class="mT0"><label for="name"><img src="../images/member/img_pw_find_name.gif" alt="이름" class="pt03" /></label><span class="pr23"></span> <input type="text" id="name" name="name" maxlength="32" value="" class="login" title="이름을 입력하세요" /></li>
									<li><label for="id"><img src="../images/member/img_login_id.gif" alt="아이디" class="pt03" /></label><span class="pr23"></span> <input type="text" id="id" name="id" maxlength="20" value="" class="login" title="아이디를 입력하세요" /></li>
									<li><label for="email"><img src="../images/member/img_id_find_email.gif" alt="이메일" class="pt03" /></label><span class="pr23"></span> <input type="text" id="email" name="email" maxlength="200" value="" class="login" title="이메일을 입력하세요" /></li>
									</ul>
									<div class="btn_pass"><input type="image" src="../images/member/btn_pw_find_02.gif" alt="PW(비밀번호) 찾기" /></div>
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