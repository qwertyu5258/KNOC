<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>

<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="INTERNAL" adminURL="" sessionName="USERSESSION"/>
<div class="new_officer">
	<table summary="담당부서 및 연락처 관리일">
	<caption>담당부서 및 연락처 관리일</caption>
		<tbody>
			<tr>
				<td class="write_day"></td>
				<td class="contact_team"><strong>담당부서 : </strong>감사실 감사총괄팀</td>
				<td class="contact_user"><strong>담당자 : </strong>김의재</td>
				<td class="contact_tel"><strong>연락처 : </strong>052-216-2103</td>
			</tr>
		</tbody>
	</table>
</div>