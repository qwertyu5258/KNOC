<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
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
	
	SinmungoUserManager manager = new SinmungoUserManager();
	String gubn = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("gubn")));	
	
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */	
	String user_id = request.getParameter("user_id");
	if(user_id == null){user_id="";}
	
	HashMap hash = manager.getUserInfo(user_id); 
	
	
	String resultMsg = "";
	String returnUrl = "";
	
	//System.out.println("USER_PWD ===> "+hash.get("USER_PWD"));
	//System.out.println("USER_pwd ===> "+request.getParameter("user_pwd").toString());
	if(hash != null) {
		if(hash.get("USER_ID") == null){ //회원체크	
			resultMsg = "Not registered members.";
			returnUrl = "/ENG/sinmungo/main.jsp?gubn="+ gubn;

		}else{
			if(!hash.get("USER_PWD").equals(request.getParameter("user_pwd").toString())){ //패스워드 체크
				resultMsg = "Password is different.";
				returnUrl = "/ENG/sinmungo/main.jsp?gubn="+ gubn;
				
			}else{ //로그인SUCCESS
				session.setAttribute("SINMUNGO_ID", hash.get("USER_ID"));
				session.setAttribute("SINMUNGO_EMAIL", hash.get("EMAIL"));
				session.setAttribute("SINMUNGO_PHONE", hash.get("PHONE"));
				session.setAttribute("SINMUNGO_STATUS_NO", hash.get("STATUS_NO"));
					
				
				
				
				if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("1")){ //팀장
					returnUrl = "/ENG/sinmungo/list.jsp";
				}else{//일반				

					if(gubn.equals("form")){// 글게시하기
						returnUrl = "/ENG/sinmungo/form.jsp";					
					}else if(gubn.equals("list")){// 내가쓴글보기
						returnUrl = "/ENG/sinmungo/list.jsp";
					}			
								
				}
			}
		}
	}else{
		resultMsg = "Not registered members.";
	}
%>   

<%@ include file="../include/topmenu.jsp" %>
<!-- topmenu end -->
<script type="text/javascript">
<!--
<%
if(resultMsg.length() > 0){
%>
alert("<%=resultMsg %>");
<% } %>
location.href = "<%=returnUrl %>";


//-->
</script>

<!-- contents -->
<div id="container">
	<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">
	
	  <tr>
	    <td align="center" valign="top"><table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
	      <tr>
	        <td width="180" align="right" valign="top"><!-- leftmenu --><%@ include file="../include/leftmenu.jsp" %></td>
	        <td width="40">&nbsp;</td>
	        <td valign="top">
	        <table width="760" border="0" cellspacing="0" cellpadding="0">
	         <tr>
	            <td height="30">&nbsp;</td>
	          </tr>
	          <tr>
	            <td><!-- contimg --><%@ include file="../include/contimg05.jsp" %></td>
	          </tr>
	          <tr>
	            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt;Service &gt;<span class="loca_text"> E-Complaints Mailbox</span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub05/ttl_sub05_1_2.gif" width="109" height="24" alt="KNOC PR Room" /></td>
	          </tr>
	          <tr>
	            <td align="center" valign="top" background="0">
	
					<div class="btnsec" style="text-align: center; margin-top: 20px">
						<a href="#boardsec" onclick="goPage(); return false;"><img src="/images/member/btn_write.gif" alt="글게시하기" ></a>						
					</div>
	              
	
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