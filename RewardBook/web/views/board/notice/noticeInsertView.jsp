<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RewardBook</title>
<style type="text/css">
body {
	background-color: #ffc107;
}

h1 {
	padding: 100px;
	color: black;
}

h3 {
	padding: 0px 0px 0px 15px;
}

.submitdiv {
	float: right;
	padding: 10px 15px 10px 1px;
}

.insertT {
	border: 2px solid black !important;
}

.insertT input[type="text"] {
	border: 1px solid #fff;
	width: 90%;
	height: 30px
}

.insertT textarea {
	border: 1px solid #fff;
	width: 95%;
	height: 300px;
	font-size: 15px;
	margin: 0px 0px 5px 15px;
}

.insertT ul {
	margin: 0px;
	padding: 0px;
}

.insertT {
	margin: 0 auto;
	width: 50%;
}

li {
	list-style: none;
}

.button {
	float: right;
	margin: 15px 5px 15px 5px;
}

.textT input[type="text"]::placeholder {
	font-size: 16px;
	color: #8c8c8c;
	padding-left: 5px;
}

.textT textarea::placeholder {
	font-size: 16px;
	color: #8c8c8c;
	padding-left: 5px;
}

.textT textarea {
	font-size: 18px;
	margin: 5px 0px 5px 15px;
}

.textT input {
	font-size: 18px;
}

.textT {
	padding: 15px;
	background-color: #grey;
}

.textT input {
	font-size: 18px;
	margin-left: 10px;
}

li.textT {
	padding: 15px
}

.bt1, .bt2 {
	background-color: white;
	border: 0;
	padding: 10px 11px 10px 11px;
	margin-top: 15px;
}

.filebt {
	border: 0;
	padding: 10px 0px 30px 29px;
}

.nt_ntevent {
	float: right;
	padding: 5px 5px 10px 5px;
	text-align: center;
	margin: 15px;
}

.nt_oc {

	text-align: center;
	margin: 15px;
	padding: 7px 5px 12px 10px;
}

form {
	margin-bottom: 300px;
}


</style>

</head>

<body>
	<main id="noticemain">

	<div class=noticeinsert-ui-header-all>

		<div class="ui-header">
			<h1 class="title" align="center" margin="0 auto">공지사항 글 등록</h1>
		</div>


		<form method="post" enctype="multipart/form-data"
			action="/RewardBook/ninsert">


			<div class="insertT">
				<ul>
					<select id="nt_ntevent" class="nt_ntevent" name="nt_ntevent">
						<option value="ntnt">공지사항</option>
						<option value="ntevent">이벤트</option>
					</select>
					<li class="textT"><h3 style="color: black">
							제목
							</h6>
							<input type="text" name="nt_title" placeholder="제목을 입력하세요"></li>
					<li class="textT"><h3 style="color: black">
							내용
							</h6>
							<textarea name="nt_text" placeholder="내용을 입력하세요"></textarea></li>
					<li><input class="filebt" type="file" name="nt_img" size=40></li>

					<li class="button"><select id="ntoc" class="nt_oc"
						name="nt_oc">
							<option value="nto">공개</option>
							<option value="ntx">비공개</option>
					</select> <input class="bt1" type="submit" value="등록">&nbsp; <input
						class="bt2" type="reset" value="취소"
						OnClick="javascript:history.back(-1)"></li>

				</ul>
			</div>

		</form>
	</main>

</body>
</html>