<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
    
<%@ page import="java.util.ArrayList, project.model.vo.Project" %>
<% 
   ArrayList<Project> list = (ArrayList<Project>)request.getAttribute("list"); 
   String searchText = (String)request.getAttribute("searchText");
   int result = ((Integer)request.getAttribute("count")).intValue();
   int listcount = 3;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project</title>

<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 프로젝트 메인 스타일시트 연결 -->
<link rel="stylesheet" href="/RewardBook/resources/css/project/projectSearch.css">
<!-- 공통 header & footer 스타일시트 연결 -->
<link rel="stylesheet" href="/RewardBook/resources/css/index.css">
<link rel="stylesheet" href="/RewardBook/resources/css/MainMyPage.css">
<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>

<!-- 슬라이드 스크립트 -->
<script type="text/javascript" src="/RewardBook/resources/js/index.js"></script>


</head>
<body>

<%@ include file="/views/common/header.jsp" %>

<div id="projectListWrap">
   <div class="projectListHeader">
      <div class="categoryName"><h2>'<%= searchText %>'에 대한 검색결과</h2></div>
   </div>
   <div class="invest_list">
         <% for(int i = 0; i < list.size(); i++){ %>
         <% int percent = (int)((double)(list.get(i).getP_nprice()) / (double)(list.get(i).getP_tprice()) * 100); %>
      <div class="invest_box invest_item<%= i+1 %>">
         <div class="invest_img">
            <a class="invest_imgtag" href="/RewardBook//p_sel?p_no=<%= list.get(i).getP_no() %>"><img src="/RewardBook/resources/images/index/main1.jpg"></a></div>
         <div class="invest_title">
            <a href="/RewardBook//p_sel?p_no=<%= list.get(i).getP_no() %>" class="invest_titlelink"><p><%= list.get(i).getP_title() %></p></a>
            <div class="invest_name">
               <span class="invest_category"><%= list.get(i).getP_category() %></span>
               <span class="invest_maker">IT세준</span>
            </div>
         </div>
         <div class="target_gauge"><span class="gauge" style="width:<%= percent %>%;"></span></div>
         <span class="percentage"><%= percent %>%</span>
         <span class="invest_info nowprice"><%= list.get(i).getP_nprice() %>원</span>
         <span class="invest_info enddate"><%= list.get(i).getP_rdate() %>일 남음</span>
      </div>
      
         <% } %>
</div>
<script type="text/javascript">
   var maxlength = (<%= result %> / 3);
   var start_number = 0;
   var count = 3;

   $(".invest_plus").on("click", function() {
      start_number = start_number + 1;
      if(start_number > maxlength) {
         return false;
      }
      $(".load_btn_box").fadeOut("fast");
      $.ajax({
         url: '/RewardBook/p_majax', //주소
         type: 'get', // get 또는 post 방식으로
         dataType: "json",
         success : function(data) { 
            console.log("success");
            //성공시 동작
            var jsonStr = JSON.stringify(data);
            var json = JSON.parse(jsonStr);
            
            for(var i = 0; i < 3; i++){
               
               $(".invest_list").append(
                  "<div class='invest_box invest_item'>"
                  + "<div class='invest_img'>"
                  + "<a class='invest_imgtag' href='/RewardBook//p_sel?p_no="+ json.list[count].no +"'><img src='/RewardBook/resources/images/bgimg.jpg'></a></div>"
                  + "<div class='invest_title'>"
                  + "<a href='/RewardBook//p_sel?p_no="+ json.list[count].no +"' class='invest_titlelink'><p>"+ decodeURIComponent(json.list[count].title).replace(/\+/gi, " ") +"</p></a>"
                  + "<div class='invest_name'>"
                  + "<span class='invest_category'>"+ decodeURIComponent(json.list[count].category).replace(/\+/gi, " ") +"</span>"
                  + "<span class='invest_maker'>IT세준</span>"
                  + "</div></div>"
                  + "<div class='target_gauge'><span class='gauge' style='width:" + (json.list[count].nprice / json.list[count].tprice) * 100 + "%'></span></div>"
                  + "<span class='percentage'>"+ parseInt((json.list[count].nprice / json.list[count].tprice) * 100) +"%</span>"
                  + "<span class='invest_info nowprice'>"+ json.list[count].nprice +"원</span>"
                  + "<span class='invest_info enddate'>"+ json.list[count].rdate +"일 남음</span>"
               );
               count++;
               
            }
            if(start_number >= maxlength) {
               $(".load_btn_box").fadeOut("fast");
               return false;
            }
            $(".load_btn_box").fadeIn("fast");
            
         },
         error: function(textStatus) {
            console.log("error : " + textStatus);
         }
      });
   });

</script>   

</div>


<%@ include file="/views/common/footer.jsp" %>

</body>
</html>