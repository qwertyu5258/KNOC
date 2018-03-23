<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.petronet.*"%>
<jsp:useBean id="PetronetMa" scope="page" class="kr.co.knoc.petronet.PetronetManager" />
<%
	PetronetBean pb = PetronetMa.getPetronet();
%>

<script type="text/javascript"> 
function change_table(var1,var2) 
{ 
 c_image1 = eval(var2+"_01"); 
 c_image2 = eval(var2+"_02"); 
 c_image3 = eval(var2+"_03"); 
 
 c_table1 = eval(var2+"_1"); 
 c_table2 = eval(var2+"_2"); 
 c_table3 = eval(var2+"_3"); 
 
 if(var1 == "1") { 
  this.c_image1.src = "http://www.knoc.co.kr/images/main/"+var2+"01_on.gif"; 
  this.c_image2.src = "http://www.knoc.co.kr/images/main/"+var2+"02.gif"; 
  this.c_image3.src = "http://www.knoc.co.kr/images/main/"+var2+"03.gif"; 
 
  this.c_table1.style.display = ""; 
  this.c_table2.style.display = "none"; 
  this.c_table3.style.display = "none"; 
 
  morelink = 'servlet/dvboard.List?with=PSBODB..TNDKORNEWS'; 
 } 
 else if(var1 == "2") { 
  this.c_image1.src = "http://www.knoc.co.kr/images/main/"+var2+"01.gif"; 
  this.c_image2.src = "http://www.knoc.co.kr/images/main/"+var2+"02_on.gif"; 
  this.c_image3.src = "http://www.knoc.co.kr/images/main/"+var2+"03.gif"; 
 
  this.c_table1.style.display = "none"; 
  this.c_table2.style.display = ""; 
  this.c_table3.style.display = "none"; 
   
  morelink = 'servlet/dvboard.List?with=PSBODB..TPDPUBDATA'; 
 } 
 else if(var1 == "3") { 
  this.c_image1.src = "http://www.knoc.co.kr/images/main/"+var2+"01.gif"; 
  this.c_image2.src = "http://www.knoc.co.kr/images/main/"+var2+"02.gif"; 
  this.c_image3.src = "http://www.knoc.co.kr/images/main/"+var2+"03_on.gif"; 
 
  this.c_table1.style.display = "none"; 
  this.c_table2.style.display = "none"; 
  this.c_table3.style.display = ""; 
   
  morelink = 'servlet/dvboard.List?with=PSBODB..TNDPOLICY'; 
 } 
} 

function Freeprov() {
	var win = window.open("http://www.petronet.co.kr/jsp/pet/prc/korea/freeprc/KNOC_5Xweeks.jsp", "Freeprov", "width=570, height=400");
	win.focus();
}
</script> 

<div class="price">
	<div id="taboil">
		<h2><img src="http://www.knoc.co.kr/images/main/mstle1.gif" alt="국제 유가 정보" /></h2>
		<ul>
		<li>			
			<a href="#kortab1" onclick="korChange('kortab1','kor_01');return false;"><img src="http://www.knoc.co.kr/images/main/ms1tab01_on.gif" id="kor_01" alt="원유현물" /></a>
<!-- 원유현물 --> 
 		
		<div id="kortab1"> 
			<p class="mtbtle1"><img src="http://www.knoc.co.kr/images/main/w_blet.gif" alt="" /> <% if (pb.getRecentDt() != null && !pb.getRecentDt().equals("")) { %><%=pb.getRecentDt().substring(0,4) %>.<%=pb.getRecentDt().substring(4,6) %>.<%=pb.getRecentDt().substring(6,8) %><% } %> ($/bbl)</p>
			<table cellspacing="0" cellpadding="0" summary="국제유가 정보를 원유현물 종류별로 확인할 수 있습니다." class="m1tb">
			<caption>원유현물 정보</caption>
			<colgroup><col width="105px" /><col width="47px" /><col width="40px" /></colgroup>			
				<tr>
					<th scope="row"><%=pb.getOil1Name() %></th>
					 
		    		<td><%=pb.getOil1Num() %></td> 
		            
		            <td class="td2"><%=pb.getOil1Img() %></td> 
		    		 
		   			 					
			  </tr>
			  <tr>
					<th scope="row"><%=pb.getOil2Name() %></th>
					 
           			<td><%=pb.getOil2Num() %></td> 
    				 
                   	<td class="td2"><%=pb.getOil2Img() %></td> 
                  	 
   					 
			  </tr>
			  <tr>
					<th scope="row"><%=pb.getOil3Name() %></th>
					 
           			<td><%=pb.getOil3Num() %></td> 
                  	 
                    <td class="td2"><%=pb.getOil3Img() %></td> 
    				 
   					 
			  </tr>
			</table>
		</div>
	</li>
