<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","15");
	application.setAttribute("gNavMenuDepth3","04");
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
			<!-- contents -->
            <div id="subcnts">
                <%@include file="/include/subtop_05.jsp"%>
                <div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a> &gt; <span>정보공개</span> &gt; <span>정보공개제도</span> &gt; <span class="locanow">불복구제절차</span>
                </div>				
                <div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/n_img_sub5/ttl_sub05_1_4.gif" alt="불복구제 절차" /></h3>
				</div>
                <div class="information">
					<!--star_불복구제절차-->
                    <h4 class="mT0"><img src="../images/information/img_ttl_sub05_4_1_04.gif" alt="불복구제절차" /></h4>
					<dl>
						<dt>이의신청</dt>
						<dd>이의신청권자<br/>
							<p>- 청구인이 정보공개와 관련하여 공공기관의 처분 또는 부작위로 인하여 법률상 이익의 침해를 받은 때에는 당해 공공기관에<br/>
							<span class="mL10"> 이의신청을 할 수 있습니다.</span></p>
							<p>- 비공개 요청을 받은 공공기관이 당해 제3자의 의사에 반하여 공개하고자 하는 경우에 공개 통지를 받은 당해 제3자는 당해<br/>
							<span class="mL10"> 공공기관에 이의신청을 할 수 있습니다.</span></p>
						</dd>
						<dd>이의신청기간
							<p>- 공공기관으로부터 공개여부의 결정통지를 받은 날또는 비공개의 결정이 있는 것으로 보는 날로부터 “30일 이내”</p>
						</dd>
						<dd> 이의신청방법
							<p>- 이의신청은 「서면」으로 하며<br/>
							- 이의신청서에 기재사항은 다음과 같습니다.</p>
							<p class="mL10">신청인의 이름·주민등록번호 및 주소(법인·단체의 경우에는 그 명칭 및 사무소 또는 사업소의 소재지와 대표자의 이름),<br/>이의신청의 대상이 되는 정보의 공개여부에 대한 결정통지의 내용, 이의신청의 취지 및 이유, 정보공개여부의 결정통지를<br/>받은 날 또는 비공개 결정이 있는 것으로 보는 날</p>
							<p>- 비공개 요청을 받은 공공기관이 당해 제3자의 의사에 반하여 공개하고자 하는 경우에 공개 통지를 받은 날부터 “7일 이내”</p>
						</dd>
					</dl>
					<dl>
						<dt>행정심판</dt>
						<dd>청구인 적격이 있는 자<br/>
							<p>- 행정심판을 제기할 수 있는 자는 정보공개와 관련하여 공공기관의 처분 또는 부작위로 인하여 법률상 이익의 침해를 받은<br/>
							<span class="mL10">청구인입니다.</span></p>
							<p>※ 청구인은 이의신청 절차를 거치지 아니하고 행정심판을 청구할 수 있습니다.</p>
						</dd>
						<dd>재결청
							<p>- 재결청은 원칙적으로 당해 행정청의「직근 상급행정기관」이 되며, 예외적으로 당해 행정청이 되는 경우와 소관<br/>
							<span class="mL10">감독행정기관이 되는 경우가 있습니다.</span></p>
						</dd>
						<dd>심판청구기간
							<p>- 행정심판의 청구는 처분이 있음을 안 날로부터 “90일 이내”에 제기하여야 합니다.<br/>
							- 정당한 사유가 없는 한 처분이 있는 날부터 “180일”을 넘겨서는 안 됩니다.</p>
						</dd>
						<dd>재결기간 및 재결방식
							<p>- 재결은 재결청 또는 피청구인인 행정청이 심판청구서를 받은 날부터 “60일 이내”에 하여야 하나, 부득이한 사정이<br/>
							<span class="mL10">있는 때에는 1차에 한하여 “30일”의 범위내에서 기간을 연장할 수 있습니다.</span>
							- 재결은 서면(재결서)으로 하되 재결서에서는 주문·청구의 취지·이유 등을 기재하고 재결청이 기명날인합니다.</p>
						</dd>
					</dl>
					<dl>
						<dt>행정소송</dt>
						<dd>제기권자(원고적격)<br/>
							<p>- 청구인은 정보공개와 관련하여 공공기관의 처분 또는 부작위로 인하여 법률상의 이익의 침해를 받은 때에는 행정소송법이<br/>
							<span class="mL10">정하는 바에 따라 행정소송을 제기할 수 있습니다.</span></p>
							<p>- 1998. 3. 1부터는 행정소송중 취소소송은 법령의 규정에 의하여 당해 처분에 대한 행정심판을 제기할 수 있는 경우에도<br/>
							<span class="mL10">이를 거치지 아니하고 제기할 수 있습니다. 다만, 다른 법률에 당해 처분에 대한 행정 심판의 재결을 거치지 아니하면</span><br/>
							<span class="mL10">취소소송을제기할 수 없다는 규정이 있는 때에는 그러하지 아니합니다.</span></p>
						</dd>
						<dd>제소기간
							<p>- 취소소송은 처분 등이 있음을 안 날로부터 “90일 이내”에 제기하여야 합니다.<br/>
							- 취소소송은 처분 등이 있은 날부터 “1년”을 경과하면 이를 제기하지 못합니다. 다만, 정당한 사유가 있을 때에는 그러하지
							<span class="mL10">아니합니다.</span></p>
						</dd>
					</dl>
                    <!--star_불복구제절차-->
				</div>
            </div>
			<!-- //contents -->
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
						<td class="contact_team"><strong>담당부서 : </strong>총무관리처 상생지원팀</td>
						<td class="contact_user"><strong>담당자 : </strong>차정민</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2607</td>
					</tr>
				</tbody>
				</table>
			</div>
		</div>
    </div>
	<!--// footer: start //-->
	<%@include file="/include/comfooter.jsp"%>
	<!--// footer: end //-->
</div>
</body>
</html>