<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","03");
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
	<input type="hidden" name="bid" value="OMBUDS" />			
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
					&gt; <span class="locanow">청렴 옴부즈맨 신고센터</span>
				</div>
				<!--// location: end //-->
				
				<div class="customer">
					<h4  /></h4>
					<div class="declaration pb05">
						<ul>
						<li><strong>한국석유공사「청렴옴부즈만」신고센터를 찾아 주셔서 감사합니다.</strong><br />
							<ul>
								<li>- 한국석유공사는 독립성을 갖춘 외부인을 청렴옴부즈만으로 위촉하여</li>
								<li>&nbsp;&nbsp;경영의 책임성·투명성을 제고하기 위해 노력하고 있습니다.</li>
								<li>- 청렴옴부즈만 신고센터는 공사 임직원 비위행위, 계약관련 불공정 행위, 업무관련 불만·불편사항에 대해</li>
								<li>&nbsp;&nbsp;민원인이 직접「청렴옴부즈만」에게 신고하기 위해 마련된 곳입니다. </li>
							</ul></li>
						<li><strong>신고대상</strong><br />
							<ul>
								<li>- 임직원 부패·비위사건</li>
								<li>- 계약관련 불공정 행위</li>
								<li>- 공사 업무관련 불만·불편사항, 고객서비스 개선 요구 사항</li>
							</ul></li>
						<li><strong>신고접수와 처리절차</strong><br />
							<ul>
								<li>- 청렴옴부즈만에게 신고가 접수되면 사실 확인 절차를 거쳐 신고자에게 조치결과를 알려드립니다.</li>
								<li>- 처리절차</li>
								<img src="/images/management/ttl_sub04_5_1_2.gif" width="500" height="219" border="0" alt="">
                            </ul></li>
						<li><strong>신고방법</strong><br />
							<ul>
								<li>- 누구든지 공사직무와 관련된 부패행위 및 불공정 계약행위 등을 알게 된 때는 청렴옴부즈만에게 신고할 수 있습니다.</li>			<li>- 신고는 공사홈페이지 옴부즈만 신고센타, 우편서신, 팩스를 이용하시면 됩니다.</li>
								<li>- 신고사안은 비공개 처리되며, 신고인의 신분은 철처히 보안을 유지하여 드립니다.</li>
								<li>- 신고는 실명을 원칙으로 하며, 석유관련 일반적인 질의 등 민원과 관련이 없는 사항은 반드시 석유정보망<br /><span class="pl10"><a href="http://www.petronet.co.kr/"  target="_blank" title="석유정보망 홈페이지로 이동(새창)"><span class="ce45108_b">"http://www.petronet.co.kr"</span></a>의 일반사항 등의 코너를 이용하시기 바랍니다.</span></li>
							</ul></li>
						<li><strong>연락처 : 감사실 (☎ 031-380-2132 / 팩스 031-388-9371)</strong></li>
						</ul>
					</div>
                    <BR /></br>
					<BR /></br>
						<li><strong>[청렴 옴부즈만 신고]</strong><br />
							<ul>
							<tr>
							<BR />
			      			<th scope="row" class="th1" colspan="2"><label for="subject">신고유형(선택 하세요)</label></th>						
				        	</tr>
					        <BR /><tr>
						    <td class="cnts1" colspan="2">
							<input type="radio" name="type" value="1"> 부패 비위 신고사안
							<input type="radio" name="type" value="2"> 계약관련 신고사안 
							<input type="radio" name="type" value="3"> 업무 불만/불편, 고객서비스 관련
					     	</td>
					        </tr></br>	
						</ul></li>
					<div class="pt25" align="center">
					<table width="100%">
					<tr>
						<td style="padding-left:50px;text-align:center;"><a href="/sub04/sub04_5_list.jsp?page=1&amp;mode=write&amp;bid=MINWON"><img src="../images/customer/btn_03.gif" alt="민원(부조리) 신고" /></a>&nbsp;<a href="#contents" onclick="popup_passwd(); return false;" title="새창"><img src="../images/customer/btn_04.gif" alt="처리결과조회" /></a></td>
						<td width="148"><a href="http://www.acrc.go.kr/acrc/board.do?command=searchDetail&menuId=0502" target="_blank"><img src="../images/customer/btn_030.gif" alt="국민권익위원회 부패신고상담 홈페이지로 이동 (새창)" /></a></td>

					</tr>
					</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>