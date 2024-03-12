<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호변경화면</title>
</head>

<style>
	body {
		font-size: 12px;
		font-family:맑은 고딕;
	}
	table {
		width: 98%;
		border-collapse: collapse;
	}
	
	th, td {
		height: 30px;
		padding: 5px;
		border: 1px solid #777;
	}
	input {
		width: 95%;
	}
</style>

<script>
	function fn_submit() {
		
		var f = document.frm;
		if( f.pass1.value == "" ) {
			alert("현재 암호를 임력해주세요.");
			f.pass1.focus();
			return false;
		}
		
		if( f.pass2.value == "" ) {
			alert("새로운 암호를 임력해주세요.");
			f.pass2.focus();
			return false;
		}
		
		if( f.pass3.value == "" ) {
			alert("새 암호의 재입력을 임력해주세요.");
			f.pass3.focus();
			return false;
		}
		
		if( f.pass2.value != f.pass3.value ) {
			alert("새로운 암호와 재설정이 일치하지 않습니다.");
			f.pass2.focus();
			return false;
		}
		f.submit();
	}
</script>

<body>

<form name="frm" method="post" action="passChangeSub.jsp">
	<table>
		<tr>
			<th>현 암호 입력</th>
			<td>
				<input type="password" name="pass1">
			</td>
		</tr>
		<tr>
			<th>새 암호 입력</th>
			<td>
				<input type="password" name="pass2">
			</td>
		</tr>
		<tr>
			<th>새 암호 재입력</th>
			<td>
				<input type="password" name="pass3">
			</td>
		</tr>
	</table>
	<div style="width:98%; text-align:center; margin-top:10px;">
		<button type="submit" onclick="fn_submit();return false;">적용</button>
		<button type="button" onclick="self.close();">닫기</button>
	</div>
</form>

</body>
</html>