<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록 </title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../../../resources/css/board/noticeInsertView.css">
</head>
<body>
   <%@ include file="../../../views/common/header.jsp" %>
	<main id="noticemain">

	<div class=noticeinsert-ui-header-all>

		<div class="ui-header">
			<h1 class="title" align="center" margin="0 auto">공지사항 글 등록</h1>
		</div>


		<form method="post" enctype="multipart/form-data"
			action="/RewardBook/ninsert">
		<input type="hidden" name="a_no" value="<%= loginAdmin.getaNo() %>">

			<div class="insertT">
				<ul>
					<select id="nt_ntevent" class="nt_ntevent" name="nt_ntevent">
						<option value="NOTICE">공지사항</option>
						<option value="EVENT">이벤트</option>
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
							<option value="Y">공개</option>
							<option value="N">비공개</option>
					</select> <input class="bt1" type="submit" value="등록">&nbsp; <input
						class="bt2" type="reset" value="취소"
						OnClick="javascript:history.back(-1)"></li>

				</ul>
			</div>

		</form>
	</main>
<%@ include file="../../../views/common/footer.jsp" %>
</body>
</html>