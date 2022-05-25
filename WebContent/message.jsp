<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String label =request.getParameter("proc");
String msg = request.getParameter("msg");


if(label.equals("signout")){
	if(msg.equals("OK")){
		%>
	<script type="text/javascript">
			alert("회원탈퇴완료");
			location.href = "user?param=login";
			</script>
	<%
		}else{
			%>
	<script type="text/javascript">
			alert("다시 시도해주세요");
			location.href = "user?param=mypage";
			</script>
	<%
		}
}
else if(label.equals("login")){
	if(msg.equals("OK")){
		%>
	<script type="text/javascript">
			alert("환영합니다.");
			location.href = "user?param=mypage";
			</script>
	<%
		}else{
			%>
	<script type="text/javascript">
			alert("id나 password를 확인하세요");
			location.href = "user?param=login";
			</script>
	<%
		}
	
}
else{
	if(msg.equals("OK")){
		%>
		<script type="text/javascript">
			alert("성공적으로 가입되었습니다");
			location.href = "user?param=login";
			</script>
		<%
		}else{
			%>
		<script type="text/javascript">
			alert("다시 기입해 주십시오");
			location.href = "user?param=regi";
			</script>
		<%
	}
}
%>

</body>
</html>