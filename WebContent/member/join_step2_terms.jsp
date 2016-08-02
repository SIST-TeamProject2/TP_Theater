<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<!-- JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="../css/join.css">
<link rel="stylesheet" href="../css/footer.css">

</head>

<body>

<div class="header">
	<jsp:include page="join_header.jsp"/>
</div>

<div class="header_2">
	<div class="step">
		<img src="../image/tap_join_01_off.jpg"/>
		<img src="../image/tap_join_02_on.jpg"/>
		<img src="../image/tap_join_03_off.jpg"/>
		<img src="../image/tap_join_04_off.jpg"/>
	</div>
</div>

<div class="section_join_terms">
	<div class="summary">
		<h1>본인인증에 성공했습니다.</h1>
		<h2>이용약관 및 정보 활용 안내에 동의해주세요.</h2>
		<br/>
	</div>
	<div>
		서비스 이용 약관 및 정보 활용 동의
	</div>
</div>

<div class="footer">
	<jsp:include page="../include/footer.jsp"/>
</div>

</body>
</html>