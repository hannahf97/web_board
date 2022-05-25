<%@page import="dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
Object obj = session.getAttribute("myid");
if(obj == null){
	%>
	<script>
	alert("로그인해 주십시오");
	location.href = "login.jsp";
	</script>	
	<%
}

%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
		rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<%
String id = (String)request.getParameter("id");
%>

	<div class="container py-1 h-80">

		<div class="card">
			<div class="contents">

			<div class="write">
			<h2><%=id %>'s MyPage</h2>
			</div>
			<div class="write">
			<p>로그인 완료!</p>
			</div>
			<div class="write">
			<label for="signout">회원탈퇴를 원하시나요?</label>
			<button class="btn" id="signout" name="signout">회원탈퇴</button>
			<label for="logout">로그아웃을 원하시나요?</label>
			<button class="btn" id="logout" name="logout" name="logout">로그아웃</button>
			</div>

		</div>

	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		 $("#logout").click(function(){
			 location.href="../user?param=login&id="+'<%=id%>';
		}); 
		
		$("#signout").click(function () {
			location.href="../user?param=signout&id="+'<%=id%>';
					
			});
			
		
		<%--  --%>
		
	});
	
	</script>

</body>
</html>