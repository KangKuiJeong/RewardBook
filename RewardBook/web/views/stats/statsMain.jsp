<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RewordBook</title>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/commons.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<!-- // -->
<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);

var data = [];
var value = 0;
for(let i = 0; i < 300; i++){
  let date = new Date();
  date.setHours(0,0,0,0);
  date.setDate(i);
  /*  value -= Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);  */
   value = Math.round((Math.random()) * Math.random() * 10); 
  data.push({date:date, value: value});
}

chart.data = data;

// Create axes
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.minGridDistance = 60;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

// Create series
var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "value";
series.dataFields.dateX = "date";
series.tooltipText = "{value}"

series.tooltip.pointerOrientation = "vertical";

chart.cursor = new am4charts.XYCursor();
chart.cursor.snapToSeries = series;
chart.cursor.xAxis = dateAxis;

//chart.scrollbarY = new am4core.Scrollbar();
chart.scrollbarX = new am4core.Scrollbar();

}); // end am4core.ready()
</script>


<style type="text/css">
#statemain{
	margin: 0 auto;
	width: 50%;
	height: 2100px;
}
#chartdiv {
  margin: 0 auto;
  width:50%;
  height: 500px;
}

table{
	margin:0 auto;

}
td{
text-align:center;
}


.statemenu{
	float:right;

}

select{
padding:5px 5px 10px 5px;

}
</style>
</head>

<body>
<%@ include file="/views/admin/common/adminHeader.jsp" %>
<%@ include file="/views/admin/common/adminSideMenu.jsp" %>
	<!-- 컨텐츠 영역 -->
	<br><br>
	
<H1 align="center">가입자수 통계</H1>
<div style="margin-left:1100px;">
<select name="statemenu">
    <option value="방문자수">방문자수</option>
    <option value="가입자수">가입자수</option>
    <option value="탈퇴자수">탈퇴자수</option>
</select>
</div>
<div id="chartdiv"></div>

<table border="1" align="center" class="charttable">
<tr>
<th>오늘 가입자 수</th>
<th>어제 가입자 수</th>
<th>금주 가입자 수</th>
<th>전체 가입자 수</th>
</tr>
<tr>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
</table>
</body>
</html>