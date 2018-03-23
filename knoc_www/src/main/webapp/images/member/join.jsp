<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.mgr.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrMa" scope="page" class="kr.co.knoc.mgr.MgrHelper" />		
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	
	Kcookie.setCookie(response , "okurl","/member/login.jsp" );
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<% request.setCharacterEncoding("euc-kr"); %>
<%!
    String getSession(HttpSession session, String attrName)
    {
        return session.getAttribute(attrName) != null ? (String)session.getAttribute(attrName) : "";
    }
%>
<%
	String name = getSession(session, "realName");
	String msg = "G-PIN인증이 되지 않았습니다.";
	String url = "/member/pre_join_1.jsp";
	if( name == null || name.equals("")){ 
%>
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
		<html lang="en">
		<head>
		<title>석유공사 홈페이지에 오신것을 환영합니다.</title>
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<meta http-equiv="refresh" content="30;url=<%=url%>" >
		</head>
		<body>
		<script type="text/javascript" >
		//<![CDATA[
		//<!--
		alert("<%=msg%>");
		location.href = "<%=url%>";
		//-->
		//]]>

		</script><noscript>
		<%=msg%> <a href="<%=url%>" >[확인]</a>
		</noscript>
		</body>
		</html> 
<%
			return;
	}
	String virtualno = getSession(session, "virtualNo");
	String gpin_aq_service_site_user_confirm = getSession(session, "GPIN_AQ_SERVICE_SITE_USER_CONFIRM");

	boolean checkVirtualno = MgrMa.checkVirtualNo(virtualno);
   	if (checkVirtualno) {
%>
<script type="text/javascript">
		alert("이미 등록된 회원 입니다.");
		history.back();
</script>	
<%   	
		return;
   	}
%>

<%@include file="/include/comheader.jsp"%>

