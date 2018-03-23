<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.etc.*"%>
<jsp:useBean id="BoardMa" scope="page" class="kr.co.knoc.etc.BoardLimit" />
<% request.setCharacterEncoding("euc-kr"); %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","11");
	application.setAttribute("gNavMenuDepth2","00");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>  

<%!
	public String getNewArticle(java.util.Date writeday,String contextRoot){
		java.util.Date today = new java.util.Date();
		String newImg=""; 
		if (today.getTime()-writeday.getTime() < (1000*60*60*24*1)){
			newImg = "<img src='"+contextRoot+"' border='0' alt='new' />" ;
		}
		return newImg;
	}  
%>

<%@include file="/include/comheader.jsp"%>

<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
    
    <div id="smcontents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
        
        <div id="rightarea" class="mgn_top">
			<div id="smainvisual">
				<img src="/images/new_sub/cyber_title.gif" alt="사이버홍보실(Cyber Public Relations) 깨끗하고 풍요로운 에너지 기업의 꿈을 실현해 가는 한국석유공사 환경과 사람이 조화를 이루는 경영활동을 통해 아름다운 삶과 행복을 추구합니다. 
" />
			</div>
			
            <div id="smcnts_4">
                <div class="smsec1">
               
					<div class="sub_main_tab" id="NEWS" style="display:block" style="position:relative ; z-index:1 ;">
						<h3><img src="/images/information/img_tab_02_on.gif" id="mtabs2" alt="보도자료" /></h3>                       
                        <ul class="mlistul">
<%
ArrayList boardlimit = BoardMa.getNeoBoard("NEOBOARD_NEWS",5,"");
if (boardlimit.size() == 0) {
%>
							<li>
								<div class="txtli">등록된 자료가 없습니다.</div>
							</li>
<%
} else {
	Iterator iter = boardlimit.iterator();
	while(iter.hasNext()){
		BoardBean bb = (BoardBean)iter.next();
%>
							<li>
								<div class="txtli"><a href="/sub11/sub11_1.jsp?num=<%=bb.getNo() %>&amp;mode=view&amp;bid=NEWS"><%=EtcUtil.getTitleLimit(bb.getSubject(),34)%></a> <%=getNewArticle(bb.getRegDate(), "/images/2011/icon_new.gif") %></div>
								<div class="dateli">[<%=bb.getRegDateString("yyyy.MM.dd") %>]</div>
							</li>
<%		
	}
}	
%>			                                                    
                        </ul>
						<div class="more"><a href="/sub11/sub11_1.jsp"><img src="/images/main/btn_more.gif" alt="보도자료 더보기" /></a></div>
                	</div>
                    <div style="clear:both;"></div>
                </div>
                <div class="submain_05">
            		<ul>
            			<li><a href="/sub11/sub11_7_1_1.jsp"><img src="/images/submain/sub07_01.gif" alt="어린이 바로가기" /></a></li>
            			<li style="float:none ;"><a href="/sub11/sub11_2.jsp"><img src="/images/submain/sub07_02.gif" alt="포토뉴스" /></a></li>
            			<li><a href="/sub11/sub11_3.jsp"><img src="/images/submain/sub07_03.gif" alt="홍보영상" /></a></li>
            			<li><a href="/sub11/sub11_4.jsp"><img src="/images/submain/sub07_04.gif" alt="자료사진" /></a></li>
            			<li><a href="/sub11/sub11_5_1.jsp"><img src="/images/submain/sub07_05.gif" alt="홍보 간행물" /></a></li>
            			<!--li><a href="/sub11/sub11_6.jsp"><img src="/images/submain/sub07_06.gif" alt="Cafe Oleum" /></a></li-->
            		</ul>
            	</div>
                <!-- 
				<div class="smsec2">                    
					<div class="infoMain01">						
						<h3><img src="/images/information/main_tit_01.gif" alt="사이버홍보실"/></h3>						
						<p class="mT10"><img src="/images/information/main_txt_01.gif" alt="영상으로 보는 석유공사" /></p>						
						<p class="mT10"><a href="/sub05/sub05_3_1.jsp"><img src="/images/common/btn_main_go.gif" alt="사이버홍보실 페이지로 이동" /></a></p>
					</div>
					
					<div class="infoMain03">						
						<h3><img src="/images/information/main_tit_02.gif" alt="정보공개방"/></h3>						
						<p class="mT10"><img src="/images/information/main_txt_02.gif" alt="정보를 배포 또는 공표하는 형태로 정보를 제공합니다." /></p>						
						<p class="mT10"><a href="/sub05/sub05_4_1.jsp"><img src="/images/common/btn_main_go.gif" alt="정보공개방 페이지로 이동" /></a></p>
					</div>
				</div>    
				
				<div class="smsec3">					
					<div class="infoMain02">						
						<h3><img src="/images/information/main_tit_03.gif" alt="자료실"/></h3>						
						<p class="mT10"><img src="/images/information/main_txt_03.gif" alt="석유공사의 소중한 자료가 있는 곳입니다."/></p>						
						<p class="mT10"><a href="/sub05/sub05_5_1.jsp"><img src="/images/common/btn_main_go.gif" alt="자료실 페이지로 이동" /></a></p>
					</div>
					
					<div class="infoMain04">						
						<a href="/sub05/sub05_6.jsp" title="위험정보 페이지로 이동"><img src="/images/information/main_tit_0401.gif" alt="위험정보 페이지로 이동" /></a><a href="/sub05/sub05_7_1.jsp" class="mL60"><img src="/images/information/main_tit_0402.gif" alt="관련사이트 페이지로 이동" /></a>					
					</div>                
				</div>
				 -->
			</div>        
		</div>    
	</div>
    
    <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>



</body>
</html>

