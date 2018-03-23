<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sinmungo.SinmungoUserManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	SinmungoUserManager manager = new SinmungoUserManager();
	
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */	
	String user_id = request.getParameter("user_id");
	if(user_id == null){user_id="";}
	
	HashMap hash = manager.getAdminInfo(user_id); 
	
	
	String resultMsg = "";
	String returnUrl = "";
	
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */	
	 if(hash != null) {	 
		if(hash.get("USER_ID") == null){ //회원체크	
			resultMsg = "관리자 아이디 및 비밀번호와 일치하지 않습니다. 확인해주십시오.";
		}else{
			if(!hash.get("USER_PWD").equals(request.getParameter("user_pwd").toString())){ //패스워드 체크
				resultMsg = "패스워드가 다릅니다.";
				returnUrl = "main.jsp";
			}else{ //로그인SUCCESS
				session.setAttribute("SINMUNGO_ID", hash.get("USER_ID"));
				session.setAttribute("SINMUNGO_EMAIL", hash.get("EMAIL"));
				session.setAttribute("SINMUNGO_PHONE", hash.get("PHONE"));
				session.setAttribute("SINMUNGO_STATUS_NO", hash.get("STATUS_NO"));
				
				
				
				
				if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("3")){ //팀장
					session.setAttribute("SINMUNGO_OBM_TYPE", hash.get("USER_ID"));
					returnUrl = "list.jsp";
				}else{//일반
					returnUrl = "notice.jsp";
				}
			}
		}
	}else{
		resultMsg = "관리자 아이디 및 비밀번호와 일치하지 않습니다. 확인해주십시오.";
	}		
	
	
%>   

 
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contentsLayer">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
<script type="text/javascript">
<!--
<%
if(resultMsg.length() > 0){
%>
alert("<%=resultMsg %>");
location.href = "/ombudsman/main.jsp";
<%
}

if(resultMsg.length() == 0){
	//if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("1")){	
%>
location.href = "<%=returnUrl %>";
<%
	//}
}
%>

//-->
</script>
	<div id="rightarea">
		<div id="subcnts">	
			<!-- 디자인팀 수정요청[start] -->
			<%@include file="/include/subtop_04.jsp"%>
			<!-- 디자인팀 수정요청[end] -->
			
			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
				&gt; <span>고객참여</span>&gt; <span class="locanow">청렴 옴부즈만 신고센터</span>
			</div>
			<!--// location: end //-->

			<div class="pagetle">				
				<h3><img src="/images/customer/ttl_sub04_8_1.gif" alt="인사 청탁&bull;알선 신문고" /></h3>
			</div>
			<div class="customer">
			<h4 class="mT0 pb10"><img src="../images/customer/sinmungo_tit.gif" alt="'인사청탁,알선 신문고' '안내문 인사청탁,알선 신문고'는 인사 청탁,알선행위 관련 직원들의 자유로운 의견개진을 지원하여 조직 내 인사 불공정행위를 예방하기 위하여 운영되는 곳입니다." /></h4>	
			<div class="declaration" >						
				<ul>
					<li> 공사 직원들만 이용하여 주시고, 공사와 관련하여 상담신청, 공사관련 제안, 민원 및 신고사항 등이 있으신 외부고객께서는 고객상담실, 고객/국민제안, 고객민원/신고를 이용하여 주시기 바랍니다. </li>
					<li> 개인 인사이동희망 등 인사상담은 사내포털 e-HR 메뉴의 인사관리 시스템을 이용해주시기 바랍니다. </li>
					<li> ‘인사 청탁·알선 신문고’에 제출된 의견은 무기명·비공개로 인사팀장만 확인 가능하며, 제출자의 신원은 확인되지 않습니다. </li>
				</ul>						
			</div>
				
			<div class="btnsec" style="text-align: center; margin-top: 20px">
				<a href="#boardsec" onclick="goPage(); return false;"><img src="/images/member/btn_write.gif" alt="글게시하기" ></a>						
			</div>
			</div>	
		</div>
	</div>
</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

</body>
</html>