<script type="text/javascript" language="javascript">
	function do_join()
	{
		var f = document.joinform;
		if(f.userid.value == "") {
			alert("아이디를 입력해 주시기 바랍니다.");
			f.userid.focus();			
		} else if (f.userid.value.length < 4 || f.userid.value.length > 10) {
			alert("아이디는 영문소문자와 숫자와의 조합으로 4~10자입니다.");
			f.userid.focus();	
		} else if(document.loginchkform.idck.value != "OK") {
			alert("아이디 중복확인을 해주시기 바랍니다.");
			f.userid.focus();			
			return false;
		} else if(f.passwd.value == "") {
			alert("비밀번호를 입력해 주시기 바랍니다.");
			f.passwd.focus();		
		} else if (f.passwd.value.length < 5 || f.passwd.value.length > 10) {
			alert("비빌번호는 영문소문자와 숫자의 조합으로 5~10자입니다.");
			f.passwd.focus();
		} else if(f.passwd.value != f.passwd2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			f.passwd.focus();				
		} else if(f.phone1.value =="" || f.phone2.value =="" || f.phone3.value =="") { 
			alert("전화번호를 입력해 주시기 바랍니다"); 
			f.phone1.focus(); 
		} else if(!isNum(f.phone1.value) || !isNum(f.phone2.value)  || !isNum(f.phone3.value)) { 
			alert("전화번호는 숫자만을 허용합니다."); 
			f.phone1.focus(); 
		} else if(!isNum(f.mobile1.value) || !isNum(f.mobile2.value)  || !isNum(f.mobile3.value)) { 
			alert("핸드폰번호는 숫자만을 허용합니다."); 
			f.mobile1.focus(); 
		} else if(f.email_pre.value == "" || f.email_post.value == "") {
			alert("이메일 주소를 입력해 주시기 바랍니다.");
			f.email_pre.focus();	
		} else {
			f.submit();						
		}		
	}
	
	function automail(){
		var am = document.joinform.email.value;
		document.joinform.email_post.value = am;
	}

	
	function isNum(str)
	{
		var vString = "1234567890";
		for (var i=0 ;i<str.length;i++)
		{
			if(vString.indexOf(str.charAt(i)) <0)
			{
				return false;
			}
		}
		return true;
	}	
	
	function idCheck() {
		var frm = document.loginchkform;
		if (document.joinform.userid.value == "") {
			alert("아이디를 입력해 주시기 바랍니다.");
			document.joinform.userid.focus();
			return false;
		} else {
			window.open("","pop_id","width=302,height=202,scrollbars=no");
			frm.userid.value = document.joinform.userid.value;
			frm.target = "pop_id";
			frm.action = "pop_id.jsp";
			frm.submit();
			return false;
		}
	}
	
	function openZipcode() {
		window.open("/member/pop_post.jsp","pop_post","width=362,height=280,scrollbars=yes");			
	}
	
	function setZipcode(zipcode1,zipcode2,addr1) {
		document.joinform.zipno1.value = zipcode1;
		document.joinform.zipno2.value = zipcode2;
		document.joinform.addr1.value = addr1;
	}
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
                    &gt; <span>기타서비스</span>
                    &gt; <span>회원가입</span>
                    &gt; <span class="locanow">회원가입</span>
                </div>
                <!--// location: end //-->
            
                <!-- [2009-09-29 표준코딩에 의한 수정] 작성자:장정인 -->
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_join.gif" alt="회원가입" /></h3>
                </div>
                <div class="members4">
                	<!-- star_선언문 -->
                	<div class="step"><img src="../images/member/tit_step02.gif" alt="03.상세정보입력-다양한 서비스를 이용해보세요" />
						<ul class="stepCon">
						<li class="mL0"><img src="../images/member/img_step01.gif" alt="STEP 01.약관동의" /></li>
						<li><img src="../images/member/img_step02.gif" alt="STEP 02.실명인증" /></li>
						<li><img src="../images/member/img_step03on.gif" alt="STEP 03.상세정보입력(현재페이지)" /></li>
						<li><img src="../images/member/img_step04.gif" alt="STEP 04.가입완료" /></li>
						</ul>
					</div>
						<!--table-->
					<div class="mT20" id="boardsecss">
					<table cellspacing="0" cellpadding="0" class="viewtypess" summary="해당게시판은 말씀자료의 상세내용을 보여줍니다">
					<caption>해당게시판 상세보기</caption>
					<colgroup><col width="100px" /><col width="500px" /></colgroup>
