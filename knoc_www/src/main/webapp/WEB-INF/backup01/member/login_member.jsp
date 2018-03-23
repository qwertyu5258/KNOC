<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","00");
	Kcookie.setCookie(response , "okurl","/member/silmung_login.jsp" );
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<% request.setCharacterEncoding("euc-kr"); %>    
<%
	String return_url=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("returnURL")));
	String mode=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mode")));
	String bid=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("bid")));
	if(return_url == null || return_url.equals("")) {
		return_url = etcutil.DOMAIN_URL + "/index.jsp";
	}  else {
		int tag1 = return_url.indexOf("?");
		if (mode != null && !mode.equals("")) {
			if (tag1 > 0) {
				return_url = return_url + "&mode=" + mode + "&bid=" + bid;
			} else {
				return_url = return_url + "?mode=" + mode + "&bid=" + bid;
			}
		}
	}
	application.setAttribute("return_url",return_url );
%>   
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript" >
	function submit_login(){
		frm = document.form_login;
		if(frm.id.value == ""){
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false;
		} else if(frm.passwd.value == ""){
			alert("패스워드를 입력하세요");
			frm.passwd.focus();
			return false;
		} else {
			//frm.action = "<%=etcutil.SSL_DOMAIN_URL %>/member/loginOk.jsp";
			frm.action = "/member/loginOk.jsp";
			frm.submit();
		}
	}

	function testAuth() {
	    wWidth = 360;
	    wHight = 120;
	    
	    wX = (window.screen.width - wWidth) / 2;
	    wY = (window.screen.height - wHight) / 2;
	    
	    var w = window.open("/GPIN/Sample-AuthRequest.jsp", "gPinLoginWin", "directories=no,toolbar=no,left="+wX+",top="+wY+",width="+wWidth+",height="+wHight);
	    //var w = window.open("http://gpin.knoc.co.kr/Sample-AuthRequest.jsp", "gPinLoginWin", "directories=no,toolbar=no,left="+wX+",top="+wY+",width="+wWidth+",height="+wHight);
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
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">로그인</span></div>
            <!--// location: end //-->
            
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_login.gif" alt="로그인" /></h3>
                </div>
                
                <div class="members">              
 					<h4><img src="../images/member/img_login01_55.gif" alt="이사회 로그인" /></h4>
 					
 					
					<div class="loginBox3">
						<p><img src="../images/member/img_login_text.gif" alt="한국석유공사 이사회 전용 메뉴에 오신 것을 환영합니다." /></p>
						<form name="form_login" method="post" action="<%=etcutil.SSL_DOMAIN_URL %>/member/loginOk.jsp" onsubmit="submit_login();return false;" autocomplete="OFF">
						<fieldset>
						<legend>로그인</legend>
						
						<input type="hidden"  name="mode" value="login" />
						<input type="hidden"  name="return_url" value="<%=return_url %>" />
						<div class="idSearch">
                        	<ul>
                            <li><label for="id"><img src="../images/member/img_login_id.gif" alt="아이디" class="pt03" /></label><span class="pr23"></span> <input type="text" id="id" name="id" maxlength="20" class="login" title="아이디를 입력하세요" /></li>
							<li><label for="passwd"><img src="../images/member/img_login_pw.gif" alt="비밀번호" class="pt03" /></label><span class="pr10"></span> <input type="password" id="passwd" name="passwd" maxlength="32" class="login" title="비밀번호를 입력하세요" /></li>
                            </ul>							
							<div class="btn_id"><input type="image" src="../images/member/btn_submit.gif" alt="확인" /></div>
						</div>
						</fieldset>
					
						<ul class="loginTxt">
						<li><img src="/images/member/img_login_txt.gif" alt="이사회 전용 메뉴에 오신것을 환영합니다." /></li>
						<!-- 
						<li><img src="../images/member/img_find.gif" alt="아이디/비밀번호를 잃어버리셨나요?" class="vMid pr10" /> <a href="id_find.jsp" title="아이디 찾기"><img src="../images/member/btn_id_find.gif" alt="아이디 찾기" class="vMid" /></a> <a href="pw_find.jsp"><img src="../images/member/btn_pw_find.gif" alt="패스워드 찾기" class="vMid" /></a></li>
						<li><img src="../images/member/img_joinus.gif" class="vMid pr10" alt="한국석유공사의 회원이 아니시면 지금 가입하세요." /> <a href="pre_join.jsp" ><img src="../images/member/btn_joinus.gif" alt="회원가입" class="vMid"/></a></li>
						-->
						</ul>
						
						</form>
					</div> 
					 
                    

              </div>
            </div>
        </div>
    
        </div>
    
        <!--// footer: start //-->
		<%@include file="/include/comfooter.jsp"%>
		<!--// footer: end //-->
    </div>
    
</body>
</html>