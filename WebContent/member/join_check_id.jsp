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
String inputId = request.getParameter("m_id");
boolean resultCheckId = memberDAO.INSTANCE.checkId(inputId);
%>

<%
if ( resultCheckId ) {
%>
	<span class="result_id_true"><img src="../image/icon_mark_x.png"/>이미 존재하는 아이디입니다.</span>
	<input type="hidden" id="resultCheckId" value="same"/>
<%
} else {
%>
	<span class="result_id_false"><img src="../image/icon_mark_check.png"/>사용 가능한 아이디입니다.</span>
	<input type="hidden" id="resultCheckId" value="<%= inputId %>"/>
<%
}
%>	


</body>
</html>