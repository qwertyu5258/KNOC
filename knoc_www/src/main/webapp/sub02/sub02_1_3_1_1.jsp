<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","01");
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
                    &gt; <span>윤리경영</span>
					&gt; <span>윤리경영제도</span>
                    &gt; <span class="locanow">윤리경영시스템</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_1_3_1.gif" alt="윤리경영시스템" /></h3>
				</div>
				<!--시작-->				
				<div class="manageSys">
					<div>
						<ul class="tab">
						<li><a href="sub02_1_3_1.jsp" title="시스템체계" ><img src="/images/management/tab_sub02_1_3_1_1.gif" alt="시스템체계" /></a></li>
						<li><a href="sub02_1_3_1_1.jsp" title="신고보상제도" ><img src="/images/management/tab_sub02_1_3_1_2r.gif" alt="신고보상제도" /></a></li>
						<li><a href="sub02_1_3_1_2.jsp" title="청렴계약제" ><img src="/images/management/tab_sub02_1_3_1_3.gif" alt="청렴계약제" /></a></li>
						<li><a href="sub02_1_3_1_3.jsp" title="임원직무청렴계약제" ><img src="/images/management/tab_sub02_1_3_1_4.gif" alt="임원직무청렴계약제" /></a></li>
						</ul>
						<h4><img src="/images/management/sub02_1_3_1_ta2.gif" alt="신고보상제도" /></h4>
						<div class="sysBox2">
							<div><img src="/images/management/sub02_1_3_1_img2_1.gif" alt="공익신고에 대한 인센티브를 제공함으로써 자율신고문화(whistle-blowing)를 활성화시키기 위한 제도" />
							</div>
							<ol>
							<li type="1">내부공익신고
								<ul>
								<li>내부공익신고
									<p>타인의 비윤리적 행위 등에 대한 정보를 신고하는 행위</p>
								</li>
								<li>신고 대상 
									<p>업무관련 금품수수/향응제공, 직위이용 부당이득/사손, 다른 직원의 공정한 직무수행 저해(알선, 청탁 등), 기타 행동강령 위반을 통해 얻은 부당이득 </p>
								</li>
								<li>보상내용
									<p>1억원이하 : 20%</p>
									<p>1억원초과 5억원이하 : 2천만원+1억원 초과 금액의 10%</p>
									<p>5억원초과 20억원이하 : 6천만원+5억원 초과 금액의 5%</p>
									<p>20억원초과 : 1억3천5백만원+20억원 초과 금액의 3%</p>
									<p>금액산출 불가한 건 : 사안의 경중/5단계 구분 지급(100만원/500만원/1,000만원/3,000만원/5,000만원)</p>
								</li>
								<li>신고절차
									<dl>
									<dt><strong>위반행위신고서 작성</strong> <a href="/upload/data/sub02/report1_1.hwp" title="위반행위신고서 양식 다운로드"><img src="/images/management/btn_down.gif" alt="위반행위신고서 양식 다운로드"/></a></dt>
									<dd>신고접수확인(감사실)</dd>
									<dd>조사 실시(감사실)</dd>
									<dd>신고처리결과 통보(감사실)</dd>
									<dd>보상금 지급(감사실)</dd>
									</dl>
								</li>
								</ul>
							</li>

							<li type="1">자율적 공익신고
								<ul>
								<li>자율적 공익신고
									<p>자신과 관련된 비윤리적 행위 등에 대한 정보를 신고하는 행위</p>
								</li>
								<li>신고 대상 
									<p>외부인 및 공사직원으로부터 수수한 금품(현금, 상품권 등)</p>
								</li>
								<li>보상내용
									<p>3만원(또는 금액상당 상품권) 지급</p>
									<p>* 신고금액이 100만원 이상인 경우 보상심의를 통해 신고금액의 20%범위에서 최대 1,000만원까지 추가지급 가능</p>
								</li>
								<li>신고절차
									<dl>
									<dt><strong>자진신고서 작성</strong> <a href="/upload/data/sub02/report2_1.hwp" title="다운로드"><img src="/images/management/btn_down.gif" alt="자진신고서 양식"/></a></dt>
									<dd>신고 접수(감사실)</dd>
									<dd>사실 확인(감사실)</dd>
									<dd>처리결과 통보(감사실)</dd>
									<dd>보상심의(윤리경영위원회)</dd>
									<dd>보상금 지금(감사실)</dd>
									</dl>
								</li>
								</ul>
							</li>
							</ol>
							<p class="mT20"><strong>기타 고발/제보/상담 창구</strong></p>
							<ul>
							<li>- 전  화 : 052-216-2126</li>
							<li>- E-mail :<a href="mailto:yukyung.lee@knoc.co.kr" title="yukyung.lee@knoc.co.kr">yukyung.lee@knoc.co.kr</a> </li>
							<li>- 우 편 : (우:44538)울산광역시 중구 종가로 305 한국석유공사</li>
							</ul>
						</div>
					</div>

				</div>
				
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
							<td class="contact_team"><strong>담당부서 : </strong>감사실 청렴경영감사팀</td>
							<td class="contact_user"><strong>담당자 : </strong>이유경</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2126</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>