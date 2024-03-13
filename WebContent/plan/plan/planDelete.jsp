<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/certificate.jsp" %>
<%@ include file = "../include/dbCon.jsp" %>

<%
	String pdate = request.getParameter("pdate");
	if( pdate == null ) {
%>
	<script>
		alert("잘못된 경로의 접근입니다.");
		self.close();
	</script>
<%		
	return;
	}
	
	String sql = "DELETE FROM plan WHERE userid='"+USERID+"' AND pdate='"+pdate+"' ";
	int result = stmt.executeUpdate(sql);
	if(result == 1) {
%>
	<script>
		alert("삭제완료")
		self.close();
		opener.document.location="planList.jsp";
	</script>
<%		
	} else {
%>
	<script>
		alert("삭제실패")
		self.close();
	</script>
<%
	}
%>