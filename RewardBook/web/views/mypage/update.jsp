<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>


<style type="text/css">
#box { width:100%; text-align:center;}
#myphoto { border-radius:50%;}
.upul { list-style:none;}
.upul li { padding: 10px; margin: 0px 35px 0px 0px; }
.upul li input { width: 220px; height: 20px; }
.upul li .upselect { width: 225px; height:25px;}
.upul li .upbtn { width: 60px; height:25px;}
.upul li .byebtn { width: 45px; height:25px;}


</style>

<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>

</head>

<body>

<div id="box">
	<div>
		<div>
			<div>
				<div>
					<div>
						<img id="myphoto" src="/RewardBook/resources/images/mypage/i.jpg">
					</div>
					<div class="uplist">
						<ul class="upul">
							<li><input type="text" placeholder="이름"></li>
							<li><input type="password" placeholder="비밀번호"></li>
							<li><input type="password" placeholder="비밀번호 확인"></li>
							<li><input type="tel" placeholder="전화번호"></li>
							<li><input type="address" placeholder="주소"></li>
							<li><input type="address" placeholder="상세 주소"></li>
							<li>
							<select class="upselect">
								<option hidden>직업을 선택하세요.</option>
								<option value="직장인">직장인</option>
								<option value="학생">학생</option>
								<option value="주부">주부</option>
								<option value="기타">기타</option>
							</select>
							</li>
							<li>
							<div style="margin: 0px 150px 0px 0px;">나의 소개</div>
							<div><textarea style=" width:220px; height:70px;" placeholder=""></textarea></div>
							</li>
							<li>
							<input class="upbtn" type="button" value="수정">
							<input id="noup" class="upbtn" type="button" value="취소" onclick="noup_click();">
							<script type="text/javascript">
							function noup_click(){
								if (confirm("취소하시겠습니까??") == true){    //확인
	   								location.href = "mypage.jsp";
								}else{   //취소
	    							return;
								}

							}
							</script>
							</li>
							<li>
							<br><br>
							<input class="byebtn" type="button" value="탈퇴">
							</li>
							
							
							
						</ul>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




</body>



</html>