<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","13");
	application.setAttribute("gNavMenuDepth4","05");
//	application.setAttribute("gNavMenuDepth3","06");
//	application.setAttribute("gNavMenuDepth4","14");	
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%>
<!--// subtopNavi: start //-->
<script type="text/javascript">
$(document).ready(function(){
	$("a.btn_open_popup").on("click", function(e) {
		openPopup(this);
		e.preventDefault();
	});	
});
function openPopup(obj) {
	obj = $(obj);
	var url = obj.attr("href");
	var title = obj.attr("title");
	var popup_size = "size_640x480"; //기본 사이즈
		
	var class_arr = obj.attr("class").split(" ");
	var size_fmt = /^size_\d{3,4}x\d{3,4}$/;
	for(var i = 0 ; i < class_arr.length ; i++) {
		if(size_fmt.test(class_arr[i])) { popup_size = class_arr[i]; break; }
	}
	
	size_arr = popup_size.replace("size_", "").split("x");
	var popup_width = size_arr[0];
	var popup_height = size_arr[1];
	
	try {
		window.open(url, title, "scrollbars=yes,width=" + popup_width + ",height=" + popup_height + ",top=100,left=600");		
	}
	catch (e) {
		window.open(url, "", "scrollbars=yes,width=" + popup_width + ",height=" + popup_height + ",top=100,left=600");
	}
}
</script>
<div id="contents">
	<%@include file="/include/sub_leftmenu_new.jsp"%>
	<div id="rightarea">
		<div id="subcnts">
			<%@include file="/include/subtop_02.jsp"%>
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a> &gt; 
				<span>열린경영</span> &gt; 
				<span>경영공시</span> &gt; 
				<span>기타정보</span> &gt; 
				<span class="locanow">비위행위 처분결과 및 징계·고발 기준</span>
			</div>
			<div class="pagetle">
				<h3><img src="/images/management/ttl_sub02_2_6.gif" alt="기타정보" /></h3>
			</div>
			<div class="officer">
				<h4><img src="/images/management/sub02_2_6_14_ta.gif" alt="비위행위 처분결과 및 징계·고발 기준" /></h4>
                 <p style="padding:10px 0 20px 0;"><a class="btn_open_popup size_800x1000" href="/popup_open.html"><img src="/images/management/ab_sub02_2_6_14_btn.gif" alt="징계·고발 기준 바로보기" /></p>
				<ul class="tab mb_10">
					<li><a href="/sub02/sub02_2_6_14.jsp" ><img src="/images/management/ab_sub02_2_6_16.gif" alt="2016년" /></a></li>
					<li><a href="/sub02/sub02_2_6_14_15.jsp" ><img src="/images/management/ab_sub02_2_6_14_15.gif" alt="2015년" /></a></li>
					<li><a href="/sub02/sub02_2_6_14_14.jsp" ><img src="/images/management/ab_sub02_2_6_14_14r.gif" alt="2014년" /></a></li>
				</ul>

				<div style="clear:both;">
				</div>
				<table class="chart2" summary="비위행위 처분결과 입니다.">
					<caption>비위행위 처분결과</caption>
					<colgroup>
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="first">연번</th>
							<th scope="col">비위 유형</th>
							<th scope="col">부패금액</th>
							<th scope="col">징계종류</th>
							<th scope="col">처분일</th>
							<th scope="col">고발 여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="first">1</td>
							<td>성실의무 위반</td>
							<td>-</td>
							<td>경고</td>
							<td>2014.4</td>
							<td>미고발</td>
						</tr>
						<tr>
							<td class="first">2</td>
							<td>도로교통법 위반</td>
							<td>-</td>
							<td>견책</td>
							<td>2014.7</td>
							<td>고발</td>
						</tr>
						<tr>
							<td class="first">3</td>
							<td>품의유지의무 위반</td>
							<td>-</td>
							<td>정직1월</td>
							<td>2014.7</td>
							<td>미고발</td>
						</tr>
						<tr>
							<td class="first">4</td>
							<td>성실의무 위반</td>
							<td>-</td>
							<td>감봉3월</td>
							<td>2014.8</td>
							<td>미고발</td>
						</tr>
						<tr>
							<td class="first">5</td>
							<td>성실의무 위반</td>
							<td>-</td>
							<td>견책</td>
							<td>2014.8</td>
							<td>미고발</td>
						</tr>
						<tr>
							<td class="first">6</td>
							<td>성실의무 위반</td>
							<td>-</td>
							<td>견책</td>
							<td>2014.8</td>
							<td>미고발</td>
						</tr>
						<tr>
							<td class="first">7</td>
							<td>성실의무 위반</td>
							<td>-</td>
							<td>경고</td>
							<td>2014.8</td>
							<td>미고발</td>
						</tr>
						<tr>
							<td class="first">8</td>
							<td>성실의무 위반</td>
							<td>-</td>
							<td>경고</td>
							<td>2014.8</td>
							<td>미고발</td>
						</tr>
						<tr>
							<td class="first">9</td>
							<td>품위유지의무 위반</td>
							<td>-</td>
							<td>파면</td>
							<td>2014.12</td>
							<td>미고발</td>
						</tr>
						<tr>
							<td class="first">10</td>
							<td>성실의무 위반</td>
							<td>-</td>
							<td>경고</td>
							<td>2014.12</td>
							<td>미고발</td>
						</tr>
						<tr>
							<td class="first">11</td>
							<td>성실의무 위반</td>
							<td>-</td>
							<td>경고</td>
							<td>2014.12</td>
							<td>미고발</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"></td>
							<td class="contact_team"><strong>담당부서 : </strong>인재경영처 인사팀</td>
							<td class="contact_user"><strong>담당자 : </strong>박영환</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2706</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--div class="infoCheck">
				<%@include file="/include/satisfy_link.jsp"%>
			</div-->
		</div>
	</div>
</div>
<%@include file="/include/comfooter.jsp"%>
<!--// footer: start //-->
<!--// footer: end //-->
</div>
</body></html>