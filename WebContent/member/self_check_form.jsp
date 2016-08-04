<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "member.memberDTO" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>본인 확인</title>

<!-- JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="../css/mypage.css">

</head>

<body>

<div class="section_self_check">

	<form name="frm_self_check" action="self_check.jsp" method="post">
		
		<div class="input_pw">
			비밀번호 입력
			<input type="password" name="m_pw" class="input_text" size="13" maxlength="12"/>
		</div>
		<div>
			<input type="image" src="../image/btn_ok.png" name="submit"/>
			<a href=""><img src="../image/btn_close.png" onclick="window.close()"/></a>
		</div>
		
	</form>
	
</div>

</body>
</html>