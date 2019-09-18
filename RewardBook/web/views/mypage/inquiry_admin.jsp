<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inq_admin</title>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/common.css">

<style type="text/css">
	

main{
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

html, body, div,
main, section, article,
h1, h2, h3, h4, p, blockquote,
ul, ol, li, dl, dt, dd,
table, thead, tbody, tr, th, td {
  margin: 0;
  padding: 0;  }

main, section, article {
  display: block; }

ul, ol {
  list-style: none; }

table {
  border-collapse: collapse;
  border-spacing: 0; }

a {
  text-decoration: none;
  color: inherit; }

em, i {
  font-style: normal; 
  }

em.category, em.status close, h3.title,
span.author, span.created-at{

padding: 3px;

}

em.category{
    color: #ffb202;
}


/* //기본 전체 속성*/


.ui-header {
  
  margin: 0 auto;
  padding-top: 48px;
  padding-bottom: 24px;
  text-align: left; 
  width: 100%;
  max-width: 800px;

  }
  
  .ui-header .title {
    line-height: 40px;
    color: rgba(0, 0, 0, 0.84);
    font-size: 48px;
    font-weight: 700; 
    text-align: center;}


 
  .ui-tabs ul,
  .ui-tabs li,
  .ui-tabs li a {
    display: block;
    height: 100%; }
 
  .ui-tabs ul {
    margin: 0 auto;
    padding: 0 16px;
    height: 68px;
    text-align: left;
    line-height: 0;
    white-space: nowrap;
    font-size: 0;
 }
   .ui-tabs ul::after {
      display: block;
      clear: both;
      content: ''; }
 
  .ui-tabs li {
    display: inline-block;
    margin-right: 18px;
    height: 48px; 
    margin: 0 9px; } 
    
  .ui-tabs a {
    display: block;
    line-height: 48px;
    letter-spacing: -0.3px;
    color: #16191f;
    font-size: 17px;
    font-weight: 400;
    box-sizing: border-box; }
 
   .ui-tabs a:hover, .ui-tabs a:focus {
     color: rgba(0, 0, 0, 0.84); }
      
  .ui-tabs li.active > a {
    border-bottom: 3px solid black;
    color: black;
    font-weight: 500; }

    .ui-tabs ul {
      text-align: center;
       width: 100%;
   	  max-width: 700px; }


 .noticeboard li{

 	width:50%;
 	margin: 0 auto;
 	 vertical-align:middle;
 	 border-bottom:  0.1px groove #44484b; 
 	padding: 10px 0px;
 }
 

	
	.board-footer{
	text-align:center;
	padding: 30px;
	
	}
	
	.info{ display:inline; float:right;}
	

	.thumb {
	display:inline;
	height:100%;
	width:100%;
		
		}


	.thumb img {
		margin: 0 auto;
		width:144px;
		height:108px;
		display:block;
		text-align:center;
	       
	       
	       	}
		

	.prev-page{background-color:#fff; color:#8c8c8c; border:1px solid #fff;
				font-size:20px;}
	
	.next-page{background-color:#fff; color:#8c8c8c; border:1px solid #fff;
				font-size:20px;}
							
		
	.board-footer .search .filter-container .filter {
    height:38px;
    width:115px;
    background-color: #fff;
    padding: 0 0 0 10px;
    width: 110%;
    text-align: center;  
    color: #34383a;
    font-size: 15px;
    display:inline;

    
}
	
	.filter-container { display:inline-block;}
	
	.field{ display:inline-block;}

.ui-header-all{
background-color:#ffb202;
}
	
	label.text-hidden {
       display: block;
    margin-top: -1px;
    height: 1px;
    overflow: hidden;
    text-indent: -9999px;
   
}


 .search-form {
    border: 1px solid #dadce0;
    padding-right: 64px;
    padding-left: 10px;
    width: 60%;
    line-height: 36px;
    font-size: 15px;
}

	.searchbt{
    position: absolute; 
    border: 1px solid #dadce0;
    background-color: #f5f7fa;
    width: 100%;
    max-width: 64px;
    line-height: 36px;
    color: #34383a;
    font-size: 15px;

}


	.desktopbutton_pagelist a{

    padding: 0px 9px;
    color: #565656;
	
	}
</style>


<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet" href="/RewardBook/resources/css/MainMyPage.css">


</head>

<body>

<!-- 헤더부분 -->
<%@ include file="../common/header.jsp" %>
<!-- 헤더부분  -->
<hr>


 <main class="notice_main">
    <div class = ui-header-all>
 
      <div class="ui-header">
        <h2 class="title">관리자 문의</h2>
      </div>
    
      <br>
      <br>
    
   <!-- 전체/공지/이벤트 탭 -->
      <div class="ui-tabs">
        <ul>
        
          <li class="active">
          	<a href="#">전체</a>
          </li>
          
           <li >
              <a href="#1">답변</a>
           </li>
          
           <li >
              <a href="#2">대기중</a>
           </li>
          
          
        </ul>
      </div>
  
     </div><!-- //all-ui-header -->
      <!-- //전체/공지/이벤트 탭 -->
   
	  
	  <!-- 공지사항게시판 -->
      <div class="noticeboard">
        <ul>
          
          
            <li>
            	<div class="inquiry_area">
            		<div class="inq_top" style="width:100%;">
            			<em class="category">답변</em>
            			<em class="status closed">대기중</em>
            		</div>
            		<div class="inq_bottom" style="width:100%; ">
            			<h3 class="title">[문의]아니 한여름에 지하철에서 이게 무슨 찜통인가요. 에어컨좀 틀어주세요. 제발.</h3>
            			<span class="author">KH세준</span><span class="created-at">2019.08.18</span> 
            		</div>
            	</div>
            </li>
          
          
          <li>
            	<div class="inquiry_area">
            		<div class="inq_top" style="width:100%;">
            			<em class="category">답변</em>
            			<em class="status closed">대기중</em>
            		</div>
            		<div class="inq_bottom" style="width:100%; ">
            			<h3 class="title">[문의]지뢰찾기 api 리워드 하고싶습니다.</h3>
            			<span class="author">KH세준</span><span class="created-at">2019.08.18</span> 
            		</div>
            	</div>
            </li>
            
            <li>
            	<div class="inquiry_area">
            		<div class="inq_top" style="width:100%;">
            			<em class="category">답변</em>
            		</div>
            		<div class="inq_bottom" style="width:100%; ">
            			<h3 class="title">[문의]댕댕이 용품 리워드 하고싶어용.</h3>
            			<span class="author">이승진</span><span class="created-at">2019.08.18</span> 
            		</div>
            	</div>
            </li>



        </ul>
        
      </div>
 
 
 <br>
 
       <!--// 공지사항게시판 -->

       <div class="board-footer">        
        <div class="pagination" >
        
          <div class="page">
          
         <!-- 데스크탑용 버튼과 페이지 리스트 -->
         <div class="desktopbutton_pagelist">
         <button class="prev-page" onclick="movePage(0)" disabled>
        	 <span class="text-hidden"><</span>
         </button>
         
         <a class="current" href="#" onclick="movePage(1)">1</a>  
                <a  href="#" onclick="movePage(2)">2</a>       
                <a  href="#" onclick="movePage(3)">3</a>             
                <a  href="#" onclick="movePage(4)">4</a>             
                <a  href="#" onclick="movePage(5)">5</a>
     
     	<button class="next-page" onclick="movePage(6)">
     		<span class="text-hidden">></span>
     	</button>
         </div><!-- //desktopbutton_pagelist -->
         
          </div><!-- //div class = "page" -->
         </div> <!-- //div class = "pagination" --> 
          
        
        
 <br><br>
        <div class="search">
         
          <form method="post" id="news-board-search" class="searchform">
            
            <div class="filter-container">
              <select id="searchSelectInBoard" class="filter" name="">
                <option value="tc">제목+내용</option>
                <option value="t">제목</option>
                <option value="c">내용</option>
              </select>
            </div>
          
            <div class="field">
              <label class="text-hidden" for>검색창</label>
                <input id="searchTextInBoard" name="searchTextInBoard" class="search-form" type="text" placeholder="검색어 입력">
                <button class="searchbt" type="submit">검색</button>
          
            </div>
          
          </form>
          
          
       <!--    <form id="formSearch" name="formSearchBoard" action="" method="post">
            <input id="searchText1"   name="searchText1" type="hidden" value="" />
            <input id="searchSelect1" name="searchSelect1" type="hidden" value="" />
            <input id="searchSelect2" name="searchSelect2" type="hidden" value=""/>
            <input id="searchSelect4" name="searchSelect4" type="hidden" value="" />
            <input id="searchSelect5" name="searchSelect5" type="hidden" value="" />
          </form> -->
       
       
        </div> <!-- //search -->
			<div aria-hidden="true" style="position: relative; left: 0px; bottom: 48px; width: 100%;"></div>
	
	
		</div><!--div class="board-footer"-->    
    </main>
<!-- //컨텐츠 영역 -->

<!-- 하단 영역 -->











<!-- 푸타부분 include -->
<%@ include file="../common/footer.jsp" %>
<!-- 푸타부분 include -->

</body>

</html>