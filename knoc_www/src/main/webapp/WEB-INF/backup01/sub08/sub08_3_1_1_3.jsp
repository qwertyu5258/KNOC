<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","08");
	application.setAttribute("gNavMenuDepth2","03");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<%@include file="/include/sub08_auth.jsp"%>  
<%@include file="/include/comheader.jsp"%>


	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_08.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="�ѱ��������� ������������ �̵�" /></a>	
					&gt; <span>�̻�ȸ
					&gt; <span>�濵����
                    &gt; <span>�濵����
					&gt; <span>EIS
					&gt; <span class="locanow">���濵��ȹ</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/directors/ttl_sub08_3_1_1_3.gif" alt="���濵��ȹ" /></h3>
				</div>
				<!--����-->
				<span id='premier1' style='display:on;'>
				<div id="substar">
                	<dl>
                    	<dt class="tabline"><img src="/images/directors/tab_08_3_1_1_3_1r.gif" alt="�����" border="0" onclick='premier(1);' onMouseOver='this.style.cursor="hand"' OnMouseDown='this.style.cursor="hand";premier(1);' id="premier_button1"/>&nbsp;<img src="/images/directors/tab_08_3_1_1_3_2.gif" alt="��������" border="0" onclick='premier(2);' onMouseOver='this.style.cursor="hand"' OnMouseDown='this.style.cursor="hand";premier(2);' id="premier_button2"/>&nbsp;<img src="/images/directors/tab_08_3_1_1_3_3.gif" alt="��������" border="0" onclick='premier(3);' onMouseOver='this.style.cursor="hand"' OnMouseDown='this.style.cursor="hand";premier(3);' id="premier_button3"/></dt>
                    </dl>
					<table class="tb_base1">
						<tr>
							<th class="ta1 alice"><img src="/images/directors/img_sub08_3_1_1_4_11.gif" alt="�̹���" /></th>
						</tr>
					</table>
                </div>
				</span>
				<span id='premier2' style='display:none;'>
				<div id="substar">
                	<dl>
                    	<dt class="tabline"><img src="/images/directors/tab_08_3_1_1_3_1.gif" alt="�����" border="0" onclick='premier(1);' onMouseOver='this.style.cursor="hand"' OnMouseDown='this.style.cursor="hand";premier(1);' id="premier_button1"/>&nbsp;<img src="/images/directors/tab_08_3_1_1_3_2r.gif" alt="��������" border="0" onclick='premier(2);' onMouseOver='this.style.cursor="hand"' OnMouseDown='this.style.cursor="hand";premier(2);' id="premier_button2"/>&nbsp;<img src="/images/directors/tab_08_3_1_1_3_3.gif" alt="��������" border="0" onclick='premier(3);' onMouseOver='this.style.cursor="hand"' OnMouseDown='this.style.cursor="hand";premier(3);' id="premier_button3"/></dt>
                    </dl>
					<table class="tb_base1">
						<tr>
							<th class="ta1 alice"><img src="/images/directors/img_sub08_3_1_1_4_12.gif" alt="�̹���" /></th>
						</tr>
					</table>
                </div>
				</span>
				<span id='premier3' style='display:none;'>
				<div id="substar">
                	<dl>
                    	<dt class="tabline"><img src="/images/directors/tab_08_3_1_1_3_1.gif" alt="�����" border="0" onclick='premier(1);' onMouseOver='this.style.cursor="hand"' OnMouseDown='this.style.cursor="hand";premier(1);' id="premier_button1"/>&nbsp;<img src="/images/directors/tab_08_3_1_1_3_2.gif" alt="��������" border="0" onclick='premier(2);' onMouseOver='this.style.cursor="hand"' OnMouseDown='this.style.cursor="hand";premier(2);' id="premier_button2"/>&nbsp;<img src="/images/directors/tab_08_3_1_1_3_3r.gif" alt="��������" border="0" onclick='premier(3);' onMouseOver='this.style.cursor="hand"' OnMouseDown='this.style.cursor="hand";premier(3);' id="premier_button3"/></dt>
                    </dl>
					<table class="tb_base1">
						<tr>
							<th class="ta1 alice"><img src="/images/directors/img_sub08_3_1_1_4_13.gif" alt="�̹���" /></th>
						</tr>
					</table>
                </div>
				</span>
				 <!--//��-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>