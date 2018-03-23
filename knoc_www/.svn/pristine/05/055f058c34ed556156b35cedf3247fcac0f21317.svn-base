<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>

<% 	
	ArrayList leftmenu = MenuMa.getMenuList(gNavMenuDepth1,"Y");
%>
	<div id="leftarea">
		<div class="menuleftdv" >
<%if(gNavMenuDepth1 != null){ %>        
	<% if(gNavMenuDepth1.equals("01")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="공사소개" /></h2>
	<% } else if(gNavMenuDepth1.equals("02")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="열린경영" /></h2>
	<% } else if(gNavMenuDepth1.equals("03")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="사업소개" /></h2>
	<% } else if(gNavMenuDepth1.equals("04")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="고객참여" /></h2>
	<% } else if(gNavMenuDepth1.equals("11")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="사이버홍보실" /></h2>
	<% } else if(gNavMenuDepth1.equals("05")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="정부3.0 정보공개" /></h2>
	<% } else if(gNavMenuDepth1.equals("06")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="석유개발연구원" /></h2>
	<% } else if(gNavMenuDepth1.equals("07")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="어린이" /></h2>
	<% } else if(gNavMenuDepth1.equals("08")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="이사회" /></h2>
	<% } else if(gNavMenuDepth1.equals("09")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="기타서비스" /></h2>
	<% } else if(gNavMenuDepth1.equals("12")) { %>
	        <h2><img src="/img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="석유가스 인재개발센터" /></h2>
	<% } %>
<% } %>
        	<ul>
<%
	Iterator iterm = leftmenu.iterator();
	String oldMCode = "";
	String oldMCode2 = "";
	String flag = "";
	String flag2 = "";
	while(iterm.hasNext()){		
		MenuBean mb = (MenuBean)iterm.next();
		if (!oldMCode.equals("") && !oldMCode.equals(mb.getMCode().substring(2,4)) && oldMCode.equals(gNavMenuDepth2) && flag.equals("Y")) {
%>
					</ul>
<%		
			flag = "";	
			flag2 = "";	
		} else if (!oldMCode2.equals("") && !oldMCode2.equals(mb.getMCode().substring(4,6)) && oldMCode2.equals(gNavMenuDepth3) && mb.getMCode().substring(6,8).equals("00") && flag2.equals("Y")) {
%>
			</ul>
<%		
			flag = "";	
			flag2 = "";			

		}

		if (mb.getMCode().substring(4,8).equals("0000")) {
			if (flag.equals("") && flag2.equals("") && !oldMCode.equals("")) {
%>
					</li>
<%
			}				
			if (!mb.getMCode().substring(2,4).equals(gNavMenuDepth2)) {
%>
				<li><div class="smenu_off"><a href="<%=mb.getUrl()%>"><span class="s1_off"><%=mb.getName() %></span></a></div>
<% 			} else {	%>				
				<li><div class="smenu_on"><a href="<%=mb.getUrl()%>"><span class="s1_on"><%=mb.getName() %></span></a></div>
<%			}	%>					
<%		
		} else if (mb.getMCode().substring(6,8).equals("00") && mb.getMCode().substring(2,4).equals(gNavMenuDepth2)) {

			String strTarget2 = "";
			String strLinkUrl2 = mb.getUrl();
			if(strLinkUrl2 != null && strLinkUrl2.length() > 5 && strLinkUrl2.substring(0, 4).equals("http")) {
				strTarget2 = " target=\"_blank\"";
			}

			if (flag.equals("")) {
				%>
					<ul class="sleftul">				
			<% } %>					
					<li <% if (mb.getMCode().substring(4,6).equals(gNavMenuDepth3)) { %>class="son2"<% } else { %>class="son"<% } %>><a href="<%=mb.getUrl()%>"<%=strTarget2%>><%=mb.getName() %></a></li>
<%
			flag = "Y";			
		} else if (mb.getMCode().substring(2,4).equals(gNavMenuDepth2) && mb.getMCode().substring(4,6).equals(gNavMenuDepth3) && !mb.getMCode().substring(6,8).equals("00")) {
			if (flag2.equals("")) {
%>			
					</ul>
					<ul>
<%				}	


/**
* 수정일 : 2015. 02. 24
* 수정자 : 마용민(milgam12@inplusweb.com)
* 내  용 : 외부링크 추가
*/

String strTarget = "";
String strLinkUrl = mb.getUrl();

if(strLinkUrl != null && strLinkUrl.length() > 5 && strLinkUrl.substring(0, 4).equals("http")) {
	strTarget = " target=\"_blank\"";
}

%>										
						<li class="meneu_4"><a href="<%=mb.getUrl()%>"<%=strTarget%>><% if (mb.getMCode().substring(6,8).equals(gNavMenuDepth4)) { %><span class="lnb_over"><% } %>- <%=mb.getName() %><% if (mb.getMCode().substring(6,8).equals(gNavMenuDepth4)) { %></span><% } %></a></li>
<%			
				flag2 = "Y";
			
		} else {
		}
		
		oldMCode = mb.getMCode().substring(2,4);
		oldMCode2 = mb.getMCode().substring(4,6);
	}
	if (flag.equals("Y") || flag2.equals("Y")) {
%>
					</ul>
<%
	}
%>				     
        
				</li>	
        	</ul>
		</div>
	<%if(gNavMenuDepth1.equals("02")) { %>
		<div class="mt20">
			<div>
				<!-- a href="http://www.alio.go.kr/home.html" target="_blank" ><img src="/images//management/sub02_2_alio_btn.png"  alt="공공기관 창의경영시스템" /></a-->
				<!-- 
				<a href="#" onclick="openFalsenessLayer(); return false;"><img src="/images//management/sub02_2_non_btn.png" style="margin-top:3px; " alt="불성실공시 기관 지정 관련 공지" /></a>
				 -->
			</div>
			<div id="falsenessLayer" style="display:none;  width:320px; border:2px solid #0085c2; padding:10px; z-index:9999;  background-color:#fff; position: relative; top:-5px; ">
				<div>
					<ul>
						<li>ㅇ 공사는 경영정보공시(알리오) 실태 일제점검<span style="letter-spacing: -1px">(14.2.24~3.23)</span><br />&nbsp;&nbsp;&nbsp;결과 불성실공시기관으로 지정되었습니다.</li>
						<li>※ 기재부 점검결과 : 점검대상 295개 기관 중 291개 기관<br />&nbsp;&nbsp;&nbsp; “불성실공시기관” 으로 지정, 4개기관은 “기관주의”</li>
						<li style="margin-top:8px;">ㅇ 새로운 마음으로 고객의 알권리 충족 및 투명경영 실천을<br />&nbsp;&nbsp;&nbsp; 위해 최선을 다하겠습니다.</li>
					</ul>
				</div>
				<div style="text-align:center ; margin-top:10px;"><a href="#" onclick="closeFalsenessLayer(); return false;"><img src="/images/2013/btn_close.gif" alt="close" /></a></div>
			</div>
		</div>
	<%} %>
	</div>	
	
<script>
	function openFalsenessLayer(){
		$J("#falsenessLayer").show();
	}
	
	function closeFalsenessLayer(){
		$J("#falsenessLayer").hide();
	}

</script>