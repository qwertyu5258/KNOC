<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.util.*"%>        
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<jsp:useBean id="etc" class="com.neoboard.util.EtcUtil" scope="page" />    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	String gubn = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("gubn")));	
	
%>   

<%@ include file="../include/topmenu.jsp" %>
	<!--link rel="stylesheet" type="text/css" href="/include/css/common.css" /-->
    <link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
    <link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
<!-- topmenu end -->
<script type="text/javascript">
	//<![CDATA[
	function submit_chk() {
	
		if(document.getElementById("user_id").value == ""){
			alert("Enter the ID, please.");
			return false;
		}
		
		if(document.getElementById("user_pwd").value == ""){
			alert("Enter the password, please.");
			return false;
		}

		document.log_in.action = "https://www.knoc.co.kr/ENG/sinmungo/login.jsp";
	}
	//]]>	
</script>

<!-- contents -->
<div id="container">
	<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">
	
	  <tr>
	    <td align="center" valign="top"><table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
	      <tr>
	        <td class="lnb_area">
			<!-- leftmenu -->
			<%@ include file="../include/leftmenu.jsp" %>
			<!-- //leftmenu -->
			</td>
	        <td width="30">&nbsp;</td>
	        <td valign="top">
	        <table class="con_wrap" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><!-- contimg --><%@ include file="../include/contimg05.jsp" %></td>
	          </tr>
	          <tr>
	            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt;Service &gt;<span class="loca_text"> E-Complaints Mailbox</span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="/ENG/images/info/ttl_sub05_1_2.gif" width="161" height="24" alt=" E-Complaints Mailbox" /></td>
	          </tr>
	          <tr>
	            <td align="center" valign="top" background="0">
					<div id="substar">
						
						<div class="ENG_sinLogin">
							<fieldset>
							<legend>로그인</legend>
							<form name="log_in" action="https://www.knoc.co.kr/ENG/sinmungo/login.jsp" method="post" onsubmit="return submit_chk();">              	
							<input type="hidden" name="gubn" value="<%=gubn%>" />							
								<div class="loginBox">
									
									<p class="blindtext">한국석유공사 홈페이지를 방문해 주셔서 감사합니다.</p>
									
									<div><label for="id"><img src="../images/member/img_login_id.gif" alt="아이디" /></label><input  type="text" id="user_id" name="user_id" maxlength="20" /></div>								
									<div><label for="passwd"><img src="../images/member/img_login_pw.gif" alt="비밀번호"/></label><input type="password" id="user_pwd" name="user_pwd" maxlength="32" /></div>
								
								</div>
								<div class="loginbtn"><input type="image" src="../images/member/btn_submit.gif" alt="확인"/></div>
							
							</form>
	
							</fieldset>
						</div>
	              
					</div>
	
	              
	
				</td>
	          </tr>
	          <tr>
	              	<td>
	<div style="height:20px ;"></div>
	<div class="new_officer eng">
		<table summary="Department Contacts Updated">
		<caption>Department Contacts Updated</caption>  
		<tbody>
		    <tr>
		    	<td class="write_day"><!-- strong>Updated : </strong>2016-04-05-->&nbsp;</td>
		        <td class="contact_team"><strong>Department : </strong>Internal Auditing Dept.</td>
		        <td class="contact_tel"><strong>Contacts : </strong>+82)52-216-2124</td>																        
		    </tr>
		</tbody>
		</table>
	</div><!-- new_officer end -->  
	              	</td>
	              </tr>
	          <tr>
	          	<td height="40">&nbsp;</td>
	          </tr>
	          
	        </table></td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
</div>
<!-- contents end-->

<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->


</body>
</html>