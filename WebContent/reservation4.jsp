<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
    <%@ page import="movie.movieDAO" %>
   <%@ page import="reservation.reservationDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reservation4-예매내역</title>
</head>
<body>

<%!
int total_price=0;
boolean a=false;
int seq=0;
%>
<%
total_price=0;
if(request.getParameter("total")!=null){
	total_price = Integer.parseInt(request.getParameter("total"));
	
	reservationDAO rdao = reservationDAO.getInstance();
	
/*  	(String)session.getAttribute("date"),
	(String)session.getAttribute("movie"), 
	(String)session.getAttribute("theater") , 
	(int)session.getAttribute("room"), 
	(String)session.getAttribute("time"), 
	(String)session.getAttribute("hiddenseat") ,
	(int)session.getAttribute("general")+(int)session.getAttribute("teen") ,
	
	(String)session.getAttribute("id"),
	 */
	///임시저장된 예매 seq얻어오기
		System.out.println("Reservation4");
		int seq=rdao.get_reservation_seq((String)session.getAttribute("id"), (String)session.getAttribute("date"), (String)session.getAttribute("movie"),(String)session.getAttribute("hiddenseat"));
		System.out.println("seq==="+seq);
	boolean result = rdao.UpdateReservation(seq, total_price, (String)session.getAttribute("hiddenseat"));
	System.out.println("result=="+result);
}
%>

<h3>예매가 완료되었습니다!!!!!!!</h3>


<table border="1" width=80%>

<tr>
<td>예매번호 : </td>
<td> <%=seq %></td>
</tr>


<tr>
<td >영화제목 : </td>
<td><%=session.getAttribute("movie") %>
<%
movieDAO mdao =movieDAO.getInstance();
String temp = (mdao.get_poster_Movie((String)session.getAttribute("movie")));
%>
<img width="100px" height="120px" src = "<%=temp%>"/>
</td>
</tr>

<tr>
<td>영화관 :  </td>
<td><%=session.getAttribute("theater") %> &nbsp;&nbsp;&nbsp;<%=session.getAttribute("room") %>관</td>
</tr>
<tr>
<td>상영일 :  </td>
<td><%=session.getAttribute("date") %></td>
</tr>

<tr>
<td>시간 : </td>
<td><%=session.getAttribute("time") %></td>
</tr>

<tr>
<td>인원 : </td>
<td>성인 : <%=session.getAttribute("general") %>명, 청소년 : <%=session.getAttribute("teen") %>명</td>
</tr>

<tr>
<td>좌석 : </td>
<td><%=session.getAttribute("seat") %></td>
</tr>

<%

Calendar cal2 = new GregorianCalendar(Locale.KOREA);
int nday = cal2.get(Calendar.DAY_OF_MONTH);
int nmonth = cal2.get(Calendar.MONTH)+1;
System.out.println("*******달력*****");
System.out.println("nmonth"+nmonth);
System.out.println("nday="+nday);
System.out.println("*******달력*****");

%>
<tr>
<td>결제유형 :  </td>
<td>[무통장입금] : <br>
<%out.println(nmonth+"월"+nday+"일 24:00까지 입금 완료해주세요."); %>
</td>
</tr>

<tr>
<td>결제금액 :  </td>
<td><%=total_price%>원</td>
</tr>



</table>



</body>
</html>