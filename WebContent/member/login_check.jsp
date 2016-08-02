<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "member.MemberDAO" %>
<%@ page import = "member.MemberDTO" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>

<%
String inputId = request.getParameter("login_id");
String inputPw = request.getParameter("login_pw");
boolean resultCheckMember = MemberDAO.INSTANCE.checkMember(inputId, inputPw);
%>

<%
if ( resultCheckMember ) {
	
	MemberDTO mdto = MemberDAO.INSTANCE.selectMember(inputId);
	session.setAttribute("loginMember", mdto);
	
%>
	<script type="text/javascript">
		location.href="../main/index.jsp";
	</script>
<%
} else {
%>
	<script type="text/javascript">
		alert("아이디 또는 비밀번호가 맞지 않습니다.");
		location.href="login_form.jsp";
	</script>
<%
}
%>	


</body>
</html>