<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<div id="leftarea">
		<div class="menuleftdv">
        
        <%if(lfid == 10){%>
        <h2><img src="/images/common/sleft_tle1.gif" alt="공사소개" /></h2>
        	<ul>
            	<%if(lmid == 11){%>
				<li><div class="smenu_on"><a href="#"><div class="s1_on">CEO</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 111){%>
						<li class="son2"><a href="#">CEO인사말</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">CEO인사말</a></li>
                        <%}%>
                        <%if(lsid == 112){%>
						<li class="son2"><a href="#">약력</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">약력</a></li>
                        <%}%>
                        <%if(lsid == 113){%>
						<li class="son2"><a href="#">말씀자료</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">말씀자료</a></li>
                        <%}%>
                        <%if(lsid == 114){%>
						<li class="son2"><a href="#">GREAT WAY</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">GREAT WAY</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">CEO</div></a></div></li>
                <%}%>
                
                <%if(lmid == 12){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">기업문화</div></a></div></li>
                	<ul class="sleftul">
                    	<%if(lsid == 121){%>
						<li class="son2"><a href="#">사명과비전</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">사명과비전</a></li>
                        <%}%>
                        <%if(lsid == 122){%>
						<li class="son2"><a href="#">핵심가치</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">핵심가치</a></li>
                        <%}%>
                        <%if(lsid == 123){%>
						<li class="son2"><a href="#">경영원칙</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">경영원칙</a></li>
                        <%}%>
                        <%if(lsid == 124){%>
						<li class="son2"><a href="#">일처리방식</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">일처리방식</a></li>
                        <%}%>
                        <%if(lsid == 125){%>
						<li class="son2"><a href="#">CIP</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">CIP</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">기업문화</div></a></div></li>
                <%}%>
                
                <%if(lmid == 13){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">Great KNOC 3020</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">Great KNOC 3020</div></a></div></li>
                <%}%>
                
                <%if(lmid == 14){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">회사연혁</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">회사연혁</div></a></div></li>
                <%}%>
                
                <%if(lmid == 15){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">조직 및 인원</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">조직 및 인원</div></a></div></li>
                <%}%>
                
                <%if(lmid == 16){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">석유공사30년사</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">석유공사30년사</div></a></div></li>
                <%}%>
                
                <%if(lmid == 17){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">채용정보</div></a></div></li>
                	<ul class="sleftul">
                    	<%if(lsid == 171){%>
						<li class="son2"><a href="#">인재상</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">인재상</a></li>
                        <%}%>
                        <%if(lsid == 172){%>
						<li class="son2"><a href="#">인재육성</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">인재육성</a></li>
                        <%}%>
                        <%if(lsid == 173){%>
						<li class="son2"><a href="#">복지후생</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">복지후생</a></li>
                        <%}%>
                        <%if(lsid == 174){%>
						<li class="son2"><a href="#">인재관리</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">인재관리</a></li>
                        <%}%>
                        <%if(lsid == 175){%>
						<li class="son2"><a href="#">직무소개</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">직무소개</a></li>
                        <%}%>
                        <%if(lsid == 176){%>
						<li class="son2"><a href="#">채용안내</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">채용안내</a></li>
                        <%}%>
                        <%if(lsid == 177){%>
						<li class="son2"><a href="#">상시인재등록</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">상시인재등록</a></li>
                        <%}%>
                        <%if(lsid == 178){%>
						<li class="son2"><a href="#">채용FAQ</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">채용FAQ</a></li>
                        <%}%>
                        <%if(lsid == 179){%>
						<li class="son2"><a href="#">채용설명회 신청</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">채용설명회 신청</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">채용정보</div></a></div></li>
                <%}%>
                
                <%if(lmid == 18){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">석우회</div></a></div></li>
                	<ul class="sleftul">
                    	<%if(lsid == 181){%>
						<li class="son2"><a href="#">임원명단</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">임원명단</a></li>
                        <%}%>
                        <%if(lsid == 182){%>
						<li class="son2"><a href="#">운영계획</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">운영계획</a></li>
                        <%}%>
                        <%if(lsid == 183){%>
						<li class="son2"><a href="#">수지예산</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">수지예산</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">석우회</div></a></div></li>
                <%}%>
                
                <%if(lmid == 19){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">찾아오시는 길</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">찾아오시는 길</div></a></div></li>
                <%}%>
			</ul>
        <%}%>
        
        
        
        
        
        
        <%if(lfid == 20){%>
        <h2><img src="/images/common/sleft_tle2.gif" alt="열린경영" /></h2>
        	<ul>
            	<%if(lmid == 11){%>
				<li><div class="smenu_on"><a href="#"><div class="s1_on">윤리경영</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 111){%>
						<li class="son2"><a href="#">윤리경영소개</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">윤리경영소개</a></li>
                        <%}%>
                        <%if(lsid == 112){%>
						<li class="son2"><a href="#">윤리경영소식</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">윤리경영소식</a></li>
                        <%}%>
                        <%if(lsid == 113){%>
						<li class="son2"><a href="#">말씀자료</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">말씀자료</a></li>
                        <%}%>
                        <%if(lsid == 114){%>
						<li class="son2"><a href="#">윤리경영제도</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">윤리경영제도</a></li>
                        <%}%>
                        <%if(lsid == 115){%>
						<li class="son2"><a href="#">윤리규범</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">윤리규범</a></li>
                        <%}%>
                        <%if(lsid == 116){%>
						<li class="son2"><a href="#">HOT_LINE</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">HOT_LINE</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">윤리경영</div></a></div></li>
                <%}%>
                
                <%if(lmid == 12){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">경영공시</div></a></div></li>
                	<ul class="sleftul">
                    	<%if(lsid == 121){%>
						<li class="son2"><a href="#">일반현황</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">일반현황</a></li>
                        <%}%>
                        <%if(lsid == 122){%>
						<li class="son2"><a href="#">재무정보</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">재무정보</a></li>
                        <%}%>
                        <%if(lsid == 123){%>
						<li class="son2"><a href="#">사업현황</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">사업현황</a></li>
                        <%}%>
                        <%if(lsid == 124){%>
						<li class="son2"><a href="#">인력현황</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">인력현황</a></li>
                        <%}%>
                        <%if(lsid == 125){%>
						<li class="son2"><a href="#">내?외부평가</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">내?외부평가</a></li>
                        <%}%>
                        <%if(lsid == 126){%>
						<li class="son2"><a href="#">기타정보</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">기타정보</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">경영공시</div></a></div></li>
                <%}%>
                
                <%if(lmid == 13){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">사회공헌</div></a></div></li>
                	<ul class="sleftul">
                    	<%if(lsid == 131){%>
						<li class="son2"><a href="#">사회공헌</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">사회공헌</a></li>
                        <%}%>
                        <%if(lsid == 132){%>
						<li class="son2"><a href="#">활동마당</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">활동마당</a></li>
                        <%}%>
                        <%if(lsid == 133){%>
						<li class="son2"><a href="#">의견마당</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">의견마당</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">사회공헌</div></a></div></li>
                <%}%>
                
                <%if(lmid == 14){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">환경경영</div></a></div></li>
                	<ul class="sleftul">
                    	<%if(lsid == 141){%>
						<li class="son2"><a href="#">환경경영 소개</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">환경경영 소개</a></li>
                        <%}%>
                        <%if(lsid == 142){%>
						<li class="son2"><a href="#">환경경영 현황</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">환경경영 현황</a></li>
                        <%}%>
                        <%if(lsid == 143){%>
						<li class="son2"><a href="#">환경경영</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">환경경영</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">환경경영</div></a></div></li>
                <%}%>
                
                <%if(lmid == 15){%>
                <li><div class="smenu_on"><a href="#"><div class="s1_on">Annual Report</div></a></div></li>
	                <ul class="sleftul">
                    	<%if(lsid == 151){%>
						<li class="son2"><a href="#">Profile</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">Profile</a></li>
                        <%}%>
                        <%if(lsid == 152){%>
						<li class="son2"><a href="#">Financial highlights</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">Financial highlights</a></li>
                        <%}%>
                        <%if(lsid == 153){%>
						<li class="son2"><a href="#">Achieve a great work</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">Achieve a great work</a></li>
                        <%}%>
                        <%if(lsid == 154){%>
						<li class="son2"><a href="#">Reaching out with passion</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">Reaching out with passion</a></li>
                        <%}%>
                        <%if(lsid == 155){%>
						<li class="son2"><a href="#">Korea's primary source of energy</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">Korea's primary source of energy</a></li>
                        <%}%>
                        <%if(lsid == 156){%>
						<li class="son2"><a href="#">Annual Report</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">Annual Report</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">Annual Report</div></a></div></li>
                <%}%>
			</ul>
        <%}%>
        
        
        
        
        <%if(lfid == 30){%>
        <h2><img src="/images/common/sleft_tle3.gif" alt="사업소개" /></h2>
			<ul>
            	<%if(lmid == 11){%>
				<li><div class="smenu_on"><a href="#"><div class="s1_on">대륙붕사업</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 111){%>
						<li class="son2"><a href="#">대륙붕탐사개요</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">대륙붕탐사개요</a></li>
                        <%}%>
                        <%if(lsid == 112){%>
						<li class="son2"><a href="#">대륙붕탐사현황</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">대륙붕탐사현황</a></li>
                        <%}%>
                        <%if(lsid == 113){%>
						<li class="son2"><a href="#">대륙붕탐사계획</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">대륙붕탐사계획</a></li>
                        <%}%>
                        <%if(lsid == 114){%>
						<li class="son2"><a href="#">동해-1 가스전 현황</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">동해-1 가스전 현황</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">대륙붕사업</div></a></div></li>
                <%}%>
                
                <%if(lmid == 12){%>  
                <li><div class="smenu_on"><a href="#"><div class="s1_on">해외사업</div></a></div></li>  
                	<ul class="sleftul">
                    	<%if(lsid == 121){%>
						<li class="son2"><a href="#">석유개발사업개요</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">석유개발사업개요</a></li>
                        <%}%>
                        <%if(lsid == 122){%>
						<li class="son2"><a href="#">석유개발현황도</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">석유개발현황도</a></li>
                        <%}%>
                        <%if(lsid == 123){%>
						<li class="son2"><a href="#">석유개발과정</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">석유개발과정</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">해외사업</div></a></div></li>  
                <%}%>
                
                <%if(lmid == 13){%>    
				<li><div class="smenu_on"><a href="#"><div class="s1_on">건설사업</div></a></div></li>  
                	<ul class="sleftul">
                    	<%if(lsid == 131){%>
						<li class="son2"><a href="#">건설사업 개요</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">건설사업 개요</a></li>
                        <%}%>
                        <%if(lsid == 132){%>
						<li class="son2"><a href="#">비축기지건설</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">비축기지건설</a></li>
                        <%}%>
                        <%if(lsid == 133){%>
						<li class="son2"><a href="#">생산기지건설</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">생산기지건설</a></li>
                        <%}%>
                        <%if(lsid == 134){%>
                        <li class="son2"><a href="#">해외사업추진</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">해외사업추진</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">건설사업</div></a></div></li>  
                <%}%>
                
                <%if(lmid == 14){%>    
				<li><div class="smenu_on"><a href="#"><div class="s1_on">석유비축사업</div></a></div></li>  
                	<ul class="sleftul">
                    	<%if(lsid == 141){%>
						<li class="son2"><a href="#">석유비축사업의개요</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">석유비축사업의개요</a></li>
                        <%}%>
                        <%if(lsid == 142){%>
						<li class="son2"><a href="#">비축사업추진전략</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">비축사업추진전략</a></li>
                        <%}%>
                        <%if(lsid == 143){%>
						<li class="son2"><a href="#">비축기지운영현황</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">비축기지운영현황</a></li>
                        <%}%>
                        <%if(lsid == 144){%>
                        <li class="son2"><a href="#">경제적 비축사업추진 노력</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">경제적 비축사업추진 노력</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">석유비축사업</div></a></div></li>  
                <%}%>
                
                <%if(lmid == 15){%>    
				<li><div class="smenu_on"><a href="#"><div class="s1_on">시추선사업</div></a></div></li>  
                	<ul class="sleftul">
                    	<%if(lsid == 151){%>
						<li class="son2"><a href="#">소개</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">소개</a></li>
                        <%}%>
                        <%if(lsid == 152){%>
						<li class="son2"><a href="#">사업실적</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">사업실적</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">시추선사업</div></a></div></li>  
                <%}%>
                
                <%if(lmid == 16){%>    
				<li><div class="smenu_on"><a href="#"><div class="s1_on">석유정보</div></a></div></li>  
                	<ul class="sleftul">
                    	<%if(lsid == 161){%>
						<li class="son2"><a href="#">석유정보서비스</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">석유정보서비스</a></li>
                        <%}%>
                        <%if(lsid == 162){%>
						<li class="son2"><a href="#">Petronet</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">Petronet</a></li>
                        <%}%>
                        <%if(lsid == 163){%>
						<li class="son2"><a href="#">석유이야기</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">석유이야기</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">석유정보</div></a></div></li>  
                <%}%>
                
                <%if(lmid == 17){%>    
				<li><div class="smenu_on"><a href="#"><div class="s1_on">에특회계</div></a></div></li>  
                	<ul class="sleftul">
                    	<%if(lsid == 171){%>
						<li class="son2"><a href="#">개요</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">개요</a></li>
                        <%}%>
                        <%if(lsid == 172){%>
						<li class="son2"><a href="#">사업추진효과</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">사업추진효과</a></li>
                        <%}%>
                        <%if(lsid == 173){%>
						<li class="son2"><a href="#">세입</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">세입</a></li>
                        <%}%>
                        <%if(lsid == 174){%>
                        <li class="son2"><a href="#">세출</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">세출</a></li>
                        <%}%>
                        <%if(lsid == 175){%>
                        <li class="son2"><a href="#">사업융자,보조지원안내</a></li>
                        <%}else{%>
                        <li class="son"><a href="#">사업융자,보조지원안내</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">에특회계</div></a></div></li>  
                <%}%>
			</ul>
        <%}%>
        
        
        
            
        <%if(lfid == 40){%>
			<h2><img src="/images/common/sleft_tle4.gif" alt="고객참여" /></h2>
			<ul>
            	<%if(lmid == 11){%>
                <li><div class="smenu_on"><a href="../sub04/sub04_1_1.jsp"><div class="s1_on">고객헌장</div></a></div></li>
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
                <li><div class="smenu_off"><a href="../sub04/sub04_1_1.jsp"><div class="s1_off">고객헌장</div></a></div></li>
                <%}%>
                
                <%if(lmid == 12){%>	
                <li><div class="smenu_on"><a href="../sub04/sub04_2.jsp"><div class="s1_on">고객상담실</div></a></div></li>
	                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><div class="smenu_off"><a href="../sub04/sub04_2.jsp"><div class="s1_off">고객상담실</div></a></div></li>
                <%}%>
                
                <%if(lmid == 13){%>
				<li><div class="smenu_on"><a href="../sub04/sub04_3.jsp"><div class="s1_on">고객/국민 제안</div></a></div></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><div class="smenu_off"><a href="../sub04/sub04_3.jsp"><div class="s1_off">고객/국민 제안</div></a></div></li>
                <%}%>
                
                <%if(lmid == 14){%>
				<li><div class="smenu_on"><a href="../sub04/sub04_4_1.jsp"><div class="s1_on">FAQ</div></a></div></li>
					<ul class="sleftul">
	                    <%if(lsid == 141){%>
						<li class="son2"><a href="../sub04/sub04_4_1.jsp">석유상식</a></li>
                        <%}else{%>
                        <li class="son"><a href="../sub04/sub04_4_1.jsp">석유상식</a></li>
                        <%}%>
                        <%if(lsid == 142){%>
						<li class="son2"><a href="../sub04/sub04_4_2.jsp">석유개발</a></li>
                        <%}else{%>
                        <li class="son"><a href="../sub04/sub04_4_2.jsp">석유개발</a></li>
                        <%}%>
                        <%if(lsid == 143){%>
					    <li class="son2"><a href="../sub04/sub04_4_3.jsp">석유비축</a></li>
                        <%}else{%>
                        <li class="son"><a href="../sub04/sub04_4_3.jsp">석유비축</a></li>
                        <%}%>
                        <%if(lsid == 144){%>
					    <li class="son2"><a href="../sub04/sub04_4_4.jsp">일반사항</a></li>
                        <%}else{%>
                        <li class="son"><a href="../sub04/sub04_4_4.jsp">일반사항</a></li>
                        <%}%>
					</ul>
				<%}else{%>
                <li><div class="smenu_off"><a href="../sub04/sub04_4_1.jsp"><div class="s1_off">FAQ</div></a></div></li>
                <%}%>
                
                <%if(lmid == 15){%>
			    <li><div class="smenu_on"><a href="../sub04/sub04_5.jsp"><div class="s1_on">민원(부조리)사항</div></a></div></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><div class="smenu_off"><a href="../sub04/sub04_5.jsp"><div class="s1_off">민원(부조리)사항</div></a></div></li>
                <%}%>
                
                <%if(lmid == 16){%>
				<li><div class="smenu_on"><a href="../sub04/sub04_6.jsp"><div class="s1_on">예산낭비신고센터</div></a></div></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><div class="smenu_off"><a href="../sub04/sub04_6.jsp"><div class="s1_off">예산낭비신고센터</div></a></div></li>
                <%}%>
                
                <%if(lmid == 17){%>
				<li><div class="smenu_on"><a href="../sub04/sub04_7.jsp"><div class="s1_on">설문조사</div></a></div></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><div class="smenu_off"><a href="../sub04/sub04_7.jsp"><div class="s1_off">설문조사</div></a></div></li>
                <%}%>
			</ul>
         <%}%>
         




         
		 
		 <%if(lfid == 50){%>
         <h2><img src="/images/common/sleft_tle5.gif" alt="정보마당" /></h2>
			<ul>
	            <%if(lmid == 11){%>
                <li><div class="smenu_on"><a href="/sub05/sub05_1.jsp"><div class="s1_on">공지사항</div></a></div></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><div class="smenu_off"><a href="/sub05/sub05_1.jsp"><div class="s1_off">공지사항</div></a></div></li>
                <%}%>
                
                <%if(lmid == 12){%>
				<li><div class="smenu_on"><a href="/sub05/sub05_2.jsp"><div class="s1_on">석유뉴스</div></a></div></li>
                <%if(lsid == 0){%> <%}%>
				<%}else{%>
                <li><div class="smenu_off"><a href="/sub05/sub05_2.jsp"><div class="s1_off">석유뉴스</div></a></div></li>
                <%}%>
                
                <%if(lmid == 13){%>
				<li><div class="smenu_on"><a href="/sub05/sub05_3_1.jsp"><div class="s1_on">사이버홍보실</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 131){%>
						<li class="son2"><a href="/sub05/sub05_3_1.jsp">홍보영상</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_3_1.jsp">홍보영상</a></li>
                        <%}%>
                        <%if(lsid == 132){%>
						<li class="son2"><a href="/sub05/sub05_3_2.jsp">홍보사진</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_3_2.jsp">홍보사진</a></li>
                        <%}%>
                        <%if(lsid == 133){%>
						<li class="son2"><a href="/sub05/sub05_3_3.jsp">석유사랑(전자사보)</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_3_3.jsp">석유사랑(전자사보)</a></li>
                        <%}%>
                        <%if(lsid == 134){%>
						<li class="son2"><a href="/sub05/sub05_3_4.jsp">석유만화</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_3_4.jsp">석유만화</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub05/sub05_3_1.jsp"><div class="s1_off">사이버홍보실</div></a></div></li>
                <%}%>
                
                <%if(lmid == 14){%>
				<li><div class="smenu_on"><a href="/sub05/sub05_4_1.jsp"><div class="s1_on">정보공개방</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 141){%>
						<li class="son2"><a href="/sub05/sub05_4_1.jsp">정보공개제도안내</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_4_1.jsp">정보공개제도안내</a></li>
                        <%}%>
                        <%if(lsid == 142){%>
						<li class="son2"><a href="/sub05/sub05_4_2.jsp">자발적 정보공개목록</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_4_2.jsp">자발적 정보공개목록</a></li>
                        <%}%>
                        <%if(lsid == 143){%>
						<li class="son2"><a href="/sub05/sub05_4_3.jsp">정보공개청구</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_4_3.jsp">정보공개청구</a></li>
                        <%}%>
                        <%if(lsid == 144){%>
						<li class="son2"><a href="/sub05/sub05_4_4.jsp">관련자료실</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_4_4.jsp">관련자료실</a></li>
                        <%}%>
                        <%if(lsid == 145){%>
						<li class="son2"><a href="/sub05/sub05_4_5.jsp">정보공개목록</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_4_5.jsp">정보공개목록</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub05/sub05_4_1.jsp"><div class="s1_off">정보공개방</div></a></div></li>
                <%}%>
                
                <%if(lmid == 15){%>
				<li><div class="smenu_on"><a href="/sub05/sub05_5_1.jsp"><div class="s1_on">자료실</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 151){%>
						<li class="son2"><a href="/sub05/sub05_5_1.jsp">석유개발/시추선</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_5_1.jsp">석유개발/시추선</a></li>
                        <%}%>
                        <%if(lsid == 152){%>
						<li class="son2"><a href="/sub05/sub05_5_2.jsp">비축/건설</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_5_2.jsp">비축/건설</a></li>
                        <%}%>
                        <%if(lsid == 153){%>
						<li class="son2"><a href="/sub05/sub05_5_3.jsp">신청서식</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_5_3.jsp">신청서식</a></li>
                        <%}%>
                        <%if(lsid == 154){%>
						<li class="son2"><a href="/sub05/sub05_5_4.jsp">정관 및 법령자료</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_5_4.jsp">정관 및 법령자료</a></li>
                        <%}%>
                        <%if(lsid == 155){%>
						<li class="son2"><a href="/sub05/sub05_5_5.jsp">일반/기타</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_5_5.jsp">일반/기타</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub05/sub05_5_1.jsp"><div class="s1_off">자료실</div></a></div></li>
                <%}%>
				
                <%if(lmid == 16){%>
                <li><div class="smenu_on"><a href="/sub05/sub05_6.jsp"><div class="s1_on">위험정보</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub05/sub05_6.jsp"><div class="s1_off">위험정보</div></a></div></li>
                <%}%>
                
                <%if(lmid == 17){%>
				<li><div class="smenu_on"><a href="/sub05/sub05_7_1.jsp"><div class="s1_on">관련사이트</div></a></div></li>
					<ul class="sleftul">
	                    <%if(lsid == 171){%>
						<li class="son2"><a href="/sub05/sub05_7_1.jsp">정부기관</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_7_1.jsp">정부기관</a></li>
                        <%}%>
                        <%if(lsid == 172){%>
						<li class="son2"><a href="/sub05/sub05_7_2.jsp">국내석유회사,단체</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_7_2.jsp">국내석유회사,단체</a></li>
                        <%}%>
                        <%if(lsid == 173){%>
						<li class="son2"><a href="/sub05/sub05_7_3.jsp">국내유관사이트</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_7_3.jsp">국내유관사이트</a></li>
                        <%}%>
                        <%if(lsid == 174){%>
						<li class="son2"><a href="/sub05/sub05_7_4.jsp">해외석유회사,단체</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_7_4.jsp">해외석유회사,단체</a></li>
                        <%}%>
                        <%if(lsid == 175){%>
						<li class="son2"><a href="/sub05/sub05_7_5.jsp">해외유관사이트</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub05/sub05_7_5.jsp">해외유관사이트</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub05/sub05_7_1.jsp"><div class="s1_off">관련사이트</div></a></div></li>
				<%}%>
			</ul>
            <%}%>



            
            
            
            <%if(lfid == 60){%>
            <h2><img src="/images/common/sleft_tle6.gif" alt="석유개발연구" /></h2>
			<ul>
            	<%if(lmid == 11){%>
				<li><div class="smenu_on"><a href="/sub06/sub06_1_1.jsp"><div class="s1_on">연구원안내</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 111){%>
						<li class="son2"><a href="/sub06/sub06_1_1.jsp">인사말</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_1_1.jsp">인사말</a></li>
                        <%}%>
                        <%if(lsid == 112){%>
						<li class="son2"><a href="/sub06/sub06_1_2.jsp">연혁</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_1_2.jsp">연혁</a></li>
                        <%}%>
                        <%if(lsid == 113){%>
						<li class="son2"><a href="/sub06/sub06_1_3.jsp">조직도</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_1_3.jsp">조직도</a></li>
                        <%}%>
                        <%if(lsid == 114){%>
						<li class="son2"><a href="/sub06/sub06_1_4_1.jsp">부서안내</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_1_4_1.jsp">부서안내</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub06/sub06_1_1.jsp"><div class="s1_off">연구원안내</div></a></div></li>
				<%}%>
                
                <%if(lmid == 12){%>
				<li><div class="smenu_on"><a href="/sub06/sub06_2_1.jsp"><div class="s1_on">연구개발</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 121){%>
						<li class="son2"><a href="/sub06/sub06_2_1.jsp">연도별 R&D 수행실적</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_2_1.jsp">연도별 R&D 수행실적</a></li>
                        <%}%>
                        <%if(lsid == 122){%>
						<li class="son2"><a href="/sub06/sub06_2_2_1.jsp">분야별 R&D</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_2_2_1.jsp">분야별 R&D</a></li>
                        <%}%>
                        <%if(lsid == 123){%>
						<li class="son2"><a href="/sub06/sub06_2_3.jsp">수행중인 R&D</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_2_3.jsp">수행중인 R&D</a></li>
                        <%}%>
                        <%if(lsid == 124){%>
						<li class="son2"><a href="/sub06/sub06_2_4.jsp">학술발표/논문게재</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_2_4.jsp">학술발표/논문게재</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub06/sub06_2_1.jsp"><div class="s1_off">연구개발</div></a></div></li>
				<%}%>
                
                <%if(lmid == 13){%>
				<li><div class="smenu_on"><a href="/sub06/sub06_3_1_1.jsp"><div class="s1_on">기술서비스</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 131){%>
						<li class="son2"><a href="/sub06/sub06_3_1_1.jsp">기술평가 및 지원</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_3_1_1.jsp">기술평가 및 지원</a></li>
                        <%}%>
                        <%if(lsid == 132){%>
						<li class="son2"><a href="/sub06/sub06_3_3.jsp">KOTIS</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_3_3.jsp">KOTIS</a></li>
                        <%}%>
                        <%if(lsid == 133){%>
						<li class="son2"><a href="/sub06/sub06_3_4.jsp">보유 H/W S/W</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_3_4.jsp">보유 H/W S/W</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub06/sub06_3_1_1.jsp"><div class="s1_off">기술서비스</div></a></div></li>
				<%}%>
                
                <%if(lmid == 14){%>
				<li><div class="smenu_on"><a href="/sub06/sub06_4_1.jsp"><div class="s1_on">기술동향</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 141){%>
						<li class="son2"><a href="/sub06/sub06_4_1.jsp">석유지질</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_4_1.jsp">석유지질</a></li>
                        <%}%>
                        <%if(lsid == 142){%>
						<li class="son2"><a href="/sub06/sub06_4_2.jsp">지구물리</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_4_2.jsp">지구물리</a></li>
                        <%}%>
                        <%if(lsid == 143){%>
						<li class="son2"><a href="/sub06/sub06_4_3.jsp">석유공학</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_4_3.jsp">석유공학</a></li>
                        <%}%>
                        <%if(lsid == 144){%>
						<li class="son2"><a href="/sub06/sub06_4_4.jsp">비재래형</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub06/sub06_4_4.jsp">비재래형</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub06/sub06_4_1.jsp"><div class="s1_off">기술동향</div></a></div></li>
                <%}%>
                
                <%if(lmid == 15){%>
				<li><div class="smenu_on"><a href="/sub06/sub06_5.jsp"><div class="s1_on">용어사전</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub06/sub06_5.jsp"><div class="s1_off">용어사전</div></a></div></li>
                <%}%>
			</ul>
            <%}%>
            
            
            
            <%if(lfid == 70){%>
            <h2><img src="/images/common/sleft_tle7.gif" alt="어린이" /></h2>
			<ul>
            	<%if(lmid == 11){%>
				<li><div class="smenu_on"><a href="/sub07/sub07_1_1.jsp"><div class="s1_on">석유이야기</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 111){%>
						<li class="son2"><a href="/sub07/sub07_1_1.jsp">한국석유공사</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_1_1.jsp">한국석유공사</a></li>
                        <%}%>
                        <%if(lsid == 112){%>
						<li class="son2"><a href="/sub07/sub07_1_2.jsp">우리도산유국</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_1_2.jsp">우리도산유국</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub07/sub07_1_1.jsp"><div class="s1_off">석유이야기</div></a></div></li>
                <%}%>
                
                <%if(lmid == 12){%>
				<li><div class="smenu_on"><a href="/sub07/sub07_2_1.jsp"><div class="s1_on">석유바로알기</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 121){%>
						<li class="son2"><a href="/sub07/sub07_2_1.jsp">석유상식</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_2_1.jsp">석유상식</a></li>
                        <%}%>
                        <%if(lsid == 122){%>
						<li class="son2"><a href="/sub07/sub07_2_2.jsp">석유와생활</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_2_2.jsp">석유와생활</a></li>
                        <%}%>
                        <%if(lsid == 123){%>
						<li class="son2"><a href="/sub07/sub07_2_3.jsp">석유공부방</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_2_3.jsp">석유공부방</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub07/sub07_2_1.jsp"><div class="s1_off">석유바로알기</div></a></div></li>
                <%}%>
                
                <%if(lmid == 13){%>
				<li><div class="smenu_on"><a href="/sub07/sub07_3_1.jsp"><div class="s1_on">석유참여방</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 131){%>
						<li class="son2"><a href="/sub07/sub07_3_1.jsp">나도한마디</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_3_1.jsp">나도한마디</a></li>
                        <%}%>
                        <%if(lsid == 132){%>
						<li class="son2"><a href="/sub07/sub07_3_2.jsp">궁금해요</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_3_2.jsp">궁금해요</a></li>
                        <%}%>
                        <%if(lsid == 133){%>
						<li class="son2"><a href="/sub07/sub07_3_3.jsp">석유어린이단</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_3_3.jsp">석유어린이단</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub07/sub07_3_1.jsp"><div class="s1_off">석유참여방</div></a></div></li>
                <%}%>
                
                <%if(lmid == 14){%>
				<li><div class="smenu_on"><a href="/sub07/sub07_4_1.jsp"><div class="s1_on">석유놀이터</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 141){%>
						<li class="son2"><a href="/sub07/sub07_4_1.jsp">페트로메이션</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_4_1.jsp">페트로메이션</a></li>
                        <%}%>
                        <%if(lsid == 142){%>
						<li class="son2"><a href="/sub07/sub07_4_2.jsp">석유놀이방</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub07/sub07_4_2.jsp">석유놀이방</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub07/sub07_4_1.jsp"><div class="s1_off">석유놀이터</div></a></div></li>
                <%}%>
			</ul>
            <%}%>
            
            
            
            <%if(lfid == 80){%>
            <h2><img src="/images/common/sleft_tle8.gif" alt="이사회" /></h2>
			<ul>
            	<%if(lmid == 11){%>
				<li><div class="smenu_on"><a href="/sub08/sub08_1_1_1.jsp"><div class="s1_on">이사회소개</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 111){%>
						<li class="son2"><a href="/sub08/sub08_1_1_1.jsp">이사회구성및 기능</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_1_1_1.jsp">이사회구성및 기능</a></li>
                        <%}%>
                        <%if(lsid == 112){%>
						<li class="son2"><a href="/sub08/sub08_1_2.jsp">소집 및 의결절차</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_1_2.jsp">소집 및 의결절차</a></li>
                        <%}%>
                        <%if(lsid == 113){%>
						<li class="son2"><a href="/sub08/sub08_1_3.jsp">비상임이사보수</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_1_3.jsp">비상임이사보수</a></li>
                        <%}%>
                        <%if(lsid == 114){%>
						<li class="son2"><a href="/sub08/sub08_1_4.jsp">관련규정 및 법령</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_1_4.jsp">관련규정 및 법령</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub08/sub08_1_1_1.jsp"><div class="s1_off">이사회소개</div></a></div></li>
                <%}%>
                
                <%if(lmid == 12){%>
				<li><div class="smenu_on"><a href="/sub08/sub08_2_1_1.jsp"><div class="s1_on">이사회운영</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 121){%>
						<li class="son2"><a href="/sub08/sub08_2_1_1.jsp">이사회운영실적</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_2_1_1.jsp">이사회운영실적</a></li>
                        <%}%>
                        <%if(lsid == 122){%>
						<li class="son2"><a href="/sub08/sub08_2_2_1.jsp">운영계획 및 연차보고서</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_2_2_1.jsp">운영계획 및 연차보고서</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub08/sub08_2_1_1.jsp"><div class="s1_off">이사회운영</div></a></div></li>
                <%}%>
                
                <%if(lmid == 13){%>
				<li><div class="smenu_on"><a href="/sub08/sub08_3_1_1_1.jsp"><div class="s1_on">경영정보</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 131){%>
						<li class="son2"><a href="/sub08/sub08_3_1_1_1.jsp">경영정보</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_3_1_1_1.jsp">경영정보</a></li>
                        <%}%>
                        <%if(lsid == 132){%>
						<li class="son2"><a href="/sub08/sub08_3_2_1.jsp">석유정보</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_3_2_1.jsp">석유정보</a></li>
                        <%}%>
                        <%if(lsid == 133){%>
						<li class="son2"><a href="/sub08/sub08_3_3.jsp">석유사랑(사보)</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_3_3.jsp">석유사랑(사보)</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub08/sub08_3_1_1_1.jsp"><div class="s1_off">경영정보</div></a></div></li>
                <%}%>
                
                <%if(lmid == 14){%>
				<li><div class="smenu_on"><a href="/sub08/sub08_4_1.jsp"><div class="s1_on">참여마당</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 141){%>
						<li class="son2"><a href="/sub08/sub08_4_1.jsp">경영제언 및 조치사항</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_4_1.jsp">경영제언 및 조치사항</a></li>
                        <%}%>
                        <%if(lsid == 142){%>
						<li class="son2"><a href="/sub08/sub08_4_2.jsp">자유게시판</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_4_2.jsp">자유게시판</a></li>
                        <%}%>
                        <%if(lsid == 143){%>
						<li class="son2"><a href="/sub08/sub08_4_3.jsp">요구자료 및 질의</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_4_3.jsp">요구자료 및 질의</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub08/sub08_4_1.jsp"><div class="s1_off">참여마당</div></a></div></li>
                <%}%>
                
                <%if(lmid == 15){%>
				<li><div class="smenu_on"><a href="/sub08/sub08_5_1.jsp"><div class="s1_on">공지사항</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 151){%>
						<li class="son2"><a href="/sub08/sub08_5_1.jsp">이사회 등 개최안내</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_5_1.jsp">이사회 등 개최안내</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub08/sub08_5_1.jsp"><div class="s1_off">공지사항</div></a></div></li>
                <%}%>
                
                <%if(lmid == 16){%>
				<li><div class="smenu_on"><a href="/sub08/sub08_6_1.jsp"><div class="s1_on">이사회연락처</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 161){%>
						<li class="son2"><a href="/sub08/sub08_6_1.jsp">이사회사무국 연락처</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_6_1.jsp">이사회사무국 연락처</a></li>
                        <%}%>
                        <%if(lsid == 162){%>
						<li class="son2"><a href="/sub08/sub08_6_2.jsp">임원연락처</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_6_2.jsp">임원연락처</a></li>
                        <%}%>
                        <%if(lsid == 163){%>
						<li class="son2"><a href="/sub08/sub08_6_3.jsp">공사 전화번호부</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_6_3.jsp">공사 전화번호부</a></li>
                        <%}%>
                        <%if(lsid == 164){%>
						<li class="son2"><a href="/sub08/sub08_6_4.jsp">찾아오시는 길</a></li>
                        <%}else{%>
                        <li class="son"><a href="/sub08/sub08_6_4.jsp">찾아오시는 길</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="/sub08/sub08_6_1.jsp"><div class="s1_off">이사회연락처</div></a></div></li>
                <%}%>
			</ul>
            <%}%>
            
            
            
            
            <%if(lfid == 90){%>
            <h2><img src="/images/common/sleft_tle9.gif" alt="기타서비스" /></h2>
			<ul>
            	<%if(lmid == 11){%>
				<li><div class="smenu_on"><a href="#"><div class="s1_on">회원가입</div></a></div></li>
					<ul class="sleftul">
                    	<%if(lsid == 111){%>
						<li class="son2"><a href="/member/login.jsp">로그인</a></li>
                        <%}else{%>
                        <li class="son"><a href="/member/login.jsp">로그인</a></li>
                        <%}%>
                        <%if(lsid == 112){%>
						<li class="son2"><a href="/member/pre_join.jsp">회원가입</a></li>
                        <%}else{%>
                        <li class="son"><a href="/member/pre_join.jsp">회원가입</a></li>
                        <%}%>
                        <%if(lsid == 113){%>
						<li class="son2"><a href="/member/id_find.jsp">아이디 찾기</a></li>
                        <%}else{%>
                        <li class="son"><a href="/member/id_find.jsp">아이디 찾기</a></li>
                        <%}%>
                        <%if(lsid == 114){%>
						<li class="son2"><a href="/member/pw_find.jsp">비밀번호 찾기</a></li>
                        <%}else{%>
                        <li class="son"><a href="/member/pw_find.jsp">비밀번호 찾기</a></li>
                        <%}%>
					</ul>
                <%}else{%>
                <li><div class="smenu_off"><a href="#"><div class="s1_off">회원가입</div></a></div></li>
                <%}%>
                
                <%if(lmid == 12){%>
				<li><div class="smenu_on"><a href="#"><div class="s1_on">사이트맵</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="@"><div class="s1_off">사이트맵</div></a></div></li>
                <%}%>
                
                <%if(lmid == 13){%>
				<li><div class="smenu_on"><a href="#"><div class="s1_on">개인정보보호정책</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="@"><div class="s1_off">개인정보보호정책</div></a></div></li>
                <%}%>
                
                <%if(lmid == 14){%>
				<li><div class="smenu_on"><a href="#"><div class="s1_on">뷰어프로그램</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="@"><div class="s1_off">뷰어프로그램</div></a></div></li>
                <%}%>
                
                <%if(lmid == 15){%>
				<li><div class="smenu_on"><a href="#"><div class="s1_on">RSS서비스</div></a></div></li>
                <%}else{%>
                <li><div class="smenu_off"><a href="@"><div class="s1_off">RSS서비스</div></a></div></li>
                <%}%>
                
                
			</ul>
            <%}%>
            
           
           
            
            
            <%if(lfid == 110){%>
            <h2><img src="/images/common/sleft_search.gif" alt="사이트검색" /></h2>
			<ul>
            	<%if(lmid == 11){%>
				<li><div class="smenu_on"><a href="#"><div class="s1_on">사이트검색</div></a></div></li>
                <%}%>
			</ul>
            <%}%>
            
		</div>
	</div>	