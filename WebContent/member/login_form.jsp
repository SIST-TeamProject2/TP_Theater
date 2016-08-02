<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<!-- JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/login_form.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/footer.css">

</head>

<body>

<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

<div class="section_login">
	
	<div class="login_ad" style="background:#d2cbbe;">
        <div>
           <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Login_bigbanner" 
           width="350" height="300" title="" frameborder="0" scrolling="no" 
           marginwidth="0" marginheight="0" name="Login_bigbanner" id="Login_bigbanner">
           </iframe>
        </div>
    </div>
	
	<div class="login">
		<div class="summary">
			<h5>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</h5>
		</div>
		
		<form action="login_check.jsp" method="post">
		
			<div class="login_form">
				<div class="input_id">
					<input type="text" id="login_id" name="login_id" size="39" maxlength="12"/>
				</div>
				<div class="input_pw">
					<input type="password" id="login_pw" name="login_pw" size="40" maxlength="12"/>
				</div>
				<div class="btn_login">
					<input type="image" id="btn_login" src="../image/btn_login.png"/>
				</div>
				<div class="id_pw_find">
					<a href="">ID / PW 찾기</a>
				</div>
			</div>
		</form>
		
	</div>
	
</div>

<div class="footer">
	<jsp:include page="../include/footer.jsp"/>
</div>

<div class="aside">
	<jsp:include page="../include/aside.jsp"/>
</div>

</body>
</html>