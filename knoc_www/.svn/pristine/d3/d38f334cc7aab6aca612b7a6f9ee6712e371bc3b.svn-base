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
			if(request.getParameter("rtype")!=null){
				return_url += ("&rtype=" + request.getParameter("rtype"));
			}
		}
	}
	application.setAttribute("return_url",return_url );
		

	// 비밀번호 다수 틀릴시 로그인 제한 로직 시작	
	String sess = "";
	
	if(session.getAttribute("loginSession") == null || session.getAttribute("loginSession").equals("")){
		session.setAttribute("loginSession", "");
	}else{
		sess = (String)session.getAttribute("loginSession");
	}

	int chkCookie = 0;
	Cookie[] co = request.getCookies();	
	
	for (int i=0; i<co.length; i++) {
		if (co[i].getName().equals("cntPasswdCookie")) {
			chkCookie = 1;
		}
	}	
		
	if(sess.equals("YY") && chkCookie == 0){  
		session.setAttribute("loginSession", "");
	}else if(sess.equals("Y")){ // Y: 비밀번호 체크 로직에서 넘어온 값
		Cookie cookie = new Cookie ("cntPasswdCookie", "Y");
		cookie.setMaxAge(600);	
		response.addCookie(cookie);
		
		session.setAttribute("loginSession", "YY");
		chkCookie = 1;
	}
	
	// 비밀번호 다수 틀릴시 로그인 제한 로직 종료
	
	
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
			frm.action = "loginOk.jsp";
			frm.submit();
		}
	}

	function testAuth() {
		
		
		if(<%=chkCookie %> == 1){
			alert("비밀번호를 5회 이상 틀리셨습니다. 로그인이 제한 됩니다.");
			return false;
		}
		
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
					<h4 class="mT30"><img src="../images/member/img_i_pin_02.gif" alt="공공아이핀(i-pin) 인증" /></h4>
                	
					<div class="loginBox4">
						<p><img src="../images/member/img_login_text01.gif" alt="한국석유공사 홈페이지를 방문해주셔서 감사합니다." /></p>
						
						<div class="ipinTxt">
	<img src="../images/member/img_i_pin_05.gif" alt="우리 한국석유공사는 별도의 회원가입 절차가 없습니다. 게시글 작성 등 홈페이지 이용은 i-pin 인증을 이용하여 주시기 바랍니다. I-PIN은 개인정보 유출방지를 위한 주민등록번호를 대신하는 인터넷상의 개인식별번호를 의미합니다. 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 23조의 2(주민등록번호외의 회원가입 방법)에 따라 홈페이지 게시판에 글을 게시할땐 반드시 공공아이핀(I-PIN) 인증을 받으셔야 합니다. 공공아이핀(I-PIN)이 없으신 분들은 등록 후 사용하여 주시기 바랍니다." /></div>
						<div class="btnCen"><a href="/GPIN/Sample-AuthRequest.jsp" onclick="testAuth();return false;" target="_blank" title="새창"><img src="../images/member/btn_i_pin.gif" alt="공공아이핀(I-PIN) 인증" /></a></div>
					</div>
					<!-- 회원가입 삭제[2011.07]
 					<h4><img src="../images/member/img_login_55.gif" alt="기존 회원으로 로그인" /></h4>
 					
 					
					<div class="loginBox2">
						<p><img src="../images/member/img_login_text.gif" alt="한국석유공사 홈페이지를 방문해주셔서 감사합니다." /></p>
						<form name="form_login" method="post" action="<%=etcutil.SSL_DOMAIN_URL %>/member/loginOk.jsp" onsubmit="submit_login();return false;" AUTOCOMPLETE="OFF">
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
						<li><img src="../images/member/img_find.gif" alt="아이디/비밀번호를 잃어버리셨나요?" class="vMid pr10" /> <a href="id_find.jsp" title="아이디 찾기"><img src="../images/member/btn_id_find.gif" alt="아이디 찾기" class="vMid" /></a> <a href="pw_find.jsp"><img src="../images/member/btn_pw_find.gif" alt="패스워드 찾기" class="vMid" /></a></li>
						<li><img src="../images/member/img_joinus.gif" class="vMid pr10" alt="한국석유공사의 회원이 아니시면 지금 가입하세요." /> <a href="pre_join.jsp" ><img src="../images/member/btn_joinus.gif" alt="회원가입" class="vMid"/></a></li>
						</ul>
						</form>
					</div> 
					 -->
                    
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