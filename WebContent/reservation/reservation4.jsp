<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
    <%@ page import="movie2.movieDAO" %>
   <%@ page import="reservation.reservationDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reservation4-예매내역</title>
</head>
<link rel="stylesheet" href="../css/reservation.css">
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<div class="section_reservation33">

<%!
int total_price=0;
boolean a=false;
int seq=0;
reservationDAO rdao = reservationDAO.getInstance();
%>
<%
total_price=0;
if(request.getParameter("total")!=null){
	total_price = Integer.parseInt(request.getParameter("total"));
	

	
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
	//	System.out.println("Reservation4");
		int seq=rdao.get_reservation_seq((String)session.getAttribute("id"), (String)session.getAttribute("date"), (String)session.getAttribute("movie"),(String)session.getAttribute("hiddenseat"));
	//	System.out.println("seq==="+seq);
	boolean result = rdao.UpdateReservation(seq, total_price, (String)session.getAttribute("hiddenseat"));
	//System.out.println("result=="+result);
}
%>

<h3>예매가 완료되었습니다!!!!!!하하하하하하하하</h3>


<div class="final_table">
<table>

<tr>
<th>예매번호 </th>
<td > <%=rdao.get_reservation_seq((String)session.getAttribute("id"), (String)session.getAttribute("date"), (String)session.getAttribute("movie"),(String)session.getAttribute("hiddenseat")) %></td>
<%
movieDAO mdao =movieDAO.getInstance();
String temp = (mdao.get_poster_Movie((String)session.getAttribute("movie")));
%>
<td rowspan="9" align="center" ><img width="250px" height="250px" src = "<%=temp%>"/></td>
</tr>


<tr>
<th>영화제목  </th>
<td><%=session.getAttribute("movie") %>


</td>
</tr>

<tr>
<th>영화관  </th>
<td><%=session.getAttribute("theater") %> &nbsp;&nbsp;&nbsp;<%=session.getAttribute("room") %>관</td>
</tr>
<tr>
<th>상영일 </th>
<td><%=session.getAttribute("date") %></td>
</tr>

<tr>
<th>시간  </th>
<td><%=session.getAttribute("time") %></td>
</tr>

<tr>
<th>인원  </th>
<td>성인 : <%=session.getAttribute("general") %>명, 청소년 : <%=session.getAttribute("teen") %>명</td>
</tr>

<tr>
<th>좌석 </th>
<td><%=session.getAttribute("seat") %></td>
</tr>

<%

Calendar cal2 = new GregorianCalendar(Locale.KOREA);
int nday = cal2.get(Calendar.DAY_OF_MONTH);
int nmonth = cal2.get(Calendar.MONTH)+1;


%>
<tr>
<th>결제유형 </th>
<td>[무통장입금] : <br>
<%out.println(nmonth+"월"+nday+"일 24:00까지 입금 완료해주세요."); %>
</td>
</tr>

<tr>
<th>결제금액 </th>
<td><%=total_price%>원</td>
</tr>



</table>


</div>
<br>
<input type="submit" value="확인" onclick="location.href='../main/index.jsp'"/>
</div>



<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../include/aside.jsp"/>
</body>
</html>