<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="board.notice.model.vo.Notice"%>
<%   
   Notice n = (Notice)request.getAttribute("list");
   
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정페이지</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="resources/css/board/noticeUpdateView.css" rel="stylesheet">
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
   $(".filebt").on("change", function() {
      $("input[name=newimg]").val($(this).val());
      console.log($(this).val());
   });
});
</script>
</head>
<%@ include file="../../../views/common/header.jsp"%>
<body>

   <main id="noticemain">

   <div class=noticeinsert-ui-header-all>

      <div class="ui-header">
         <h1 class="title" align="center" margin="0 auto">공지사항 글 수정</h1>
      </div>

      <form method="post" action="/RewardBook/nupdate"
         enctype="multipart/form-data">
         <input type="hidden" name="nt_no" value="<%= n.getNt_no() %>">

         <div class="insertT">
            <ul>
               <select id="nt_ntevent" class="nt_ntevent" name="nt_ntevent">
                  <option value="NOTICE">공지사항</option>
                  <option value="EVENT">이벤트</option>
               </select>
               <li class="textT"><h3 style="color: black">제목</h3> <input
                  type="text" name="nt_title" placeholder="제목을 입력하세요"
                  value="<%= n.getNt_title() %>"></li>
               <li class="textT"><h3 style="color: black">내용</h3> <textarea
                     class="textarea" name="nt_text" placeholder="내용을 입력하세요">
                     <% if( n.getNt_text()==null ){ %>
                     <% }else{ %><%= n.getNt_text() %>
                     <%} %>
                  </textarea></li>

               <li>
                  <input type="hidden" name="img" value="<%= (n.getNt_img() == null ? "없음"  : n.getNt_img()) %>">
                  <input type="hidden" name="newimg" value="">
                  <input class="filebt" type="file" name="nt_img" size=40><%= (n.getNt_img() != null ? n.getNt_img() : "") %>
               </li>
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
   <%@ include file="../../../views/common/footer.jsp"%>
</body>
</html>