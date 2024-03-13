<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<!-- DB가져오기 -->
<%@ include file = "../include/dbCon.jsp" %>


<!-- 데이터 받기 -->
<%
	String pdate = request.getParameter("pdate");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
%>

<!-- SQL작성 -->
<%
	String sql = "INSERT INTO plan(userid,pdate,title,content) ";
		   sql+= "VALUES('"+USERID+"', '"+pdate+"', '"+title+"', '"+content+"')";
		   
	int result = stmt.executeUpdate(sql);
%>

<!-- 메세지 출력 -->
<script>
	alert("일정 저장완료");
	self.close();
	opener.location = "planList.jsp";
</script>







