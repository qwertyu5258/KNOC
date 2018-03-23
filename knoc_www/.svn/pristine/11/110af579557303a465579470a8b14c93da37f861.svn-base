<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">    
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>JSP 통합게시판 샘플사이트</title>
<link rel="stylesheet" type="text/css" href="css/import.css" />
</head>		

<script type="text/javascript">
	function do_setting()
	{
		var f = document.settingform;
		if (document.settingform.db_gubun[0].checked) {
			if(f.DBName.value == "") {
				alert("DBName을 입력해 주시기 바랍니다.");
				f.DBName.focus();			
			} else if(f.DBIp.value == "") {
				alert("DBIp을 입력해 주시기 바랍니다.");
				f.DBIp.focus();			
			} else if(f.DBUser.value == "") {
				alert("DBUser을 입력해 주시기 바랍니다.");
				f.DBUser.focus();				
			} else if(f.DBPasswd.value == "") {
				alert("DBPasswd을 입력해 주시기 바랍니다.");
				f.DBPasswd.focus();			
			} else {
				f.DBPool.value = "";
				f.submit();						
			}			
		} else {
			if(f.DBPool.value == "") {
				alert("DBPool을 입력해 주시기 바랍니다.");
				f.DBPool.focus();			
			} else {
				f.DBName.value = "";
				f.DBIp.value = "";
				f.DBUser.value = "";
				f.DBPasswd.value = "";
				f.submit();						
			}		
		}
	}	
	
	function show_db()
	{
		var db1 = document.all["db1"];
		var db2 = document.all["db2"];
		
		if (document.settingform.db_gubun[0].checked) {
			db1.style.display = "block";
			db2.style.display = "none";
		} else {
			db1.style.display = "none";
			db2.style.display = "block";
		}
	}
</script>

<body style="background:none">		
		<p class="bullet02_title">통합게시판 세팅</p>
<form name="settingform" method="post" action="setup_ok.jsp">		
		<p class="bullet02_title"><input type="radio" name="db_gubun" id="db_gubun" value="1" checked="checked" onclick="show_db();" />JDBC 연결 사용
		<input type="radio" name="db_gubun" id="db_gubun" value="2" onclick="show_db();" />DB POOL 연결 사용</p>
<div id="db1" style="display:block">
		<table summary="통합게시판 세팅 테이블" class="application">
		<caption>아이디 비밀번호 등을 입력할 수  있습니다.</caption>
			<colgroup>
				<col width="100px" />
				<col width="" />
			</colgroup>
			<thead>
				<tr>
					<th class="title">DB Name</th>
					<td class="r_none">
					<input title="DBName" type="text" name="DBName" id="DBName" value="" class="phoneSec" style="width:200px;"/>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="title">DB Ip</th>
					<td class="r_none">
					<input title="DBIp" type="text" name="DBIp" id="DBIp" value="" class="phoneSec" style="width:200px;"/>
					</td>
				</tr>
				<tr>
					<th class="title">DB User</th>
					<td class="r_none">
					<input title="DBUser" type="text" name="DBUser" id="DBUser" value="" class="phoneSec" style="width:200px;"/>
					</td>
				</tr>
				<tr>
					<th class="title">DB Passwd</th>
					<td class="r_none">
					<input title="DBPasswd" type="text" name="DBPasswd" id="DBPasswd" value="" class="phoneSec" style="width:200px;"/>
					</td>
				</tr>							
			</tbody>
		</table>
</div>		
<div id="db2" style="display:none">
		<table summary="통합게시판 세팅 테이블" class="application">
		<caption>아이디 비밀번호 등을 입력할 수  있습니다.</caption>
			<colgroup>
				<col width="100px" />
				<col width="" />
			</colgroup>
			<thead>
				<tr>
					<th class="title">DB Pool</th>
					<td class="r_none">
					<input title="DBPool" type="text" name="DBPool" id="DBPool" value="" class="phoneSec" style="width:200px;"/> 예) java:/comp/env/jdbc/neoboard
					</td>
				</tr>
			</thead>
			<tbody>										
			</tbody>
		</table>
</div>	
</form>
		<p class="list_btn">
			<button type="button" onclick="javascript:do_setting();" class="button orange"><span class="amend"><img src="images/btn_check.gif" alt="확인" class="icon" /> 확인</span></button> 
			<button type="button" onclick="javascript:history.back();" class="button orange"><span class="amend"><img src="images/btn_check.gif" alt="취소" class="icon" /> 취소</span></button>
		</p>
</body>
</html>