<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/certificate.jsp" %>

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
	String sql = "update plan set title='"+title+"', content='"+content+"' ";
		   sql+= "	 where userid='"+USERID+"' ";
		   sql+= "	and pdate = '"+pdate+"' ";
		   
	int result = stmt.executeUpdate(sql);
%>

<!-- 메세지 출력 -->
<script>
	alert("수정완료");
	self.close();
	opener.location = "planList.jsp";
</script>







