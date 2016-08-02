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
MemberDTO mdto = (MemberDTO) session.getAttribute("loginMember");

String loginId = mdto.getId();
String inputPw = request.getParameter("m_pw");

boolean resultCheckMember = MemberDAO.INSTANCE.checkMember(loginId, inputPw);
%>

<%
if ( resultCheckMember ) {
	
	boolean resultDeleteMember = MemberDAO.INSTANCE.deleteMember(loginId);
	
	if ( resultDeleteMember ) {
%>
	<script type="text/javascript">
		alert("회원 탈퇴 처리되었습니다.");
		opener.parent.location.href="logout.jsp";
		window.close();
	</script>
<%
	}
} else {
%>
	<script type="text/javascript">
		location.href="self_check_form.jsp";
		alert("비밀번호가 맞지 않습니다.");
	</script>
<%
}
%>	


</body>
</html>