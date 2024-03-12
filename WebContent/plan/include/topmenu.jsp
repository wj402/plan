<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<ul>
				<li class="menuLink"><a href="../main/main.jsp">홈</a></li>
				<li class="menuLink"><a href="../board/boardList.jsp">게시판</a></li>
				<li class="menuLink"><a href="../board/reBoardList.jsp">답변게시판</a></li>
				<%
					String SESSION_ID = (String)session.getAttribute("SessionUserId");
					if( SESSION_ID == null ) {
				%>
					<li class="menuLink"><a href="../member/memberWrite.jsp">회원가입</a></li>	
					<li class="menuLink"><a href="../member/loginWrite.jsp">로그인</a></li>
				<%
					} else {
				%>
					<li class="menuLink"><a href="../member/memberModify.jsp">정보수정</a></li>	
					<li class="menuLink"><a href="../member/logout.jsp">로그아웃</a></li>
				<%
					}
				%>
					
				<li class="menuLink"><a href="../plan/planList.jsp">일정관리</a></li>
				<li class="menuLink"><a href="#">대화방</a></li>
		</ul>
</body>
</html>