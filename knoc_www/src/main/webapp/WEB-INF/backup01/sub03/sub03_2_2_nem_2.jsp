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
				
				<!-- [2009-09-24 ����] :: �ۼ���: ������ -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_2_2.gif" alt="����������Ȳ��" /></h3>
				</div>
				<!--����-->
				<div class="business2">
                	<%@include file="sub03_2_2_map.jsp"%>
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_nem_02.gif" alt="�δ� NEM ��" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_nem.gif" alt="�δ� NEM �� ������" /></div>
                    
                   <p class="rtxt">[2010�� 7�� ����]</p>
					<table class="chart2" summary="�δ� NEM �� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
					<caption>�δ� NEM �� ���� ����</caption>
					<col width="60px" />
					<col width="60px" />
					<col width="70px" />
					<col width="70px" />
					<col width="50px" />
					<col width="50px" />
					<col width="60px" />
					<thead>
					<tr>
					<th scope="row" class="first">����</th>
					<th scope="row">������</th>
					<th scope="row">�����</th>
					<th scope="row">����� �Ű���</th>
					<th scope="row">�ѱ�������<br />(%(�ۼ�Ʈ))</th>
					<th scope="row">�ѱ�������<br />����</th>					
					<th scope="row">�����������</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">Ž����</td>
					<td>�δ� NEM ��</td>
					<td>��������</td>
					<td>'03.10</td>
					<td>100</td>
					<td>56.25</td>
					<td>GSȦ����, �뼺</td>
					</tr>
					</tbody>
					</table>
<!--                        
                    <p class="mT20">�δ� ���ڹ� ���ζ� �ϵ� �ػ� ��ġ�� NEM II ������ 2003�� 10�� 14�Ͽ� ���깰 �й���(PSC) ü���� �������� Ž������ ����Ǿ� �Դ�. ������� ����Ž�� 2D 501.7L-km(����ų�ι���)�� ����Ͽ�����, Ž����� 1��(Atiyya-1x)�� �Ϸ��Ͽ� ��¡�� �߰��Ͽ����� ����� Ȯ�ο��� �����Ͽ���. 2009�� 1������ ��� ���Ḧ �����ϰ� �ִ�.</p>-->
                </div>
				<!--//��-->
		  </div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>