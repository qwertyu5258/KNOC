<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.recruit.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="RecruitPMa" scope="page" class="kr.co.knoc.recruit.RecruitPersonManager" />    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","07");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>    
<% request.setCharacterEncoding("euc-kr"); %>         
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">	
	//<![CDATA[
	function jsWrite()
	{
		var f = document.wForm;
		if(f.name.value == "") {
			alert("이름을 입력해 주시기 바랍니다.");
			f.name.focus();
		} else if(f.mobile2.value == "" || f.mobile3.value == "") {
			alert("연락처를 입력해 주시기 바랍니다.");
			f.mobile2.focus();			
		} else if(!isNum(f.mobile2.value) || !isNum(f.mobile3.value)) {
			alert("연락처는 숫자만 입력 가능합니다.");
			f.mobile2.focus();
		} else {
			f.submit();						
		}		
	}

	function isNum(str)
	{
		var vString = "1234567890";
		for (var i=0 ;i<str.length;i++)
		{
			if(vString.indexOf(str.charAt(i)) <0)
			{
				return false;
			}
		}
		return true;
	}	
	//]]>		
</script>



	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
					&gt; <span>채용정보</span>
                    &gt; <span class="locanow">상시인재등록</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_7_7.gif" alt="상시인재등록" /></h3>
				</div>
				<!--시작-->
				<div class="recruit2">
					<h4><img src="/images/info/sub01_7_7_ta1.gif" alt="상시 인재등록" /></h4>
					<ul>
						<li>정의 : 특정 학위 및 경력을 보유한 전문.경력직 인력의 DB를 사전에 구축하여 해당 직종/직무와 관련된 인력소요가 발생 시 충원하는 제도</li>
						<li>상시 인재등록 → 필요직종/직무 소요발생 → 메일/유선연락</li>
						<li>등록 자격요건
							<table class="chart1 mT10" summary="상시 인재등록 자격요건을 확인할 수 있습니다.">
							<caption>상시 인재등록 자격요건</caption>
								<col width="20%" />
								<col width="80%" />
								<thead>
									<tr>
										<th scope="col" class="first">구분</th>
										<th scope="col">자격요건</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first">전문직</td>
										<td>해당분야 박사학위 소지자 (석유 개발 부분)</td>
									</tr>
									<tr>
										<td class="first">경력직</td>
										<td>해당분야 학사학위 소지 후 모집분야 유관경력 일정기간 이상</td>
									</tr>
								</tbody>
							</table>							
						</li>
					</ul>
					<div class="register">
						<p><strong>※ 유의 사항 ※</strong><br/>
							인재등록은 입사지원과는 연동되지 않으며, 향후 공개채용 시에는 별도로 지원을 하셔야 함을 유념하여 주시기 바랍니다.</p>
						<form name="wForm" method="post" action="recruitPersonWriteOk.jsp">	
	
						<fieldset>
		
						<legend>상시인재등록</legend>
						<table summary="전문, 경력직 인력을 등록할 수 있습니다.">
							<caption>인재등록</caption>
							<col width="100px" />
							<col width="580Px" />
							<tr>
								<th scope="row"><label for="name">이름</label></th>
								<td><input type="text" value="" id="name" name="name" maxlength="32" class="input" style="width:100px;" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="email">E-MAIL</label></th>
								<td><input type="text" value="" id="email" name="email" maxlength="100" class="input" style="width:250px;" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="mobile1">휴대전화</label></th>
								<td>
										<select id="mobile1" name="mobile1" title="휴대전화국번"  style="vertical-align:middle;" >
										<option value="010" selected="selected">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
										</select> - 
										<input type="text" value="" name="mobile2" maxlength="4" class="input w40" title="휴대전화 앞자리"/> - 
										<input type="text" value="" name="mobile3" maxlength="4" class="input w40" title="휴대전화 뒷자리"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="academic">최종학력</label></th>
								<td><input type="text" value="" id="academic" name="academic" maxlength="50" class="input w200" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="school">출신학교</label></th>
								<td><input type="text" value="" id="school" name="school" maxlength="50" class="input w200" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="bunya">분야</label></th>
								<td>									
									<select id="bunya" name="bunya">
										<option value="분야" selected="selected">분야</option>
										
										<option value="분야">경영기획</option>
										
										<option value="인사노무">인사노무</option>
										
										<option value="총무">총무</option>
										
										<option value="구매">구매</option>
										
										<option value="정보기술">정보기술</option>
										
										<option value="예산">예산</option>									
										<option value="재무">재무</option>	
										
										<option value="에특사업">에특사업</option>	
										
										<option value="회계">회계</option>	
										
										<option value="비축사업관리">비축사업관리</option>	
										
										<option value="정보지원">정보지원</option>	
										
										<option value="E&amp;P사업관리">E&amp;P사업관리</option>	
										
										<option value="G&amp;G">G&amp;G</option>	
										
										<option value="석유공학">석유공학</option>	
										
										<option value="시추선사업">시추선사업</option>	
										
										<option value="생산시설">생산시설</option>	
										
										<option value="HSEQ">HSEQ</option>	
										
										<option value="비축시설관리">비축시설관리</option>	
										
										<option value="비축사업지원">비축사업지원</option>
										
										<option value="건설사업">건설사업</option>								
									</select>
								</td>
							</tr>
			
						</table>
	
						</fieldset>
						</form>			
						
						<div class="boardbtm pt15" align="center">
							<div class="btnsec2">
								<!-- a href="#" onclick="jsWrite();"><img src="/images/board/btn_send.gif" alt="보내기"/></a -->
								<input type="image"  onclick="jsWrite();" src="/images/board/btn_send.gif" alt="보내기"/>
								<a href="#form" onclick="document.wForm.reset();"><img src="/images/board/btn_refr.gif" alt="다시쓰기"/></a>
							</div>
						</div>
					</div>
				</div>
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>