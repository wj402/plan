<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<%
	String yy = request.getParameter("year");
	String mm = request.getParameter("month");

	Calendar cal = Calendar.getInstance();
	
	// 현재상태
	int y = cal.get(Calendar.YEAR); // 출력 년도
	int m = cal.get(Calendar.MONTH); // 출력 개월(출력시 +1 필요)
	//int y = 2023;
	//int m = 11;
	
	if( yy != null && mm != null && !yy.equals("") && !mm.equals("")) { // null이 아니어야되고 공백도 아니여야 될경우
		y = Integer.parseInt(yy);
		m = Integer.parseInt(mm)-1;
	}
	
	cal.set(y ,m, 1);
	// 출력 년월의 1일날의 요일
	int dayOfweek = cal.get(Calendar.DAY_OF_WEEK); // 2, (일:1 ~ 토:7)
	// dayOfweek = 2;
	
	// 출력 년월의 마지막 날짜
	int lastday = cal.getActualMaximum(Calendar.DATE);
	// lastday = 31;
	
	// 이전버튼
	int b_y = y;
	int b_m = m;
	
	// if( b_m == 0 )
	if(m == 0) {
		b_y = b_y -1;
		b_m = 12;
	} 
	
	// 다음버튼
	int n_y = y;
	int n_m = m+2;
	
	// if( n_m == 13 )
	if(m == 11) {
		n_y = n_y +1;
		n_m = 1;
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>일정목록</title>
<link rel="stylesheet" href="../css/layout.css" >
</head>

<style>
	.t_div1 {
		float:left; 
		width:30%; 
		background: yellow;
	}
	.t_div2 {
		float:left; 
		width:40%; 
		background: green;
	}
	.t_div3 {
		float:left;
		width:30%; 
		background: yellow; 
		text-align:right;
	}
</style>

<script>
	function fn_planWrite() {
		
		var w = (window.screen.width/2) - 200;
		var h = (window.screen.height/2) - 200;
		var url = "planWrite.jsp";
		window.open(url, "planWrite", "width=400, height=400, left="+w+", top="+h);
	}
</script>

<body>
	
	<div class="wrap">
		<header>
			<div class="top_logo">
				
			</div>
			<div class="top_header">
			
			</div>
		</header>
		<nav>
			<%@ include file="../include/topmenu.jsp" %>
		</nav>
		<aside>
			<%@ include file="../include/leftmenu.jsp" %>
		</aside>
		<section>
			<article>
				<div style="width:600px;">
					<div class="t_div1" >&nbsp;</div>
						<div class="t_div2" >
							<%=y %>년 <%=m+1 %>월
						</div>
						<div class="t_div3" >
							<button type="button" onclick="fn_planWrite()">일정등록</button> 
					</div>
				</div>
				<table>
					<tr>
						<th>일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
					</tr>
					<tr>
						<%
							// 빈공간 count
							int count = 0;
							// 1일을 출력하기 전 빈칸을 출력하는 설정
						
							for(int s=1; s<dayOfweek; s++) {
								out.print("<td></td>");
								count++;
							}
							
							// 날자 출력하는 설정
							for( int d=1; d<=lastday; d++ ) {
								count++;
								String color="#555";
								if(count == 7) {
									color = "blue";
								} else if (count == 1) {
									color = "red";
								}
						%>
							<td style="color:<%=color %>"><%=d %></td>
						<%
								// 개행을 위한 설정
								if( count == 7 ) {
									out.print("</tr><tr>");
									count = 0; // 변수 초기화
								}
							}
							
							// 4, 5, 6, 
							while( count < 7 ) {
								out.print("<td></td>");
								count++;
							}
						%>
					</tr>
					
				</table>
			</article>
		</section>
		<footer>
			<%@ include file = "../include/footer.jsp" %>
		</footer>
	</div>
	
</body>
</html>