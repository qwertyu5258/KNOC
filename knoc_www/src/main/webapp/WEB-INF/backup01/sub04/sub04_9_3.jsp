<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","11");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>        
<%@include file="/include/comheader.jsp"%>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

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
					&gt; <span>정보마당</span> 
					&gt; <span class="locanow">정보공개</span>
                </div>
                <!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
                <div class="pagetle">
                    <h3 class="tleimg"><img src="/images/information/ttl_sub05_4_1.gif" alt="정보공개" /></h3>
                </div>
                <div class="officer" >
					<ul class="tab">
						<li><a href="/sub04/sub04_9_1.jsp" ><img src="/images/business/tab_sub04_9_1.gif" alt="정보공개제도안내 "/></a></li>
						<li><a href="/sub04/sub04_9_3.jsp" ><img src="/images/business/tab_sub04_9_3_1on.gif" alt="온라인청구"/></a></li>
						<li><a href="/sub04/sub04_9_3_1.jsp" ><img src="/images/business/tab_sub04_9_3_2.gif" alt="오프라인청구" /></a></li>
					</ul>
					<div style="width:256px; float:right; margin-top:-30px ">
					<a href="http://www.open.go.kr" target="_blank"><img src="/images/business/btn_sub04_9_1_1.gif" alt="정보정보공개시스템 바로가기" /></a>
					<a href="http://www.gov30.go.kr/gov30/int/intro.do" target="_blank"><img src="/images/business/btn_sub04_9_1.gif" alt="정부3.0 이란 상세보기" /></a>
					</div>
			  	 </div> <!-- officer end  -->
			   <div class="business" >				
				<img src="/images/business/img_ttl_sub04_9_3_1_02.gif" alt="온라인 정보공개청구"/>
				<h5>정보공개청구는 한국석유공사의 정보공개와 관련된 사항만 청구할 수 있으며,
				 일반적인 질의나 민원사항은 고객참여<br /> 고객상담실 및 고객민원/신고 등을 이용하여 주시기 바랍니다.</h5>
		
				<h5>한국석유공사 세부기준</h5>
				<ul>
					<li>공공기관의 정보공개에 관한 법률 제 9조 제1항 각 호에 해당하는 공사 비공개 세부기준을 확인하신 후 정보공개청구를 이용하여 주시기 바랍니다.</li>
				</ul>
				
				
				</div>
			
				<div style="float:left; margin:30px 0px 20px 100px;">	
					<a href="/filedown.jsp?fileno=19&amp;filepath=/upload/form_download/" title="비공개 세부기준download" >
					<img src="/images/business/closed_documen_download.gif" alt="비공개 세부기준  download" /></a>
					 <a href="/sub04/sub04_9_3_2.jsp"><img src="/images/business/btn_claim.gif" alt="청구하기" /></a>
				</div>	
			  
			</div> <!-- subcnts end -->
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>총무관리처 총무팀</td>
						<td><strong>연락처 : </strong>052-216-2607</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
				</table>
			</div> <!--new_officer end -->
			
		</div>
	</div>
	
  <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>