<!-- 석유제품 --> 
<!--국제제품가격 시작--> 
 		
	<li>
		<a href="#kortab2" onclick="korChange('kortab2','kor_02');return false;"><img src="http://www.knoc.co.kr/images/main/ms1tab02.gif" id="kor_02" alt="석유제품" /></a>
		<div id="kortab2" style="display: none;"> 
			<p class="mtbtle1"><img src="http://www.knoc.co.kr/images/main/w_blet.gif" alt="" /> <% if (pb.getRecentDt() != null && !pb.getRecentDt().equals("")) { %><%=pb.getRecentDt().substring(0,4) %>.<%=pb.getRecentDt().substring(4,6) %>.<%=pb.getRecentDt().substring(6,8) %><% } %> ($/bbl)</p>
			<table cellspacing="0" cellpadding="0" summary="국제유가 정보를 석유제품 종류별로 확인할 수 있습니다." class="m1tb">
			<caption>석유제품 정보</caption>
			<colgroup><col width="105px" /><col width="47px" /><col width="40px" /></colgroup>
   
				<tr>
	<th scope="row"><%=pb.getOilp1Name() %></th>
<td><%=pb.getOilp1Num() %></td>
<td class='td2'><%=pb.getOilp1Img() %></td>
 
			  </tr>
	 
				<tr>
	<th scope="row"><%=pb.getOilp2Name() %></th>
<td><%=pb.getOilp2Num() %></td>
<td class='td2'><%=pb.getOilp2Img() %></td>
 
			  </tr>
	 
				<tr>
	<th scope="row"><%=pb.getOilp3Name() %></th>
<td><%=pb.getOilp3Num() %></td>
<td class='td2'><%=pb.getOilp3Img() %></td>
 
			  </tr>
	 			 
			</table>
		</div>
	</li>
<!-- 원유선물 --> 
<!--국제선물원유가격 시작--> 
 		
	<li>
		<a href="#kortab3" onclick="korChange('kortab3','kor_03');return false;"><img src="http://www.knoc.co.kr/images/main/ms1tab03.gif" id="kor_03" alt="원유선물" /></a>
		<div id="kortab3" style="display: none;"> 
           <p class="mtbtle1"><img src="http://www.knoc.co.kr/images/main/w_blet.gif" alt="" /> <% if (pb.getRecentDt() != null && !pb.getRecentDt().equals("")) { %><%=pb.getRecentDt().substring(0,4) %>.<%=pb.getRecentDt().substring(4,6) %>.<%=pb.getRecentDt().substring(6,8) %><% } %> &nbsp;  ($/bbl)</p>
            <table cellspacing="0" cellpadding="0" summary="국제유가 정보를 원유선물 종류별로 확인할 수 있습니다." class="m1tb">
            <caption>원유선물 정보</caption>
            <colgroup><col width="105px" /><col width="47px" /><col width="40px" /></colgroup>
                <tr>
                    <th scope="row"><%=pb.getOils1Name() %></th>
                     
           			<td><%=pb.getOils1Num() %></td> 
    				<td class="td2"><%=pb.getOils1Img() %></td> 
   					                     
              </tr>
            </table>
             
       <p class="mtbtle2" style="color:#666;"><img src="http://www.knoc.co.kr/images/main/g_blet.gif" alt="" /> <% if (pb.getRecentDt() != null && !pb.getRecentDt().equals("")) { %><%=pb.getRecentDt().substring(0,4) %>.<%=pb.getRecentDt().substring(4,6) %>.<%=pb.getRecentDt().substring(6,8) %><% } %></p>
            <table cellspacing="0" cellpadding="0" summary="국제유가 정보 확인할 수 있습니다." class="m1tb">
            <caption>국제 유가 정보</caption>
            <colgroup><col width="105px" /><col width="47px" /><col width="40px" /></colgroup>
                <tr>
                    <th scope="row"><%=pb.getOils2Name() %></th>
                     
                  	<td><%=pb.getOils2Num() %></td> 
    				<td class="td2"><%=pb.getOils2Img() %></td> 
   					 
              </tr>
            </table>
        </div>
		</li>
		</ul>
	</div>	
 
  <!-- 가상테이블 --> 	
  	<div class="m1tbdv" id="ms1tab_4" style="display: none;"> 
  	</div>
	<div id="taboil2">
		<h2><img src="http://www.knoc.co.kr/images/main/mstle2.gif" alt="국내 유가 정보" /></h2>
		<ul>
		<li>
			<a href="#worldtab1" onclick="worldChange('worldtab1','world_01');return false;"><img src="http://www.knoc.co.kr/images/main/ms2tab01_on.gif" id="world_01" alt="주유소판매" /></a>
