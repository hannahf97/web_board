<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/style.css?ver=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
      
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
   

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;

            }
        }).open();
    }
		
</script>


</head>
<body>
	<div class="container py-0.3 h-10">
		<div class="card">
			<div class="row">
				<div class="col">
					<form action="../user" method="post">
						<input type="hidden" name="param" value="accountAf">
						<h2>Account</h2>
						<div class="form-group">
							<label for="inputID">ID</label> 
							<p id="idcheck" style="font-size: 10px"></p>
							<input type="text"
								class="form-control" id="inputID" name="id" placeholder="id">
								
						</div>
						<div class="form-group">
							<label for="inputPassword">Password</label> <input
								type="password" class="form-control" id="inputPassword" name="pwd"
								placeholder="Password">
						</div>
						<div class="form-group">
							<label for="inputName">Name</label> <input type="text"
								class="form-control" id="inputName" placeholder="Name" name="name">
						</div>
						<div class="form-group">
							<label for="inputAge">age</label> <input type="text"
								class="form-control" id="inputAge" name="age" placeholder="Age">
						</div>
						<div class="form-group">
							<label for="inputDate">BirthDay</label> <input type="date"
								class="form-control" onchange="ageCount()" id="inputDate" name="date"
								placeholder="BirthDay">

						</div>
						<div class="form-group">
							<label for="address">Address</label> <input type="text"
								class="form-control" onclick="daumPostcode()" id="address" name="address"
								placeholder="Address">
						</div>
						<div class="form-group">
							<label for="inputHeight">height</label> <input type="text"
								class="form-control" id="inputHeight" name="height" placeholder="height">
						</div>
						<button type="submit" class="btn">Sign in</button>
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
	function ageCount(){
		let birthday = $("#inputDate").val();
		if(birthday == ""){
			alert("날짜를 선택해주세요");
		}else{
			let birth = new Date(birthday).getFullYear();
			if(birth >= 2022 ){
				alert("이전 날짜로 선택해주세요");
			}

			let today = new Date().getFullYear();
			
			console.log(birth + " "+ today);
			
			let gap = today - birth +1;
			
			console.log("gap = "+gap);
			
			$("#inputAge").val(gap); 
		}
	}
	
	$(document).ready(function() {
		
		$("#inputID").change(function () {
			
			if($("#inputID").val().trim() == ""){
				alert("id를 입력해 주십시오");
			}		
			else{
				$.ajax({
					url:"../user?param=checkId",
					type:"post",
					data:{ "id":$("#inputID").val()},
					success:function(data){
						//alert('success');
						
						if(data.str == "OK"){ // 사용가능
							$("#idcheck").css("color", "#0000ff");
							$("#idcheck").text("사용 가능한 아이디입니다");
						}else{
							$("#idcheck").css("color", "#ff0000");
							$("#idcheck").text("사용 중인 아이디입니다");
							$("#inputID").val("");
						}
					},
					error:function(){
						alert('error');
					}
					
				});	
			}
			
		});
		});
	</script>
</body>
</html>