<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","04");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","03");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@include file="/include/comheader.jsp"%>


<!--// subtopNavi: start //-->
<%@include file="/include/subtopnavi_new.jsp"%>
	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->

		<div id="rightarea">
			<div id="subcnts">
			  <%@include file="/include/subtop_03.jsp"%>
			  <!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="�ѱ��������� ������������ �̵�" /></a>
					&gt; <span>����Ұ�</span>
                    &gt; <span>�������� �� ���뱸���������</span>
                    &gt; <span>�˶�������</span>
                    &gt; <span class="locanow">���Ȳ</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 ����] :: �ۼ���: ������ -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_8_1_3.gif" alt="���Ȳ" /></h3>
				</div>
				<!--����-->
                <div class="cont_2012">
                	<ul class="egs_ea">
					<li><img src="/images/business/cs_01.png" alt="�ڿ� 443" /></li>
					<li><img src="/images/business/cs_02.png" alt="���ΰ��� 167" /></li>
					<li><img src="/images/business/cs_03.png" alt="����NH 558" /></li>
					</ul>
					<p class="egs_total"><img src="/images/business/cs_total.png" alt="�� 1,168 (9.7%)" /></p>
					<!-- <p class="egs_txt">* ��12.11.23�� ���� �˶������� �� 800���� ����</p>  -->
					<p class="egs_obj"><img src="/images/business/cs_obj.gif" alt="��å��ǥ - ��ü�������� 10%" /></p>
                </div><!-- cont_2012 end -->
				<!--//��-->
		  </div>

		  <!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="���μ� �� ����ó ������">
				<caption>���μ� �� ����ó ������</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>�ۼ������� : </strong>2017-01-03</td>
					<td class="contact_team"><strong>���μ� : </strong>������ó ��������</td>
					<td class="contact_user"><strong>����� : </strong>�̽¿�</td>
					<td class="contact_tel"><strong>����ó : </strong>052-216-5202</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->

		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>