<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
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
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>열린경영</span>
					&gt; <span class="locanow">경영공시</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2.gif" alt="경영공시" /></h3>
				</div>
				<!--시작-->
				<div class="management">
					<div class="manage01">
						<strong>한국석유공사는 경영에 대한 중요정보를 투명하게 공개하여 국민에게 신뢰받는 기업이 되겠습니다.</strong>
						<p>[경영공시 시행근거]</p>
						<ul>
						<li>공공기관의 운영에 관한 법률 제11조(경영공시) 및 제12조(통합공시)</li>
						<li>공공기관의 운영에 관한 법률 시행령 제14조(경영공시) 및 제15조(통합공시)</li>
						</ul>												
						<p>&nbsp;&nbsp;※ 공사의 경영공시 상세내용에 대한 문의 또는 관련문서의 열람 등이 필요하신 경우 전화(031-380-2165)로 </br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의 주시기 바랍니다.</p>
					</div>
					
					<!--<div class="manage02">
						<p>공사의 경영공시 상세내용에 대한 문의 또는 관련문서의 열람 등이 필요하신 경우 전화(031-380-2165)로 문의 주시기 바랍니다.</p>
						<div><a href="/sub04/sub04_2.jsp" title="고객상담실 페이지로 이동"><img src="/images/management/sub02_2_btn.gif" width="157" height="51" alt="고객상담실 페이지로 이동"/></a></div>
					</div>-->	
					
								
					<ul>
					<li>
							
						<dl>
						<dt><img src="/images/management/img_sub02_2_te1.gif" alt="일반현황"/></dt>
						<dd><a href="/sub02/sub02_2_1_1.jsp">설립근거, 설립목적<br/>및 연혁</a></dd>
						<dd><a href="/sub02/sub02_2_1_2.jsp">정관 및 관련법령</a></dd>
						<dd><a href="/sub02/sub02_2_1_3.jsp">자본금 및 주주현황</a></dd>
						<dd><a href="/sub02/sub02_2_1_4.jsp">임원현황</a></dd>
						<dd><a href="/sub02/sub02_2_1_5.jsp">조직도 및 주요업무</a></dd>
						<dd><a href="/sub02/sub02_2_1_6.jsp">투자 및 출자현황</a></dd>
						<dd><a href="/sub02/sub02_2_1_7.jsp">사규</a></dd>
						<dd><a href="/sub02/sub02_2_1_8_list.jsp">사규 제.개정예고</a></dd>
						</dl>
					</li>
					<li>
						<dl>
						<dt><img src="/images/management/img_sub02_2_te2.gif" alt="경영현황"/></dt>
						<dd><a href="/sub02/sub02_2_2_2.jsp">경영목표</a></dd>
						<dd><a href="/sub02/sub02_2_2_3.jsp">운영계획</a></dd>
						<dd><a href="/sub02/sub02_2_2_4.jsp">성장전망</a></dd>
						<dd><a href="/sub02/sub02_2_2_5.jsp">국회업무보고</a></dd>
						<dd><a href="/sub02/sub02_2_2_6.jsp">석유개발사업현황</a></dd>
						<dd><a href="/sub02/sub02_2_2_7.jsp">석유비축사업현황</a></dd>
						<dd><a href="/sub02/sub02_2_2_8.jsp">시추선 조업일수 <br/>및 가동률</a></dd>
						<dd><a href="/sub02/sub02_2_2_9.jsp">사업비계획</a></dd>
						</dl>
					</li>
					<li>
						<dl>
						<dt><img src="/images/management/img_sub02_2_te3.gif" alt="재무현황"/></dt>
						<dd><a href="/sub02/sub02_2_3_1.jsp">재무제표</a></dd>
						<dd><a href="/sub02/sub02_2_3_2.jsp">외부회계감사보고서</a></dd>
						<dd><a href="/sub02/sub02_2_3_3.jsp">신용등급 및 신뢰도</a></dd>
						<dd><a href="/sub02/sub02_2_3_4.jsp">장·단기 차입금현황</a></dd>
						<dd><a href="/sub02/sub02_2_3_5.jsp">사채원부</a></dd>
						<dd><a href="/sub02/sub02_2_3_6.jsp">담보제공현황</a></dd>
						<dd><a href="/sub02/sub02_2_3_7.jsp">채무보증</a></dd>
							
							
						<dd><a href="/sub02/sub02_2_3_9.jsp">주요재무비율</a></dd>
							
						<dd><a href="/sub02/sub02_2_3_10.jsp">수입·지출현황</a></dd>
							
						<dd><a href="/sub02/sub02_2_3_11.jsp">주요사업별 수익</a></dd>
							
						<dd><a href="/sub02/sub02_2_3_12.jsp">예산</a></dd>
							
						<dd><a href="/sub02/sub02_2_3_13.jsp">손익전망</a></dd>
							
						<dd><a href="/sub02/sub02_2_3_14.jsp">공공기관 투자집행 현황</a></dd>
						
						<dd><a href="/sub02/sub02_2_3_15.jsp">납세정보현황</a></dd>
							
						</dl>
					</li>
					<li>
						<dl>
						<dt><img src="/images/management/img_sub02_2_te4.gif" alt="인적자원현황"/></dt>
						<dd><a href="/sub02/sub02_2_4_11.jsp">인원현황</a></dd>
						<dd><a href="/sub02/sub02_2_4_1.jsp">신규채용현황</a></dd>
						<dd><a href="/sub02/sub02_2_4_2.jsp">공공기관 인턴채용 현황</a></dd>
						<dd><a href="/sub02/sub02_2_4_9.jsp">유연근무현황</a></dd>
						<dd><a href="/sub02/sub02_2_4_3.jsp">임원연봉</a></dd>
						<dd><a href="/sub02/sub02_2_4_4.jsp">직원평균보수</a></dd>
						<dd><a href="/sub02/sub02_2_4_5.jsp">신입사원 초임</a></dd>
						<dd><a href="/sub02/sub02_2_4_6.jsp">복리후생현황</a></dd>
						<dd><a href="/sub02/sub02_2_4_7.jsp">인력개발현황</a></dd>
						<dd><a href="/sub02/sub02_2_4_8.jsp">노사관계 및 근로조건</a></dd>
						</dl>
					</li>
					<li>
						<dl>
						<dt><img src="/images/management/img_sub02_2_te5.gif" alt="내·외부평가"/></dt>
						<dd><a href="/sub02/sub02_2_5_1.jsp">국정감사</a></dd>
						<dd><a href="/sub02/sub02_2_5_2.jsp">감사원감사</a></dd>
						<dd><a href="/sub02/sub02_2_5_3.jsp">자체감사결과</a></dd>
						<dd><a href="/sub02/sub02_2_5_4.jsp">경영실적 평가결과</a></dd>
						<dd><a href="/sub02/sub02_2_5_6.jsp">고객만족도 조사결과</a></dd>
						<dd><a href="/sub02/sub02_2_5_7.jsp">감사직무실적 평가결과</a></dd>
						</dl>
					</li>
					<li>
						<dl>
						<dt><img src="/images/management/img_sub02_2_te6.gif" alt="기타정보"/></dt>
						<dd><a href="/sub02/sub02_2_6_10_2.jsp">기관장업무추진비</a></dd>
						<dd><a href="/sub02/sub02_2_6_12_2.jsp">임원업무추진비</a></dd>
						<dd><a href="/sub02/sub02_2_6_11.jsp">임원국외출장정보</a></dd>
						<dd><a href="/sub02/sub02_2_6_2.jsp">임원추천위원회 회의록</a></dd>
						<dd><a href="/sub02/sub02_2_6_1.jsp">이사회 회의록</a></dd>
						<dd><a href="/sub02/sub02_2_6_8.jsp">퇴직임원 취업현황</a></dd>
						<dd><a href="/sub02/sub02_2_6_5.jsp">중소기업상품 등 <br/>구매실적</a></dd>
						<dd><a href="/sub02/sub02_2_6_6.jsp">전자조달규모</a></dd>
						<dd><a href="/sub02/sub02_2_6_7.jsp">연간 출연 및 증여</a></dd>
						<dd><a href="/sub02/sub02_2_6_9.jsp">연간주요거래내역</a></dd>						
						<dd><a href="/sub02/sub02_2_6_4.jsp">품질 및 기술수준</a></dd>
						</dl>
					</li>
					</ul>
					<div class="infoCheck"><div style="clear:both ; height:20px ;"></div><%@include file="/include/satisfy_link.jsp"%></div>
				</div>				
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>