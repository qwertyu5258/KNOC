<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","13");
	application.setAttribute("gNavMenuDepth3","11");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>        

<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

<script type="text/javascript">

	$(function(){
		$("#infArea img").mouseover(function(){
			var src = $(this).attr("src");
			if(src.indexOf("_on") == -1){
				$(this).attr("src", src.replace(".gif", "_on.gif"));				
			}
		}).mouseout(function(){
			var src = $(this).attr("src");
			if(src.indexOf("_on") > -1){
				$(this).attr("src", src.replace("_on", ""));
			}
		});
	});
	
</script>

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->

		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_05.jsp"%>

				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>정보공개</span> 
					&gt; <span>사전정보공표</span>
					&gt; <span class="locanow">카테고리별 정보</span>
				</div>
				<!--// location: end //-->
				
				<!-- sch_area -->
				<form name="searchform" action="./sub05_12_list.jsp" method="post">
				<input name="ses" type="hidden" value="USERSESSION">
				<input name="mode" type="hidden" value="list">		
					<!--// searchbox: end //-->
					<div id="schsec" class="st_box1">
						<fieldset class="schset">
							<legend>Search Box</legend>
							
							<select name="sType" title="목록검색선택" id="sType">
								<option value="TITLE">제목</option>
								<option value="DEPARTMENT"">부서별</option>
							</select>
							
							<label class="nlabel" for="schinput">목록검색</label>
							<input name="sWord" class="input" id="schinput" type="text" value="">							
							
							<div class="btndv"><input style="width: 33px; height: 19px;" type="image" alt="검색" src="/neoboard/skin/skin01/images/btn_search.gif"></div>
					  </fieldset>
					</div>
					<!--// searchbox: end //-->
				</form>
				<!-- //sch_area -->
								
				<div style="width:100%; text-align:center; margin-top:40px;">
					<div id="infArea" style="position:relative; left:20px ;">
						<ul class="con_list" >
							<li><a href="/sub05/sub05_12_list.jsp?gpk=1"><img src="/images/information/sub04_tit1_1.gif" alt="회사현황" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=2"><img src="/images/information/sub04_tit1_2.gif" alt="HSEQ" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=3"><img src="/images/information/sub04_tit1_3.gif" alt="감사" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=4"><img src="/images/information/sub04_tit1_4.gif" alt="사업계획서" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=5"><img src="/images/information/sub04_tit1_5.gif" alt="계약관리" /></a></li>
						</ul>	
						<ul class="con_list">
							
							<li><a href="/sub05/sub05_12_list.jsp?gpk=6"><img src="/images/information/sub04_tit2_1.gif" alt="사회공헌" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=7"><img src="/images/information/sub04_tit2_2.gif" alt="인사복지" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=8"><img src="/images/information/sub04_tit2_3.gif" alt="예산재무" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=9"><img src="/images/information/sub04_tit2_4.gif" alt="정보통신" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=10"><img src="/images/information/sub04_tit2_5.gif" alt="상생협력" /></a></li>
						</ul>
						<ul class="con_list">							
							<li><a href="/sub05/sub05_12_list.jsp?gpk=11"><img src="/images/information/sub04_tit3_1.gif" alt="석유개발" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=12"><img src="/images/information/sub04_tit3_2.gif" alt="석유비축" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=13"><img src="/images/information/sub04_tit3_3.gif" alt="알뜰주유소" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=14"><img src="/images/information/sub04_tit3_4.gif" alt="석유정보" /></a></li>
							<li><a href="/sub05/sub05_12_list.jsp?gpk=15"><img src="/images/information/sub04_tit3_5.gif" alt="홍보" /></a></li>
						</ul>
						
				    </div>
			    </div>
			    <div style="clear:both;"></div>
					<!-- div class="new_officer">
						<table summary="담당부서 및 연락처 관리일">
						<caption>담당부서 및 연락처 관리일</caption>
						<tbody>
							<tr>
								<td class="write_day"></td>
								<td class="contact_team"><strong>담당부서 : </strong>총무관리처 상생지원팀</td>
								<td class="contact_user"><strong>담당자 : </strong>차정민</td>
								<td class="contact_tel"><strong>연락처 : </strong>052-216-2607</td>
							</tr>
						</tbody>
						</table>
					</div-->
				</div>
			
		</div>
	</div>
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>

</body>
</html>