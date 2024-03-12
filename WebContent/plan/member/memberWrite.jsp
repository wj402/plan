<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
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
		
		if(f.userid.value == "") {
			alert("아이디을 입력해주세요.");
			f.userid.focus();
			return false;
		}
		
		if( f.chk.value == "0" ) {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		
		if(f.pass.value == "") {
			alert("암호을 입력해주세요.");
			f.pass.focus();
			return false;
		}
		
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
		docuemnt.frm.userid.focus();	
	}
	
	function fn_idcheck() {
		
		var userid = document.frm.userid.value;
		
		if( userid == "" ) {
			alert("아이디를 입력해주세요.");
			document.frm.userid.focus();
			return false;
		}
		
		if(userid.length < 4 || userid.length > 12 ) {
			alert("아이디는 4자 ~ 12자 사이로 해주세요.");
			document.frm.userid.focus();
			return false;
		}
		
		//alert(window.screen.width);
		//alert(window.screen.height);
		var w = window.screen.width/2 - 150;
		var h = window.screen.height/2 - 100;
		var url = "idcheck.jsp?userid="+userid;
		window.open(url,"중복아이디체크","width=300,height=200, left="+w+", top="+h);
	}
	
	function fn_post() {
		window.open("post1.jsp", "post", "width=500, height=200")
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
				<form name="frm" method="post" action="memberWriteSave.jsp">
					<input type="hidden" name="chk" value="0" >
					<table>
						<caption> 회원등록 </caption>
						<colgroup>
							<col width="25%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th>아이디</th>
								<td>
									<input type="text" name="userid" class="box2" required>
									(4자 ~ 12자 사이)
									<button type="button" onclick="fn_idcheck()">중복아이디체크</button>
								</td>
							</tr>
							<tr>
								<th>암호</th>
								<td><input type="password" name="pass" class="box2" required></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" class="box2" required></td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<input type="radio" name="gender" value="M">남성
									<input type="radio" name="gender" value="F">여성
								</td>
							</tr>
							<tr>
								<th>생일</th>
								<td>
									<input type="text" name="birthday" id="birthday" class="box2" required>
								</td>
							</tr>
							<tr>
								<th>핸드폰</th>
								<td>
									<input type="text" name="mobile" class="box2">
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<input type="text" name="zipcode" class="box2">
									<button type="button" onclick="fn_post()" >우편번호찾기</button> <br><br>
									<input type="text" name="addr" class="box1">
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