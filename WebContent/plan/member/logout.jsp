<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 세션 변수가 만들어져있는데 세션변수를 없애는게 여기 일 (세션변수 없애기)
	session.removeAttribute("SessionUserId");
%>

<script>
	alert("로그아웃");
	location="/";
</script>