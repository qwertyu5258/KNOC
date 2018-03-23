<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","15");
	application.setAttribute("gNavMenuDepth3","03");
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
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a> &gt; <span>정보공개</span> &gt; <span>정보공개제도</span> &gt; <span class="locanow">비공개대상정보</span>
                </div>				
                <div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/n_img_sub5/ttl_sub05_1_3.gif" alt="비공개 대상정보" /></h3>
				</div>
                <div class="information">
					<h4 class="mT0"><img src="../images/information/n_img_sub5/ttl_sub05_1_3_1.gif" alt="정보공개 요청시 비공개 대상이 되는 정보입니다." /></h4>
					<p class="download"> 한국석유공사 비공개 세부기준 ㆍㆍㆍㆍㆍㆍㆍㆍ <a href="/filedown.jsp?fileno=30&amp;filepath=/upload/data/sub02/"><img src="../images/information/btn_download.gif" alt="한국석유공사 비공개 세부기준 다운로드" class="vMid" /></a></p>
					<dl>
						<dt>비공개 대상정보</dt>
						<dd class="noBack">공공기관의정보공개에관한법률 제9조1항 및 국무총리훈령 제6조에 따른 비공개 기준은 다음과 같습니다.</dd>
						<dd>다른 법률 또는 법률이 위임한 명령에 의하여 비밀 또는 비공개사항으로 규정된 정보</dd>
						<dd>국가안전보장ㆍ국방ㆍ통일ㆍ외교관계 등에 관한 사항으로서 공개될 경우 국가의 중대한 이익을 현저히 해할 우려가 있다고<br/>인정되는 정보
							<p>- 대북한 관련 정보 수립ㆍ분석자료, 전군 주둔 지휘관의 회의록</p>
							<p>- 통일관계 장관회의 회의록ㆍ비밀외교협정관계문서 등</p>
						</dd>
						<dd>국민의 생명ㆍ신체 및 재산의 보호에 현저한 지장을 초래할 우려가 있다고 인정되는 정보
							<p>- 범죄의 피의자, 참고인 또는 통보자 명단, 개인의 납세실적 등</p>
						</dd>
						<dd>진행 중인 재판에 관련된 정보와 범죄의 예방, 수사, 공소의 제기 및 유지, 형의 집행, 교정, 보안처분에 관한 사항으로서<br/>직무수행을 현저히 곤란하게 하거나 형사 피고인의 공정한 재판을 받을 권리를 침해하는 정보
							<p>- 무기제도, 피의자 신문조서, 수형자의 신분 기록 등에 관한 정보</p>
						</dd>
						<dd>감사ㆍ감독, 검사ㆍ시험ㆍ규제ㆍ입찰계약ㆍ기술개발ㆍ인사관리ㆍ의사결정과정 또는 내부검토과정에 있는 사항으로써<br/>업무의 공정한 수행이나 연구ㆍ개발에 현저한 지장을 초래하는 정보
							<p>- 감사의 범위ㆍ방법ㆍ시기, 검사의 결과 및 조치사항, 국가고시 및 자격시험의 채점, 입찰예정가격, 직원의 인사기록 등</p>
						</dd>
						<dd>이름ㆍ주민등록번호 등 개인에 관한 사항으로서 개인의 사생활의 비밀 또는 자유를 침해할 우려가 있다고 인정되는 정보
							<p>- 학력, 성명, 직업, 건강상담표, 납세증명서 등 특정인을 식별할 수 있는 정보 등</p>
						</dd>
						<dd>법인, 단체 또는 개인의 경영ㆍ영업상 비밀에 관한 사항으로써 법인 등의 정당한 이익을 현저히 해할 우려가 있는 정보
							<p>- 생산기술 또는 영업상의 정보, 경영방침, 경리ㆍ인사 등 내부관리 사항 등</p>
						</dd>
						<dd>특정인에게 이익 또는 불이익을 줄 우려가 있다고 인정되는 정보
							<p>- 정보를 얻은 자와 얻지 못한 자와의 사이에 불공평이 발생하고 부당한 이익 또는 불이익을 초래하는 정보</p>
							<p>(예시 : 용지매매계약서, 설계단가표 등)</p>
						</dd>			
						<dd>정책수립 및 집행 관련 업무로서 내부검토나 의견수렴, 또는 조정 중에 있는 사안이어서 공개 시 정책결정에 중대한 지장을<br/>초래할 우려가 있는 정보</dd>
						<dd>경영평가관련 업무 중 최종평가 결과 이전의 평가자료로서, 공개될 경우 공정한 평가에 지장을 주는 정보</dd>
						<dd>감사에 관한 사항 중 공직자비리 등 구체적 정보로서 공직기강 감사업무 수행에 중대한 영향을 주거나 개인의 사적비밀 또는<br/><span class="pl07">권익을 침해하는 정보</span></dd>
						<dd>한국석유공사 소관 위원회 관련 자료 중 공개시 이해관계인의 혼란을 초래할 우려가 있어 당해 위원회의 의결로 비공개하기로<br/><span class="pl07">결정된 안건</span></dd>
						<dd>기타 공개시 업무수행에 현저한 지장을 초래하거나, 특정인의 이익을 침해할 우려가 있는 정보로서 한국석유공사<br/>정보공개심의회에서 비공개로 결정한 정보</dd>
					</dl>
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