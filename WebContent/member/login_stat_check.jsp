<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "member.MemberDTO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 상태 체크</title>
</head>
<body>

<%
MemberDTO mdto = (MemberDTO) session.getAttribute("loginMember");
%>

<%
if ( mdto == null ) {
%>
	<script type="text/javascript">
		alert("서비스를 이용하기 위해서는 로그인이 필요합니다.");
		location.href="../member/login_form.jsp";
	</script>
<%
}
%>	


</body>
</html>