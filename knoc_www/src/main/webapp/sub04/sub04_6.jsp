<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","06");
	application.setAttribute("gNavMenuDepth3","00");
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
	<input type="hidden" name="bid" value="BUDGET" />
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="callback" value="/sub04/sub04_6_list.jsp" />
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
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a> &gt; <span>고객참여</span> &gt; <span class="locanow">예산낭비신고센터</span>
				</div>
				<!--// location: end //-->
				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/customer/ttl_sub04_6.gif" alt="예산낭비신고센터" /></h3>
				</div>
				<div class="customer">
				<h4 class="mT0 pb10"><img src="../images/customer/img_sub04_6_01.gif" alt="예산낭비신고센터는 한국석유공사에서 수행하고 있는 일중에서 예산이 낭비되고 있다고 국민 여러분들이 판단하는 사인에 대해 의견수렴을 하기 위해서 운영하는 곳입니다.." /></h4>
				<div class="declaration pb05">
					<ul>
						<li>예산낭비와 관련없는 일반적인 민원사항은 <a href="/sub04/sub04_2.jsp" title="고객상담실 페이지로 이동"><span class="ce45108_b">[고객상담실]</span></a>, <a href="/sub04/sub04_5.jsp" title="민원(부조리)사항 페이지로 이동"><span class="ce45108_b">[민원(부조리)사항]</span></a>을 이용해 주시기 바랍니다.</li>
						<li>예산낭비신고센터에 신고된 내용은 비공개로 처리되며, 신고인의 신원은 철저히 보장됩니다.</li>
						<li>신고된 내용에 대해서는 철저한 조사를 통하여 가능한 빠른 시일내에 결과를 회신해 드리겠으며, 잘못된 내용은 지속적으로 개선토록 노력하겠습니다.</li>
						<li>담당 : 예산팀 정재현(☎ 052-216-2316)</li>
					</ul>
				</div>
				<div class="customer2">
					<div class="declaration">
						<ul>
							<li>한국석유공사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률과 개인정보보호법 등 개인정보 관련 법령을 준수하며, 개인정보처리방침을 통하여 다음과 같이 개인정보를 수집하여 처리함을 알려드립니다.<br />
								<br />
								<ul>
									<li style="text-align:center;"> <strong>- 다 음 -</strong> </li>
									<li> <strong>1. 수집하는 개인정보 항목</strong><br />
										&nbsp;
										&nbsp;
										&nbsp;
										&nbsp;
										공사는 다음과 같은 항목들을 수집하여 처리합니다.<br />
										&nbsp;
										&nbsp;
										&nbsp;
										&nbsp;
										-성명, 비밀번호, 전화번호, 이메일 </li>
									<li><strong>2. 개인정보의 수집·이용 목적</strong> <br />
										&nbsp;
										&nbsp;
										&nbsp;
										&nbsp;
										-예산낭비신고센터 게시판 운영</li>
									<li><strong>3. 개인정보의 보유 및 이용기간</strong><br />
										&nbsp;
										&nbsp;
										&nbsp;
										&nbsp;
										-보유 기간 : 게시물 삭제 요청시까지 또는 게시글 등록 후 3년 경과시(자동파기)<br />
										&nbsp;
										&nbsp;
										&nbsp;
										&nbsp;
										-보유 근거 : 공사 내부 방침 </li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="pt25" align="center">
						<a href="/sub04/sub04_6_list.jsp?page=1&amp;mode=write&amp;bid=BUDGET" title="예산낭비 신고하기"><img src="../images/customer/btn_05.gif" alt="예산낭비 신고하기" /></a> <a href="#" onclick="popup_passwd();" title="처리결과조회 (정보입력 새창)"><img src="../images/customer/btn_04.gif" alt="처리결과조회 (정보입력 새창)" /></a>
					</div>
				</div>
			</div>

			<!-- new_officer -->
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"></td>
					<td class="contact_team"><strong>담당부서 : </strong>예산투자처 예산팀</td>
					<td class="contact_user"><strong>담당자 : </strong>정재현</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2316</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->

		</div>
	</div>	

	</div>
    
        <!--// footer: start //-->
		<%@include file="/include/comfooter.jsp"%>
		<!--// footer: end //-->
    </div>
    
</body>
</html>