<form name="loginchkform" method="post" action="">					
<input type="hidden" name="idck" value="" />	
<input type="hidden" name="userid" value="" />	
</form>							
<form name="joinform" method="post" action="<%=etcutil.SSL_DOMAIN_URL %>/member/joinOk.jsp">

						<tr>
							<th class="th1">이름</th>
							<td class="td1"><%=name%></td>
						</tr>
						<tr>
							<th class="th1">아이디</th>
							<td class="cnts1"><input type="text" value="" id="userid" name="userid" maxlength="20" class="input" style="width:100px;" /> <a href="#" onclick="idCheck();"><img src="../images/member/btn_pass.gif" alt="ID중복확인" style="cursor:pointer" /></a></td>
						</tr>
						<tr>
							<th class="th1">비밀번호</th>
							<td class="cnts1"><input type="password" value="" id="passwd" name="passwd" maxlength="32" class="input" style="width:100px;" /></td>
						</tr>
						<tr>
							<th class="th1">비밀번호확인</th>
							<td class="cnts1"><input type="password" value="" id="passwd2" name="passwd2" maxlength="32" class="input" style="width:100px;" /> </td>
						</tr>
						<tr>
							<th class="th1">전화번호</th>
							<td class="cnts1">
							<input type="text" value="" id="phone1" name="phone1" maxlength="3" class="input" style="width:50px;" /> - <input type="text" value="" id="phone2" name="phone2" maxlength="4" class="input" style="width:60px;" /> - <input type="text" value="" id="phone3" name="phone3" maxlength="4" class="input" style="width:60px;" /></td>
						</tr>
						<tr>
							<th class="th1">핸드폰번호</th>
							<td class="cnts1">
							<select id="mobile1" name="mobile1" align="absbottom">
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> <input type="text" value="" id="mobile2" name="mobile2" maxlength="4" class="input" style="width:60px;" /> - <input type="text" value="" id="mobile3" name="mobile3" maxlength="4" class="input" style="width:60px;" /></td>
						</tr>
						<tr>
							<th class="th1" rowspan="3">주소</th>
							<td class="cnts1"><input type="text" value="" id="zipno1" name="zipno1" maxlength="3" class="input" style="width:60px;" readonly onclick="openZipcode();" /> - <input type="text" value="" id="zipno2" name="zipno2" maxlength="3" class="input" style="width:60px;" readonly onclick="openZipcode();" /> <a href="#" onclick="openZipcode();"><img src="/images/board/btn_se.gif" align="top" alt="우편번호찾기" style="cursor:pointer" /></a></td>
						</tr>
						<tr>
							<td><input type="text" value="" id="addr1" name="addr1" maxlength="200" class="input" style="width:560px;" readonly onclick="openZipcode();" /></td>
						</tr>
						<tr>
							<td><input type="text" value="" id="addr2" name="addr2" maxlength="200" class="input" style="width:560px;" /></td>
						</tr>
						<tr>
							<th class="th1">이메일</th>
							<td class="cnts1"><input type="text" value="" id="email_pre" name="email_pre" maxlength="100" class="input" style="width:60px;" /> @ <input type="text" value="" id="email_post" name="email_post" maxlength="100"  class="input" style="width:60px;" />
							<select id="email" name="email" onChange="javascript:automail()" align="absbottom">
								<option value="" selected="selected">직접입력</option>
								<option value="chol.com">chol.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="empal.com">empal.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanafos.com">hanafos.com</option>
								<option value="hanmail.com">hanmail.com</option>
								<option value="hitel.net">hitel.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="nate.com">nate.com</option>
								<option value="naver.com">naver.com</option>
								<option value="netian.com">netian.com</option>
								<option value="paran.com">paran.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
							</select>
							</td>
						</tr>
						<tr>
							<th class="th1">이메일수신</th>
							<td class="cnts1"><input type="radio" value="Y" id="letter" name="letter" checked="checked" />동의
							<input type="radio" value="N" id="letter" name="letter" />동의하지 않음
							</td>
						</tr>
						<tr>
							<th class="th1">직업</th>
							<td class="cnts1">
							<select id="job" name="job">
								<option value="-- 선택 --" selected="selected">-- 선택 --</option>
								<option value="초/중/고생">초/중/고생</option>
								<option value="대학(원)생">대학(원)생</option>
								<option value="공무원">공무원</option>
								<option value="자영업">자영업</option>
								<option value="직장인">직장인</option>
								<option value="언론인">언론인</option>
								<option value="교직자">교직자</option>
								<option value="법조인">법조인</option>
								<option value="의료인">의료인</option>
								<option value="예술인">예술인</option>
								<option value="군인">군인</option>
								<option value="무직">무직</option>
								<option value="기타">기타</option>
							</select>
							</td>
						</tr>
</form>						
					</table>
					<!--//table-->
                    <!-- end_선언문 -->
					<div class="btnCen"><img src="/images/member/btn_pre_agree01.gif" alt="회원가입 "border="0" onclick="javascript:do_join();" style="cursor:pointer" />&nbsp;&nbsp;<img src="/images/member/btn_pre_can.gif" alt="취소 " border="0" onclick="javascript:history.back();" style="cursor:pointer" /></div>
                </div>
            </div>
        </div>
		<!-- G-PIN사이트에 넘겨줄 userid값 세션생성  -->
	    <% session.setAttribute("userid", null); %>
        <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
    </div>
</div>
</body>
</html>