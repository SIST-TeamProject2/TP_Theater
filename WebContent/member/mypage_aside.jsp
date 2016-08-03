<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 메뉴</title>

<!-- JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="../css/mypage.css">

</head>

<body>

<div class="aside_mypage">
	<div class="aside_menu">
		<table class="tbl_menu">
		<tr>
			<td class="member_info" onclick="location.href='mypage_info.jsp'">
				회원 정보
			</td>
		</tr>
		<tr>
			<td class="my_ticketing_list" onclick="location.href='mypage_ticketing_list.jsp'">
				예매 내역
			</td>
		</tr>
		</table>
	</div>
</div>

</body>
</html>