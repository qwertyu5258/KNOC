<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>   

<%@ include file="../include/topmenu.jsp" %>
<!-- topmenu end -->
<script type="text/javascript">
	
	$(function(){
		$(document).ready(function() {
		
			$(".gubn").on("click",function(e){
				if($(this).attr("href") == "form.jsp"){// 글 게시하기
					document.bform.gubn.value = "form";
					document.bform.submit();
				}
				if($(this).attr("href") == "list.jsp"){// 내가 쓴 글보기
					document.bform.gubn.value = "list";
					document.bform.submit();
				}				
				e.preventDefault();
			});
		
		});
	});	
		
</script>

<form name="bform" method="post" action="/ENG/sinmungo/main.jsp"  onsubmit="do_search(this); return false;">
	<input type="hidden" name="gubn" value="" />
</form>

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
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="/ENG/images/info/ttl_sub05_1_2.gif" width="161" height="24" alt="E-Complaints Mailbox" /></td>
	          </tr>
	          <tr>
	            <td align="center" valign="top" background="0">
					<div class="btnsec" style="text-align: center; margin-top: 50px">
						<p style="padding-bottom:10px ;"><img src="/ENG/images/member/eng_sinmungo.gif" alt="" /></p>
 						<a href="form.jsp" class="gubn"><img src="/ENG/images/member/btn_sc.gif" alt="글게시하기" ></a>
 						<a href="list.jsp" class="gubn"><img src="/ENG/images/member/btn_vmc.gif" alt="내가쓴글보기" ></a>									
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