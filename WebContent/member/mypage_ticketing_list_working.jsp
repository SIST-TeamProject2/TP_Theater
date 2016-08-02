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

<%!
public Integer toInt(String x) {
	
	int a = 0;
	
	try {
		a = Integer.parseInt(x);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return a;
}
%>



<%
MemberDTO mdto = (MemberDTO) session.getAttribute("loginMember");
List<TicketDTO> tdtoList = MovieDAO.INSTANCE.selectTicketingList(mdto.getId());

request.setAttribute("tdtoList", tdtoList);

int pageno = toInt(request.getParameter("pageno"));

if (pageno < 1) {	//현재 페이지
	pageno = 1;
}
	
int total_record = tdtoList.size(); //총 레코드 수
int page_per_record_cnt = 5; //페이지 당 레코드 수
int group_per_page_cnt = 10; //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
//                                                    [6],[7],[8],[9],[10]
int record_end_no = pageno * page_per_record_cnt;
int record_start_no = record_end_no - (page_per_record_cnt);

if (record_end_no > total_record) {
   record_end_no = total_record;
}

int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0);

if (pageno > total_page) {
   pageno = total_page;
}

//          현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);
//            현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)   
//   ex)    14      =   13(몫)      =    (66 / 5)      1   (1(나머지) =66 % 5)           

int page_eno = group_no * group_per_page_cnt;
//            현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
//   ex)    70      =   14   *   5
int page_sno = page_eno - (group_per_page_cnt - 1);
//             현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
//   ex)    66   =   70 -    4 (5 -1)

if (page_eno > total_page) {
   //            현재 그룹 끝 번호가 전체페이지 수 보다 클 경우      
   page_eno = total_page;
   //            현재 그룹 끝 번호와 = 전체페이지 수를 같게
}

int prev_pageno = page_sno - group_per_page_cnt; // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
//            이전 페이지 번호   = 현재 그룹 시작 번호 - 페이지당 보여줄 번호수   
//   ex)      46      =   51 - 5            
int next_pageno = page_sno + group_per_page_cnt; // <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
//            다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
//   ex)      56      =   51 - 5
if (prev_pageno < 1) {
   //            이전 페이지 번호가 1보다 작을 경우      
   prev_pageno = 1;
   //            이전 페이지를 1로
}

if (next_pageno > total_page) {
   //            다음 페이지보다 전체페이지 수보가 클경우      
   next_pageno = total_page / group_per_page_cnt * group_per_page_cnt + 1;
   //            next_pageno=total_page
   //            다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
   //   ex)            =    76 / 5 * 5 + 1   ????????       
}

// [1][2][3].[10]
// [11][12]
%>
<%
for (int i = record_start_no; i < record_start_no + page_per_record_cnt; i++) {
	if (tdtoList.size() == i) {
		break;
	}
		
TicketDTO tdto = tdtoList.get(i);
/* for(int i =0;i<tdtoList.size();i++){
ReviewDTO redto = tdtoList.get(i); */
%>         
     





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
		
		
		
<!-- 페이징 하는 부분!!! -->
<%-- <a href="mypage_ticketing_list.jsp?pageno=1">[맨앞으로]</a> 
<a href="mypage_ticketing_list.jsp?pageno=<%=prev_pageno%>">[이전]</a> --%>

<%
	for (int j = page_sno; j <= page_eno; j++) {
%>
<a href="mypage_ticketing_list.jsp?pageno=<%=j%>"> 
<%
	if (pageno == j) {
%>
		[<%=j%>] 
<%
   } else {
%> 
		<%=j%> 
<%
   }
%>
</a>
<%--   콤마    --%>
<%
	if (j < page_eno) {
%>
,
<%
	}
}
}
%>

<%-- <a href="mypage_ticketing_list.jsp?pageno=<%= next_pageno%> ">[다음]</a> 
<a href="mypage_ticketing_list.jsp?pageno=<%= total_page%> ">[맨뒤로]</a> --%>
<!-- 페이징 하는 부분!!! -->
		
		
		
		
	</div>
	
</div>

<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>

</body>
</html>