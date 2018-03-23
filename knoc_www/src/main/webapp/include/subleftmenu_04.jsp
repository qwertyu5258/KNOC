<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<div id="leftarea">
		<div class="menuleftdv">
        <%if(lfid == 40){%>
			<h2><img src="/images/common/sleft_tle4.gif" alt="고객참여" /></h2>
			<ul>
            	<%if(lmid == 11){%>
				<li><a href="../sub04/sub04_1_1.jsp"><img src="/images/common/sleft_menu4_1on.gif" alt="고객헌장" border="0" /></a></li>
					<ul class="sleftul">
	                    <%if(lsid == 111){%>
						<li class="son2"><a href="../sub04/sub04_1_1.jsp">고객헌장 선언문</a></li>
                        <%}else{%>
                        <li class="son"><a href="../sub04/sub04_1_1.jsp">고객헌장 선언문</a></li>
                        <%}%>
                        <%if(lsid == 112){%>
						<li class="son2"><a href="../sub04/sub04_1_2.jsp">서비스이행표준</a></li>
                        <%}else{%>
                        <li class="son"><a href="../sub04/sub04_1_2.jsp">서비스이행표준</a></li>
                        <%}%>
                        <%if(lsid == 113){%>
					    <li class="son2"><a href="../sub04/sub04_1_3.jsp">서비스표준 이행실적</a></li>
                        <%}else{%>
                        <li class="son"><a href="../sub04/sub04_1_3.jsp">서비스표준 이행실적</a></li>
                        <%}%>
					</ul>
	            <%}else{%>
                <li><a href="../sub04/sub04_1_1.jsp"><img src="/images/common/sleft_menu4_1.gif" alt="고객헌장" border="0" /></a></li>
                <%}%>
                
                <%if(lmid == 12){%>	
				<li><a href="../sub04/sub04_2.jsp"><img src="/images/common/sleft_menu4_2on.gif" border="0" alt="고객상담실" /></a></li>
	                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><a href="../sub04/sub04_2.jsp"><img src="/images/common/sleft_menu4_2.gif" border="0" alt="고객상담실" /></a></li>
                <%}%>
                
                <%if(lmid == 13){%>
				<li><a href="../sub04/sub04_3.jsp"><img src="/images/common/sleft_menu4_3on.gif" border="0" alt="고객/국민 제안" /></a></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><a href="../sub04/sub04_3.jsp"><img src="/images/common/sleft_menu4_3.gif" border="0" alt="고객/국민 제안" /></a></li>
                <%}%>
                
                <%if(lmid == 14){%>
				<li><a href="../sub04/sub04_4_1.jsp"><img src="/images/common/sleft_menu4_4on.gif" border="0" alt="FAQ" /></a></li>
					<ul class="sleftul">
	                    <%if(lsid == 141){%>
						<li class="son"><a href="../sub04/sub04_4_1.jsp">석유상식</a></li>
                        <%}else{%>
                        <li><a href="../sub04/sub04_4_1.jsp">석유상식</a></li>
                        <%}%>
                        <%if(lsid == 142){%>
						<li class="son"><a href="../sub04/sub04_4_2.jsp">석유개발</a></li>
                        <%}else{%>
                        <li><a href="../sub04/sub04_4_2.jsp">석유개발</a></li>
                        <%}%>
                        <%if(lsid == 143){%>
					    <li class="son"><a href="../sub04/sub04_4_3.jsp">석유비축</a></li>
                        <%}else{%>
                        <li><a href="../sub04/sub04_4_3.jsp">석유비축</a></li>
                        <%}%>
                        <%if(lsid == 144){%>
					    <li class="son"><a href="../sub04/sub04_4_4.jsp">일반사항</a></li>
                        <%}else{%>
                        <li><a href="../sub04/sub04_4_4.jsp">일반사항</a></li>
                        <%}%>
					</ul>
				<%}else{%>
                <li><a href="../sub04/sub04_4_1.jsp"><img src="/images/common/sleft_menu4_4.gif" border="0" alt="FAQ" /></a></li>
                <%}%>
                
                <%if(lmid == 15){%>
			    <li><a href="../sub04/sub04_5.jsp"><img src="/images/common/sleft_menu4_5on.gif" border="0" alt="민원(부조리)사항" /></a></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><a href="../sub04/sub04_5.jsp"><img src="/images/common/sleft_menu4_5.gif" border="0" alt="민원(부조리)사항" /></a></li>
                <%}%>
                
                <%if(lmid == 16){%>
				<li><a href="../sub04/sub04_6.jsp"><img src="/images/common/sleft_menu4_6on.gif" border="0" alt="예산낭비신고센터" /></a></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><a href="../sub04/sub04_6.jsp"><img src="/images/common/sleft_menu4_6.gif" border="0" alt="예산낭비신고센터" /></a></li>
                <%}%>
                
                <%if(lmid == 17){%>
				<li><a href="../sub04/sub04_7.jsp"><img src="/images/common/sleft_menu4_7on.gif" border="0" alt="설문조사" /></a></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><a href="../sub04/sub04_7.jsp"><img src="/images/common/sleft_menu4_7.gif" border="0" alt="설문조사" /></a></li>
                <%}%>
                            
			</ul>
         <%}%>
		</div>
	</div>	