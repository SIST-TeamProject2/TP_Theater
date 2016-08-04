<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>head</title>

<link rel="stylesheet" href="../css/main.css">

<script type="text/javascript">

$(function(){
	$("#movie_finder").click(function(){
		/* $("#area_Yongho").show(); */
	});
});

</script>

</head>
<body>

<div class="nav">
	<div class="nav_menu">
		<div class="nav_left">
			<a href="../main/index.jsp"><img src="../image/logo.png"/></a>
		</div>
		<div class="nav_right"></div>
		<div class="nav_center">
			<div class="nav_center_title">
				<img src="../image/btn_nav_title.png"/>
			</div>
			<br/>
			<div class="nav_center_menu">
				<ul>
					<li class="nav_center_menu_list">
						<img src="../image/btn_nav_movie.png"/>
						<ul class="nav_center_submenu">
							<li onclick="location.href='../movie/movie.jsp'">무비차트</li>
							<li>HD 트레일러</li>
							<li id="movie_finder" onclick="location.href='../movie/movie.jsp?hide=0'">무비 파인더</li>
							<li onclick="location.href='../movie/grade.jsp?'">평점</li>
						</ul>
					</li>
					<li class="nav_center_menu_list">
						<img src="../image/btn_nav_ticketing.png"/>
						<ul class="nav_center_submenu">
							<li>빠른 예매</li>
							<li>상영 시간표</li>
						</ul>
					</li>
					<li class="nav_center_menu_list">
						<img src="../image/btn_nav_theater.png"/>
						<ul class="nav_center_submenu">
							<li>CGV 극장</li>
							<li>특별관</li>
						</ul>
					</li>
					<li class="nav_center_menu_list">
						<img src="../image/btn_nav_event-culture.png"/>
						<ul class="nav_center_submenu">
							<li>이벤트</li>
							<li>티켓*팝콘 스토어</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

</body>
</html>