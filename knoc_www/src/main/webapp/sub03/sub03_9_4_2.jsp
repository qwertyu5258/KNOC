<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","08");
	application.setAttribute("gNavMenuDepth3","04");
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
				<%@include file="/include/subtop_03.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="�ѱ��������� ������������ �̵�" /></a>
					&gt; <span>����Ұ�</span>
                    &gt; <span>�������</span>
                    &gt; <span>�����뿡����</span>
                    &gt; <span class="locanow">ġ��/���� ���ϡ����� Ž��-����-������</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_9_4.gif" alt="�����뿡����" /></h3>
				</div>
				<!--����-->
				<div class="officer">
					<ul class="tab">
					<li><a href="sub03_9_4.jsp" title="���ϻ��� Ž�� �� ������" ><img src="/images/business/tab_sub03_9_4_01.gif" alt="���ϻ��� Ž�� �� ������" /></a></li>
					<li><a href="sub03_9_4_2.jsp" title="ġ��/���� ���ϡ����� Ž��-����-������" ><img src="/images/business/tab_sub03_9_4_02r.gif" alt="ġ��/���� ���ϡ����� Ž��-����-������" /></a></li>
					</ul>
				</div>

				<div class="business">
					<h4 class="mT0"><img src="../images/business/img_ttl_sub03_9_4_02.gif" alt="ġ��/���� ���ϡ����� Ž��-����-������" /></h4>
					<p>ġ��/���� ���ϡ������� ��ü�������� �ſ� ���� ���, ź�꿰���� ���� �������� �� �����Ǿ� �ִ� ���� �� ������ ���մϴ�. ���ſ��� ���߱���� ������ ���� ���꼺���� ���� ������ �������� ������ �Ұ���������, �ֱٿ��� ������߱���� �����ļ�������� ����� ���� �� ������ �����ϰ� �Ǿ����ϴ�.</p>
					<p class="mT20">����� 2010�� �̱����� ����� ���� �Ƴ����ڻ���� �������ڸ� ���� ġ��/���ϻ�������� ���� ���� �� �پ��� ���� ������ �����ϰ� �Ǿ����ϴ�. �̿� ���Ҿ� 2013����ʹ� ���ϰ��� ���߱�� �ڸ�ȭ 3�ܰ� ������Ʈ�� ���������ν� ������ Ư��ȭ, �����ϰ� �� �����ļ� �׸��� ���� ����ȭ ��������� �������� ���� ĳ���� Montney �ڻ��� ������� �� 4���� ���μ�Ź������ ���� �߿� �ֽ��ϴ�.</p>
				</div>
				<!--//��-->

				<!-- new_officer -->
				<div class="new_officer" style="left:2%">
					<table summary="���μ� �� ����ó ������">
					<caption>���μ� �� ����ó ������</caption>
					<tbody>
					<tr>
						<td class="write_day"><strong>�ۼ������� : </strong>2016-08-20</td>
						<td class="contact_team"><strong>���μ� : </strong>�������ó ���������</td>
						<td class="contact_user"><strong>����� : </strong>������</td>
						<td class="contact_tel"><strong>����ó : </strong>052-216-3537</td>
					</tr>
					</tbody>
					</table>
				</div>
				<!-- new_officer -->
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>