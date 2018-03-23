<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@page import="kr.co.knoc.gov_public.GovPublicBean"%>
<%@page import="kr.co.knoc.util.EtcUtil"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="govPublicManager" scope="page" class="kr.co.knoc.gov_public.GovPublicManager" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","13");
	application.setAttribute("gNavMenuDepth3","27");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	ArrayList<HashMap<String, String>> govPublicList = govPublicManager.getHotRank();
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
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a> &gt; <span>정보공개</span> &gt; <span>사전정보공표</span> &gt; <span class="locanow">즐겨찾는정보</span>
                </div>
                <div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/n_img_sub5/ttl_sub05_6_1.gif" alt="즐겨찾는정보" /></h3>
				</div>
				<div class="information">					

					<p><img src="/images/information/n_img_sub5/sub05_13_6_1_info.png" alt="청구자 유형별, 목적별로 분류한 맞춤형 사전정보 공개입니다." /></p>
                    <div class="sub05_13_6_1_list">
                    	<ul>
                        	<li>
                                <dl>
                                    <dt><img src="/images/information/n_img_sub5/img_sub05_13_6_1_te1.gif" alt="연구자·학생"></dt>
                                    <dd><a href="http://www.petronet.co.kr/v3/board/listType1.jsp?BbsId=PSBODB..OILPRICE" target="_blank" title="새창">국내유가현황</a></dd>
                                    <dd><a href="http://www.petronet.co.kr/v3/board/listType21.jsp?BbsId=PSBODB..TPDWFTREND" target="_blank" title="새창">주간국제유가동향</a></dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt><img src="/images/information/n_img_sub5/img_sub05_13_6_1_te2.gif" alt="석유사업자"></dt>
                                    <dd><a href="/sub05/sub05_12_list.jsp?gpk=13">알뜰주유소</a></dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt><img src="/images/information/n_img_sub5/img_sub05_13_6_1_te3.gif" alt="일상생활"></dt>
                                    <dd><a href="http://www.opinet.co.kr/user/main/mainView.do" target="_blank" title="새창">싼 주유소 찾기</a></dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    
					<h4><img src="../images/information/n_img_sub5/ttl_sub05_6_1_4.gif" alt="최근 관심 정보" /></h4>
					<p><img src="../images/information/n_img_sub5/ttl_sub05_6_1_4_tx1.gif" alt="사전정보공개의 게시물 조회수 1~3위까지입니다." /></p>
					<table class="chart2 mT20" summary="최근 관심 정보에 대한 표로 구분, 바로가기 등에 대한 정보를 제공합니다.">
						<caption>최근 관심 정보</caption>
						<colgroup>
						<col width="8%" />
						<col width="18%" />
						<col width="45%" />
						<col width="*" />
						</colgroup>
						<thead>
						<tr>
							<th class="first">순위</th>
							<th>구분</th>
							<th>제목</th>
							<th>바로가기</th>
						</tr>	
						</thead>
						<tbody>
						<%
						Iterator<HashMap<String, String>> iter = govPublicList.iterator();
						while(iter.hasNext()){
							HashMap<String, String> hashMap = iter.next();						
						%>
						<tr>
							<td class="first"><%=EtcUtil.checkNull(hashMap.get("RNUM"))%></td>
							<td><%=EtcUtil.checkNull(hashMap.get("GOV_PUBLIC_KIND_NM"))%></td>
							<td class="align_L"><%=EtcUtil.checkNull(hashMap.get("TITLE"))%></td>
							<td><a href="/sub05/sub05_12_filelist.jsp?gpk=<%=EtcUtil.checkNull(hashMap.get("GOV_PUBLIC_KIND")) %>&gov_public_nid=<%=EtcUtil.checkNull(hashMap.get("GOV_PUBLIC_NID")) %>"><img src="../images/information/n_img_sub5/btn_link4.gif" alt="바로가기" /></a></td>
						</tr>
						<%}%>
						</tbody>
                	</table>
				</div>
            </div>
			<!-- //contents -->
			<div class="new_officer">
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
			</div>
		</div>
    </div>
	<!--// footer: start //-->
	<%@include file="/include/comfooter.jsp"%>
	<!--// footer: end //-->
</div>
</body>
</html>