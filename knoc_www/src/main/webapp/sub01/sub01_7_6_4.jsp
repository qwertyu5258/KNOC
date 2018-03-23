<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","06");
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
					<a href="/"><img src="/images/common/loca_home.gif" alt="�ѱ��������� ������������ �̵�" /></a>
					&gt; <span>����Ұ�</span>
                    &gt; <span>ä������</span>
                    &gt; <span class="locanow">�����Ұ�</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-15 ����] :: �ۼ���: ������ -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_7_6.gif" alt="ä��ȳ�" /></h3>
				</div>
				<!--����-->
				<div class="recruit3">					
					<div id="hit">
						<ul class="tab">
							<li><a href="sub01_7_6.jsp"><img src="/images/info/sub01_7_6_1.gif" alt="ä��ȳ�" border="0"  id="his_button1"/></a></li>
							<li><a href="sub01_7_6_1.jsp"><img src="/images/info/sub01_7_6_2.gif" alt="��������" border="0" id="his_button2"/></a></li>
							<li><a href="sub01_7_6_2.jsp"><img src="/images/info/sub01_7_6_3.gif" alt="������" border="0" id="his_button3"/></a></li>
							<li><a href="sub01_7_6_3.jsp"><img src="/images/info/sub01_7_6_4.gif" alt="����/�����" border="0" id="his_button4"/></a></li>
							<li><a href="sub01_7_6_4.jsp"><img src="/images/info/sub01_7_6_5r.gif" alt="����Ư�� �����������" border="0" id="his_button5"/></a></li>
						</ul>
						<h4 class="pt20"><img src="/images/info/sub01_7_6_1ta4_1.gif" alt="����Ư�� �����������" /></h4>
						<div class="guide2">
							<table class="chart1" summary="����Ư�� ����������� ä��ȳ� ���λ����� Ȯ���� �� �ֽ��ϴ�.">
								<caption>����Ư�� ����������� ä��ȳ�</caption>
								<col width="15%"/>
								<col width="25%"/>

								<thead>
									<tr>
										<th scope="col" class="first">����</th>
										<th scope="colgroup" colspan="2">���λ���</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row" class="first">1�� ����</th>
										<td colspan="2">����</td>
									</tr>
									<tr>
										<th scope="row" class="first">2�� �ʱ�</th>
										<td>P.T ����<br />
											����ȸȭ<br />
											�μ��˻�
										</td>
										<td class="tdleft">�������� ���� ��ǥ <br />
											ȸȭ�ɷ�<br />
											�μ��˻� �ǽ�
										</td>
									</tr>
									<tr>
										<th scope="row" class="first">3�� ����</th>
										<td>���ո���</td>
										<td class="tdleft">�������� ���� �� ���� �ٽɰ�ġ���� ���ռ� ��</td>
									</tr>
								</tbody>
							</table>
							<p class="pt10">* 2009�� ä�����(�ش�⵵ ä����ħ�� ���� ���氡��)</p>
						</div>
					</div>
                </div>
				<!--//��-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>