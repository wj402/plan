<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인증관련 공통파일 생성 -->


<!-- 아이디 유효성 검사 (세션아이디 가져오기) -->
<%
	String USERID = (String) session.getAttribute("SessionUserId");
	if( USERID == null ) {
%>
	<script>
		alert("로그인 이후에 이용가능합니다.");
		location = "../member/loginWrite.jsp";
	</script>
<%		
	return;
	}
%>