<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, memo.model.vo.Memo" %>
<%@ page import="java.util.ArrayList, project.model.vo.Project" %>
 <%
	Project list = (Project)request.getAttribute("list"); 
   Memo memo = (Memo)request.getAttribute("list");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 상세페이지</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
main{ margin: 0 auto; }
li{ list-style: none; }
.detail_title{ font-size: 30px; padding: 20px 10px 20px 0px; }
.line{width: 235px; height: 5px; background: #ffb202; margin-bottom: 5px; }
.p_name{padding: 20px 0px 20px 0px;}
.m_text{ width:400px; height:260px; }
.btbt{width: 100%; text-align: center;}
.bt{ display: inline-block;}
.mdelbt{ padding: 0.5px 5px; border: 1px solid black; background: white; font-size: 15px; }
.mupbt{background: white;  border: 1px solid black; padding: 1.5px 8px; font-size: 14px;}
.resetbt{background: white;  border: 1px solid black; padding: 1.5px 8px; font-size: 14px;}
</style>
</head>
<body>
<main>
<div class="detailmain">
	<div class="dform">
		<ul>
			<li class="detail_title">내가 작성한 메모</li>
			<li class="line"></li>
			<li class="p_name">프로젝트명 : 프로젝트이름받아오기</li>
			<li class="m_text">메모내용입니다!</li>
			</li>
		</ul>
		<div class="btbt">
			<div class="bt">
			<input class="mupbt"  type="button" value="수정">
			<a class="mdelbt" onclick="confirm('정말 삭제하시겠습니까?');">삭제</a>
			<input class="resetbt" type="reset" value="취소" onclick="window.close();">
			</div>
		</div>
	</div>
</div>
</main>
</body>
</html>