<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/dbCon.jsp" %>

<%
	String session_id = (String) session.getAttribute("SessionUserId");
	if( session_id == null ) {
%>
	<script>
		alert("잘못된 경로의 접근입니다.");
		location = "/";
	</script>
<%		
	return;
	} 
	
	/*
		* 아이디 값을 가진 변수 값의 실 존재 유무
	*/
	
	String sql = " select count(*) cnt from memberinfo ";
		   sql+= "	where userid='"+session_id+"' ";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	int cnt = rs.getInt("cnt");
	
	if ( cnt != 1 ) {
%>
	<script>
		alert("오류입니다. 관리자에게 연락해주세요.\n02-777-1111");
		location = "/";
	</script>
<%		
	return;
	}
	
	/*
		*화면 출력을 위한 SQL
	*/
	
	String sql2 = " select name,birthday,gender,mobile,zipcode,addr,rdate ";
		   sql2+= "	from memberinfo ";
		   sql2+= "		where userid ='"+session_id+"' ";
	ResultSet rs2= stmt.executeQuery(sql2);
	
	String name = "";
	String birthday = "";
	String gender = "";
	String mobile = "";
	String zipcode = "";
	String addr = "";
	String rdate = "";
	
	if( rs2.next() ) {
		name = rs2.getString("name");
		birthday = rs2.getString("birthday");
		gender = rs2.getString("gender");
		mobile = rs2.getString("mobile");
		zipcode = rs2.getString("zipcode");
		addr = rs2.getString("addr");
		rdate = rs2.getString("rdate");	
	} else {
%>
	<script>
		alert("다시 시도 해주세요.");
		location = "../member/loginWrite.jsp";
	</script>
<%	
	return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="../css/layout.css" >
<link rel="stylesheet" href="../css/jquery-ui.css">
<script src="../script/jquery-3.6.0.js"></script>
<script src="../script/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#birthday" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  } );
</script>
</head>

<style>
	td {
		text-align: left;
		line-height: 1.6;
	}

	.box1 {
		width: 98%;
	}
	
	.box2 {
		width: 150px;
	}
	
	button {
		height: 28px;
	}
	
</style>

<script>
	function fn_submit() {
		
		var f = document.frm
		
		if(f.name.value == "") {
			alert("이름을 입력해주세요.");
			f.name.focus();
			return false;
		}
		if( f.gender[0].checked == false && f.gender[1].checked == false ) {
			alert("성별을 체크해주세요.");
			return false;
		}
		
		f.submit();
	}
	
	function fn_onload() {
		docuemnt.frm.name.focus();	
	}

	
	function fn_post() {
		window.open("post1.jsp", "post", "width=500, height=200")
	}
	
	function fn_passChange() {
		var w = window.screen.width/2 - 200;
		var h = window.screen.height/2 - 100;
		var url = "passChange.jsp";
		window.open(url, "passChange", "width=400, height=200, left="+w+", top="+h);
		
		// 팝업창이 기본 2개가 있다. 
		// 1.window.open (팝업 기본창)
		// 2.모달창 => 잘 쓰이지 않는다. (브라우저 종류 및 버전에 따라 적용이 다르기 때문에 사용을 잘 안한다.)
	}
	
</script>

<body onload="fn_onload()">
	
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
				<form name="frm" method="post" action="memberModifySave.jsp">
					<input type="hidden" name="chk" value="0" >
					<table>
						<caption> 회원정보수정 </caption>
						<colgroup>
							<col width="25%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th>아이디</th>
								<td>
									<%=session_id %>
								</td>
							</tr>
							<tr>
								<th>암호</th>
								<td>
									<button type="button" onclick="fn_passChange()">암호변경</button>
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" class="box2" required value="<%=name %>"></td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<input type="radio" name="gender" value="M" <%if(gender.equals("M")) { out.print("checked"); } %> >남성
									<input type="radio" name="gender" value="F" <%if(gender.equals("F")) { out.print("checked"); } %> >여성
								</td>
							</tr>
							<tr>
								<th>생일</th>
								<td>
									<input value="<%=birthday %>" type="text" name="birthday" id="birthday" class="box2" required >
								</td>
							</tr>
							<tr>
								<th>핸드폰</th>
								<td>
									<input type="text" name="mobile" class="box2" value="<%=mobile %>" >
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<input type="text" name="zipcode" class="box2" value="<%=zipcode %>">
									<button type="button" onclick="fn_post()" >우편번호찾기</button> <br><br>
									<input type="text" name="addr" class="box1" value="<%=addr %>" >
								</td>
							</tr>
						</tbody>
					</table>
					
					<div style="width:600px; text-align: center; margin-top:10px;">
						<button type="submit" onclick="fn_submit(); return false; ">저장</button>
						<button type="reset">취소</button>
					</div>
				</form>
			</article>
		</section>
		<footer>
			<%@ include file = "../include/footer.jsp" %>
		</footer>
	</div>
	
</body>
</html>