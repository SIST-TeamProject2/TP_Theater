<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "member.memberDAO" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>
<%
String inputId = request.getParameter("id");
boolean resultCheckId = memberDAO.INSTANCE.checkId(inputId);
String scrollPos = request.getParameter("scrollPos");

response.sendRedirect("m_join_form.jsp?id=" + inputId + "&result=" + resultCheckId + "&scrollPos=" + scrollPos);
%>

</body>
</html>