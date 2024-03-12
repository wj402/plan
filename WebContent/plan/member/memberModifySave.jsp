<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file = "../include/dbCon.jsp" %>    

<!-- 세션 아이디 가져오기 -->
<%
	String session_id = (String) session.getAttribute("SessionUserId");
%>

<!-- 데이터 받기 -->
<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birthday");
	String mobile = request.getParameter("mobile");
	String zipcode = request.getParameter("zipcode");
	String addr = request.getParameter("addr");
%>

<!-- 데이터 유효성 체크 -->
<%
	if( session_id == null || name == null || gender == null ) {
%>
	<script>
		alert("잘못된 경로의 접근");
		location = "/";
	</script>
<%
	return;
	}
%>

<!-- 업데이트 SQL 작성 및 실행 -->
<%
	String sql2 = "UPDATE memberinfo SET ";
		   sql2+= " name='"+name+"', gender='"+gender+"', birthday='"+birthday+"', mobile='"+mobile+"', zipcode='"+zipcode+"', addr='"+addr+"' ";
		   sql2+= "	WHERE userid='"+session_id+"'  ";
	int result = stmt.executeUpdate(sql2);
%>


<!-- 메세지 출력 후 메인으로 이동 -->
<%
	if(result == 1) {
%>
	<script>
		alert("<%=name%>님의 정보가 변경되었습니다.");
		location = "/";
	</script>
<% 
	} else {
%>
	<script>
		alert("변경 실패");
		history.back();
	</script>
<%
	}
%>