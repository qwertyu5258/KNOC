<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String y_2016 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_5.jsp":"sub04_9_10_5.jsp");
	String y_2015 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_4.jsp":"sub04_9_10_4.jsp");
	String y_2014 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_2.jsp":"sub04_9_10.jsp");
	String y_2013 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_3.jsp":"sub04_9_10_3.jsp");
	String y_2012 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12.jsp":"sub04_9_10_1.jsp");
	String y_2011 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_1.jsp":"sub04_9_10_2.jsp");
%>

<div class="officer" style="padding-top:20px;">
	<ul class="tab">
		<li><a href="<%=y_2016 %>" ><img src="/images/business/ab_sub02_2_6_12_5r.gif" alt="2016��" /></a></li>
		<li><a href="<%=y_2015 %>" ><img src="/images/business/ab_sub02_2_6_12_4.gif" alt="2015��" /></a></li>
		<li><a href="<%=y_2014 %>" ><img src="/images/business/ab_sub02_2_6_12_3.gif" alt="2014��" /></a></li>
		<li><a href="<%=y_2013 %>" ><img src="/images/business/ab_sub02_2_6_12_2.gif" alt="2013��" /></a></li>
		<li><a href="<%=y_2012 %>" ><img src="/images/business/ab_sub02_2_6_12.gif" alt="2012��" /></a></li>		
	</ul>

	<h5>���Ӱ������� ���������� ���� ����</h5>
	<p class="rtxt1">2016��</p>
	<p class="rtxt2">(���� : õ��)</p>
	<table class="chart3" summary="�ѱ��������� 2016�� ���Ӱ������� ���������� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
		<caption>
		2016�� ���Ӱ������� ���������� ���� ����
		</caption>
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<thead>
			<tr>
				<th scope="col" class="first">�����</th>
				<th scope="colgroup">���� ����</th>
				<th scope="colgroup">���� �ݾ�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">1��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>1,255</td>
			</tr>
			<tr>
				<td class="first">2��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>550</td>
			</tr>
			<tr>
				<td class="first">3��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>675</td>
			</tr>
			<tr>
				<td class="first">4��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>400</td>
			</tr>
			<tr>
				<td class="first">5��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>910</td>
			</tr>
			<tr>
				<td class="first">6��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>527</td>
			</tr>
			<tr>
				<td class="first">7��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>570</td>
			</tr>
			
			<tr>
				<td class="first">8��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>913</td>
			</tr>
			<tr>
				<td class="first">9��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>419</td>
			</tr>
			<tr>
				<td class="first">10��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>276</td>
			</tr>
			<tr>
				<td class="first">11��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>263</td>
			</tr>
			<tr>
				<td class="first">12��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>436</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">�հ�</td>
				<td>7,194</td>
			</tr>
		</tbody>
	</table>
	
	<br />
	
	<!-- h5>�λ��� ���������� ���� ����</h5>
	<p class="rtxt1">2016��</p>
	<p class="rtxt2">(���� : õ��)</p>
	<table class="chart3" summary="�ѱ��������� 2016�� �λ��� ���������� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
		<caption>
		2016�� �λ��� ���������� ���� ����
		</caption>
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<thead>
			<tr>
				<th scope="col" class="first">�����</th>
				<th scope="colgroup">���� ����</th>
				<th scope="colgroup">���� �ݾ�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">1��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>646</td>
			</tr>
			<tr>
				<td class="first">2��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>460</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">�հ�</td>
				<td>1,106</td>
			</tr>
		</tbody>
	</table>
	
	<br /-->
	
	<!-- h5>������ȹ������ ���������� ���� ����</h5>
	<p class="rtxt1">2016��</p>
	<p class="rtxt2">(���� : õ��)</p>
	<table class="chart3" summary="�ѱ��������� 2016�� ������ȹ������ ���������� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
		<caption>
		2016�� ������ȹ������ ���������� ���� ����
		</caption>
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<thead>
			<tr>
				<th scope="col" class="first">�����</th>
				<th scope="colgroup">���� ����</th>
				<th scope="colgroup">���� �ݾ�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">1��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>200</td>
			</tr>
			<tr>
				<td class="first">2��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>90</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">�հ�</td>
				<td>290</td>
			</tr>
		</tbody>
	</table>
	
	<br /-->

	<h5>�濵���������� ���������� ���� ����</h5>
	<p class="rtxt1">2016��</p>
	<p class="rtxt2">(���� : õ��)</p>

	
	<table class="chart3" summary="�ѱ��������� 2016�� �濵���������� ���������� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
		<caption>
		2016�� �濵���������� ���������� ���� ����
		</caption>
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<thead>
			<tr>
				<th scope="col" class="first">�����</th>
				<th scope="colgroup">���� ����</th>
				<th scope="colgroup">���� �ݾ�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">1��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>276</td>

			</tr>
			<tr>
				<td class="first">2��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>110</td>
			</tr>
			<tr>
				<td class="first">3��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>69</td>
			</tr>
			<tr>
				<td class="first">4��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">5��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>282</td>
			</tr>
			<tr>
				<td class="first">6��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>337</td>
			</tr>
			<tr>
				<td class="first">7��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>196</td>
			</tr>
			
			<tr>
				<td class="first">8��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>348</td>
			</tr>
			<tr>
				<td class="first">9��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>286</td>
			</tr>
			<tr>
				<td class="first">10��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">11��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>80</td>
			</tr>
			<tr>
				<td class="first">12��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>278</td>
			</tr>
			<tr class="tdgray">  
				<td colspan="2" class="first">�հ�</td>
				<td>2,262</td>    
			</tr>   
		</tbody>
	</table>   
	
	<br />    
	
	<h5>������������ ���������� ���� ����</h5>
	<p class="rtxt1">2016��</p>
	<p class="rtxt2">(���� : õ��)</p>
	
	<table class="chart3" summary="�ѱ��������� 2016�� ������������ ���������� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
		<caption>
		2016�� ������������ ���������� ���� ����
		</caption>
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<thead>
			<tr>
				<th scope="col" class="first">�����</th>
				<th scope="colgroup">���� ����</th>
				<th scope="colgroup">���� �ݾ�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">1��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>80</td>
			</tr>
			<tr>
				<td class="first">2��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>215</td>
			</tr>
			<tr>
				<td class="first">3��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>187</td>
			</tr>
			<tr>
				<td class="first">4��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>469</td>
			</tr>
			<tr>
				<td class="first">5��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>658</td>
			</tr>
			<tr>
				<td class="first">6��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">7��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>378</td>
			</tr>
			
			<tr>
				<td class="first">8��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>236</td>
			</tr>
			<tr>
				<td class="first">9��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>494</td>
			</tr>
			<tr>
				<td class="first">10��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">11��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>93</td>
			</tr>
			<tr>
				<td class="first">12��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>0</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">�հ�</td>
				<td>2,810</td>
			</tr>
		</tbody>
	</table>
	
	<br />

	<!-- h5>���꺻���� ���������� ���� ����</h5>
	<p class="rtxt1">2016��</p>
	<p class="rtxt2">(���� : õ��)</p>
	<table class="chart3" summary="�ѱ��������� 2016�� ���꺻���� ���������� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
		<caption>
		2016�� ���꺻���� ���������� ���� ����
		</caption>
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<thead>
			<tr>
				<th scope="col" class="first">�����</th>
				<th scope="colgroup">���� ����</th>
				<th scope="colgroup">���� �ݾ�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">1��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>761</td>
			</tr>
			<tr>
				<td class="first">2��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>420</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">�հ�</td>
				<td>1,181</td>
			</tr>
		</tbody>
	</table>
	
	<br /-->

	<!-- h5>Ž�纻���� ���������� ���� ����</h5>
	<p class="rtxt1">2016��</p>
	<p class="rtxt2">(���� : õ��)</p>
	<table class="chart3" summary="�ѱ��������� 2016�� Ž�纻���� ���������� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
		<caption>
		2016�� Ž�纻���� ���������� ���� ����
		</caption>
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<thead>
			<tr>
				<th scope="col" class="first">�����</th>
				<th scope="colgroup">���� ����</th>
				<th scope="colgroup">���� �ݾ�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">1��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>103</td>
			</tr>
			<tr>
				<td class="first">2��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>250</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">�հ�</td>
				<td>353</td>
			</tr>
		</tbody>
	</table-->	
	
	<h5>��ȹ���꺻���� ���������� ���� ����</h5>
	<p class="rtxt1">2016��</p>
	<p class="rtxt2">(���� : õ��)</p>
	
	<table class="chart3" summary="�ѱ��������� 2016�� ������������ ���������� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
		<caption>
		2016�� ��ȹ���꺻���� ���������� ���� ����
		</caption>
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<thead>
			<tr>
				<th scope="col" class="first">�����</th>
				<th scope="colgroup">���� ����</th>
				<th scope="colgroup">���� �ݾ�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">4��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>103</td>
			</tr>
			<tr>
				<td class="first">5��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>82</td>
			</tr>
			<tr>
				<td class="first">6��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>84</td>
			</tr>
			<tr>
				<td class="first">7��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>276</td>
			</tr>
			
			<tr>
				<td class="first">8��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>166</td>
			</tr>
			<tr>
				<td class="first">9��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>88</td>
			</tr>
			<tr>
				<td class="first">10��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>105</td>
			</tr>
			<tr>
				<td class="first">11��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">12��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>269</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">�հ�</td>
				<td>1,173</td>
			</tr>
		</tbody>
	</table>
	
	<br />
	
	<h5>E&amp;P��������� ���������� ���� ����</h5>
	<p class="rtxt1">2016��</p>
	<p class="rtxt2">(���� : õ��)</p>
	
	<table class="chart3" summary="�ѱ��������� 2016�� ������������ ���������� ���� ������ Ȯ���� �� �ֽ��ϴ�.">
		<caption>
		2016�� ������������ ���������� ���� ����
		</caption>
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<thead>
			<tr>
				<th scope="col" class="first">�����</th>
				<th scope="colgroup">���� ����</th>
				<th scope="colgroup">���� �ݾ�</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="first">4��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>848</td>
			</tr>
			<tr>
				<td class="first">5��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>284</td>
			</tr>
			<tr>
				<td class="first">6��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>267</td>
			</tr>
			<tr>
				<td class="first">7��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>888</td>
			</tr>
			
			<tr>
				<td class="first">8��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>256</td>
			</tr>
			<tr>
				<td class="first">9��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>175</td>
			</tr>
			<tr>
				<td class="first">10��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>183</td>
			</tr>
			<tr>
				<td class="first">11��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>306</td>
			</tr>
			<tr>
				<td class="first">12��</td>
				<td class="c3_center">������������ ��������, ȸ��, ����ȸ, �����ݷ�</td>
				<td>278</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">�հ�</td>
				<td>3,485</td>
			</tr>
		</tbody>
	</table>
	
	<br />
</div>
<div class="new_officer">
	<table summary="���μ� �� ����ó ������">
	<caption>���μ� �� ����ó ������</caption>
		<tbody>
			<tr>
				<td class="write_day"><strong>�ۼ������� : </strong>2016-12-31</td>
				<td class="contact_team"><strong>���μ� : </strong>��ȹ����ó ��ȹ������</td>
				<td class="contact_user"><strong>����� : </strong>Ȳ�ڿ�</td>
				<td class="contact_tel"><strong>����ó : </strong>052-216-2208</td>
			</tr>
		</tbody>
	</table>
</div>