<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>           
<%@include file="/include/comheader.jsp"%>


  <%@include file="/include/subtopnavi_new.jsp"%>
  <!--// subtopNavi: start //-->

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
                    &gt; <span>�ؿܻ��</span>
                    &gt; <span class="locanow">����������Ȳ��</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 ����] ::  -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_2_2.gif" alt="����������Ȳ��" /></h3>
				</div>
				<!--����-->
				<div class="business2">
                	<%@include file="sub03_2_2_map.jsp"%>
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_tigil.gif" alt="���þ� - Tigil" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_russian.gif" alt="���þ� - Tigil ������" /></div>
                    
                   <p class="rtxt">[2010�� 7�� ����]</p>
					<table class="chart2" summary="���þ� - Tigil ���� ������ Ȯ���� �� �ֽ��ϴ�.">
					<caption>���þ� - Tigil ���� ����</caption>
					<col width="60px" />
					<col width="60px" />
					<col width="70px" />
					<col width="70px" />
					<col width="50px" />
					<col width="50px" />
					<col width="60px" />
					<thead>
					<tr>
					<th scope="col" class="first">����</th>
					<th scope="col">������</th>
					<th scope="col">�����</th>
					<th scope="col">����� �Ű���</th>
					<th scope="col">�ѱ�������<br />(%(�ۼ�Ʈ))</th>
					<th scope="col">�ѱ�������<br />����</th>					
					<th scope="col">�����������</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">Ž����</td>
					<td>���þ� Tigil</td>
					<td>PKK(ĳ)</td>
					<td>'06.03</td>
					<td>50</td>
					<td>27.5</td>
					<td>�泲���,<br />SK����, �뼺</td>
					</tr>
					</tbody>
					</table>
                        
                    <p class="mT20">Tigil ������ į��ī �ݵ� ���� ���� ��ġ�ϰ� ������ ���� ��ü ������ 3,264��(���ų�ι���)�̴�.</p>
					<p class="mT5">����� �泲��� �� SK���� �� �뼺����� �Բ� �ѱ����ҽþ�(KKPL)�� �����Ͽ� ��ǻ��� PetroKamchatka Plc(PKK)��� 2005�� 12�� SPA ����� ü���Ͽ� ����� �����ϰ� �ִ�.</p>
					<p class="mT5">����� ��ü ��� ���� �� 27.5%(�ۼ�Ʈ)�� �����ϰ� �ְ�, ��08�⵵���� �� 712L-km(����ų�ι���)�� 2D Ž�� �ڷ��� ����Ͽ���. �ڷ� �ؼ� ����� �������� ����� 2���� ���� ������ ���� ��09.10~��10.2 �� Ž�� ���� 1���� �Ϸ��Ͽ�����, ��10�� ��ݱ� �� �߰� Ž�� ���� 1���� �������� �۾��� �غ� ���̴�.</p>
                </div>
				<!--//��-->
		  </div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>