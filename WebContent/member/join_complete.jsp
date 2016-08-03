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
		<img src="../image/tap_join_02_off.jpg"/>
		<img src="../image/tap_join_03_off.jpg"/>
		<img src="../image/tap_join_04_on.jpg"/>
	</div>
</div>

<div class="section_join_complete">
	${ param.name }님 회원가입을 축하합니다.
	
	<div class="area_btn">
	<br/><br/>
		<a href="login_form.jsp" class="btn_link_login" onclick=""><img src="../image/btn_link_login.png"/></a>
		<a href="../main/index.jsp" class="btn_link_main" ><img src="../image/btn_link_main.png"/></a>
	</div>
	
</div>



<div class="footer">
	<jsp:include page="../include/footer.jsp"/>
</div>

</body>
</html>