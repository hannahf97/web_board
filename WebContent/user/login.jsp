<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="../css/style.css?ver=1">
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

</head>
<body>

	<div class="container py-1 h-80">
		<div class="card">
			<div class="row">
				<div class="col">
					<form action="../user" method="post">
					<input type="hidden" name="param" value="loginAf">
						<h2>Login</h2>
						<div class="login-form">
						<div class="form-group">
							<label for="userid">ID</label> <input type="checkbox" id="chk_save_id">아이디저장
							<input type="text"
								class="form-control" id="userid" name="id" placeholder="id">
						</div>
						<div class="form-group">
							<label for="Password">Password</label> <input type="password"
								class="form-control" id="userPwd"name="pwd" placeholder="Password">
						</div>
						<input type="submit" class="btn btn-block" id="signinbtn"
							name="login" value="Log in">



						<div class="gotoAccount">
							Don't have an account yet? <a href="./account.jsp"> Register
								for free </a>
						</div>
						</div>
					</form>
				</div>
				<div class="col" id="imgPlace">
					<div class="avatar">
						<img src="../img/avatar.png">
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<script type="text/javascript">

let user_id = $.cookie("user_id");
if(user_id != null){
	$("#userid").val(user_id);
	$("#chk_save_id").prop("checked", true);
}

$("#chk_save_id").click(function() {
	
	if( $("#chk_save_id").is(":checked") ){ // 체크되었을 때
		
		if($("#userid").val().trim() == ""){
			alert("id를 입력해 주십시오");
			$("#chk_save_id").prop("checked", false);
		}else{
			// cookie에 저장	
			$.cookie("user_id", $("#userid").val().trim(), { expires:7, path:"/" });
		}
	}
	else{ // cookie를 삭제
		$.removeCookie("user_id", { path:"/" });
	}	
	
});

</script>

</body>
</html>