<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>   
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
	//<![CDATA[
	function submit_chk(f) {
		if(!f.id.value) {
			window.alert('아이디를 입력하세요.');
			f.id.focus();
			return false;
		}else{
	  
			var special = ",;'#/*";
			for(var i = 0 ; i < f.id.value.length; i++)
			{
				ch = f.id.value.charAt(i); //아이디 입력폼에 값을 하나씩 가져온다.
				for(var j=0; j < special.length; j++)
				{ 
					if(ch == special.charAt(j))
	   				{
						alert("특수 문자는 안됩니다.");
	    					f.id.value = "";
						f.id.focus();
	    					return false;
					}
				}
			}
		}
		if(!f.passwd.value) {
			window.alert('비밀번호를 입력하세요.');
			f.passwd.focus();
			return false;
		}
	}
	//]]>	
</script>

	<!--// subtopNavi: start //-->
	<%@include file="/include/subtopnavi_new.jsp"%>
	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
                    &gt; <span>CEO</span>
                    &gt; <span class="locanow">GREAT WAY</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_1_4.gif" alt="GREAT WAY" /></h3>
				</div>
				<!-- 2009-10-24 로그인 수정-->
				<div id="substar">
					<p><img src="../../images/info/img_great_knoc_02_new.gif" alt="GREAT Way는 사내직원들의 경영진에 대한 자유로운 의견게진을 지원하여 창의적인 기업문화를 구축하기 위하여 운영되는 곳입니다." /></p>
					<div class="comLogin">
						<fieldset>
						<legend>로그인</legend>
						<form name="log_in" action="channel_login_proc.jsp" method="post" onsubmit="return submit_chk(this);">              	
							
							<div class="loginBox">
								
								<p class="blindtext">한국석유공사 홈페이지를 방문해 주셔서 감사합니다.</p>
								
								<div><label for="id"><img src="../images/member/img_login_id.gif" alt="아이디" /></label><input type="text" id="id" name="id" maxlength="20" /></div>
								
								<div><label for="passwd"><img src="../images/member/img_login_pw.gif" alt="비밀번호"/></label><input type="password" id="passwd" name="passwd" maxlength="32" /></div>
							
							</div>
							<div class="loginbtn"><input type="image" src="../images/member/btn_submit.gif" alt="확인"/></div>
						
						</form>

						</fieldset>
					</div>
              
				</div>
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>비서팀 </td>
						<td class="contact_user"><strong>담당자 : </strong>최서윤</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2033</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>