<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>        
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","11");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","02");
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
				<%@include file="/include/subtop_11.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사이버홍보실</span>	
					&gt; <span>어린이</span>
                    &gt; <span class="locanow">석유만화방</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/child/ttl_sub11_08.gif" alt="석유만화방" /></h3>
				</div>
				<div class="book01">
					<ul class="book_Num01">
						<li><span>누비의 석유사랑 이야기<br/>(최신/2013년 발간)</span></li>
						<li><img src="/images/child/img_sub11_3_1_1.gif" alt="누비의 석유사랑 이야기"/></li>
						<li><a href="http://www.knoc.co.kr/upload/neoboard/COMIC_NUBI/ecatalog.html" target="_blank"><img src="/images/child/btn_ebook.gif" alt="E-BOOK보기"></a>
						&nbsp;&nbsp;&nbsp;	
						<a href="/filedown.jsp?fileno=15&amp;filepath=/upload/data/sub11/" title="누비의 석유사랑이야기(최신/2013년 발간)다운로드"> <img src="/images/child/btn_pdf.gif" alt="PDF 다운로드"></a></li>
					</ul>
				</div>
				
				

				<div class="book01">
					<ul class="book_Num01">
						<li><span>해피유의 석유사랑<br/>(2010년 발간)</span></li>
						<li><img src="/images/child/img_sub11_3_1_2.gif" alt="해피유의 석유사랑 (2010년 발간)"/></li>
						<li><a href="http://www.knoc.co.kr/upload/neoboard/CARTOON/cartoon_2/ecatalog.html" target="_blank"><img src="/images/child/btn_ebook.gif" alt="E-BOOK보기"></a></li>
					</ul>
				</div>
		
			
			    <div class="book01">
					<ul class="book_Num01">
						<li><span>덜덜이와 덩달이<br/>(2004년 발간) </span></li>
						<li><img src="/images/child/img_sub11_3_1_3.gif" alt="덜덜이와 덩달이 (2004년 발간)"/></li>
						<li><a href="http://www.knoc.co.kr/upload/neoboard/COMIC/cartoon_1/cartoon_A01.html" target="_blank"><img src="/images/child/btn_ebook.gif" alt="E-BOOK보기"></a></li>
					</ul>
				</div>
			</div>
			<div style="clear:both; height: 15px;"></div>			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"></td>
							<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
							<td class="contact_user"><strong>담당자 : </strong>조혜진</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2231</td>
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