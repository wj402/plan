<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbCon.jsp" %>

<%@ page import= "com.Cookies" %>
<!-- 
	1. 쿠키변수 생성
	2. 쿠키변수 사용
	3. 쿠키변수 삭제
 -->

<%
	String userid = request.getParameter("userid");
	String pass = request.getParameter("pass");
	String idchk = request.getParameter("idchk");
	
	if( userid == null || pass == null ) {
%>
	<script>
		alert("잘못된 경로의 접근");
		location = "/";
	</script>
<%		
	return;
	} 
	
	String sql = " select count(*) cnt from memberinfo ";
		   sql+= " 	where userid='"+userid+"' and pass='"+pass+"' ";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	int cnt = rs.getInt("cnt");
	
	if( cnt == 0 ) {
%>
	<script>
		alert("잘못된 정보입니다.");
		history.back();
	</script>
<%
	return;
	} else {
		// SessionUserId = "test1"; //  SessionUserId = "test2"; 
		session.setAttribute("SessionUserId", userid); //세션 변수 
		//session.setMaxInactiveInterval(60); // 로그인 유지시간(초)
		
		// 넘어온 chk값이 무엇인가?
		if( idchk != null ) {
			// 1. 쿠키변수 생성
			response.addCookie( Cookies.createCookie("CookieUserId", userid, "/", -1) );	
		} else {
			// 3. 쿠키변수 삭제 ( 아이디만 없애면 쿠키가 사라진다.)
			response.addCookie( Cookies.createCookie("CookieUserId", "", "/", 0) );	
		}
				
		
%>
	<script>
		alert("<%=userid %>님 로그인 되었습니다. ");
		location = "/";
	</script>	
<%
	return;
	}
%>