<!-- 주유소 --> 
 		
		<div id="worldtab1"> 
			<p class="mtbtle1"><img src="http://www.knoc.co.kr/images/main/w_blet.gif" alt="" /> <%=pb.getRecentDtP() %> (원/ℓ)</p>
			<table cellspacing="0" cellpadding="0" summary="국내 유가 정보를 주유소판매 종류별로 확인할 수 있습니다." class="m2tb">
			<caption>주유소판매 정보</caption>
			<colgroup><col width="105px" /><col width="47px" /><col width="40px" /></colgroup>
	 
				<tr>
					<th scope="row"><%=pb.getStation1Name() %></th>
<td><%=pb.getStation1Num() %></td>
<td class="td2"><%=pb.getStation1Img() %></td>
 					
			  </tr>
   
				<tr>
					<th scope="row"><%=pb.getStation2Name() %></th>
<td><%=pb.getStation2Num() %></td>
<td class="td2"><%=pb.getStation2Img() %></td>
 					
			  </tr>
   
				<tr>
					<th scope="row"><%=pb.getStation3Name() %></th>
<td><%=pb.getStation3Num() %></td>
<td class="td2"><%=pb.getStation3Img() %></td>
 					
			  </tr>
  		
			</table>
		</div>
	</li>
<!-- LPG --> 
<!--국내 LPG판매가격 시작--> 
 		
	<li>
		<a href="#worldtab2" onclick="worldChange('worldtab2','world_02');return false;"><img src="http://www.knoc.co.kr/images/main/ms2tab02.gif" id="world_02" alt="LPG판매" /></a>
		<div id="worldtab2" style="display: none;"> 
			<p class="mtbtle1"><img src="http://www.knoc.co.kr/images/main/w_blet.gif" alt="" /> <%=pb.getRecentDtP() %>(원/Kg)</p>
            <table cellspacing="0" cellpadding="0" summary="국내 유가 정보를 LPG판매 종류별로 확인할 수 있습니다." class="m2tb">
            <caption>LPG판매 정보</caption>
            <colgroup><col width="105px" /><col width="47px" /><col width="40px" /></colgroup>
            <tr>
            <th scope="row"><%=pb.getLpg1Name() %></th>
            <td><%=pb.getLpg1Num() %></td>
            <td class="td2"><%=pb.getLpg1Img() %></td>
            </tr>
            <tr>
            <th scope="row"><%=pb.getLpg2Name() %></th>
            <td><%=pb.getLpg2Num() %></td>
            <td class="td2"><%=pb.getLpg2Img() %></td>
            </tr>
            <tr>
            <td colspan="3" style="color:#666" class="pt03">※ 판매소 가격입니다.</td>
            </tr>
            </table>
      	</div>		
	</li>
	<li>
		<a href="http://www.petronet.co.kr/jsp/pet/prc/korea/freeprc/KNOC_5Xweeks.jsp" target="_blank" onclick="window.open(this.href, 'popupName', 'width=580,height=420'); return false;" title="새창"><img src="http://www.knoc.co.kr/images/main/ms2tab03.gif" alt="5주간 추이" id="ms2tab_03" /></a>
	</li>
	</ul>
	
      	<!-- 가상테이블 --> 
		<div class="m2tbdv" id="ms2tab_3" style="display: none;"> 			
		</div>
		<div class="m2tbdv" id="ms2tab_4" style="display: none;"> 			
		</div>
	</div>
</div>
