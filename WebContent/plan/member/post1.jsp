<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호검색</title>
</head>

<style>
	div {
		font-size: 12px;
		width: 98%;
		height: 190px;
		text-align: center;
		background: skyblue;
	}
</style>

<script>
	function fn_submit() {
		if( document.frm.dong.vlaue == "" ) {
			alert("검색 단어를 입력해주세요.");
			document.frm.dong.focus();
			return false;
		}
		document.frm.submit();
	}
</script>

<body onload="document.frm.dong.focus();">

<div>
<br><br><br><br>
	<form name="frm" method="post" action="post2.jsp">
		<input type="text" name="dong">
		<button type="submit" onclick="fn_submit(); return false;">검색</button>
	</form>
</div>

</body>
</html>