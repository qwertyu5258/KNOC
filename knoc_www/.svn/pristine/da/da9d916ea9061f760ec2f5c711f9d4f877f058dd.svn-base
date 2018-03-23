<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","06");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>    
<% request.setCharacterEncoding("euc-kr"); %>

<%
	MgrSession mem_ses = (MgrSession)session.getAttribute("USERSESSION");
	String userid = "";
	if (mem_ses == null) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>회원정보 수정 처리 페이지 입니다.</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
</head>
<body>
<script type="text/javascript">
	alert("로그인 하신 후 이용 가능하십니다.");
	history.back();
</script><noscript>로그인 하신 후 이용 가능하십니다. <a href="login.jsp" title="로그인 페이지로 이동합니다.">[GO]</a>를 선택하시면 로그인 페이지로 이동합니다.</noscript>
</body>
</html>
<%		
		return;		
	} else {
		userid = mem_ses.getUserID();
		if (userid.equals("guest")) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
	<title>회원정보 수정 처리 페이지 입니다.</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="cache-control" content="no-cache" /><meta http-equiv="pragma" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
	<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
</head>
<body>
<script type="text/javascript">
	alert("로그인 하신 후 이용 가능하십니다.");
	history.back();
</script>
</body>
</html>
<%		
			return;
		}
	}
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
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">회원탈퇴</span></div>
        <!--// location: end //-->
            
                <div class="pagetle">
                    <h3 ><img src="/images/member/ttl_secession.gif" alt="회원탈퇴" /></h3>
                </div>
                <div id="boardsec" align="center">
               	  <p><img src="../images/member/img_secession_01.gif" alt="! | 회원을 탈퇴하시면 본 사이트에서 제공하는 서비스에 제한을 받게 되며, 가입시 등록하셨던 회원님의 정보는 모두 삭제됩니다. 재가입을 원하실 경우 회원가입 메뉴를 이용하여 재가입하여주시기 바랍니다." /></p>
				  <p class="pt20"><a href="secessionOk.jsp" title="회원 탈퇴하기"><img src="../images/member/btn_secession.gif" alt="회원 탈퇴하기" /></a></p>
              </div>
            </div>
      </div>
    
        <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
    </div>
</div>
