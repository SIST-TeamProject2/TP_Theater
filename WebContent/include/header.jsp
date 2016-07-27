<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>head</title>

<link rel="stylesheet" href="css/main.css">

<%-- <jsp:useBean id="mdto" class="member.MemberDTO"/ scope="session">
<c:set var="login" value="${ mdto }"/> --%>

</head>
<body>

<div class="header">
	<div class="header_banner">
		<img src="image/banner_01.jpg" onclick=""/>
	</div>
	
	<div class="header_menu">
	
		<table align="left">
		<tr>
			<td><a href=""><img src="image/btn_head_cgv_app.png" onclick=""/></a></td>
			<td><a href=""><img src="image/btn_head_facebook_like.png" onclick=""/></a></td>
			<td><a href=""><img src="image/btn_head_follow.png" onclick=""/></a></td>
			<td><a href=""><img src="image/btn_head_altle.png" onclick=""/></a></td>
		</tr>
		</table>
		<div class="header_menu_right">
			<table align="right">
			<tr>
				<c:choose>
				<c:when test="${ mdto == null }">
					<td><a href=""><img src="image/btn_head_login.png" onclick=""/></a></td>
					<td><a href=""><img src="image/btn_head_join.png" onclick=""/></a></td>
				</c:when>
				<c:otherwise>
					<td><a href=""><img src="image/btn_head_logout.png" onclick=""/></a></td>
				</c:otherwise>
				</c:choose>
				<td><a href=""><img src="image/btn_head_mypage.png" onclick=""/></a></td>
				<td><a href=""><img src="image/btn_head_viprounge.png" onclick=""/></a></td>
				<td><a href=""><img src="image/btn_head_clubservice.png" onclick=""/></a></td>
				<td><a href=""><img src="image/btn_head_customcenter.png" onclick=""/></a></td>
				<td><a href=""><img src="image/btn_head_englishticketing.png" onclick=""/></a></td>
			</tr>
			</table>
		</div>
	</div>
</div>

</body>
</html>