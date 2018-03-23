<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","06");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>         
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
	function popup_passwd() {
		window.open("","bform","width=305,height=205,top=0,left=0,scrollbars=no");
		document.bform.submit();
	}
</script>

	

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<form name="bform" method="post" action="/sub04/pop_login.jsp" target="bform" onsubmit="do_search(this); return false;">
	<input type="hidden" name="bid" value="MINWON" />			
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="callback" value="/sub04/sub04_5_list.jsp" />			
	<input type="hidden" name="mode" value="list" />
</form>
	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_04.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>고객참여</span>
					&gt; <span class="locanow">민원(부조리)사항</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/customer/ttl_sub04_5.gif" alt="민원(부조리)사항" /></h3>
				</div>
				<div class="customer">
					<h4 class="mT0 pb10"><img src="../images/customer/img_sub04_5_01.gif" alt="한국석유공사(감사실)의 사이버 민원실을 찾아 주셔서 감사합니다. 저희 공사의 직무와 관련하여 행정처리에 대한 이의신청이나 부당하거나 억울한 사항에 대한 진정 등 민원인의 어려움을 성심성의껏 해결하여 드리겠습니다." /></h4>
					<div class="declaration pb05">
						<ul>
						<li><strong>사이버 민원실은?</strong><br />
							<ul>
								<li>- 한국석유공사와 관련된 이의 신청, 진정 등의 민원사항을 접수하여 처리 운영하는 곳입니다.</li>
							</ul></li>
						<li><strong>운영방법</strong><br />
							<ul>
								<li>- 본 민원실은 비공개 처리를 원칙으로 하여 민원인의 신분을 절대로 보호해 드립니다.</li>
								<li>- 접수민원의 처리결과 조회는 해당 민원인만이 가능합니다.<br /><span class="pl10">즉, 아래의 [처리결과 조회]란을 클릭한 후 민원인의 성명과 접수시 입력하신 비밀번호, 접수번호<br />&nbsp;&nbsp;&nbsp;(자동부여됨)를 입력하면 처리결과를</span><span class="pl10">조회하실 수 있습니다.</span></li>
								<li>- 민원처리는 7일 이내 처리를 원칙으로 하며, 불가피하게 지연될 경우에는 지연사유, 처리계획 등을 <br />&nbsp;&nbsp;&nbsp;명시한 중간 회신을 드리겠습니다.</li>
							</ul></li>
						<li><strong>유의사항</strong><br />
							<ul>
								<li>- 본 민원실은 실명을 원칙으로 하며, 석유관련 일반적인 질의 등 민원과 관련이 없는 사항은 반드시 <br />&nbsp;&nbsp;&nbsp;석유정보망<span class="pl10"><a href="http://www.petronet.co.kr/"  target="_blank" title="석유정보망 홈페이지로 이동(새창)"><span class="ce45108_b">"http://www.petronet.co.kr"</span></a>의 일반사항 등의 코너를 이용하시기 바랍니다.</span></li>
							</ul></li>
						<li><strong>연락처 : 감사실 민원담당  백은성 과장(☎ 031-380-2143 / 팩스 031-388-9371)</strong></li>
						</ul>
					</div>
					<h4 class="pt20 pb10"><img src="../images/customer/img_sub04_5_02.gif" alt="한국석유공사(감사실)의 부조리 신고실을 찾아 주셔서 감사합니다. 저희 공사는 부패추방을 통한 깨끗하고 신뢰받는 공직사회를 구현하기 위하여 노력하겠습니다. 많은 성원과 적극적인 제보를 부탁드립니다." /></h4>
					<div class="declaration pb05">
						<ul>
						<li><strong>부조리 신고란?</strong><br />
							<ul>
								<li>- 한국석유공사의 직무와 관련된 부당한 압력이나 청탁, 향응 및 금품수수행위 등의 부조리를 접수하여 <br />&nbsp;&nbsp;&nbsp;처리운영하는 곳입니다.</li>
							</ul></li>
						<li><strong>운영방법</strong><br />
							<ul>
								<li>- 본 신고실은 비공개 처리되며, 신고인의 신분은 철저히 보안을 유지하여 드립니다.</li>
								<li>- 접수민원의 처리결과 조회는 해당 민원인만이 가능합니다.<br /><span class="pl10">즉, 아래의 [처리결과 조회]란을 클릭한 후 민원인의 성명과 접수시 입력하신 비밀번호, 접수번호<br />&nbsp;&nbsp;&nbsp;(자동부여됨)를 입력하면 처리결과를</span><span class="pl10">조회하실 수 있습니다.</span></li>
								<li>- 처리는 7일 이내 처리를 원칙으로 하며, 불가피하게 지연될 경우에는 지연사유, 처리계획 등을 명시한<br />&nbsp;&nbsp;&nbsp;중간 회신을 드리겠습니다.</li>
							</ul></li>
						<li><strong>유의사항</strong><br />
							<ul>
								<li>- 신고는 실명을 원칙으로 하며, 석유관련 일반적인 질의 등 부조리와 관련이 없는 사항은 반드시<br />&nbsp;&nbsp;&nbsp;석유정보망<span class="pl10"><a href="http://www.petronet.co.kr/"  target="_blank" title="석유정보망 홈페이지로 이동(새창)"><span class="ce45108_b">"http://www.petronet.co.kr"</span></a>의 일반사항 등의 코너를 이용하시기 바랍니다.</span></li>
							</ul></li>
						<li><strong>연락처 : 감사실 민원담당 전병혁 과장(☎ 031-380-2132 / 팩스 031-388-9371)</strong></li>
						</ul>
					</div>
					<div class="customer2">					
					
					&nbsp;&nbsp;&nbsp;<BR />
					<div class="pt25" align="center">
					<table width="600px" >
					<tr>
						<td style="padding-left:50px;text-align:center;"><a href="/sub04/sub04_5_list.jsp?page=1&amp;mode=write&amp;bid=MINWON"><img src="../images/customer/btn_03.gif" alt="민원(부조리) 신고" /></a>&nbsp;<a href="#contents" onclick="popup_passwd(); return false;" title="새창"><img src="../images/customer/btn_04.gif" alt="처리결과조회" /></a></td>
						<td width="148"><a href="http://www.acrc.go.kr/acrc/board.do?command=searchDetail&menuId=0502" target="_blank"><img src="../images/customer/btn_030.gif" alt="국민권익위원회 부패신고상담 홈페이지로 이동 (새창)" /></a></td>

					</tr>
					</table>
					</div>
				</div>
				
				<div class="declaration">
						<ul>							
							<li>한국석유공사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률과 개인정보보호법 등 개인정보 관련 법령을 준수하며, 
