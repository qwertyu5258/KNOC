<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","05");
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
                    &gt; <span>윤리경영</span>
					&gt; <span class="locanow">HOT_LINE</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_1_5.gif" alt="HOT_LINE" /></h3>
				</div>
				<!--시작-->
				<div class="hotLine">
					<div class="hotTxt">
						<p class="blindtext">윤리경영 Hot-line은 공사의 임직원, 협력회사(직원), 고객/국민이 공사와 공사 임직원의 비윤리적 행위를 신고하거나, 윤리경영의 효율적인 정착을 위하여 잘못된 관행이나 제도에 대한 제안(개선)사항을 접수하는 공간입니다.</p>
					</div>
					<div class="line01">
						<ul>
						<li>실명 또는 무기명으로 신고하는 것이 가능합니다. 실명으로 신고 시에는 빠른 시일 내에 조사, 처리하고 회신하여 드리겠습니다. 무기명으로 신고 시에는 내용을 검토 후 조사,처리하겠습니다.</li>
						<li>또한 제안(개선)사항에 대해서도 실명 또는 무기명으로 접수합니다. 제안 시에는 내용의 타당성을 검토하여 반영여부를 회신하여 드리겠습니다.</li>
						<li>신고/제안자의 신분은 공개되지 않으며, 신고/제안으로 인한 어떠한 불이익도 받지 않음을 알려드립니다.</li>
						<li>고객서비스 측면에서의 제안/개선사항은 <a href="/sub04/sub04_3.jsp"><span class="ce45108_b">[고객/국민제안]</span></a>을, 민원에 관련된 사항은 <a href="/sub04/sub04_5.jsp"><span class="ce45108_b">[민원(부조리)사항]</span></a>을 이용하여 주시기 바랍니다. </li>
						</ul>
					</div>
					<div class="line02">
						<ul>
						<li><a href="#guard1"><img src="/images/management/sub02_1_5_ta12_bt1.gif" alt="신고자 보호조치 내용보기" border="0"/></a></li>
						<li><a href="/sub04/sub04_5_list.jsp?page=1&amp;mode=write&amp;bid=MINWON"><img src="/images/management/sub02_1_5_ta12_bt2.gif" alt="민원(부조리)사항 신고 접수하기" border="0"/></a></li>
						<li><a href="/sub04/sub04_5.jsp"><img src="/images/management/sub02_1_5_ta12_bt3.gif" alt="민원(부조리)사항 처리결과조회" border="0"/></a></li>
						<li><a href="/member/privacy.jsp"><img src="/images/management/sub02_1_5_ta12_bt4.gif" alt="개인정보 보호정책내용보기" border="0"/></a></li>
						<li><a href="/sub04/sub04_3_list.jsp?page=1&amp;mode=write&amp;bid=SUGEST"><img src="/images/management/sub02_1_5_ta12_bt5.gif" alt="고객/국민제안접수하기" border="0"/></a></li>
						<li><a href="/sub04/sub04_3.jsp"><img src="/images/management/sub02_1_5_ta12_bt6.gif" alt="고객/국민제안 처리결과조회" border="0"/></a></li>
						</ul>
					</div>
					
					<div style="clear:both ; padding-top:20px ; ">
						<ul style="width:400px ; padding-left:50px; color:#999 ;">
							<li><strong>전화번호</strong> : 052-216-2122</li>
							<li><strong>E-mail</strong> : moonwhan.lee@knoc.co.k</li>
							<li><strong>주 소</strong> :(우:44538) 울산광역시 중구 종가로 305 한국석유공사 감사실</li>
						</ul>
					</div>
					
					<h4 class="mT20"><a name="guard1"><img src="/images/management/sub02_1_5_ta0.gif" alt="신고보상제도"/></a></h4>
					<ul class="line03">
					<li>목적 : 공익신고에 대한 인센티브를 제공함으로써 자율신고 문화를 활성화하기 위한 제도</li>
					<li>보상금액
					<p>1억원이하 : 신고액의 20%</p>
					<p>1억원초과 5억원이하 : 2천만원+1억원 초과 금액의 10%</p>
					<p>5억원초과 20억원이하 : 6천만원+5억원 초과 금액의 5%</p>
					<p>20억원초과 : 1억3천5백만원+20억원 초과 금액의 3%</p>
					<p>금액산출이 불가능한 건 : 사안의 경중을5단계로 구분하여 지급 (백만원/5백만원/천만원/3천만원/5천만원)</p>
					</li>
					</ul>
					<h4 class="mT30"><a name="guard1"><img src="/images/management/sub02_1_5_ta1.gif" alt="신고자 보호조치"/></a></h4>
					<ul class="line03">
					<li>법적근거 : 부패방지법 제32조(신분보장) 및 제33조(신변의 보호)</li>
					<li>비공개(익명) 조사, 처리 및 신분노출 금지</li>
					<li>부패방지법 제27조(신고자의 성실의무)에 따라 신고자가 신고내용이 허위라는 사실을 알았거나 알 수 있음에도 신고한 경우에는 보호를 받지 못함</li>
					<li>신분상 불이익 또는 근무조건상 차별 금지</li>
					<li>외부인인 경우 소속 단체와 기업의 장에게 적절한 신분보장 조치 요청</li>
					<li>신고로 인해 자신의 부정행위가 발견된 경우 감경 또는 면제</li>
					</ul>
					
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
							<td class="contact_user"><strong>담당자 : </strong>이문환</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2122</td>
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