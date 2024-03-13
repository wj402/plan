<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file = "../include/dbCon.jsp" %>

<!-- 세션아이디 가져오기 -->

<%
	String session_id = (String) session.getAttribute("SessionUserId");
%>

<!-- 세션아이디 유효성검사 -->
<%
	if(session_id == null) {
%>
	<script>
		alert("로그인 해주세요.");
		self.close();
	</script>
<%		
	return;
	}
%>

<!-- 데이터 받기 -->
<%
	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	String pass3 = request.getParameter("pass3");
%>

<!-- 데이터 유효성 검사 -->
<%
	if( pass1 == null || pass2 == null || pass3 == null ) {
%>
	<script>
		alert("암호를 입력해주세요.");
		history.back();
	</script>
<% 		
	return;
	}
%>

<!-- 현 패스워드 일치 검사 -->

<%
	String sql = "	select count(*) cnt from memberinfo	";
		   sql+= "	where userid='"+session_id+"' and pass='"+pass1+"' ";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	int cnt = rs.getInt("cnt");
	
	if(cnt == 0) {
%>
	<script>
		alert("현재 암호를 잘못입력했습니다.");
		history.back(); // 이전화면으로 GO
	</script>
<%		
	return;
	}
%>


<!-- 새로운 암호와 재설정 암호가 맞는지 -->
<%
	if( !pass2.equals(pass3)) {
%>
	<script>
		alert("새로운 암호가 일치하지 않습니다.");
		history.back(); 
	</script>
<%		
	return;
	}
%>

<!-- 암호변경 SQL 작성 후 적용 -->

<%
	String sql2 = "	UPDATE memberinfo SET pass='"+pass2+"' ";
		   sql2+= "	where userid='"+session_id+"' ";
	int result = stmt.executeUpdate(sql2);
	if( result == 1 ) {
%>

	<!-- 메세지 출력 -->
	<script>
		alert("새로운 암호로 변경되었습니다.");
		self.close();
	</script>
<%
	return;
	}
%>