개인정보처리방침을 통하여 다음과 같이 개인정보를 수집하여 처리함을 알려드립니다.
<br /><br />
								<ul>
									<li style="text-align:center;">
										<strong>- 다 음 -</strong>										
									</li>
								
									<li>
										<strong>1. 수집하는 개인정보 항목</strong><br />
										&nbsp;&nbsp;&nbsp;&nbsp;공사는 다음과 같은 항목들을 수집하여 처리합니다.<br />
										&nbsp;&nbsp;&nbsp;&nbsp;-성명, 비밀번호, 전화번호, 이메일, 주소, 직업
										
									</li>
									
									<li><strong>2. 개인정보의 수집·이용 목적</strong> <br />
									&nbsp;&nbsp;&nbsp;&nbsp;-민원(부조리) 게시판 운영</li>
									<!-- <li>※ 견학 관련 문의<br />
										본사 : 홍보팀 <span class="ce45108_b">(☎ 031-380-2158)</span><br />
										지사 : 각 지사 ("<a href="/sub01/sub01_5.jsp" title="조직 및 인원 페이지로 이동"><span class="ce45108_b">공사소개 > 조직 및 인원 > 연락처</span></a>" 참조)
									</li>
									-->
									
									<li><strong>3. 개인정보의 보유 및 이용기간</strong><br />
									&nbsp;&nbsp;&nbsp;&nbsp;-보유 기간 :  영구<br />
									&nbsp;&nbsp;&nbsp;&nbsp;-보유 근거 : 공사 내부 방침
									</li>
								
								</ul>
							</li>						
							
						</ul>
					</div>
			</div>
			
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
						<td><strong>담당부서 : </strong>감사실</td>
						<td><strong>연락처 : </strong>031-380-2143</td>
						<td></td>
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