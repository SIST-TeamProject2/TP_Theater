<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>

<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>
<%@ page import = "movie.MovieDAO" %>
<%@ page import = "movie.TicketDTO" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>

<!-- JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="../css/mypage.css">

</head>

<body>

<jsp:include page="login_stat_check.jsp"/>

<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<jsp:include page="mypage_aside.jsp"/>

<c:set var="member" value="${ sessionScope.loginMember }"/>
<c:set var="myTickectingList" value="${ MemberDAO.INSTANCE.selectMember(loginMember.id) }"/>

<div class="section_mypage_tickecting_list">

	<div class="summary">
		<h3>나의 예매내역</h3>
	</div>
	<hr/>
	<div>
	
		<table class="tbl_ticketingList">
		<tr>
			<th>번호</th><th>영화 제목</th><th>상영 날짜</th><th>시작 시간</th>
			<th>지점</th><th>상영관 번호</th><th>좌석</th>
			<th>인원</th><th>결제 날짜</th><th>결제 금액</th>
		</tr>
		
		<c:set var="ticketingList" value="${ MovieDAO.INSTANCE.selectTicketingList(member.id) }"/>
		<c:forEach var="ticket" items="${ ticketingList }" varStatus="num">
			<tr>
				<td>${ num.count }</td>
				<c:choose>
					<c:when test="${ ticket.movieName.length() > 12 }">
						<td>${ ticket.movieName.substring(0, 12) }...</td>
					</c:when>
					<c:otherwise>
						<td>${ ticket.movieName }</td>
					</c:otherwise>
				</c:choose>
				<td>${ ticket.seeDate }</td>
				<td>${ ticket.theaterRoomTime }</td>
				<td>${ ticket.theaterName }</td>
				<td>${ ticket.theaterRoomNum }</td>
				<td>${ ticket.seatNum }</td>
				<td>${ ticket.peopleCount }</td>
				<td><fmt:formatDate value="${ ticket.payDate }" pattern="yyyy.MM.dd HH:mm"/></td>
				<td><fmt:formatNumber value="${ ticket.pay }" type="number"/>원</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
	<div class="page_list">
		
		
	</div>
	
</div>

<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>

</body>
</html>