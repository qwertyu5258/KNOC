<%@page import="kr.co.knoc.banner.BannerBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <jsp:useBean id="BannerMa" scope="page" class="kr.co.knoc.banner.BannerManager" />
    

	<!-- footer -->
    <div id="footer">
		<!-- footer_banner -->
    	<div class="footer_banner">
        	<div class="footer_banner_area">
                <ul>
                   	<%
						ArrayList bannerList = BannerMa.getBanner("KOR");
						Iterator bannerIt = bannerList.iterator();
						while(bannerIt.hasNext()){
							BannerBean bb = (BannerBean)bannerIt.next();
					%>
						<li><a href="<%=bb.getLinkUrl()%>" target="<%=bb.getLinkType()%>" title="<%=bb.getAlttext()%>"><img src="/upload/BANNER/<%=bb.getNewFilename()%>" width="112" height="30" alt="<%=bb.getAlttext()%>" /></a></li>
					<%} %>
                </ul>
            </div>
            <div class="roll_control">
                <button class="footer_banner_prev"><span class="bline">이전</span></button>
                <button class="footer_banner_next"><span class="bline">다음</span></button>
            </div>
            
        </div>
		<!-- //footer_banner -->
        <!-- footer_wrap -->
        <div class="footer_wrap">
        	<p class="footer_qm">
            	<a href="/member/privacy.jsp">개인정보처리방침</a>
                <span class="arrow">I</span>
                <a href="/member/mail.jsp">이메일무단수집거부</a>
                <span class="arrow">I</span>
                <a href="/sub01/sub01_9.jsp">찾아오시는길</a>
            </p>
            <p class="addr">
            	울산 신사옥 주소 : (우 : 44538) 울산광역시 중구 종가로 305 한국석유공사<span class="arrow">I</span><span class="tel">대표전화 052-216-2114</span><span class="arrow">I</span>팩스 052-216-5900
            </p>
            <p class="copy">
            	COPYRIGHT (C) BY KOREA NATIONAL OIL CORPORATION. ALL RIGHTS RESERVED.
            </p>
            <div class="qr"><img src="/img/common/qr.png" alt="qr코드" /></div>
        </div>
		<!-- //footer_wrap -->
    </div>
	<!-- //footer -->
		




 