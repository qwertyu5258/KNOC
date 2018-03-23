<%@ page language="java" contentType="text/html; charset=EUC-KR"    pageEncoding="EUC-KR"%>
<%@page import="kr.co.knoc.banner.BannerBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="BannerMa" scope="page" class="kr.co.knoc.banner.BannerManager" />


		<div class="hidden_tit"><h2>Footer Area</h2></div>
		<!-- footer -->
   		<div id="footer">
		<!-- footer_banner -->
    	
		<!-- //footer_banner -->
        <!-- footer_wrap -->
        <div class="footer_wrap">
        	<div class="qr"><img src="/ENG/img/common/qr.png" alt="qr code" /></div>
            <p class="addr">
            	305,JONGGA-RO, JUNG-GU, ULSAN, Republic of Korea(44538)<span class="arrow">I</span><span class="tel">TEL +82)52-216-2114</span><span class="arrow">I</span>FAX +82)52-216-5900
            </p>
            <p class="copy">
            	COPYRIGHT (C) BY KOREA NATIONAL OIL CORPORATION. ALL RIGHTS RESERVED.
            </p>
            
            <div class="footer_banner">
	        	<div class="footer_banner_area">
	                <ul>
	                <%
					ArrayList bannerList = BannerMa.getBanner("ENG");
					Iterator bannerIt = bannerList.iterator();
					while(bannerIt.hasNext()) {
						BannerBean bb = (BannerBean)bannerIt.next();
						%>
					<li><a href="<%=bb.getLinkUrl()%>" target="<%=bb.getLinkType()%>" title="<%=bb.getAlttext()%>"><img src="/upload/BANNER/<%=bb.getNewFilename()%>" width="112" height="30" alt="<%=bb.getAlttext()%>" /></a></li>
						<%
					} %>
	                </ul>
	            </div>
	            <div class="roll_control">
	            <%	if(bannerList.size() > 1 ){ 	%>	            
	                <button type="button" class="footer_banner_prev"><span class="hidden">prev</span></button>
	                <button type="button" class="footer_banner_next"><span class="hidden">next</span></button>
            	<% 	} 	%>
	            </div>

       	 	</div>
       	    
        </div>
		<!-- //footer_wrap -->
    </div>
	<!-- //footer -->
	
	