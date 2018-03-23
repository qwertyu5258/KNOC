<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","13");
	application.setAttribute("gNavMenuDepth3","01");
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
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
                    &gt; <span>CI</span>
                    &gt; <span class="locanow">CI소개</span>
				</div>
				<!--// location: end //-->
				
<script type="text/javascript" src="/ebook/kor/common.js"></script>
<script type="text/javascript" src="/ebook/eng/common.js"></script>
				
				
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_2_5.gif" alt="CIP" /></h3>
				</div>
								
				<div class="cip">
					
					<!-- div class="cip_tab">
						<ul>
							<li><a href="/sub01/sub01_2_5.jsp"><img src="/images/cip/cip_tab01_on.gif" alt="identifier" /></a></li>
							<li><a href="/sub01/sub01_2_5_01.jsp"><img src="/images/cip/cip_tab02.gif" alt="signature" /></a></li>
							<li><a href="/sub01/sub01_2_5_02.jsp"><img src="/images/cip/cip_tab03.gif" alt="basic elements" /></a></li>
							<li><a href="/sub01/sub01_2_5_03.jsp"><img src="/images/cip/cip_tab04.gif" alt="application system" /></a></li>
						</ul>
						<div class="dummy"></div>
						<p class="ebook_kor"><a href="#kor" onclick="ecatalog('/ebook/kor/','','4','yes');"><img src="/images/cip/btn_ebook_kor.gif" alt="e-book국문" /></a></p>
						<p class="ebook_eng"><a href="#eng" onclick="ecatalog('/ebook/eng/','','5','yes');"><img src="/images/cip/btn_ebook_en.gif" alt="e-book영문" /></a></p>
					</div--><!-- cip_tab end -->
					
					<div class="cip_down2">
						<a href="/cip_down/identifier/KNOC_CI_STANDARDS_MANUAL.zip"><img src="/images/cip/btn_manual_pdf.gif" alt="PDF 다운로드" /></a>
						<a href="/cip_down/signature/BS2_SIGNATURE_ai.zip"><img src="/images/cip/btn_ai_dw.gif" alt="AI 다운로드" /></a>
						<a href="/cip_down/signature/BS2_SIGNATURE_jpg.zip"><img src="/images/cip/btn_jpg_dw.gif" alt="JPG 다운로드" /></a>
						<a href="#kor" onclick="ecatalog('/ebook/kor/','','4','yes');"><img src="/images/cip/btn_ebook_kor.gif" alt="e-book국문" /></a>
						<!-- 
						<a href="/cip_down/identifier/KNOC_STANDARDS_MANUAL.zip"><img src="/images/cip/btn_manual_dw.gif" alt="knoc ci standards manual 다운로드" /></a>
						<a href="/cip_down/identifier/Utilizing.zip"><img src="/images/cip/btn_wm_dw.gif" alt="활용파일다운로드" /></a> -->
					</div>
					
					<div class="cip_cont">
						
						<h4><img src="/images/cip/wm_tit.gif" alt="워드마크" /></h4>
						
						<div class="cip_box_top"></div>
						<div class="cip_box_mid">							
							<p class="cip_txt">
								워드마크는 한국석유공사의 조형적 특징 및 상징성을 가장 잘 드러내는 요소이다.<br /> 
								모든 원고의 사용은 매뉴얼 CD의 컴퓨터 데이터에 의해 정비례로 확대 축소하여 사용하는 것을 원칙으로 한다.
							</p>
							<p class="cip_img"><img src="/images/cip/cip_15.gif" alt="knoc 워드마크" /></p>
							<dl>
								<dt>컨셉</dt>
								<dd>
									우리나라를 대표하는 국영기업으로서의 이미지를 강조하기 위하여, 대한민국의 대표 이니셜      와 태극문양을 결합하여 표현하였다. 
									순환하는 이미지로 재해석된 태극문양의 모티프는 ‘석유’에서 ‘가치’로의 순환, ‘기술’에서 ‘인간’으로의 순환, ‘오늘’의 도전에서 ‘내일’의 혁신으로의 순환을 나타내며, 국영기업으로서의 신뢰감을 강조함과 동시에 글로벌 플레이어로서 이미지를 전달하고 있다.
								</dd>
							</dl>							
						</div>
						<div class="cip_box_bot"></div>
						
						<div style="clear:both ; height:30px ;"></div>
						
						<h4><img src="/images/cip/grid_tit.gif" alt="그리드 &amp; 공간규정" /></h4>						
						<div class="cip_box_top"></div>
						<div class="cip_box_mid">							
							<p class="cip_txt">
								워드마크는 한국석유공사의 아이덴티티를 표현하는 가장 중요한 요소이므로 일관된 이미지를 위해 사용상 철저한 관리가 필요하며 임의로 작도하여 한국석유공사의 이미지를 손상시키는 경우가 없어야 한다. 워드마크를 사용 또는 작도해야 하는 경우에는 그리드 또는 컴퓨터 데이터를 이용하여 정확하게 축소·확대하여 사용해야 한다. 

							</p>
							<p class="cip_img"><img src="/images/cip/grid.gif" alt="knoc 그리드 &amp; 공간규정" /></p>							
						</div>
						<div class="cip_box_bot"></div>
						
						<div style="clear:both ; height:30px ;"></div>
						
						<h4><img src="/images/cip/sig_tit02.gif" alt="시그니춰 국 영문" /></h4>
						
						<div class="cip_box_top"></div>
						<div class="cip_box_mid">
							
							<p class="cip_txt">
								시그니춰는 워드마크와 한국석유공사 로고타입을 적절한 비례로 조합한 것으로 적용상황에 맞는 조합을 선택 활용할 수 있으며, 
								모든 원고의 사용은 매뉴얼 CD의 컴퓨터 데이터에 의해 축소·확대하여 사용하는 것을 원칙으로 한다.
							</p>
							<p class="cip_img"><img src="/images/cip/sig_img01.gif" alt="knoc 시그니춰 국 영문 한문" /></p>														
						</div>
						<div class="cip_box_bot"></div>
						
						<div style="clear:both ; height:30px ;"></div>
						
						<h4><img src="/images/cip/sig_tit01.gif" alt="시그니춰 상하조합" /></h4>						
						<div class="cip_box_top"></div>
							<div class="cip_box_mid">								
								<p class="cip_img"><img src="/images/cip/sig_img02.gif" alt="knoc 시그니춰 국 영문 상하조합 좌우조합" /></p>								
							</div>
						<div class="cip_box_bot"></div>
						
						<div style="clear:both ; height:30px ;"></div>
						
						<h4><img src="/images/cip/color_tit.gif" alt="색상활용" /></h4>
						
						<div class="cip_box_top"></div>
						<div class="cip_box_mid">
							
							<p class="cip_txt">
								한국석유공사 CI의 색상활용은 기본형인 Full Color Version, 1도표현 및 특수인쇄에 관한 활용예이다.<br />
								색상활용은 일관된 이미지를 위해 사용상 철저한 관리가 필요하며 임의로 변형하여 이미지를 손상시키는 경우는 없어야 한다.<br />
								워드마크 활용시 Full Color Version을 원칙으로 하지만, 사용 용도에 따라 1Color 2 Tone Version, 1Color Version순으로 
								활용할 수 있다.
							</p>
							<p class="cip_img"><img src="/images/cip/full_color_version.gif" alt="full color version" /></p>
							<p class="cip_img"><img src="/images/cip/basic-elements.gif" alt="basic elements 전용컬러" /></p>
							<p class="cip_txt_red">
								본 메뉴얼의 설명문안 중 PANTONE은 팬톤사의 등록상표이며 팬톤사에서 제시하고 있는
								색상 배합표의 명칭으로, 정확한 색의 재현을 위해 이색상표를 활용하도록 한다.
							</p>
							
						</div>
						<div class="cip_box_bot"></div>
						
						<div style="clear:both ; height:30px ;"></div>
						
						<h4><img src="/images/cip/graphic_tit_a.gif" alt="그래픽 모티브 A" /></h4>						
						<div class="cip_box_top"></div>
						<div class="cip_box_mid">							
							<p class="cip_txt">
								그래픽모티브는 워드마크 등 공식적인 표시와는 달리 별도로 디자인된 요소이다.<br /> 
								각종 응용매체에 적용되어 한국석유공사의 이미지를 보조하고 적용매체의 품위를 높이며 아이덴티티를 강화하는 
								보조적인 역할을 한다. 적용시 활용되는 아이템에 따라 기능에 맞추어 활용한다.
							</p>
							<p class="cip_img"><img src="/images/cip/graphic_A.gif" alt="그래픽 모티브 A" /></p>							
						</div>
						<div class="cip_box_bot"></div>
						
					</div><!-- cip_cont end -->
					
				</div><!-- cip end -->
				
				<div style="clear:both ;"></div>
				
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
						<td class="contact_user"><strong>담당자 : </strong>고유나</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2228</td>
					</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer end -->
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>

</body>
</html>