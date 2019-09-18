<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userprofile</title>

<style type="text/css">
	 
  	#box{margin: 0 auto; width:940px;}
  	
	ul{list-style: none;}
	#top {  height:400px;  }
	
	#myname { font-size: 35px; font-weight:bold;}
	#point { background-color: #ffb202; border-radius: 100px; text-align: center; font-size: 13px; 
			color: #fff; font-weight: bold; height: 10px; line-height: 10px;}
	#leftul {float:left; }
	.litype a{ font-size: 20px; font-weight:bold; color: black; text-decoration: none;}
	#leftul li{ padding: 5px 0px;}
	#logdiv { float:right; }
	#top #left { float:left; margin : 100px 0px 0px 0px;}
	#top #right { float:right; margin : 100px 0px 0px 0px;}
	#rightul li{ padding: 5px 0px;}
	#logout{ background-color: #ffb202; border-radius: 100px; text-align: center; font-size: 13px; 
			 font-weight: bold; height: 10px; line-height: 10px; text-decoration: none; width:80px;
			 margin: 0px 47px 0px 0px ;}
	#logout a{ text-decoration:none; color: #fff;}  
	#myimage img{ width:180px; height:180px; border-radius: 49%; }
	header{ height:100px;}
	#bottom{height:400px; margin: 0px 0px 100px 0px;}

.tabs { 
	width:100%; height:150px;
  display: flex; 
  flex-wrap: wrap;     
} 
.tabs label { 
width: 313.33px;
  order: 1; 
  display: block; 
  padding:10px 0px; 
  text-align:center; 
  cursor: pointer; 
  background: #ffb202; 
  font-weight: bold; 
  transition: background ease 0.7s; 
} 
/*박스배경*/ 
.tabs .tab {
	height: 250px; 
  order: 99; 
  flex-grow: 1; 
  width: 100%; 
  display: none; 
  padding: 1rem; 
  background: rgba(178, 178, 178, 0.3); 
} 
.tabs input[type="radio"] { 
  display: none; 
} 
/*탭 눌렀을때 컬러*/ 
.tabs input[type="radio"]:checked + label { 
  background: rgba(178, 178, 178, 0.3); 
} 
.tabs input[type="radio"]:checked + label + .tab { 
  display: block; 
}


#tabsearch button{ float:right;}

.tabitem { float:left; width:130px; height:130px; border:1px solid gray; margin: 55px;}

#tabsearch { float: right; margin: 0px 30px;}

</style>



<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript"></script>


</head>
<body>

<header></header>
<hr>

<div id="box">

<div id="top">
	<div id="left">
		<ul id="leftul">
			<li id="myname">KH세준</li>
			<li id="my">기업회원</li>
			<li id="category"></li>
			<li class="litype"><a href="#"></a></li>
			<li class="litype"><a href="#"></a></li>
			<li class="litype"><a href="#"></a></li>
		</ul>
	</div>
	<div id="right">
		<div id="myimage">
			<img src="/RewardBook/resources/images/mypage/i.jpg">
		</div>
		<div id="logdiv">
			<ul id="rightul">
				<li id="logout"><a href="#">로그아웃</a></li>
			</ul>
		</div>
	</div>
</div>


	<div id="bottom">
	<div class="tabs"> 
	<input type="radio" name="tabs" id="tabone" checked="checked">     
    <label for="tabone">프로젝트</label> 
      <div class="tab">
      		<div id="tabsearch">
				<input type="text" placeholder="검색어를 입력하세요.">
				<button>검색</button>
			</div> 
        <ul class="tabview">
        	<div class="tabitem">1</div>
        	<div class="tabitem"></div>
        	<div class="tabitem"></div>
        </ul>
      </div>        
    <input type="radio" name="tabs" id="tabtwo">     
    <label for="tabtwo">팔로워</label> 
      <div class="tab"> 
      		<div id="tabsearch">
				<input type="text" placeholder="검색어를 입력하세요.">
				<button>검색</button>
			</div> 
        <ul class="tabview">
        	<div class="tabitem">
        		<div class="following">
        			<a href="/RewardBook/views/mypage/userprofile.jsp"><img src="/RewardBook/resources/images/mypage/i.jpg"></a>
        		</div>
        	</div>
        	<div class="tabitem">2</div>
        	<div class="tabitem"></div>
        </ul>
      </div>
      <input type="radio" name="tabs" id="tabthree">     
    <label for="tabthree">리뷰</label> 
      <div class="tab"> 
            <div id="tabsearch">
				<input type="text" placeholder="검색어를 입력하세요.">
				<button>검색</button>
			</div> 
        <ul class="tabview">
        	<div class="tabitem"></div>
        	<div class="tabitem"></div>
        	<div class="tabitem">3</div>
        </ul>
      </div>  
      
  	</div>
	</div>

</div>



</body>
</html>